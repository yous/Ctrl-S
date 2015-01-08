local tracker = LibStub:NewLibrary("LibStormEarthAndFire-1.0", 2)
if not tracker then return end

tracker.callbacks = LibStub("CallbackHandler-1.0"):New(tracker)

--[[
Callbacks:

ENABLED: fires when the tracker enables itself (typically on spec change)

DISABLED: fires when the tracker disables itself (typically on spec change)

NEW_SPIRIT: fires when a new spirit is summoned
    name - String - Name of the spirit (e.g. "Storm Spirit")
    guid - String - GUID of the spirit
    target - String - Name of the spirit's target
    targetGUID - String - GUID of the spirit's target
    icon - String - Texture for the spirit's totem icon

DEAD_SPIRIT: fires when a spirit disappears
    name - String - Name of the spirit (e.g. "Storm Spirit")
    guid - String - GUID of the spirit

SPIRIT_TARGET: fires when the player is targeting a spirit's target
    name - String - Name of the spirit
    guid - String - GUID of the spirit
    target - String - Name of the shared target
    targetGUID - String - GUID of the shared target

SPIRIT_TARGET_END: fires when the player stops targetting a spirit's target
]]

--[[
Functions:

- Enabled()
    Returns whether the tracker is enabled. The tracker is enabled when the
    player is a monk in Windwalker spec.

  Returns:
    true if tracking is enabled, false otherwise.

- SpiritInfoByTargetGUID(guid)
    Returns info about a spirit targeting that GUID.

  Parameters:
    guid - String - GUID of the target

  Returns:
    If no spirit has that target, no return values. Otherwise:

    String - Name of the spirit
    String - GUID of the spirit
    String - Icon of the spirit

- NumSpirits()
    Returns the number of active spirits.

  Returns:
    Number - Number of active spirits, or 0 if none

- SpiritInfoByIndex(index)
    Returns info about a spirit by index from 1 to NumSpirits().

  Parameters:
    index - Number - Index from 1 to NumSpirits()

  Returns:
    If no spirit by that index, no return values. Otherwise:

    String - Name of the spirit
    String - GUID of the spirit
    String - Name of the target
    String - GUID of the target
    String - Icon of the spirit
]]
-- these functions will get overridden later, these are just the stubs for
-- non-monks
function tracker:Enabled()
	return false
end
function tracker:SpiritInfoByTargetGUID(guid)
end
function tracker:NumSpirits()
    return 0
end
function tracker:SpiritInfoByIndex(index)
end

if select(2, UnitClass("player")) ~= "MONK" then return end -- only track monks, naturally

local SPIRIT_IDS = {
    [69680] = "Storm Spirit",
    [69791] = "Fire Spirit",
    [69792] = "Earth Spirit",
}

local STORM_EARTH_AND_FIRE_ID = 137639

local frame = CreateFrame("Frame")
frame.spirits = {}
frame.activeSpirits = {}
frame.spiritsByTargetGUID = {}
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:RegisterEvent("PLAYER_SPECIALIZATION_CHANGED")
frame:SetScript("OnEvent", function(self, event, ...)
    self[event](self, ...)
end)

function frame:PLAYER_ENTERING_WORLD()
    self:CheckSpecialization()
end

function frame:PLAYER_SPECIALIZATION_CHANGED()
    self:CheckSpecialization()
end

function frame:CheckSpecialization()
    if GetSpecialization() == 3 then
        -- Windwalker
        self:Enable()
    else
        self:Disable()
    end
end

function frame:Enable()
    if self.enabled then return end
    self:RegisterEvent("PLAYER_TOTEM_UPDATE")
    self:RegisterEvent("PLAYER_TARGET_CHANGED")
    self:RegisterEvent("PLAYER_TOTEM_UPDATE")
    self:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
    wipe(self.spirits)
    wipe(self.activeSpirits)
    wipe(self.spiritsByTargetGUID)
    self.lastCastTarget, self.lastCastTargetGUID = nil, nil
    self.lastSummonedSpirit = nil
    self.lastWarnedTargetGUID = nil
    self.enabled = true
    tracker.callbacks:Fire("ENABLED")
end

function frame:Disable()
    if not self.enabled then return end
    self:UnregisterEvent("PLAYER_TOTEM_UPDATE")
    self:UnregisterEvent("PLAYER_TARGET_CHANGED")
    self:UnregisterEvent("PLAYER_TOTEM_UPDATE")
    self:UnregisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
    self:SetScript("OnUpdate", nil)
    self.lastCastTarget, self.lastCastTargetGUID = nil, nil
    self.lastSummonedSpirit = nil
    self.lastWarnedTargetGUID = nil
    self.enabled = false
    self:UpdateSpirits() -- to send out any "dead spirit" callbacks
    wipe(self.spirits)
    wipe(self.spiritsByTargetGUID)
    tracker.callbacks:Fire("DISABLED")
end

function frame:PLAYER_TOTEM_UPDATE()
    -- used to detect when a spirit disappears
    self:UpdateSpirits()
end

function frame:COMBAT_LOG_EVENT_UNFILTERED(...)
    local event = select(2, ...)
    if event == "SPELL_SUMMON" or event == "SPELL_CAST_SUCCESS" then
        local srcGUID = select(4, ...)
        if srcGUID == UnitGUID("player") then
            self[event](self, select(4, ...))
        end
    end
end

-- we need to properly handle getting SPELL_SUMMON before
-- SPELL_CAST_SUCCESS or after
function frame:SPELL_SUMMON(...)
    local dstGUID, dstName = select(5, ...)
    local dstType, _, _, _, _, npcid = strsplit("-", dstGUID)
    if dstType == "Creature" then
        npcid = tonumber(npcid)
        if SPIRIT_IDS[npcid] then
            -- it's one of our Storm, Earth, or Fire spirits
            local t = self.spirits[dstName]
            if t and t.alive then
                -- oops this is a living spirit?
                -- we need to kill it now
                self:killSpirit(t)
                wipe(t)
            else
                t = {}
            end
            self.spirits[dstName] = t
            t.name = dstName
            t.guid = dstGUID
            if self.lastCastTarget then
                t.target, t.targetGUID, self.lastCastTarget = self.lastCastTarget, self.lastCastTargetGUID, nil
                self:UpdateSpirits()
            else
                self.lastSummonedSpirit = t
                self:StartResetTimer()
            end
        end
    end
end

function frame:SPELL_CAST_SUCCESS(...)
    local spellid = select(9, ...)
    if spellid == STORM_EARTH_AND_FIRE_ID then -- Storm, Earth, and Fire
        local dstGUID, dstName = select(5, ...)
        if self.lastSummonedSpirit then
            self.lastSummonedSpirit.target = dstName
            self.lastSummonedSpirit.targetGUID = dstGUID
            self.lastSummonedSpirit = nil
            self:UpdateSpirits()
        else
            self.lastCastTarget = dstName
            self.lastCastTargetGUID = dstGUID
            self:StartResetTimer()
        end
    end
end

function frame:StartResetTimer()
    local timerDuration = 0.5 -- reset after 0.5 seconds
    local total = 0
    self:SetScript("OnUpdate", function(self, elapsed)
        total = total + elapsed
        if total > timerDuration then
            self.lastSummonedSpirit = nil
            self.lastCastTarget = nil
            self.lastCastTargetGUID = nil
            self:SetScript("OnUpdate", nil)
        end
    end)
end

function frame:PLAYER_TARGET_CHANGED()
    self:CheckTarget()
end

function frame:UpdateSpirits()
    local seen = {}
    if self.enabled then
        for i = 1, MAX_TOTEMS do
            local haveTotem, name, _, _, icon = GetTotemInfo(i)
            if haveTotem and name and self.spirits[name] and self.spirits[name].target then
                seen[name] = true
                local t = self.spirits[name]
                t.icon = icon
                if not t.alive then
                    t.alive = true
                    table.insert(self.activeSpirits, t)
                    self.spiritsByTargetGUID[t.targetGUID] = t
                    tracker.callbacks:Fire("NEW_SPIRIT", name, t.guid, t.target, t.targetGUID, icon)
                end
            end
        end
    end
    for name, t in pairs(self.spirits) do
        if not seen[name] and t.alive then
            self:killSpirit(t)
        end
    end
    self:CheckTarget()
end

function frame:killSpirit(t)
    t.alive = nil
    for i, v in ipairs(self.activeSpirits) do
        if t == v then
            table.remove(self.activeSpirits, i)
            break
        end
    end
    self.spiritsByTargetGUID[t.targetGUID] = nil
    if t.targetGUID == self.lastWarnedTargetGUID then
        self.lastWarnedTargetGUID = false
    end
    tracker.callbacks:Fire("DEAD_SPIRIT", t.name, t.guid)
end

function frame:CheckTarget()
    local targetGUID = UnitGUID("target")
    if self.enabled and targetGUID then
        if targetGUID == self.lastWarnedTargetGUID then return end
        for name, t in pairs(self.spirits) do
            if t.alive then
                if t.targetGUID == targetGUID then
                    tracker.callbacks:Fire("SPIRIT_TARGET", name, t.guid, t.target, t.targetGUID)
                    self.lastWarnedTargetGUID = targetGUID
                    return
                end
            end
        end
    end
    if self.lastWarnedTargetGUID ~= nil then
        tracker.callbacks:Fire("SPIRIT_TARGET_END")
        self.lastWarnedTargetGUID = nil
    end
end

function tracker:Enabled()
	return frame.enabled
end

function tracker:SpiritInfoByTargetGUID(guid)
    local t = frame.spiritsByTargetGUID[guid]
    if t then
        return t.name, t.guid, t.icon
    end
end

function tracker:NumSpirits()
    return #frame.activeSpirits
end

function tracker:SpiritInfoByIndex(index)
    local t = frame.activeSpirits[index]
    if t then
        return t.name, t.guid, t.target, t.targetGUID, t.icon
    end
end

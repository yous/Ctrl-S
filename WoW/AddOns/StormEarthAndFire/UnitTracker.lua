local addonName, addonTable = ...

local tracker = {}
addonTable.UnitTracker = tracker

--[===[@debug@
_G.SEFUT = tracker
--@end-debug@]===]

--[==[
UnitTracker tracks units by GUID and notifies any interested parties when
these targets are accessible via unitid.

Functions:

- :StartTrackingGUID(guid)

  Starts tracking the given target by GUID. This should be balanced by a call
  to :StopTrackingGUID(guid).

  Arguments:
    guid - String - GUID for a unit

  Returns:
    unitid - String or nil - unitid for the target, if one can be found
                             immediately. Otherwise nil

- :StopTrackingGUID(guid)

  Arguments:
    guid - String - GUID for a unit

- :StartTrackingUnit(unit)

  Starts tracking a given unitid and sends callbacks when the unitid appears
  (refers to a valid unit) and disappears. If the unitid is already valid when
  this method is called, no callback is issued.

  Arguments:
    unit - String - unitid

- :StopTrackingUnit(unit)

  Arguments:
    unit - String - unitid

- :UnitIDForGUID(guid)

  Returns the unitid that corresponds to guid. Will not return mouseover
  unless it has no other choice. If this method does return mouesover, the
  caller should be careful not to assume it's still valid, as the unitid
  silently invalidates while the mouse is pressed.

  Arguments:
    guid - String - GUID for a unit. Must already be tracked

  Returns:
    unitid - String - unitid for the given unit, if any can be found.
                      Otherwise returns nil

- .RegisterCallback(self, eventName[, method[, arg]])

  Arguments:
    self - String or Table or Thread - identifier for the callback
    eventName - String - name of the callback event
    method - Function or String - callback handler. Defaults to eventName
    arg - any - optional first argument to the method

- .UnregisterCallback(self, eventName)

  Arguments:
    self - String or Table or Thread - identifier for the callback
    eventName - String - name of the callback event

- .UnregisterAllCallbacks(...)

  Arguments:
    ... - String or Table or Thread - one or more identifiers

Callbacks:

- GUID_HAS_UNIT_ID(guid, unitid)

  Fired when a tracked target gains a unitid. Only one unitid per target is
  ever given. If a target loses its "primary" unitid but has another
  available, this event will fire a second time with the new unitid, without a
  corresponding GUID_LOST_UNIT_ID first.

  Parameters:
    guid - String - GUID for the tracked target
    unitid - String - unitid for the tracked target

- GUID_LOST_UNIT_ID(guid)

  Fired when a tracked target loses its unitid.

  Parameters:
    guid - String - GUID for the tracked target

- UNIT_ID_VALID(unitid)

  Fired when a tracked unitid refers to a valid unit. Also fired when the
  unitid changes the target it refers to.

  Parameters:
    unitid - String - tracked unitid

- UNIT_ID_INVALID(unitid)

  Fired when a tracked unitid no longer refers to a valid unit.

  Parameters:
    unitid - String - tracked unitid

]==]

tracker.callbacks = LibStub("CallbackHandler-1.0"):New(tracker)

tracker.enabled = false
tracker.tracked = {} -- tracked guids
tracker.units = {} -- tracked unitids
setmetatable(tracker.units, {
	-- tracking "target" should track "playertarget"
	__index = function (t, key)
		if key == "playertarget" then return rawget(t, "target") end
		return nil
	end
})
tracker.unitCache = {}
function tracker:StartTrackingGUID(guid)
	if not self.tracked[guid] then
		self.tracked[guid] = {}
	end

	if not self.enabled then
		self:Enable()
	end

	self:ScanUnits(false)

	return self.tracked[guid][1]
end

function tracker:StopTrackingGUID(guid)
	self.tracked[guid] = nil
	for k, v in pairs(self.unitCache) do
		if v == guid and not self.units[k] then
			self.unitCache[k] = nil
		end
	end

	if next(self.tracked) == nil and next(self.units) == nil then
		self:Disable()
	end
end

function tracker:StartTrackingUnit(unit)
	if self.units[unit] then return end
	self.units[unit] = true

	if not self.enabled then
		self:Enable()
	end

	self:ScanUnits(false, unit)
end

function tracker:StopTrackingUnit(unit)
	if not self.units[unit] then return end
	self.units[unit] = nil
	if unit == "target" then unit = "playertarget" end
	if not self.units[unit] then
		for k, v in pairs(self.unitCache) do
			if k == unit and not self.tracked[v] then
				self.unitCache[k] = nil
			end
		end
	end

	if next(self.tracked) == nil and next(self.units) == nil then
		self:Disable()
	end
end

function tracker:UnitIDForGUID(guid)
	return self.tracked[guid] and self.tracked[guid][1]
end

-----------

function tracker:Enable()
	if not self.frame then
		self.frame = CreateFrame("frame")
		self.frame:SetScript("OnEvent", function(_, event, ...)
			self[event](tracker, ...)
		end)
	end

	self.frame:RegisterEvent("UPDATE_MOUSEOVER_UNIT")
	self.frame:RegisterEvent("CURSOR_UPDATE")
	self.frame:RegisterEvent("UNIT_TARGET")
	self.frame:RegisterEvent("PLAYER_TARGET_CHANGED")
	self.frame:RegisterEvent("PLAYER_FOCUS_CHANGED")
	self.frame:RegisterEvent("INSTANCE_ENCOUNTER_ENGAGE_UNIT")
	self.frame:RegisterEvent("GROUP_ROSTER_UPDATE")

	self.enabled = true
end

function tracker:Disable()
	if self.frame then
		self.frame:UnregisterEvent("UPDATE_MOUSEOVER_UNIT")
		self.frame:UnregisterEvent("CURSOR_UPDATE")
		self.frame:UnregisterEvent("UNIT_TARGET")
		self.frame:UnregisterEvent("PLAYER_TARGET_CHANGED")
		self.frame:UnregisterEvent("PLAYER_FOCUS_CHANGED")
		self.frame:UnregisterEvent("INSTANCE_ENCOUNTER_ENGAGE_UNIT")
		self.frame:UnregisterEvent("GROUP_ROSTER_UPDATE")
	end

	self.enabled = false
end

do
	local cache = { guids = {}, units = {} }
	local wasInRaid, wasInGroup, wasInArena
	local function scanUnit(self, unit)
		local guid = UnitGUID(unit)
		local oldGUID = self.unitCache[unit]
		if oldGUID ~= guid then
			if oldGUID then
				if self.tracked[oldGUID] then
					for i, v in ipairs(self.tracked[oldGUID]) do
						if v == unit then
							table.remove(self.tracked[oldGUID], i)
							if i == 1 then cache.guids[oldGUID] = true end
							break
						end
					end
				end
				if self.units[unit] then
					cache.units[unit] = true
				end
				self.unitCache[unit] = nil
			end
			if guid then
				if self.tracked[guid] then
					local t = self.tracked[guid]
					-- always insert before "mouseover", if possible
					local cond
					if t[#t] == "mouseover" then
						cond = #t == 1
						table.insert(t, #t, unit)
					else
						table.insert(self.tracked[guid], unit)
						cond = #t == 1
					end
					if cond then
						cache.guids[guid] = true
					end
				end
				if self.tracked[guid] or self.units[unit] then
					self.unitCache[unit] = guid
				end
				if self.units[unit] then
					cache.units[unit] = true
				end
			end
		end
		return guid ~= nil
	end
	local function clearUnitPattern(self, pat)
		for unit, guid in pairs(self.unitCache) do
			if unit:find(pat) then
				local t = self.tracked[guid]
				for i, v in ipairs(t) do
					if v == unit then
						table.remove(t, i)
						if i == 1 then cache.guids[guid] = true end
						break
					end
				end
				if self.units[unit] then
					cache.units[unit] = true
				end
				self.unitCache[unit] = nil
			end
		end
	end
	function tracker:ScanUnits(...)
		wipe(cache.guids)
		wipe(cache.units)
		local squelch = (...) == false
		local offset = 1
		if squelch then
			offset = 2
		end
		if select('#', ...) >= offset then
			for i = offset, select('#', ...) do
				local unit = select(i, ...)
				scanUnit(self, unit)
			end
		else
			if not next(self.tracked) then
				-- only scan registered unitids
				for unit in pairs(self.units) do
					if unit == "target" then unit = "playertarget" end
					scanUnit(self, unit)
				end
			else
				-- scan bosses first
				-- then target, mouseover, and focus
				-- then friendlies (in case MC)
				-- then targets of friendlies
				-- then friendly pets
				-- then targets of friendly pets
				-- and finally arenas
				for i = 1, MAX_BOSS_FRAMES do
					scanUnit(self, "boss"..i)
				end
				scanUnit(self, "playertarget")
				scanUnit(self, "mouseover")
				scanUnit(self, "focus")
				if IsInRaid() then
					for i = 1, MAX_RAID_MEMBERS do
						if scanUnit(self, "raid"..i) then
							scanUnit(self, "raid"..i.."target")
							if scanUnit(self, "raidpet"..i) then
								scanUnit(self, "raidpet"..i.."target")
							end
						end
					end
					wasInRaid = true
				elseif wasInRaid then
					-- clear any raidN and raidpetN units
					clearUnitPattern(self, "^raid")
					wasInRaid = false
				end
				if IsInGroup() then
					for i = 1, MAX_PARTY_MEMBERS do
						if scanUnit(self, "party"..i) then
							scanUnit(self, "party"..i.."target")
							if scanUnit(self, "partypet"..i) then
								scanUnit(self, "partypet"..i.."target")
							end
						end
					end
					wasInGroup = true
				elseif wasInGroup then
					-- clear any partyN and partypetN units
					clearUnitPattern(self, "^party")
					wasInGroup = false
				end
				if IsActiveBattlefieldArena() then
					for i = 1, 5 do -- I don't see any constant for arena members
						scanUnit(self, "arena"..i)
					end
					wasInArena = true
				elseif wasInArena then
					clearUnitPattern(self, "^arena")
					wasInArena = false
				end
			end
		end
		if not squelch then
			for guid in pairs(cache.guids) do
				local unit = self.tracked[guid][1]
				if unit then
					self.callbacks:Fire("GUID_HAS_UNIT_ID", guid, unit)
				else
					self.callbacks:Fire("GUID_LOST_UNIT_ID", guid)
				end
			end
			for unit in pairs(cache.units) do
				if self.unitCache[unit == "target" and "playertarget" or unit] then
					self.callbacks:Fire("UNIT_ID_VALID", unit)
				else
					self.callbacks:Fire("UNIT_ID_INVALID", unit)
				end
			end
		end
	end
end

do
	local toScan = {}
	local function doScan()
		tracker:ScanUnits(unpack(toScan))
		wipe(toScan)
		tracker.frame:SetScript("OnUpdate", nil)
	end
	function tracker:ScanAfterFrame(...)
		if #toScan == 0 then
			self.frame:SetScript("OnUpdate", doScan)
		end
		for i = 1, select('#', ...) do
			local unit = select(i, ...)
			local found = false
			for j, key in ipairs(toScan) do
				if key == unit then
					found = true
					break
				end
			end
			if not found then
				table.insert(toScan, unit)
			end
		end
	end
end

function tracker:UPDATE_MOUSEOVER_UNIT()
	if next(self.tracked) or self.units["mouseover"] then
		self:ScanUnits("mouseover")
	end
end

function tracker:CURSOR_UPDATE()
	-- seen when mousing off a unit
	-- seems to not have updated the unitid yet though
	if next(self.tracked) or self.units["mouseover"] then
		self:ScanAfterFrame("mouseover")
	end
end

do
	-- these are units that we check the target of
	-- skip player because we use PLAYER_TARGET_CHANGED already
	local validunits = {}
	for i = 1, MAX_RAID_MEMBERS do
		validunits["raid"..i] = true
		validunits["raidpet"..i] = true
	end
	for i = 1, MAX_PARTY_MEMBERS do
		validunits["party"..i] = true
		validunits["partypet"..i] = true
	end
	function tracker:UNIT_TARGET(unit)
		if validunits[unit] then
			if next(self.tracked) or self.units[unit.."target"] then
				self:ScanUnits(unit.."target")
			end
		end
	end
end

function tracker:PLAYER_TARGET_CHANGED()
	if next(self.tracked) or self.units["target"] or self.units["playertarget"] then
		self:ScanUnits("playertarget")
	end
end

function tracker:PLAYER_FOCUS_CHANGED()
	if next(self.tracked) or self.units["focus"] then
		self:ScanUnits("focus")
	end
end

do
	local bossids = {}
	for i = 1, MAX_BOSS_FRAMES do
		table.insert(bossids, "boss"..i)
	end
	function tracker:INSTANCE_ENCOUNTER_ENGAGE_UNIT()
		self:ScanUnits(unpack(bossids))
	end
end

function tracker:GROUP_ROSTER_UPDATE()
	self:ScanUnits()
end

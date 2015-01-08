local addonName, addonTable = ...

local tracker = LibStub("LibStormEarthAndFire-1.0")

local printHeader = "|cff00aa00Storm, Earth, and Fire|r"
addonTable.printHeader = printHeader

local function debug(...)
	local arg = ...
	print("|cff00aa00Storm, Earth, and Fire |cffff0000debug|r: " .. tostring(arg), select(2, ...))
end

local addon = {}

local LSM = LibStub("LibSharedMedia-3.0")
local AceTimer = LibStub("AceTimer-3.0")

-- PlaySoundFile() doesn't seem to care if I use .ogg or .wav (but it must be
-- one of these). Since we're checking if the sound already exists, try to do
-- so in a manner that accepts both .wav and .ogg.

local defaultDeathSoundKey, defaultTargetSoundKey

do
	local synonymExts = { ogg=true, wav=true }
	local function soundsEqual(a, b)
		local pat = "^(.+)%.([^.]+)$"
		local abase, aext = a:match(pat)
		local bbase, bext = b:match(pat)
		if abase and abase:lower() == bbase:lower() then
			aext, bext = aext:lower(), bext:lower()
			return aext == bext or (synonymExts[aext] and synonymExts[bext])
		end
		return false
	end

	-- Blackrock Door
	defaultDeathSoundKey = "Blackrock Door"
	do
		local soundFile = "Sound\\Doodad\\Blackrockdoorsingledestroy.Ogg"
		if not LSM:Register("sound", defaultDeathSoundKey, soundFile) and not soundsEqual(LSM:Fetch("sound", defaultDeathSoundKey), soundFile) then
			-- use a different name
			defaultDeathSoundKey = "SEF: " .. defaultDeathSoundKey
			LSM:Register("sound", defaultDeathSoundKey, soundFile)
		end
	end

	-- Bonks
	defaultTargetSoundKey = "Bonk1"
	do
		for i = 1, 3 do
			local soundKey = "Bonk"..i
			local soundFile = "Sound\\Spells\\Bonk"..i..".Ogg"
			if not LSM:Register("sound", soundKey, soundFile) and not soundsEqual(LSM:Fetch("sound", soundKey), soundFile) then
				soundKey = "SEF: " .. soundKey
				if i == 1 then defaultTargetSoundKey = soundKey end
				LSM:Register("sound", soundKey, soundFile)
			end
		end
	end
end

--[====[ Config ]====]

addon.DB = addonTable.DB

addon.DB:SetDefaults({
	configMode = true,
	growDown = true,
	playDeathSoundOnMaster = true,
	deathSound = defaultDeathSoundKey,
	playTargetSoundOnMaster = true,
	targetSound = defaultTargetSoundKey,
	playTargetSoundOnCast = false,
	highlightMouseover = true,
	showTargetHealthBar = true,
	showHealthBarText = true,
})

addon.DB:RegisterCallback(addon, "configMode", function(key, oldValue, newValue)
	if addon.enabled then
		addon:updateConfigFrames()
		addon:relinkFrames()
	end
end)

addon.DB:RegisterCallback(addon, "growDown", function(key, oldValue, newValue)
	if addon.enabled then
		addon:relinkFrames()
	end
end)

addon.DB:RegisterCallback(addon, "highlightMouseover", function(key, oldValue, newValue)
	if addon.enabled then
		addon:CheckMouseover()
	end
end)

addon.DB:RegisterCallback(addon, "showTargetHealthBar", function(key, oldValue, newValue)
	addon:UpdateHealthBarVisibility()
	if addon.enabled and newValue then
		addon:UpdateTargetInfo()
	end
end)

addon.DB:RegisterCallback(addon, "showHealthBarText", function(key, oldValue, newValue)
	addon:UpdateHealthBarVisibility()
	if addon.enabled and newValue then
		addon:UpdateTargetInfo()
	end
end)

--[====[ Implementation ]====]

local frames = { StormEarthAndFireFrame1, StormEarthAndFireFrame2 }

local UnitTracker = addonTable.UnitTracker

addon.enabled = false
function addon:Enable()
	if self.enabled then return end
	self.enabled = true
	self:updateConfigFrames()
	for _, frame in ipairs(frames) do
		if frame.guid then
			frame:Show()
		end
	end
	self:UpdateHealthBarVisibility()
	self:UpdateTargetInfo()
	self:relinkFrames()
end

function addon:Disable()
	if not self.enabled then return end
	self.enabled = false
	self:updateConfigFrames()
	for _, frame in ipairs(frames) do
		frame:Cleanup()
		frame:Hide()
	end
end

local function getNPCID(guid)
	if tonumber(guid:sub(5,5), 16) % 8 == 3 then
		return tonumber(guid:sub(6,10), 16)
	end
	return nil
end

local active = {}
function addon:displaySpirit(name, guid, target, targetGUID, icon)
	local frame
	for _, f in ipairs(frames) do
		if not f.guid then
			frame = f
			break
		end
	end
	if not frame then
		error("Couldn't find available frame for spirit")
	end
	frame.label:SetText(target)
	frame.label:SetVertexColor(1.0, 1.0, 1.0)
	frame:SizeToFit()
	frame.icon:SetTexture(icon)
	SetDesaturation(frame.icon, false)

	frame:Cleanup()

	frame.guid = guid
	frame.targetGUID = targetGUID

	frame:UpdateTargetInfo()

	table.insert(active, frame)
	if self.DB.configMode then self:updateConfigFrames() end
	self:relinkFrames()

	frame:Show()
end

function addon:hideSpirit(name, guid)
	local frame, idx
	for i, f in ipairs(active) do
		if f.guid == guid then
			frame = f
			idx = i
			break
		end
	end
	if not frame then return end
	frame:Hide()
	frame.guid = nil
	frame:ResetBackdropColor()
	frame:ClearAllPoints()
	frame:Cleanup()
	table.remove(active, idx)
	PlaySoundFile(LSM:Fetch("sound", self.DB.deathSound), self.DB.playDeathSoundOnMaster and "master" or "SFX")
	if self.DB.configMode then
		self:updateConfigFrames()
	end
	self:relinkFrames()
end

function addon:relinkFrames()
	local last = nil
	local point, relPoint
	if self.DB.growDown then
		point, relPoint = "TOPLEFT", "BOTTOMLEFT"
	else
		point, relPoint = "BOTTOMLEFT", "TOPLEFT"
	end
	local function relink(frame)
		frame:ClearAllPoints()
		if last then
			frame:SetPoint(point, last,relPoint)
		else
			frame:SetPoint(point, StormEarthAndFireAnchor, "CENTER")
		end
		last = frame
	end
	for _, frame in ipairs(active) do
		relink(frame)
	end
	if self.DB.configMode then
		for _, frame in ipairs(frames) do
			if not frame.guid then
				relink(frame)
			end
		end
	end
end

do
	local lastWarnedGUID
	function addon:warnSpiritTarget(name, guid, target, targetGUID, alert)
		for _, frame in ipairs(frames) do
			if frame.guid == guid then
				frame:SetBackdropColor(0.8, 0.09, 0.09)
			else
				frame:ResetBackdropColor()
			end
		end
		if targetGUID ~= lastWarnedGUID then
			if alert ~= false or self.DB.playTargetSoundOnCast then
				PlaySoundFile(LSM:Fetch("sound", self.DB.targetSound), self.DB.playTargetSoundOnMaster and "master" or "SFX")
			end
		end
		lastWarnedGUID = targetGUID
	end

	function addon:cancelWarnSpiritTarget()
		for _, frame in ipairs(frames) do
			frame:ResetBackdropColor()
		end
		lastWarnedGUID = nil
	end
end

do
	local configTextures = {
		"Interface\\Icons\\INV_SummerFest_FireSpirit",
		"Interface\\Icons\\inv_misc_stormlordsfavor",
		"Interface\\Icons\\INV_Elemental_Primal_Earth"
	}

	function addon:updateConfigFrames()
		if self.DB.configMode and self.enabled then
			StormEarthAndFireAnchor:Show()
			local used = {}
			for _, frame in ipairs(frames) do
				if frame.guid then
					used[frame.icon:GetTexture():lower()] = true
				end
			end
			for _, frame in ipairs(frames) do
				if not frame.guid then
					frame.label:SetText((GetSpellInfo(137639)))
					frame.label:SetVertexColor(0.5, 0.5, 0.5)
					frame:SizeToFit()
					for _, tex in ipairs(configTextures) do
						if not used[tex:lower()] then
							frame.icon:SetTexture(tex)
							used[tex:lower()] = true
							break
						end
					end
					SetDesaturation(frame.icon, true)
					frame:Cleanup()
					frame:Show()
				end
			end
		else
			StormEarthAndFireAnchor:Hide()
			for _, frame in ipairs(frames) do
				if not frame.guid then
					frame:ClearAllPoints()
					frame:Hide()
				end
			end
		end
	end
end

function addon:UpdateTargetInfo()
	for _, frame in ipairs(frames) do
		if frame.guid then
			frame:UpdateTargetInfo()
		end
	end
end

function addon:CheckMouseover()
	local guid = self.DB.highlightMouseover and UnitGUID("mouseover") or nil
	local hasFrame = false
	for _, frame in ipairs(frames) do
		if frame.guid then hasFrame = true end
		if guid and frame.guid and frame.targetGUID == guid then
			frame.iconBorder:Show()
		else
			frame.iconBorder:Hide()
		end
	end
	if hasFrame then
		UnitTracker:StartTrackingUnit("mouseover")
	else
		UnitTracker:StopTrackingUnit("mouseover")
	end
end

function addon:UpdateHealthBarVisibility()
	for _, frame in ipairs(frames) do
		if self.DB.showTargetHealthBar then
			frame.label:SetPoint("BOTTOM", 0, 10)
			frame:ResetHealthBar()
			frame.healthBar:Show()
			frame:SizeToFit()
		else
			frame.label:SetPoint("BOTTOM")
			frame.healthBar:Hide()
			frame:SizeToFit()
		end
		if self.DB.showHealthBarText then
			frame.healthBar.label:Show()
		else
			frame.healthBar.label:Hide()
		end
	end
end

for _, frame in ipairs(frames) do
	function frame:SizeToFit()
		local width = select(4, self.icon:GetPoint()) + self.icon:GetWidth() + 5 + self.label:GetStringWidth() + 10
		if addon.DB.showTargetHealthBar then
			width = math.max(width, 150)
		end
		self:SetWidth(width)
	end

	function frame:UpdateTargetInfo()
		local unit = UnitTracker:UnitIDForGUID(self.targetGUID)
		-- raid icon
		do
			local index
			if unit then index = GetRaidTargetIndex(unit) end
			if index then
				SetRaidTargetIconTexture(self.raidIcon, index)
				self.raidIcon:SetDim(false)
				self.raidIcon:Show()
			elseif unit and (unit ~= "mouseover" or UnitGUID(unit) == self.targetGUID) then
				self.raidIcon:Hide()
			else
				self.raidIcon:SetDim(true)
			end
		end
		-- health bar
		do
			if unit and addon.DB.showTargetHealthBar then
				if not self.timer then
					self.timer = AceTimer.ScheduleRepeatingTimer(self, "UpdateFrameHealthBar", 0.5)
				end
				self:UpdateFrameHealthBar()
			else
				self:CancelHealthTimer()
				self.healthBar:SetStatusBarColor(0.0, 0.5, 0.0)
				self.healthBar.label:SetVertexColor(0.5, 0.5, 0.5)
			end
		end
	end

	function frame:CancelHealthTimer()
		if self.timer then
			AceTimer.CancelTimer(self, self.timer)
			self.timer = nil
		end
	end

	-- Cleanup() only cleans up the transient state aspects
	-- such as raid icon and health bar.
	function frame:Cleanup()
		self.raidIcon:Hide()
		self.iconBorder:Hide()
		self:ResetHealthBar()
	end

	function frame:ResetHealthBar()
		self:CancelHealthTimer()
		self.healthBar:SetMinMaxValues(0, 100)
		self.healthBar:SetValue(100)
		self.healthBar:SetStatusBarColor(0.0, 0.5, 0.0)
		self.healthBar.label:SetVertexColor(0.5, 0.5, 0.5)
		self.healthBar.label:SetText("?? / ??")
	end

	local function round(num, places)
		local factor = math.pow(10, places)
		num = num * factor
		num = math.floor(num + 0.5)
		num = num / factor
		return num
	end
	local function abbreviateNum(num)
		if num >= 1000000 then
			num = num / 1000000
			return tostring(round(num, 1)).."M"
		elseif num >= 1000 then
			num = num / 1000
			return tostring(round(num, 1)).."K"
		end
		return tostring(num)
	end

	function frame:UpdateFrameHealthBar()
		local unit = UnitTracker:UnitIDForGUID(self.targetGUID)
		if not unit or not UnitGUID(unit) then return end
		local value, maxValue = UnitHealth(unit), UnitHealthMax(unit)
		self.healthBar:SetMinMaxValues(0, maxValue)
		self.healthBar:SetValue(value)
		self.healthBar:SetStatusBarColor(0.0, 1.0, 0.0)
		self.healthBar.label:SetVertexColor(1.0, 1.0, 1.0)
		if addon.DB.showHealthBarText then
			self.healthBar.label:SetText(abbreviateNum(value) .. " / " .. abbreviateNum(maxValue))
		end
	end
end

--[====[ Slash Commands ]====]

do
	local function tokenize(str)
		local tokens = {}
		local positions = {}
		local init = 1
		while true do
			local start, stop = str:find("%S+", init)
			if start then
				table.insert(tokens, str:sub(start, stop))
				table.insert(positions, start)
				init = stop+1
			else
				break
			end
		end
		return tokens, positions
	end
	SlashCmdList[addonName:upper()] = function(msg, editBox)
		local tokens, positions = tokenize(msg)
		if tokens[1] == "config" then
			addonTable.configConsole:ProcessCommand(tokens, positions, msg)
			return
		end
		print(printHeader.." commands:")
		print("  config - get/set config variables")
	end
	_G["SLASH_"..addonName:upper().."1"] = "/"..addonName
	_G["SLASH_"..addonName:upper().."2"] = "/sef"
end

--[====[ Events ]====]

function addon:TRACKER_ENABLED(event)
	self:Enable()
end
function addon:TRACKER_DISABLED(event)
	self:Disable()
end
do
	local spiritTargets = {}
	function addon:TRACKER_NEW_SPIRIT(event, name, guid, target, targetGUID, icon)
		local unit = UnitTracker:StartTrackingGUID(targetGUID)
		self:displaySpirit(name, guid, target, targetGUID, icon)
		spiritTargets[guid] = targetGUID
		if unit then
			self:GUID_HAS_UNIT_ID(nil, targetGUID, unit)
		end
		self:CheckMouseover()
		if UnitGUID("target") == targetGUID then
			self:warnSpiritTarget(name, guid, target, targetGUID, false)
		end
	end
	function addon:TRACKER_DEAD_SPIRIT(event, name, guid)
		self:hideSpirit(name, guid)
		UnitTracker:StopTrackingGUID(spiritTargets[guid])
		spiritTargets[guid] = nil
		self:CheckMouseover()
	end
end
function addon:TRACKER_SPIRIT_TARGET(event, name, guid, target, targetGUID)
	self:warnSpiritTarget(name, guid, target, targetGUID)
end
function addon:TRACKER_SPIRIT_TARGET_END(event)
	self:cancelWarnSpiritTarget()
end

function addon:GUID_HAS_UNIT_ID(event, guid, unitid)
	self:UpdateTargetInfo()
end
function addon:GUID_LOST_UNIT_ID(event, guid)
	self:UpdateTargetInfo()
end

function addon:UNIT_ID_VALID(event, unit)
	if unit == "mouseover" then
		self:CheckMouseover()
	end
end
function addon:UNIT_ID_INVALID(event, unit)
	if unit == "mouseover" then
		self:CheckMouseover()
	end
end

for _, v in ipairs({"ENABLED", "DISABLED", "NEW_SPIRIT", "DEAD_SPIRIT", "SPIRIT_TARGET", "SPIRIT_TARGET_END"}) do
	tracker.RegisterCallback(addon, v, "TRACKER_"..v)
end

for _, v in ipairs({"GUID_HAS_UNIT_ID", "GUID_LOST_UNIT_ID", "UNIT_ID_VALID", "UNIT_ID_INVALID"}) do
	UnitTracker.RegisterCallback(addon, v)
end

local frame = CreateFrame("frame")
frame:RegisterEvent("ADDON_LOADED")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:SetScript("OnEvent", function(self, event, ...)
	addon["EVENT_"..event](addon, ...)
end)

function addon:EVENT_ADDON_LOADED(name)
	if name == addonName then
		self.DB:Initialize()
		frame:UnregisterEvent("ADDON_LOADED")
	end
end
function addon:EVENT_PLAYER_ENTERING_WORLD()
	-- It seems GameFontNormalSmall may change between ADDON_LOADED and now
	self:updateConfigFrames()
	frame:UnregisterEvent("PLAYER_ENTERING_WORLD")
end

function addon:EVENT_RAID_TARGET_UPDATE()
	self:UpdateTargetInfo()
end
frame:RegisterEvent("RAID_TARGET_UPDATE")

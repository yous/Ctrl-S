local E, L, V, P, G, _ = unpack(select(2, ...)); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB
local DT = E:GetModule('DataTexts')

local format = string.format
local join = string.join
local floor = math.floor
local wipe = table.wipe

local APM = { TIMEMANAGER_PM, TIMEMANAGER_AM }
local europeDisplayFormat = '';
local ukDisplayFormat = '';
local europeDisplayFormat_nocolor = join("", "%02d", ":|r%02d")
local ukDisplayFormat_nocolor = join("", "", "%d", ":|r%02d", " %s|r")
local timerLongFormat = "%d:%02d:%02d"
local timerShortFormat = "%d:%02d"
local lockoutInfoFormat = "%s%s |cffaaaaaa(%s, %s/%s)"
local lockoutInfoFormatNoEnc = "%s%s |cffaaaaaa(%s)"
local formatBattleGroundInfo = "%s: "
local lockoutColorExtended, lockoutColorNormal = { r=0.3,g=1,b=0.3 }, { r=.8,g=.8,b=.8 }
local lockoutFormatString = { "%dd %02dh %02dm", "%dd %dh %02dm", "%02dh %02dm", "%dh %02dm", "%dh %02dm", "%dm" }
local curHr, curMin, curAmPm
local enteredFrame = false;
local resetInfoFormatter = join("", "|cffaaaaaa", L["Reset Data: Hold Shift + Right Click"], "|r")
local Update, lastPanel; -- UpValue
local localizedName, isActive, canQueue, startTime, canEnter
local name, instanceID, reset, difficultyId, locked, extended, isRaid, maxPlayers, difficulty, numEncounters, encounterProgress

local function ValueColorUpdate(hex, r, g, b)
	europeDisplayFormat = join("", "%02d", hex, ":|r%02d")
	ukDisplayFormat = join("", "", "%d", hex, ":|r%02d", hex, " %s|r")
	
	if lastPanel ~= nil then
		Update(lastPanel, 20000)
	end
end
E['valueColorUpdateFuncs'][ValueColorUpdate] = true

local function ConvertTime(h, m)
	local AmPm
	if E.db.datatexts.time24 == true then
		return h, m, -1
	else
		if h >= 12 then
			if h > 12 then h = h - 12 end
			AmPm = 1
		else
			if h == 0 then h = 12 end
			AmPm = 2
		end
	end
	return h, m, AmPm
end

local function CalculateTimeValues(tooltip)
	if (tooltip and E.db.datatexts.localtime) or (not tooltip and not E.db.datatexts.localtime) then
		return ConvertTime(GetGameTime())
	else
		local	dateTable =	date("*t")
		return ConvertTime(dateTable["hour"], dateTable["min"])
	end
end

local function OnLeave(self)
	DT.tooltip:Hide();
	enteredFrame = false;
end

local function OnEvent(self, event, ...)
	if not IsLoggedIn() then return end

	ElvDB = ElvDB or { };
	ElvDB['worldBoss'] = ElvDB['worldBoss'] or {};
	
	local wday = date('%w')
	local updateDay = '4'
	if GetLocale() == 'enUS' then updateDay = '2' end
	if wday == updateDay and not ElvDB['worldBoss'].reset then
		for k, v in pairs(ElvDB['worldBoss']) do
			v.rukhmarKilled = nil
			v.tarlnaKilled = nil
			v.drovKilled = nil
		end
		ElvDB['worldBoss'].reset = true
	end
	if wday ~= updateDay then
		ElvDB['worldBoss'].reset = nil
	end
	
	local myname = E.myname..'-'..E.myrealm

	if not ElvDB['worldBoss'].reset then
		for k, v in pairs(ElvDB['worldBoss']) do
			if k and not k:find('-') then 
				ElvDB['worldBoss'][k] = nil
			end
		end
		ElvDB['worldBoss'].reset = true
	end
	
	ElvDB['worldBoss'][myname] = ElvDB['worldBoss'][myname] or {};
	ElvDB['worldBoss'][myname].realm = E.myrealm
	ElvDB['worldBoss'][myname].class = E.myclass
	ElvDB['worldBoss'][myname].rukhmarKilled = IsQuestFlaggedCompleted(37464)
	ElvDB['worldBoss'][myname].tarlnaKilled = IsQuestFlaggedCompleted(37462)
	ElvDB['worldBoss'][myname].drovKilled = IsQuestFlaggedCompleted(37460)	
end

local function Click(self, btn)
	if btn == "RightButton" and IsShiftKeyDown() then
		ElvDB.worldBoss = nil;
		OnEvent(self)
		DT.tooltip:Hide();
	else
		GameTimeFrame:Click();
	end
end

local function KillColor(k1,n1,k2,n2,k3,n3,class)
	local str = ''
	if k1 then
		str = format('|cffff0000%s|r', E:ShortenString(n1,3))
	else
		str = format('|cff07D400%s|r', E:ShortenString(n1,3))
	end
	if k2 then
		str = str.. '/'.. format('|cffff0000%s|r', E:ShortenString(n2,3))
	else
		str = str.. '/'.. format('|cff07D400%s|r', E:ShortenString(n2,3))
	end
	if k3 then
		str = str.. '/'.. format('|cffff0000%s|r', E:ShortenString(n3,3))
	else
		str = str.. '/'.. format('|cff07D400%s|r', E:ShortenString(n3,3))
	end
	
	return str, RAID_CLASS_COLORS[class].r, RAID_CLASS_COLORS[class].g, RAID_CLASS_COLORS[class].b, 1,1,1
end

local function GetLFGStr(id,index,str)
	local bossName, _, isKilled = GetLFGDungeonEncounterInfo(id, index)
	if str ~= '' then str = str.. '/'; end
	bossName = string.gsub(bossName, "『", "")
	bossName = string.gsub(bossName, "』", "")
	if isKilled then
		str = str..format('|cffff0000%s|r', E:ShortenString(bossName,2))
	else
		str = str..format('|cff07D400%s|r', E:ShortenString(bossName,2))
	end
	return str
end

local function LFGShow(id, startIndex, endIndex, tooltip)
	local dungeonName = GetLFGDungeonInfo(id)
	local str = '';
	for i = startIndex, endIndex do
		str = GetLFGStr(id, i, str)
	end
	tooltip:AddDoubleLine(dungeonName, str)
end

local function OnEnter(self)
	DT:SetupTooltip(self)
	enteredFrame = true;
	
	DT.tooltip:AddLine(VOICE_CHAT_BATTLEGROUND);
	for i = 1, GetNumWorldPVPAreas() do
		_, localizedName, isActive, canQueue, startTime, canEnter = GetWorldPVPAreaInfo(i)
		if canEnter then
			if isActive then
				startTime = WINTERGRASP_IN_PROGRESS
			elseif startTime == nil then
				startTime = QUEUE_TIME_UNAVAILABLE
			else
				startTime = SecondsToTime(startTime, false, nil, 3)
			end
			DT.tooltip:AddDoubleLine(format(formatBattleGroundInfo, localizedName), startTime, 1, 1, 1, lockoutColorNormal.r, lockoutColorNormal.g, lockoutColorNormal.b)	
		end
	end	

	local oneraid, lockoutColor
	for i = 1, GetNumSavedInstances() do
		name, _, reset, difficultyId, locked, extended, _, isRaid, maxPlayers, difficulty, numEncounters, encounterProgress  = GetSavedInstanceInfo(i)
		if isRaid and (locked or extended) and name then
			if not oneraid then
				DT.tooltip:AddLine(" ")
				DT.tooltip:AddLine(L["Saved Raid(s)"])
				oneraid = true
			end
			if extended then 
				lockoutColor = lockoutColorExtended 
			else 
				lockoutColor = lockoutColorNormal 
			end
			
			local _, _, isHeroic, _, displayHeroic, displayMythic = GetDifficultyInfo(difficultyId)
			if (numEncounters and numEncounters > 0) and (encounterProgress and encounterProgress > 0) then
				DT.tooltip:AddDoubleLine(format(lockoutInfoFormat, maxPlayers, (displayMythic and "M" or (isHeroic or displayHeroic) and "H" or "N"), name, encounterProgress, numEncounters), SecondsToTime(reset, false, nil, 3), 1, 1, 1, lockoutColor.r, lockoutColor.g, lockoutColor.b)
			else
				DT.tooltip:AddDoubleLine(format(lockoutInfoFormatNoEnc, maxPlayers, (displayMythic and "M" or (isHeroic or displayHeroic) and "H" or "N"), name), SecondsToTime(reset, false, nil, 3), 1, 1, 1, lockoutColor.r, lockoutColor.g, lockoutColor.b)
			end		
		end
	end
	
	local timeText
	local Hr, Min, AmPm = CalculateTimeValues(true)
	
	DT.tooltip:AddLine(" ")
	if AmPm == -1 then
		DT.tooltip:AddDoubleLine(E.db.datatexts.localtime and TIMEMANAGER_TOOLTIP_REALMTIME or TIMEMANAGER_TOOLTIP_LOCALTIME, 
			format(europeDisplayFormat_nocolor, Hr, Min), 1, 1, 1, lockoutColorNormal.r, lockoutColorNormal.g, lockoutColorNormal.b)
	else
		DT.tooltip:AddDoubleLine(E.db.datatexts.localtime and TIMEMANAGER_TOOLTIP_REALMTIME or TIMEMANAGER_TOOLTIP_LOCALTIME,
			format(ukDisplayFormat_nocolor, Hr, Min, APM[AmPm]), 1, 1, 1, lockoutColorNormal.r, lockoutColorNormal.g, lockoutColorNormal.b)
	end	

	local myname = E.myname..'-'..E.myrealm
	
	ElvDB = ElvDB or { };
	ElvDB['worldBoss'] = ElvDB['worldBoss'] or {};
	ElvDB['worldBoss'][myname] = ElvDB['worldBoss'][myname] or {};
	ElvDB['worldBoss'][myname].realm = E.myrealm
	ElvDB['worldBoss'][myname].class = E.myclass
	ElvDB['worldBoss'][myname].rukhmarKilled = IsQuestFlaggedCompleted(37464)
	ElvDB['worldBoss'][myname].tarlnaKilled = IsQuestFlaggedCompleted(37462)
	ElvDB['worldBoss'][myname].drovKilled = IsQuestFlaggedCompleted(37460)	
	local rukhmar_name = EJ_GetEncounterInfo(1262)
	local tarlna_name = EJ_GetEncounterInfo(1211)
	local drov_name = EJ_GetEncounterInfo(1291)
	
	DT.tooltip:AddLine(" ")
	DT.tooltip:AddLine(L["World Boss(s)"])

	local wNum, maxNum = 0, 11
	if IsShiftKeyDown() then maxNum = 50 end
	for k, v in pairs(ElvDB['worldBoss']) do
		if v and type(v) == 'table' then
			if wNum < maxNum then
				local name = k
				if v.realm == E.myrealm then name = string.gsub(name, '-'..v.realm, '') end
				DT.tooltip:AddDoubleLine(name..':', KillColor(v.rukhmarKilled, rukhmar_name, v.tarlnaKilled, tarlna_name, v.drovKilled, drov_name, v.class))
				wNum = wNum + 1
			end
			if wNum == maxNum then
				DT.tooltip:AddLine('...')
				break
			end
		end
	end
	
	local avgItemLevel = GetAverageItemLevel()
	if avgItemLevel >= 460 then
		DT.tooltip:AddLine(" ")
		DT.tooltip:AddLine("|cff1784d1LFR "..BOSS..':|r')
	end
	if avgItemLevel >= 460 and (avgItemLevel <500 or IsAltKeyDown()) then
		LFGShow(527, 1, 3, DT.tooltip)
		LFGShow(528, 4, 6, DT.tooltip)
	end
	if avgItemLevel >= 470 and (avgItemLevel <500 or IsAltKeyDown()) then
		if avgItemLevel < 480 then DT.tooltip:AddLine(" ") end
		LFGShow(529, 1, 3, DT.tooltip)
		LFGShow(530, 4, 6, DT.tooltip)
		DT.tooltip:AddLine(" ")
		LFGShow(526, 1, 4, DT.tooltip)
	end	
	
	if avgItemLevel >= 480 and (avgItemLevel <540 or IsAltKeyDown()) then
		LFGShow(610, 1, 3, DT.tooltip)
		LFGShow(611, 4, 6, DT.tooltip)
		LFGShow(612, 7, 9, DT.tooltip)
		LFGShow(613, 10, 12, DT.tooltip)
	end
	
	if avgItemLevel >= 500 and avgItemLevel < 599 then
		LFGShow(716, 1, 4, DT.tooltip)
		LFGShow(717, 5, 8, DT.tooltip)
		LFGShow(724, 9, 11, DT.tooltip)
		LFGShow(725, 12, 14, DT.tooltip)
	end

	if avgItemLevel >= 615 then
		LFGShow(895, 1, 3, DT.tooltip)
		LFGShow(896, 4, 6, DT.tooltip)
		LFGShow(897, 7, 7, DT.tooltip)

		LFGShow(898, 1, 3, DT.tooltip)
		LFGShow(899, 4, 6, DT.tooltip)
		LFGShow(900, 7, 10, DT.tooltip)
	end
	
--[[	if UnitLevel('player') == MAX_PLAYER_LEVEL then
		DT.tooltip:AddLine' '
		DT.tooltip:AddLine('|cff1784d1'..FLEX_RAID..':|r')
		LFGShow(726, 1, 4, DT.tooltip)
		LFGShow(728, 5, 8, DT.tooltip)
		LFGShow(729, 9, 11, DT.tooltip)
		LFGShow(730, 12, 14, DT.tooltip)
	end]]
	
	DT.tooltip:AddLine' '
	DT.tooltip:AddLine(resetInfoFormatter)
	DT.tooltip:Show()
end

local int = 3
function Update(self, t)
	int = int - t
		
	if int > 0 then return end
	
	if GameTimeFrame.flashInvite then
		E:Flash(self, 0.53)
	else
		E:StopFlash(self)
	end	
	
	if enteredFrame then
		OnEnter(self)
	end

	local Hr, Min, AmPm = CalculateTimeValues(false)

	-- no update quick exit
	if (Hr == curHr and Min == curMin and AmPm == curAmPm) and not (int < -15000) then
		int = 5
		return
	end

	curHr = Hr
	curMin = Min
	curAmPm = AmPm
		
	if AmPm == -1 then
		self.text:SetFormattedText(europeDisplayFormat, Hr, Min)
	else
		self.text:SetFormattedText(ukDisplayFormat, Hr, Min, APM[AmPm])
	end
	lastPanel = self
	int = 5
end

--[[
	DT:RegisterDatatext(name, events, eventFunc, updateFunc, clickFunc, onEnterFunc, onLeaveFunc)
	
	name - name of the datatext (required)
	events - must be a table with string values of event names to register 
	eventFunc - function that gets fired when an event gets triggered
	updateFunc - onUpdate script target function
	click - function to fire when clicking the datatext
	onEnterFunc - function to fire OnEnter
	onLeaveFunc - function to fire OnLeave, if not provided one will be set for you that hides the tooltip.
]]
DT:RegisterDatatext('Time', {'PLAYER_ENTER_WORLD, PLAYER_REGEN_ENABLED'}, OnEvent, Update, Click, OnEnter, OnLeave)

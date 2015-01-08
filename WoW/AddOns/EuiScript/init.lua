local E, L, V, P, G = unpack(ElvUI); --Engine
local S = E:NewModule('EuiScript', 'AceEvent-3.0', 'AceHook-3.0', 'AceTimer-3.0');
E.build = GetAddOnMetadata("EuiScript", "Version")
E.Euiscript = S
local format = string.format
local floor = math.floor
local split = string.split

-- buy max number value with alt
function S:ByMaxNumber(self, ...)
	if ( IsAltKeyDown() ) then
		local itemLink = GetMerchantItemLink(self:GetID())
		if not itemLink then return end
		local maxStack = select(8, GetItemInfo(itemLink))
		if ( maxStack and maxStack > 1 ) then
			BuyMerchantItem(self:GetID(), GetMerchantItemMaxStack(self:GetID()))
		end
	end
end

----------------------------------------------------------------------------------------
--	Chat channel check
----------------------------------------------------------------------------------------
function E:CheckChat(warning)
	if IsInGroup(LE_PARTY_CATEGORY_INSTANCE) then
		return "INSTANCE_CHAT"
	elseif IsInRaid(LE_PARTY_CATEGORY_HOME) then
		if warning and (UnitIsGroupLeader("player") or UnitIsGroupAssistant("player") or IsEveryoneAssistant()) then
			return "RAID_WARNING"
		else
			return "RAID"
		end
	elseif IsInGroup(LE_PARTY_CATEGORY_HOME) then
		return "PARTY"
	end
	return "SAY"
end


function S:SellItem()
	if not E.db.euiscript.autosell then return end
	local c = 0
	for b=0,4 do
		for s=1,GetContainerNumSlots(b) do
			local l = GetContainerItemLink(b, s)
			if l then
				if (not select(11, GetItemInfo(l))) or (not select(2, GetContainerItemInfo(b, s))) then break; end
				local itemid = tonumber(l:match("item:(%d+)"))
				
				local p = select(11, GetItemInfo(l))*select(2, GetContainerItemInfo(b, s))
				if ((select(3, GetItemInfo(l))==0) or E.db.euiscript.autosellList[itemid]) and (p>0) and (itemid ~= 114002) then
					UseContainerItem(b, s)
					PickupMerchantItem()
					c = c+p
					E:Print(L['Vendored gray items for:']..select(2, GetItemInfo(l)));
				end
			end
		end
	end
	if c>0 then
		local g, s, c = floor(c/10000) or 0, floor((c%10000)/100) or 0, c%100
		E:Print(" |cffffffff"..g..L.goldabbrev.." |cffffffff"..s..L.silverabbrev.." |cffffffff"..c..L.copperabbrev..".")			
	end
end


function S:CreateVehicleExit()
	local vehicle = CreateFrame("Button", nil, E.UIParent, "SecureHandlerClickTemplate")
	vehicle:Width(26)
	vehicle:Height(26)
	vehicle:Point("BOTTOMLEFT", Minimap, "BOTTOMLEFT", 2, 2)
	vehicle:SetNormalTexture("Interface\\AddOns\\ElvUI\\media\\textures\\vehicleexit")
	vehicle:SetPushedTexture("Interface\\AddOns\\ElvUI\\media\\textures\\vehicleexit")
	vehicle:SetHighlightTexture("Interface\\AddOns\\ElvUI\\media\\textures\\vehicleexit")
	vehicle:SetTemplate("Default")
	vehicle:RegisterForClicks("AnyUp")
	vehicle:SetScript("OnClick", function() VehicleExit() end)
	RegisterStateDriver(vehicle, "visibility", "[vehicleui][target=vehicle,noexists] hide;show")
end

function S:AutoCollect()
	local eventcount = 0
	local EUIInGame = CreateFrame("Frame")
	EUIInGame:RegisterAllEvents()
	EUIInGame:SetScript("OnEvent", function(self, event)
		eventcount = eventcount + 1
		if InCombatLockdown() then return end

		if eventcount > 6000 or event == "PLAYER_ENTERING_WORLD" then
			collectgarbage("collect")
			eventcount = 0
		end
	end)
end

-- Auto invite by whisper
function S:AutoInvite(...)
	local event, arg1, arg2 = ...
	if ((not UnitExists("party1") or UnitIsGroupLeader("player") or UnitIsGroupAssistant("player")) and (arg1:lower() == E.db.euiscript.ainvkeyword:lower())) and E.db.euiscript.autoinvenable == true then
		if event == 'CHAT_MSG_BN_WHISPER' then
			local totalBNet = BNGetNumFriends()
			for i = 1, totalBNet do
				local presenceID, presenceName, _,_,_,_,client,isOnline = BNGetFriendInfo(i)
				if isOnline and presenceName == arg2 and client == 'WoW' then
					local _, charName, _, realmName = BNGetToonInfo(presenceID)
					if realmName ~= GetRealmName() then charName = charName..'-'..realmName end
					InviteUnit(charName)
					return;
				end
			end	
		else
			InviteUnit(arg2)
		end
	end
end

function S:AddEuiMenuButton()
	local Button = CreateFrame("Button", "GameMenuButtonEUI", GameMenuFrame, "GameMenuButtonTemplate")
--	E.Skins:HandleButton(Button)
	Button:SetSize(GameMenuButtonMacros:GetWidth(), GameMenuButtonMacros:GetHeight())
	Button:SetText(E.ValColor..'EUI|r')
	Button:SetScript("OnClick", function()
		HideUIPanel(GameMenuFrame)
		E:ToggleConfig()
	end)
	local height = GameMenuButtonMacros:GetHeight()
	
	GameMenuFrame:SetHeight(GameMenuFrame:GetHeight() + height + 16)
	GameMenuFrame.SetHeight = E.noop
	Button:SetPoint("TOP", GameMenuButtonContinue, "BOTTOM", 0, -2)
	if E.private.skins.blizzard.enable ~= true or E.private.skins.blizzard.misc ~= true then return end
	E:GetModule('Skins'):HandleButton(Button);
end

function E:CheckChat(warning)
	if IsInGroup(LE_PARTY_CATEGORY_INSTANCE) then
		return "INSTANCE_CHAT"
	elseif IsInRaid(LE_PARTY_CATEGORY_HOME) then
		if warning and (UnitIsGroupLeader("player") or UnitIsGroupAssistant("player") or IsEveryoneAssistant()) then
			return "RAID_WARNING"
		else
			return "RAID"
		end
	elseif IsInGroup(LE_PARTY_CATEGORY_HOME) then
		return "PARTY"
	end
	return "SAY"
end


function S:Announcements(...)
	local event, _, subEvent, _, _, srcName, _, _, _, destName, _, _, spellID = ...

	if not IsInGroup() or InCombatLockdown() or not subEvent or not spellID or not srcName then return end
	if not UnitInRaid(srcName) and not UnitInParty(srcName) then return end
	if not E.db.euiscript.announcements then return; end
	
	local srcName = format(srcName:gsub("%-[^|]+", ""))
	if subEvent == "SPELL_CAST_SUCCESS" then
		-- Feasts
		if (spellID == 126492 or spellID == 126494) then
			SendChatMessage(string.format(L["ANNOUNCE_FP_STAT"], srcName, GetSpellLink(spellID), SPELL_STAT1_NAME), E:CheckChat(true))
		elseif (spellID == 126495 or spellID == 126496) then
			SendChatMessage(string.format(L["ANNOUNCE_FP_STAT"], srcName, GetSpellLink(spellID), SPELL_STAT2_NAME), E:CheckChat(true))
		elseif (spellID == 126501 or spellID == 126502) then
			SendChatMessage(string.format(L["ANNOUNCE_FP_STAT"], srcName, GetSpellLink(spellID), SPELL_STAT3_NAME), E:CheckChat(true))
		elseif (spellID == 126497 or spellID == 126498) then
			SendChatMessage(string.format(L["ANNOUNCE_FP_STAT"], srcName, GetSpellLink(spellID), SPELL_STAT4_NAME), E:CheckChat(true))
		elseif (spellID == 126499 or spellID == 126500) then
			SendChatMessage(string.format(L["ANNOUNCE_FP_STAT"], srcName, GetSpellLink(spellID), SPELL_STAT5_NAME), E:CheckChat(true))
		elseif (spellID == 104958 or spellID == 105193 or spellID == 126503 or spellID == 126504 or spellID == 145166 or spellID == 145169 or spellID == 145196 or spellID == 160914 or spellID == 160740 or spellID == 175215) then
			SendChatMessage(string.format(L["ANNOUNCE_FP_PRE"], srcName, GetSpellLink(spellID)), E:CheckChat(true))
		-- Refreshment Table
		elseif spellID == 43987 then
			SendChatMessage(string.format(L["ANNOUNCE_FP_PRE"], srcName, GetSpellLink(spellID)), E:CheckChat(true))
		-- Ritual of Summoning
		elseif spellID == 698 then
			SendChatMessage(string.format(L["ANNOUNCE_FP_CLICK"], srcName, GetSpellLink(spellID)), E:CheckChat(true))
		-- Piccolo of the Flaming Fire
		elseif spellID == 18400 then
			SendChatMessage(string.format(L["ANNOUNCE_FP_USE"], srcName, GetSpellLink(spellID)), E:CheckChat(true))
		elseif spellID == 34477 and destName then
			SendChatMessage(srcName..GetSpellLink(spellID)..'>>'..destName..'<<', E:CheckChat(true))
		end
	elseif subEvent == "SPELL_SUMMON" then
		-- Repair Bots
		if E.global.announcements.AnnounceBots[spellID] then
			SendChatMessage(string.format(L["ANNOUNCE_FP_PUT"], srcName, GetSpellLink(spellID)), E:CheckChat(true))
		end
	elseif subEvent == "SPELL_CREATE" then
		-- Ritual of Souls and MOLL-E
		if (spellID == 29893 or spellID == 54710) then
			SendChatMessage(string.format(L["ANNOUNCE_FP_PUT"], srcName, GetSpellLink(spellID)), E:CheckChat(true))
		-- Toys
		elseif E.global.announcements.AnnounceToys[spellID] then
			SendChatMessage(string.format(L["ANNOUNCE_FP_PUT"], srcName, GetSpellLink(spellID)), E:CheckChat(true))
		-- Portals
		elseif E.global.announcements.AnnouncePortals[spellID] then
			SendChatMessage(string.format(L["ANNOUNCE_FP_CAST"], srcName, GetSpellLink(spellID)), E:CheckChat(true))
		end
	elseif subEvent == "SPELL_AURA_APPLIED" then
		-- Turkey Feathers and Party G.R.E.N.A.D.E.
		if (spellID == 61781 or ((spellID == 51508 or spellID == 51510) and destName == E.myname)) then
			SendChatMessage(string.format(L["ANNOUNCE_FP_USE"], srcName, GetSpellLink(spellID)), E:CheckChat(true))
		end
	end
end

function S:ChangeActionbarPage()
	if not UnitIsPlayer("target") then return; end
	if InCombatLockdown() then self:RegisterEvent('PLAYER_REGEN_ENABLED'); return; end
	
	local change = (UnitFactionGroup('player') == UnitFactionGroup('target'))
	if not change then
		ChangeActionBarPage(2)
	else
		ChangeActionBarPage(1)
	end
end

function S:PLAYER_REGEN_ENABLED()
	self:UnregisterEvent("PLAYER_REGEN_ENABLED");
	self:ChangeActionbarPage()
end

local function changeLoot()
	if IsInGroup() and UnitIsGroupLeader('player') and GetNumGroupMembers() > 1 then
		if GetLootMethod() ~= "freeforall" then
			SetLootMethod("freeforall")
		end
	end
	if IsInRaid() and UnitIsGroupLeader('player') and GetNumGroupMembers() > 1 then
		if GetLootMethod() ~= "master" then
			SetLootMethod("master")
		end
		if GetLootThreshold() ~= 4 then
			SetLootThreshold(4)
		end
	end
end

function S:AutoChangeLoot()
	if not E.db.euiscript.autochangeloot then 
		S:UnregisterEvent("GROUP_ROSTER_UPDATE")
		return; 
	end
	E:ScheduleTimer(changeLoot, 5)
end

--[[ function S:RaidFinderFix() 
	if IsAddOnLoaded('RaidFinderFix') then
		self:UnregisterEvent("LFG_PROPOSAL_SHOW")
		self:UnregisterEvent("LFG_PROPOSAL_UPDATE")
		return
	end
	local _, _, _, _, _, _, _, _, _, completedEncounters, _, _, _, totalEncounters = GetLFGProposal(); 
	if completedEncounters then
		LFGDungeonReadyDialogInstanceInfoFrame.statusText:SetFormattedText(completedEncounters.." "..BOSS_DEAD)
	end
end ]]

function S:GetGuildRanks()
	local value = {}
	if IsInGuild() then
		local ranks = GuildControlGetNumRanks()
		for i = 1, ranks do
			value[i] = GuildControlGetRankName(i)
		end
	end
	return value
end

function S:InviteRanks()
	if not IsInGuild() then return end
	
	local numMembers = GetNumGuildMembers();
	for i = 1, numMembers do
		local name, _, rankIndex, _, _, _, _, _, online = GetGuildRosterInfo(i)
		if online and rankIndex <= E.db.euiscript.inviteRank then
			InviteUnit(name)
		end
		if not IsInGuild() and IsInGroup() and UnitIsGroupLeader("player") then ConvertToRaid(); end
	end
end

function S:TradeTargetLevel(event)
	if IsAddOnLoaded('TheBurningTrade') then
		self:UnregisterEvent("TRADE_SHOW")
		self:UnregisterEvent("TRADE_CLOSED")
		return;
	end
	
	if event == 'TRADE_SHOW' then
		if not TradeFrame.targetLevel then
			TradeFrame.targetLevel = TradeFrame:CreateFontString(nil, 'OVERLAY')
			TradeFrame.targetLevel:FontTemplate(nil, 12, 'OUTLINE')
			TradeFrame.targetLevel:SetPoint("BOTTOMLEFT", TradeFrame, "BOTTOMLEFT", 8, 8)
		end
		TradeFrame.targetLevel:SetText(TARGET..LEVEL.. ': '.. UnitLevel('NPC'))
		if UnitLevel('NPC') < 10 then TradeFrame.targetLevel:SetTextColor(1,0,0) end
		TradeFrame.targetLevel:Show()
	elseif event == 'TRADE_CLOSED' then
		if not TradeFrame.targetLevel then return; end
		TradeFrame.targetLevel:Hide()
	end
end

----------------------------------------------------------------------------------------
--	Collect minimap buttons in one line
----------------------------------------------------------------------------------------
local BlackList = {
	["QueueStatusMinimapButton"] = true,
	["MiniMapTracking"] = true,
	["MiniMapMailFrame"] = true,
	["HelpOpenTicketButton"] = true,
	["GameTimeFrame"] = true,
	["ElvConfigToggle"] = true,
	["ZygorGuidesViewerMapIcon"] = true,
	["MiniMapTrackingButton"] = true,
	["MiniMapVoiceChatFrame"] = true,
	["TimeManagerClockButton"] = true,	
}
local WhiteList = {
	["BagSync_MinimapButton"] = true,
}

local buttons = {}
local function CreateMinimapButton()
	local button = CreateFrame("Button", "EUIMinimapButton", UIParent)
	E.FrameLocks['EUIMinimapButton'] = true;
	
	button:SetFrameStrata("MEDIUM")
	button:RegisterForClicks("anyUp")

	button:SetClampedToScreen(true)
	button:StyleButton()
	button:SetTemplate('Default')
	button:Size(20)
	button:SetPoint('CENTER', Minimap, 'TOPLEFT', 0, -E.db.general.minimap.size / 2)
	E:CreateMover(button, "EUIMinimapButtonMover", L['Square minimap icons'], nil, nil, nil, "ALL,SOLO", function() return E.db.euiscript.buttonCollect; end)
	button.texture = button:CreateTexture(nil, 'OVERLAY')
	button.texture:Size(22)
	button.texture:SetPoint('CENTER')
	button.texture:SetTexture('Interface\\AddOns\\ElvUI\\media\\textures\\tank')
	button:SetScript("OnClick", function(self)
		for i = 1, #buttons do
			if buttons[i]:IsShown() then buttons[i]:Hide() else buttons[i]:Show() end
		end
	end)
	
	return button
end

local function PositionAndStyle(button)
--	local line = math.ceil(E.db.general.minimap.size / 20)
--	local position = MinimapMover:GetPoint()

	for i = 1, #buttons do
		buttons[i]:ClearAllPoints()
		if E.db.euiscript.buttonCollectDC == 'DOWN' then
			if i == 1 then
				buttons[i]:SetPoint("TOP", button, "BOTTOM", 0, -2)
		--	elseif i == line then
		--		buttons[i]:SetPoint("TOPRIGHT", buttons[1], "TOPLEFT", -1, 0)
			else
				buttons[i]:SetPoint("TOP", buttons[i-1], "BOTTOM", 0, -1)
			end
		else
			if i == 1 then
				buttons[i]:SetPoint("BOTTOM", button, "TOP", 0, 2)
		--	elseif i == line then
		--		buttons[i]:SetPoint("TOPRIGHT", buttons[1], "TOPLEFT", -1, 0)
			else
				buttons[i]:SetPoint("BOTTOM", buttons[i-1], "TOP", 0, 1)
			end
		end
		buttons[i].ClearAllPoints = E.dummy
		buttons[i].SetPoint = E.dummy
		buttons[i]:Hide()
		if (buttons[i]:HasScript("OnClick")) then
			buttons[i]:HookScript("OnClick", function(self)
				for i = 1, #buttons do
					if buttons[i]:IsShown() then buttons[i]:Hide() end
				end
			end)
		elseif (buttons[i]:HasScript("OnMouseUp")) then
			buttons[i]:HookScript("OnMouseUp", function(self)
				for i = 1, #buttons do
					if buttons[i]:IsShown() then buttons[i]:Hide() end
				end
			end)
		end
	end
end

--Camera Distance
function S:ModifyCamera()
	SetCVar("cameraDistanceMoveSpeed", E.db.euiscript.cameraspeed or 15)
	SetCVar("cameraDistanceMaxFactor", E.db.euiscript.camerafactor or 2);
	SetCVar("cameraDistanceMax", E.db.euiscript.cameradistance or 20);	
end

local function buttonCollect()
	local button = _G['EUIMinimapButton'] or CreateMinimapButton()
	
	for i, child in ipairs({Minimap:GetChildren()}) do
		local childName = child:GetName()
		local Handy = childName and (string.find(childName, "HandyNotesPin"))
		if (not BlackList[childName] and not Handy) then
			if ((child:GetObjectType() == "Button" and child:GetNumRegions() >= 3) or WhiteList[childName]) and child:IsShown() then
				pcall(child.SetParent,button)
				tinsert(buttons, child)
			end
		end
	end
	if #buttons == 0 then
		button:Hide()
	end
	
	PositionAndStyle(button)
end

function S:CollapseObjective()

	if IsInInstance() then
		if (not ObjectiveTrackerFrame.collapsed) then
			ObjectiveTracker_Collapse();
		end
	else
		if ObjectiveTrackerFrame.collapsed then
			ObjectiveTracker_Expand();
		end
	end		
end

function S:ButtonCollect()
--	self:ModifyChatSticky() --call other module
	self:loggingCombat() --call other module
	self:ModifyCamera()
	self:RegisterEvent("UPDATE_BATTLEFIELD_STATUS", "AutoBattle")--for autoleavebn
	self:CollapseObjective()
	self:FixPriestTicks()
	
	if GarrisonLandingPageMinimapButton then 
		GarrisonLandingPageMinimapButton:SetSize(36,36)
	end
	
	if not E.db.euiscript.buttonCollect then return; end
	
	if IsAddOnLoaded('MBB') then DisableAddOn('MBB') end	
	
--	if LibDBIcon10_WowSocial_UI then LibDBIcon10_WowSocial_UI:SetParent(Minimap) end
--	if LibDBIcon10_RaidBuilder then LibDBIcon10_RaidBuilder:SetParent(Minimap) end
	E:ScheduleTimer(buttonCollect, 2)
end

function S:TakeScreen()
	if not E.db.euiscript.autoscreenshoot then return; end
	
	E:ScheduleTimer(Screenshot, 1)
end

function S:loggingCombat()
	if not E.db.euiscript.logging_combat then return; end
	
	local inInstance, instanceType = IsInInstance()
	if inInstance and instanceType == "raid" then
		if not LoggingCombat() then
			LoggingCombat(1)
			E:Print("|cffffff00"..COMBATLOGENABLED.."|r")
		end
	else
		if LoggingCombat() then
			LoggingCombat(0)
			E:Print("|cffffff00"..COMBATLOGDISABLED.."|r")
		end
	end
end

function S:AutoBattle()
	if E.db.euiscript.autoleavebnsec < 0 then return; end
	local inInstance, instanceType = IsInInstance()
	local sec = E.db.euiscript.autoleavebnsec
	if sec == 0 then sec = 0.5 end
	
	if GetBattlefieldWinner() and instanceType == "pvp" then
		E:Print(L['Will be in %s seconds, automatically leave the battlefield!']:format(sec))
		E:ScheduleTimer(LeaveBattlefield, sec)
		S:UnregisterEvent("UPDATE_BATTLEFIELD_STATUS")
	end
end

function S:WorldStateAlwaysUpFrame_Update()
	_G["WorldStateAlwaysUpFrame"]:ClearAllPoints() 
	_G["WorldStateAlwaysUpFrame"].ClearAllPoints = E.noop 
	_G["WorldStateAlwaysUpFrame"]:SetPoint("TOP",S.WorldState,"TOP", 0, 0)
	_G["WorldStateAlwaysUpFrame"].SetPoint = E.noop
end 

function S:Pop_ShowMenu(self)
	E.Friends_Source = OPEN_DROPDOWNMENUS[1] and OPEN_DROPDOWNMENUS[1].which or self.owner
end

function S:FixPriestTicks()
	local mfTicks = 3
	if E.myclass == "PRIEST" and IsSpellKnown(157223) then --Enhanced Mind Flay
		mfTicks = 4
	end

	E.global.unitframe.ChannelTicks[GetSpellInfo(15407)] = mfTicks -- "Mind Flay"
	E.global.unitframe.ChannelTicks[GetSpellInfo(129197)] = mfTicks -- "Mind Flay (Insanity)"
	G.unitframe.ChannelTicks[GetSpellInfo(15407)] = mfTicks -- "Mind Flay"
	G.unitframe.ChannelTicks[GetSpellInfo(129197)] = mfTicks -- "Mind Flay (Insanity)"	
end

function S:Initialize()
	self:CreateVehicleExit()
	self:AutoCollect()
	self:AddEuiMenuButton()

	if not S.WorldState then S.WorldState = CreateFrame("Frame", "EuiWorldState", UIParent) end
	S.WorldState:SetPoint("TOP", UIParent, "TOP", -30, -60);
	S.WorldState:SetSize(200, 100)
	E:CreateMover(S.WorldState, 'EuiWorldStateMover', L["BG Score"], nil, nil, nil, 'ALL,EUI')
	
	SetCVar("taintLog", 0); 
	SetCVar("xpBarText", 1) 
	SetCVar("alternateResourceText", 1) 

	E.db.combattext = nil
	
	hooksecurefunc("StaticPopup_Show", function(arg)
		if arg == "DEATH" and not UnitIsDead("PLAYER") then
			StaticPopup_Hide("DEATH")
		end
	end)

	if ChatFrame1EditBox:IsShown() then ChatFrame1EditBox:Hide() end
	
	----------------------------------------------------------------------------------------
	--	Auto select current event boss from LFD tool(EventBossAutoSelect by Nathanyel)
	----------------------------------------------------------------------------------------
	local firstLFD
	LFDParentFrame:HookScript("OnShow", function()
		if not firstLFD then
			firstLFD = 1
			for i = 1, GetNumRandomDungeons() do
				local id = GetLFGRandomDungeonInfo(i)
				local isHoliday = select(15, GetLFGDungeonInfo(id))
				if isHoliday and not GetLFGDungeonRewards(id) then
					LFDQueueFrame_SetType(id)
				end
			end
		end
	end)
	
	self:SecureHook('MerchantItemButton_OnModifiedClick', 'ByMaxNumber')

	self:SecureHook("WorldStateAlwaysUpFrame_Update", 'WorldStateAlwaysUpFrame_Update')
	self:SecureHook("UnitPopup_ShowMenu", "Pop_ShowMenu")
	self:RegisterEvent("MERCHANT_SHOW", 'SellItem')
	self:RegisterEvent("ACHIEVEMENT_EARNED", "TakeScreen")

	self:RegisterEvent("PLAYER_ENTERING_WORLD", "ButtonCollect")
	self:RegisterEvent("CHAT_MSG_WHISPER", "AutoInvite")
	self:RegisterEvent("CHAT_MSG_BN_WHISPER", "AutoInvite")
	self:RegisterEvent("ZONE_CHANGED_NEW_AREA", "ModifyCamera")
	self:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED", "Announcements")
	self:RegisterEvent("GROUP_ROSTER_UPDATE", "AutoChangeLoot")
	
	
	self:RegisterEvent("TRADE_SHOW", "TradeTargetLevel")
	self:RegisterEvent("TRADE_CLOSED", "TradeTargetLevel")
end

E:RegisterModule(S:GetName())
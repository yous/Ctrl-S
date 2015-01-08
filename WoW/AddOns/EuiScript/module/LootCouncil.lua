--Author: Elv
--modify by eui
local E, L = unpack(ElvUI) -- Import Functions/Constants, Config, Locales
local LC = E:NewModule('LootCouncil', 'AceEvent-3.0', 'AceHook-3.0')

local split, match = string.split, string.match
local tinsert, tremove, twipe = table.insert, table.remove, table.wipe
local playerName = UnitName("player")
local unitInfo = {}
local lootData = {}
local guildRanks = {}
local broadcastChannels = {
	"OFFICER","GUILD","RAID","PARTY","SAY"
}
local slotName = {
	"Head","Neck","Shoulder","Back","Chest","Wrist",
	"Hands","Waist","Legs","Feet","Finger0","Finger1",
	"Trinket0","Trinket1","MainHand","SecondaryHand"
}
local invTypeMatch = {
	['INVTYPE_ROBE'] = 'INVTYPE_CHEST',
	['INVTYPE_2HWEAPON'] = 'INVTYPE_WEAPON',
	['INVTYPE_HOLDABLE'] = 'INVTYPE_WEAPON',
	['INVTYPE_RANGED'] = 'INVTYPE_WEAPON',
	['INVTYPE_SHIELD'] = 'INVTYPE_WEAPON',
	['INVTYPE_THROWN'] = 'INVTYPE_WEAPON',
	['INVTYPE_WEAPONMAINHAND'] = 'INVTYPE_WEAPON',
	['INVTYPE_WEAPONOFFHAND'] = 'INVTYPE_WEAPON',
	['INVTYPE_RANGEDRIGHT'] = 'INVTYPE_WEAPON'
}
local tierInvSlots = {
	['Interface\\Icons\\inv_chest_chain_10'] = 'INVTYPE_CHEST',
	['Interface\\Icons\\INV_Gauntlets_29'] = 'INVTYPE_HAND',
	['Interface\\Icons\\INV_Helmet_24"'] = 'INVTYPE_HEAD',
	["Interface\\Icons\\INV_Misc_Desecrated_PlatePants"] = 'INVTYPE_LEGS',
	["Interface\\Icons\\INV_Shoulder_22"] = 'INVTYPE_SHOULDER'
}

local function tablecopy(t, deep, seen)
    seen = seen or {}
    if t == nil then return nil end
    if seen[t] then return seen[t] end

    local nt = {}
    for k, v in pairs(t) do
        if deep and type(v) == 'table' then
            nt[k] = table.copy(v, deep, seen)
        else
            nt[k] = v
        end
    end
    setmetatable(nt, tablecopy(getmetatable(t), deep, seen))
    seen[t] = nt
    return nt
end

local function GetTooltip()
	for i=1, #GameTooltip.shoppingTooltips do
		if not GameTooltip.shoppingTooltips[i]:IsShown() then
			return GameTooltip.shoppingTooltips[i]
		end
	end
end

local function CastVote(button)
	local itemFrame = button:GetParent()
	local currentRollID = C_LootHistory.GetItem(itemFrame.itemIdx);
	local curPlayerName = itemFrame.PlayerName:GetText()
	curPlayerName = strsplit("-", curPlayerName)

	SendAddonMessage("LC_SUBMIT_VOTE", format("%d#%s", lootData[currentRollID].serverRollID, curPlayerName), "RAID")
	lootData[currentRollID].voteData[playerName] = curPlayerName
	LootHistoryFrame_FullUpdate(LootHistoryFrame)
end

local function GetRollIDFromServerID(serverID)
	local returnValue
	for id, _ in pairs(lootData) do
		if lootData[id].serverRollID == serverID then
			returnValue = id
		end
	end

	return returnValue
end

local function GuildRank_OnClick(self)
	UIDropDownMenu_SetSelectedValue(MinGuildRankDropdown, self.value);

	for index, value in pairs(guildRanks) do
		if value == self.value then
			LC.db.minRank = index
		end
	end
end

local function GuildRank_Initialize()
	local info = UIDropDownMenu_CreateInfo();
	local numRanks = GuildControlGetNumRanks();
	twipe(guildRanks)
	for i=2, numRanks do
		guildRanks[i] = GuildControlGetRankName(i);
		info.text = guildRanks[i]
		info.func = GuildRank_OnClick;
		UIDropDownMenu_AddButton(info);
	end

	UIDropDownMenu_SetSelectedValue(MinGuildRankDropdown, guildRanks[LC.db.minRank]);
end

local function BroadcastChannel_OnClick(self)
	UIDropDownMenu_SetSelectedValue(BroadcastChannelDropdown, self.value);

	for index, value in pairs(broadcastChannels) do
		if value == self.value then
			LC.db.broadcastChannel = index
		end
	end
end

local function BroadcastChannel_Initialize()
	local info = UIDropDownMenu_CreateInfo();

	for i=1, #broadcastChannels do
		info.text = broadcastChannels[i]
		info.func = BroadcastChannel_OnClick;
		UIDropDownMenu_AddButton(info);
	end

	UIDropDownMenu_SetSelectedValue(BroadcastChannelDropdown, broadcastChannels[LC.db.broadcastChannel]);
end

local function PersonalVotes_OnClick(self)
	if self:GetChecked() then
		LC.db.allowPersonalVotes = true
	else
		LC.db.allowPersonalVotes = false
	end
end

local function Disenchanter_OnClick(self)
	self:GetParent():ClearFocus()
	LC.db.disenchanter = self:GetParent():GetText()
end

local function OnEvent(self, event, ...)
	if event == "CHAT_MSG_ADDON" then
		local prefix, message, channel, sender = ...

		if prefix == 'LC_REQUEST_VOTE' then
			local serverRollID, minRank, guildName, allowPersonalVotes = split('#', message)
			local playerGuild, _, playerRankIndex = GetGuildInfo("player")
			serverRollID = tonumber(serverRollID)

			local rollID = GetRollIDFromServerID(tonumber(serverRollID))

			if lootData[rollID] then
				lootData[rollID].canVote = false
				lootData[rollID].allowPersonalVotes = allowPersonalVotes == "true" and true or false

				if guildName == playerGuild and playerRankIndex <= tonumber(minRank) then
					lootData[rollID].canVote = true
					LootHistoryFrame:Show()
					LootHistoryFrame_FullUpdate(LootHistoryFrame)
				end
			end
		elseif prefix == 'LC_SUBMIT_VOTE' then
			local serverRollID, playerName = split('#', message)
			serverRollID = tonumber(serverRollID)

			local rollID = GetRollIDFromServerID(serverRollID)
			sender = strsplit("-", sender)
			lootData[rollID].voteData[sender] = playerName

			LootHistoryFrame_FullUpdate(LootHistoryFrame)
		end
	elseif event == "START_LOOT_ROLL" then
		local rollID, _, serverRollID = ...
		local guildName = GetGuildInfo("player")

		lootData[rollID] = lootData[rollID] or {}
		lootData[rollID].voteData = lootData[rollID].voteData or {}
		lootData[rollID].serverRollID = serverRollID

		if IsMasterLooter() then
			SendAddonMessage("LC_REQUEST_VOTE", format('%d#%d#%s#%s', serverRollID, LC.db.minRank, guildName, tostring(LC.db.allowPersonalVotes)), "RAID")
		end
	elseif event == "INSPECT_READY" then
		local GUID = ...
		if GUID and unitInfo[GUID] then
			for i = 1, #slotName do
				local slotID = GetInventorySlotInfo(("%sSlot"):format(slotName[i]))
				local itemLink = GetInventoryItemLink(unitInfo[GUID].unitID, slotID)
				if itemLink then
					local  _, _, _, _, _, _, _, _, playerInvSlot = GetItemInfo(itemLink)
					playerInvSlot = invTypeMatch[playerInvSlot] or playerInvSlot
					if unitInfo[GUID].itemList[playerInvSlot] then
						unitInfo[GUID].itemList[playerInvSlot][itemLink] = true
					end
				end
			end

			if ( unitInfo[GUID].currentFrame and GameTooltip:IsOwned(unitInfo[GUID].currentFrame) ) then
				GameTooltip:Hide()
				unitInfo[GUID].currentFrame:GetScript("OnEnter")(unitInfo[GUID].currentFrame)
				unitInfo[GUID].currentFrame = nil
			end
		end	
	elseif event == "LOOT_OPENED" and IsMasterLooter() then
		local numItems = GetNumLootItems()

		local isFound = nil
		for i=1, GetNumGroupMembers() do
			local name = UnitName('raid'..i)
			if name then
				name = strsplit('-', name)
				if name == LC.db.disenchanter then
					isFound = name
					break
				end
			end

			if i < 5 then
				name = UnitName('party'..i)
				if name then
					name = strsplit('-', name)
					if name == LC.db.disenchanter then
						isFound = name
						break
					end
				end
			end
		end

		if UnitName('player') == LC.db.disenchanter then
			isFound = UnitName('player')
		end

		if numItems > 0 and isFound then
			for i=1, numItems do
				local _, _, _, quality = GetLootSlotInfo(i)
				if quality == 2 then
					for j = 1, GetNumGroupMembers() do
						if (GetMasterLootCandidate(i, j) == isFound) then
							GiveMasterLoot(i, j);
						end
					end
				end
			end
		end
	end
end

local function GetUnit(name, class)
	local groupType, groupSize, unitId
	local inGroup = IsInGroup()
	if IsInRaid() then 
		groupType = "raid"
		groupSize = GetNumGroupMembers()
	elseif inGroup then 
		groupType = "party"
		groupSize = GetNumGroupMembers() - 1
	else
		groupSize = 0
	end

	if UnitName("player") == name and select(2, UnitClass("player")) == class then
		return 'player'
	end

	for i=1, groupSize do
		local unit = groupType..i
		if UnitExists(unit) then
			local unitName = UnitName(unit)
			local _, unitClass = UnitClass(unit)
			if unitName == name and unitClass == class then
				unitId = unit
			end
		end
	end

	return unitId
end

local function SendInspectRequest(frame, matchFrame)
	local name, class = C_LootHistory.GetPlayerInfo(frame.itemIdx, frame.playerIdx);
	name = strsplit("-", name)
	local unit = GetUnit(name, class)

	local _, itemLink = C_LootHistory.GetItem(frame.itemIdx);
	local _, _, _, _, _, _, _, _, invSlot, invSlotTexture = GetItemInfo(itemLink)

	for tierTexture, tierInvSlot in pairs(tierInvSlots) do
		if tierTexture == invSlotTexture then
			invSlot = tierInvSlot
		end
	end	

	invSlot = invTypeMatch[invSlot] or invSlot

	if unit then
		local GUID = UnitGUID(unit)
		unitInfo[GUID] = unitInfo[GUID] or {}
		unitInfo[GUID].unitID = unit
		unitInfo[GUID].name = name
		unitInfo[GUID].class = class
		unitInfo[GUID].currentFrame = matchFrame and frame or nil
		unitInfo[GUID].itemList = unitInfo[GUID].itemList or {}
		if unitInfo[GUID].itemList[invSlot] then
			twipe(unitInfo[GUID].itemList[invSlot])
		else
			unitInfo[GUID].itemList[invSlot] = {}
		end

		NotifyInspect(unit);
	end
end

local function PlayerButton_OnEnter(self)
	if not self.itemIdx or not self.playerIdx then return end
	GameTooltip:Hide()
	local rollID, frameItemLink = C_LootHistory.GetItem(self.itemIdx);
	local _, _, _, _, _, _, _, _, invSlot = GetItemInfo(frameItemLink)
	invSlot = invTypeMatch[invSlot] or invSlot

	local name, class = C_LootHistory.GetPlayerInfo(self.itemIdx, self.playerIdx);
	name = strsplit("-", name)
	local isFound = false
	for GUID, _ in pairs(unitInfo) do
		if unitInfo[GUID].name == name and unitInfo[GUID].class == class then
			if unitInfo[GUID].itemList and unitInfo[GUID].itemList[invSlot] then
				local index = 1
				for itemLink, _ in pairs(unitInfo[GUID].itemList[invSlot]) do
					local tooltip = GetTooltip()
					if index > 1 then
						tooltip:SetOwner(GameTooltip.shoppingTooltips[index-1], "ANCHOR_BOTTOMLEFT", -4, GameTooltip.shoppingTooltips[index-1]:GetHeight())
					else
						tooltip:SetOwner(self, "ANCHOR_LEFT", -6, 0);
					end

					tooltip:SetHyperlink(itemLink);
					tooltip:Show()	
					isFound = true	
					index = index + 1	
				end
			end
		end
	end

	if not isFound and lootData[rollID] then
		GameTooltip:SetOwner(self, "ANCHOR_LEFT", -6, 0)
		GameTooltip:SetText(L["Waiting on player information..."])
		GameTooltip:Show()
		SendInspectRequest(self, true)
	end
end

local function PlayerButton_OnLeave(self)
	GameTooltip:Hide()
	for i=1, #GameTooltip.shoppingTooltips do
		GameTooltip.shoppingTooltips[i]:Hide()
	end	
end

function LC:GetPlayerFrame(self)
	for i=1, #self.usedPlayerFrames do
		local frame = self.usedPlayerFrames[i]
		if not frame:GetScript("OnEnter") then
			frame:SetScript("OnEnter", PlayerButton_OnEnter)
			frame:SetScript("OnLeave", PlayerButton_OnLeave)
			local button = CreateFrame("CheckButton", nil, frame, "UICheckButtonTemplate")
			button:SetPoint("RIGHT", frame.PlayerName, "LEFT")
			button:SetScript("OnClick", CastVote)
			button:Hide()
			button:SetSize(16, 16)
			frame.voteButton = button

			if ElvUI then
				ElvUI[1].Skins:HandleCheckBox(button)
				button.backdrop:Hide()
				button:SetTemplate()
				button:GetCheckedTexture():SetInside(nil, -4, -4)
				button:SetPoint("RIGHT", frame.PlayerName, "LEFT", -4, 0)
			--elseif Tukui then

			end				

			local voteText = frame:CreateFontString(nil, 'BORDER')
			voteText:SetFontObject("GameFontNormal")
			voteText:SetPoint("RIGHT", frame.RollIcon, "LEFT", -4, 2)
			voteText:SetText("0");
			voteText:Hide()
			frame.voteText = voteText
		end
	end
end

local function ItemFrame_OnClick(self, button)
	if button == "LeftButton" and not IsShiftKeyDown() then
		local tempList = {}
		local rollID, itemLink = C_LootHistory.GetItem(self.itemIdx);
		if lootData[rollID] then
			local channel = broadcastChannels[LC.db.broadcastChannel]
			SendChatMessage("----====EUI====----", channel)
			SendChatMessage(L["Results for: "]..itemLink, channel)

			for voter, playerName in pairs(lootData[rollID].voteData) do
				tempList[playerName] = tempList[playerName] or {}
				tempList[playerName].voters = tempList[playerName].voters or {}
				if not tempList[playerName].nameList then
					tempList[playerName].nameList = voter
				else
					tempList[playerName].nameList = tempList[playerName].nameList..', '..voter
				end
				
				tinsert(tempList[playerName].voters, voter)
			end

			for playerName, _ in pairs(tempList) do
				SendChatMessage(playerName.." ["..#tempList[playerName].voters.."]"..": "..tempList[playerName].nameList, channel)
			end

			twipe(tempList)		
			SendChatMessage("---------------------------------", channel)
		else
			E:Print(L["No data available for: "]..itemLink)
		end
	end
end

local function HidePasses(frame, index)
	if frame.itemIdx and frame.playerIdx then
		local _, _, rollType = C_LootHistory.GetPlayerInfo(frame.itemIdx, frame.playerIdx);
		local frame = LootHistoryFrame.usedPlayerFrames[index];
		if ( rollType == LOOT_ROLL_TYPE_PASS or rollType == nil ) then
			frame:SetScale(0.000001)
			frame:SetAlpha(0)
			return true
		else
			frame:SetScale(1)
			frame:SetAlpha(1)
		end		
	else
		frame:SetScale(1)
		frame:SetAlpha(1)		
	end	
end

function LC:UpdatePlayerRoll(self, itemIdx, playerIdx)
	for i=1, #self.usedPlayerFrames do
		local frame = self.usedPlayerFrames[i];
		if ( frame.itemIdx == itemIdx and frame.playerIdx == playerIdx ) then
			local isHidden = HidePasses(frame, i)

			if not isHidden then
				SendInspectRequest(frame)
			end
			break
		end
	end
end

function LC:UpdateItemFrame(self)
	local numItems = C_LootHistory.GetNumItems();

	for i=1, numItems do
		local itemFrame = self.itemFrames[i];
		if not itemFrame.reportResults then
			itemFrame:HookScript("OnClick", ItemFrame_OnClick)
			itemFrame.reportResults = true
		end
		local rollID, itemLink, numPlayers, isDone, winnerIdx, isMasterLoot = C_LootHistory.GetItem(itemFrame.itemIdx);

		if lootData[rollID] and isMasterLoot and lootData[rollID].canVote then
			for i=1, #self.usedPlayerFrames do
				local playerFrame = self.usedPlayerFrames[i]
				if playerFrame then
					playerFrame.numVotes = 0

					if playerFrame.itemIdx == itemFrame.itemIdx then
						local playerFrameName = playerFrame.PlayerName:GetText()
						playerFrameName = strsplit("-", playerFrameName)
						if lootData[rollID] and playerFrameName == lootData[rollID].voteData[playerName] and isMasterLoot then
							playerFrame.voteButton:SetChecked(true)
						else
							playerFrame.voteButton:SetChecked(false)
						end

						for voter, player in pairs(lootData[rollID].voteData) do
							if player == playerFrameName then
								playerFrame.numVotes = playerFrame.numVotes + 1
							end
						end

						if (lootData[rollID].allowPersonalVotes == false and playerFrameName == playerName) then
							playerFrame.voteButton:Hide()
						else
							playerFrame.voteButton:Show()
						end
						playerFrame.voteText:Show()
						playerFrame.voteText:SetText(playerFrame.numVotes)

						HidePasses(playerFrame, i)
					end
				end
			end
		else
			for i=1, #self.usedPlayerFrames do
				local playerFrame = self.usedPlayerFrames[i]

				if playerFrame.itemIdx == itemFrame.itemIdx then
					HidePasses(playerFrame, i)
					if (lootData[rollID] and lootData[rollID].canVote == false) or not lootData[rollID] then
						playerFrame.numVotes = 0
						playerFrame.voteButton:Hide()
						playerFrame.voteText:Hide()	
						playerFrame.voteText:SetText(0)		
					end
				end
			end
		end
	end
end

function LC:AutoDisplayMessage(slot, raidID)
	local _, name = GetLootSlotInfo(slot)
	local numItems = C_LootHistory.GetNumItems();

	for i=1, numItems do
		local itemFrame = LootHistoryFrame.itemFrames[i];
		local rollID, itemLink = C_LootHistory.GetItem(itemFrame.itemIdx);
		local itemName = GetItemInfo(itemLink)

		if name == itemName and lootData[rollID] and not lootData[rollID].broadcasted then
			itemFrame:Click()
			lootData[rollID].broadcasted = true;
			break
		end
	end
end

function LC:AutoDisplayMessage_LootHistory() --Same as above except for when using right click menu on loot history frame
	local _rollID = C_LootHistory.GetItem(LootHistoryDropDown.itemIdx)

	for i=1, C_LootHistory.GetNumItems() do
		local itemFrame = LootHistoryFrame.itemFrames[i];
		local rollID = C_LootHistory.GetItem(itemFrame.itemIdx);

		if _rollID == rollID and lootData[rollID] and not lootData[rollID].broadcasted then
			itemFrame:Click()
			lootData[rollID].broadcasted = true;
			break
		end	
	end	
end


function LC:CreateLC()
	RegisterAddonMessagePrefix('LC_REQUEST_VOTE')
	RegisterAddonMessagePrefix('LC_SUBMIT_VOTE')

	--Configuration
	local config = CreateFrame("Frame", "LootCouncilConfig", LootHistoryFrame)
	config:SetPoint("TOPRIGHT", LootHistoryFrame, "TOPLEFT", -2, 0)
	config:SetSize(200, 200)
	
	config:SetTemplate("Transparent")
	config:Hide()

	--Configuration Toggle Button
	local configToggle = CreateFrame("Button", config:GetName().."Toggle", LootHistoryFrame)
	configToggle:SetPoint("TOPLEFT", LootHistoryFrame, "TOPLEFT", 2, -2)
	configToggle:SetSize(20, 20)
	configToggle:SetFrameLevel(20)
	configToggle.text = configToggle:CreateFontString(nil, 'OVERLAY')
	configToggle.text:SetFontObject("GameFontNormal")
	configToggle.text:SetText('<')
	configToggle.text:SetPoint('CENTER')
	configToggle:SetScript("OnClick", function(self)
		if not config:IsShown() then
			self.text:SetText('>')
			config:Show()
		else
			self.text:SetText('<')
			config:Hide()
		end
	end)

	--Header Text
	config.header = config:CreateFontString(nil, 'OVERLAY')
	config.header:SetFontObject(GameFontNormal)
	config.header:SetPoint("TOPLEFT", config, "TOPLEFT", 15, -12)
	config.header:SetText(L["Loot Council"])

	--Min-Guild Rank Dropdown
	local guildRank = CreateFrame('Frame', 'MinGuildRankDropdown', config, 'UIDropDownMenuTemplate')
	guildRank:SetPoint('TOPLEFT', config.header, 'BOTTOMLEFT', 50, -5)
	guildRank.text = guildRank:CreateFontString(nil, 'OVERLAY', 'GameFontNormal')
	guildRank.text:SetPoint('RIGHT', guildRank, 'LEFT', 8, 0)
	guildRank.text:SetText(L['Guild Rank:'])	

	E.Skins:HandleDropDownBox(guildRank)
	
	UIDropDownMenu_SetWidth(MinGuildRankDropdown, 85);
	UIDropDownMenu_JustifyText(MinGuildRankDropdown, "LEFT");
	UIDropDownMenu_Initialize(guildRank, GuildRank_Initialize);		

	--Broadcast Channel
	local broadcastChannel = CreateFrame('Frame', 'BroadcastChannelDropdown', config, 'UIDropDownMenuTemplate')
	broadcastChannel:SetPoint('TOPLEFT', guildRank, 'BOTTOMLEFT', 0, -5)
	broadcastChannel.text = broadcastChannel:CreateFontString(nil, 'OVERLAY', 'GameFontNormal')
	broadcastChannel.text:SetPoint('RIGHT', broadcastChannel, 'LEFT', 8, 0)
	broadcastChannel.text:SetText(L['Channel:'])	

	E.Skins:HandleDropDownBox(broadcastChannel)	

	UIDropDownMenu_SetWidth(BroadcastChannelDropdown, 85);
	UIDropDownMenu_JustifyText(BroadcastChannelDropdown, "LEFT");
	UIDropDownMenu_Initialize(broadcastChannel, BroadcastChannel_Initialize);				

	--Personal Votes
	local personalVotes = CreateFrame("CheckButton", 'PersonalVotesCheckBox', config, "OptionsCheckButtonTemplate")
	_G[personalVotes:GetName() .. "Text"]:SetText(L["Allow Personal Votes"])
	personalVotes:SetPoint('TOPLEFT', broadcastChannel, 'BOTTOMLEFT', -50, -5)
	personalVotes:SetScript("OnClick", PersonalVotes_OnClick)
	personalVotes:SetChecked(LC.db.allowPersonalVotes)

	E.Skins:HandleCheckBox(personalVotes)					

	--Disenchanter
	local disenchanter = CreateFrame("EditBox", "DisenchanterEditBox", config, "InputBoxTemplate")
	disenchanter:SetPoint("TOPLEFT", personalVotes, "BOTTOMLEFT", 5, -25)
	disenchanter:SetWidth(120)
	disenchanter:SetHeight(20)
	disenchanter:SetMaxLetters(18) 
	disenchanter:SetText(LC.db.disenchanter)
	disenchanter:SetAutoFocus(false)

	E.Skins:HandleEditBox(disenchanter)					

	disenchanter.button = CreateFrame("Button", nil, disenchanter, "UIPanelButtonTemplate")
	disenchanter.button:SetText(OKAY)
	disenchanter.button:SetPoint("LEFT", disenchanter, "RIGHT", 2, 0)
	disenchanter.button:SetHeight(22)
	disenchanter.button:SetWidth(40)
	disenchanter.button:SetScript("OnClick", Disenchanter_OnClick)

	E.Skins:HandleButton(disenchanter.button)				

	disenchanter.text = disenchanter:CreateFontString(nil, 'OVERLAY', 'GameFontNormal')
	disenchanter.text:SetPoint("BOTTOMLEFT", disenchanter, "TOPLEFT", -4, 2)
	disenchanter.text:SetText(L["Disenchanter Name"])
end

function LC:Initialize()
	self.db = E.db.euiscript.LCData
	if not self.db.enable then return; end
	
	self:RegisterEvent("CHAT_MSG_ADDON")
	self:RegisterEvent("START_LOOT_ROLL")
	self:RegisterEvent("LOOT_OPENED")
	self:RegisterEvent("INSPECT_READY")
	self:SetScript("OnEvent", OnEvent)
	
	self:CreateLC();
	
	self:SecureHook('LootHistoryDropDown_GiveMasterLoot', 'AutoDisplayMessage_LootHistory')
	self:SecureHook('GiveMasterLoot', 'AutoDisplayMessage')
	self:SecureHook("LootHistoryFrame_FullUpdate", 'UpdateItemFrame')
	self:SecureHook("LootHistoryFrame_UpdatePlayerRoll", 'UpdatePlayerRoll')
	self:SecureHook("LootHistoryFrame_GetPlayerFrame", 'GetPlayerFrame')
end
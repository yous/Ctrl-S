local E, L, V, P, G, _ = unpack(ElvUI); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB

--Title: QuickQuest
--Author: p3lim
--Version: 60000.18-Release
----------------------------------------------------------------------------------------
--	Quest automation(Monomyth by p3lim)
----------------------------------------------------------------------------------------
local Monomyth = CreateFrame("Frame")
Monomyth:SetScript("OnEvent", function(self, event, ...) self[event](...) end)

local atBank, atMail, atMerchant
local choiceQueue, choiceFinished
local ignoredItems = {
	-- Inscription weapons
	[31690] = 79343, -- Inscribed Tiger Staff
	[31691] = 79340, -- Inscribed Crane Staff
	[31692] = 79341, -- Inscribed Serpent Staff

	-- Darkmoon Faire artifacts
	[29443] = 71635, -- Imbued Crystal
	[29444] = 71636, -- Monstrous Egg
	[29445] = 71637, -- Mysterious Grimoire
	[29446] = 71638, -- Ornate Weapon
	[29451] = 71715, -- A Treatise on Strategy
	[29456] = 71951, -- Banner of the Fallen
	[29457] = 71952, -- Captured Insignia
	[29458] = 71953, -- Fallen Adventurer's Journal
	[29464] = 71716, -- Soothsayer's Runes

	-- Tiller Gifts
	['progress_79264'] = 79264, -- Ruby Shard
	['progress_79265'] = 79265, -- Blue Feather
	['progress_79266'] = 79266, -- Jade Cat
	['progress_79267'] = 79267, -- Lovely Apple
	['progress_79268'] = 79268, -- Marsh Lily

	-- Misc
	[31664] = 88604, -- Nat's Fishing Journal
}

function Monomyth:Register(event, func)
	self:RegisterEvent(event)
	self[event] = function(...)
		if (not (IsShiftKeyDown() or IsAltKeyDown())) and E.db["euiscript"].idq then
			func(...)
		end
	end
end

local function IsTrackingTrivial()
	for index = 1, GetNumTrackingTypes() do
		local name, _, active = GetTrackingInfo(index)
		if name == MINIMAP_TRACKING_TRIVIAL_QUESTS then
			return active
		end
	end
end

local function GetNPCID()
	return tonumber(string.match(UnitGUID('npc') or '', 'Creature%-.-%-.-%-.-%-.-%-(.-)%-'))
end

local ignoreQuestNPC = {
	[88570] = true, -- Fate-Twister Tiklal
	[87391] = true, -- Fate-Twister Seress
}
Monomyth:Register("QUEST_GREETING", function()
	local npcID = GetNPCID()
	if(ignoreQuestNPC[npcID]) then
		return
	end
	
	local active = GetNumActiveQuests()
	if active > 0 then
		for index = 1, active do
			local _, complete = GetActiveTitle(index)
			if complete then
				SelectActiveQuest(index)
			end
		end
	end

	local available = GetNumAvailableQuests()
	if available > 0 then
		for index = 1, available do
			if (not IsAvailableQuestTrivial(index)) or IsTrackingTrivial() then
				SelectAvailableQuest(index)
			end
		end
	end
end)

local function IsGossipQuestCompleted(index)
	return not not select(((index * 5) - 5) + 4, GetGossipActiveQuests())
end

local function IsGossipQuestTrivial(index)
	return not not select(((index * 6) - 6) + 3, GetGossipAvailableQuests())
end

local ignoreGossipNPC = {
	-- Bodyguards
	[86945] = true, -- Aeda Brightdawn (Horde)
	[86933] = true, -- Vivianne (Horde)
	[86927] = true, -- Delvar Ironfist (Alliance)
	[86934] = true, -- Defender Illona (Alliance)
	[86682] = true, -- Tormmok
	[86964] = true, -- Leorajh
	[86946] = true, -- Talonpriest Ishaal

	-- Misc NPCs
	[79740] = true, -- Warmaster Zog (Horde)
	[79953] = true, -- Lieutenant Thorn (Alliance)
}

Monomyth:Register("GOSSIP_SHOW", function()
	local active = GetNumGossipActiveQuests()
	if active > 0 then
		for index = 1, active do
			if IsGossipQuestCompleted(index) then
				SelectGossipActiveQuest(index)
			end
		end
	end

	local available = GetNumGossipAvailableQuests()
	if available > 0 then
		for index = 1, available do
			if not IsGossipQuestTrivial(index) or IsTrackingTrivial() then
				SelectGossipAvailableQuest(index)
			end
		end
	end

	local _, instance = GetInstanceInfo()
	if available == 0 and active == 0 and GetNumGossipOptions() == 1 and instance ~= "raid" then
		local npcID = GetNPCID()
		if(npcID == 57850) then
			return SelectGossipOption(1)
		end
		local _, type = GetGossipOptions()
		if type == "gossip" and not ignoreGossipNPC[npcID] then
			SelectGossipOption(1)
		end
	end
end)

local darkmoonNPC = {
	[57850] = true,	-- Teleportologist Fozlebub
	[55382] = true,	-- Darkmoon Faire Mystic Mage (Horde)
	[54334] = true,	-- Darkmoon Faire Mystic Mage (Alliance)
}

Monomyth:Register("GOSSIP_CONFIRM", function(index)
	local npcID = GetNPCID()
	if npcID and darkmoonNPC[npcID] then
		SelectGossipOption(index, "", true)
		StaticPopup_Hide("GOSSIP_CONFIRM")
	end
end)

Monomyth:Register("QUEST_DETAIL", function()
	if not QuestGetAutoAccept() then
		AcceptQuest()
	end
end)

Monomyth:Register("QUEST_ACCEPT_CONFIRM", AcceptQuest)

Monomyth:Register("QUEST_ACCEPTED", function(id)
	if QuestFrame:IsShown() and QuestGetAutoAccept() then
		CloseQuest()
	end
end)

Monomyth:Register("QUEST_PROGRESS", function()
	if IsQuestCompletable() then
		local requiredItems = GetNumQuestItems()
		if(requiredItems > 0) then
			for index = 1, requiredItems do
				local link = GetQuestItemLink('required', index)
				if(link) then
					local id = tonumber(string.match(link, 'item:(%d+)'))
					for _, itemID in next, ignoredItems do
						if(itemID == id) then
							return
						end
					end
				else
					choiceQueue = 'QUEST_PROGRESS'
					return
				end
			end
		end	
	
		CompleteQuest()
	end
end)

Monomyth:Register("QUEST_ITEM_UPDATE", function(...)
	if choiceQueue then
		Monomyth.QUEST_COMPLETE()
	end
end)

local cashRewards = {
	[45724] = 1e5, -- Champion's Purse
	[64491] = 2e6, -- Royal Reward
}
Monomyth:Register("QUEST_COMPLETE", function()
	local choices = GetNumQuestChoices()
	if choices < 1 then
		GetQuestReward(QuestFrameRewardPanel.itemChoice)
	elseif choices == 1 then
		GetQuestReward(1)
	elseif choices > 1 then
		local bestValue, bestIndex = 0

		for index = 1, choices do
			local link = GetQuestItemLink("choice", index)
			if link then
				local _, _, _, _, _, _, _, _, _, _, value = GetItemInfo(link)
				value = cashRewards[tonumber(string.match(link, 'item:(%d+):'))] or value


				if value > bestValue then
					bestValue, bestIndex = value, index
				end
			else
				choiceQueue = true
				return GetQuestItemInfo("choice", index)
			end
		end

		if bestIndex then
			QuestInfoRewardsFrame.RewardButtons[bestIndex]:Click()
		end
	end
end)

Monomyth:Register("QUEST_FINISHED", function()
	choiceQueue = nil
	autoCompleteIndex = nil
end)

Monomyth:Register("QUEST_AUTOCOMPLETE", function(id)
	local index = GetQuestLogIndexByID(id)
	if GetQuestLogIsAutoComplete(index) then
		-- The quest might not be considered complete, investigate later
		ShowQuestComplete(index)
		autoCompleteIndex = index
	end
end)

Monomyth:Register("BAG_UPDATE_DELAYED", function()
	if autoCompleteIndex then
		ShowQuestComplete(autoCompleteIndex)
		autoCompleteIndex = nil
	end
end)

Monomyth:Register("BANKFRAME_OPENED", function()
	atBank = true
end)

Monomyth:Register("BANKFRAME_CLOSED", function()
	atBank = false
end)

Monomyth:Register("GUILDBANKFRAME_OPENED", function()
	atBank = true
end)

Monomyth:Register("GUILDBANKFRAME_CLOSED", function()
	atBank = false
end)

Monomyth:Register("MAIL_SHOW", function()
	atMail = true
end)

Monomyth:Register("MAIL_CLOSED", function()
	atMail = false
end)

Monomyth:Register("MERCHANT_SHOW", function()
	atMerchant = true
end)

Monomyth:Register("MERCHANT_CLOSED", function()
	atMerchant = false
end)

Monomyth:Register("BAG_UPDATE", function(bag)
	if atBank or atMail or atMerchant then return end

	for slot = 1, GetContainerNumSlots(bag) do
		local _, id, active = GetContainerItemQuestInfo(bag, slot)
		if id and not active and not IsQuestFlaggedCompleted(id) and not ignoredItems[id] then
			UseContainerItem(bag, slot)
		end
	end
end)

local errors = {
	[ERR_QUEST_ALREADY_DONE] = true,
	[ERR_QUEST_FAILED_LOW_LEVEL] = true,
	[ERR_QUEST_ALREADY_DONE_DAILY] = true,
	[ERR_QUEST_NEED_PREREQS] = true,
}

ChatFrame_AddMessageEventFilter("CHAT_MSG_SYSTEM", function(self, event, message)
	return errors[message]
end)

QuestInfoDescriptionText.SetAlphaGradient = function() end
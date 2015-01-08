local E, L = unpack(ElvUI) -- Import Functions/Constants, Config, Locales
local S = E:NewModule('AutoButton', 'AceEvent-3.0')

--Binding Variables
BINDING_HEADER_AutoSlotButton = "|cffC495DDEUI|r".. L["Auto InventoryItem Button"];
BINDING_HEADER_AutoQuestButton = "|cffC495DDEUI|r".. L["Auto QuestItem Button"];
for i = 1, 12 do
	setglobal("BINDING_NAME_CLICK AutoSlotButton"..i..":LeftButton", L["Auto InventoryItem Button"]..i)
	setglobal("BINDING_NAME_CLICK AutoQuestButton"..i..":LeftButton", L["Auto QuestItem Button"]..i)
end
----------------------------------------------------------------------------------------
--	AutoButton
----------------------------------------------------------------------------------------
local frameItem = {
	[79104] = true, 
	[80513] = true,
	[89880] = true,
	[89815] = true,
--	[89869] = true,
	[80302] = true, 
	[79102] = true, 
	[80590] = true,
	[80591] = true,
	[80592] = true,
	[80593] = true,
	[80594] = true,
	[80595] = true,
	[89328] = true,
	[89326] = true,
	[89329] = true,
	[85267] = true,
	[85268] = true,
	[85269] = true,
	[85216] = true,
	[85217] = true,
	[89202] = true,
	[85215] = true,
	[89197] = true,
	[89233] = true,	
	[85219] = true, 
	[91806] = true, 
	[80809] = true,
	[84782] = true,
	[84783] = true,
	[85153] = true,
	[85158] = true,
	[85162] = true,
	[85163] = true,
	[89847] = true,
	[89848] = true,
	[89849] = true,
	[95445] = true,
	[95447] = true,
	[95449] = true,
	[95451] = true,
	[95454] = true,
	[95457] = true,	
	['Sunsong Ranch'] = true,
}

local function IsQuestItem(bagID, slotID, itemID)
	local itemName = GetItemInfo(itemID)
	
	if E.db.euiscript.autobutton.blankList[itemID] then return; end
	
	if GetCurrentMapAreaID() == 928 and (itemID == 95567 or itemID == 95568) then 
		return itemID
	end
	
	if frameItem[GetMinimapZoneText()] then

		return frameItem[itemID]
	else
		if E.db.euiscript.autobutton.whiteList[itemID] then return itemID; end
		local isquestItem, questId, isActiveQuest = GetContainerItemQuestInfo(bagID, slotID);
		return (questId or isquestItem)
	end
end

local function haveIt(num, spellName)
	if not spellName then return false; end

	for i = 1, num do
		local AutoButton = _G["AutoQuestButton"..i]
		if not AutoButton then break; end
		if AutoButton.spellName == spellName then
			return false;
		end
	end
	return true;
end		
		
local function IsUsableItem(itemId)
	local itemSpell = GetItemSpell(itemId)
	if not itemSpell then return false; end
	
	return itemSpell
end

local function IsSlotItem(itemId)
	local itemSpell = IsUsableItem(itemId)
	local itemName = GetItemInfo(itemId)
	
	return itemSpell
end

local function AutoButtonHide(AutoButton)
	if not AutoButton then return end
	AutoButton:SetAlpha(0)
	if not InCombatLockdown() then
		AutoButton:EnableMouse(false)
	else
		AutoButton:RegisterEvent("PLAYER_REGEN_ENABLED")
		AutoButton:SetScript("OnEvent", function(self, event) 
			if event == "PLAYER_REGEN_ENABLED" then
				self:EnableMouse(false) 
				self:UnregisterEvent("PLAYER_REGEN_ENABLED") 
			end
		end)
	end
end

local function HideAllButton()
	local i
	for i = 1, 12 do
		AutoButtonHide(_G["AutoQuestButton"..i])
	end
	for i = 1, 12 do
		AutoButtonHide(_G["AutoSlotButton"..i])
	end
end

local function AutoButtonShow(AutoButton)
	if not AutoButton then return end
	AutoButton:SetAlpha(1)
	AutoButton:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, 'ANCHOR_BOTTOMRIGHT', 0, -2)
		GameTooltip:ClearLines()
		GameTooltip:AddDoubleLine(USE, self.spellName..'('..self.itemID..')', 1, 1, 1)
		GameTooltip:Show()
	end)
	AutoButton:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)
	
	if not InCombatLockdown() then
		AutoButton:EnableMouse(true)
		if AutoButton.slotID then
			AutoButton:SetAttribute("type", "macro")
			AutoButton:SetAttribute("macrotext", "/use "..AutoButton.slotID)
		elseif AutoButton.itemName then
			AutoButton:SetAttribute("type", "item")
			AutoButton:SetAttribute("item", AutoButton.itemName)
		end
	else
		AutoButton:RegisterEvent("PLAYER_REGEN_ENABLED")
		AutoButton:SetScript("OnEvent", function(self, event) 
			if event == "PLAYER_REGEN_ENABLED" then
				self:EnableMouse(true) 
				if self.slotID then
					self:SetAttribute("type", "macro")
					self:SetAttribute("macrotext", "/use "..self.slotID)
				elseif self.itemName then
					self:SetAttribute("type", "item")
					self:SetAttribute("item", self.itemName)
				end
				self:UnregisterEvent("PLAYER_REGEN_ENABLED") 
			end
		end)
	end
end

local function CreateButton(name, size)
	if _G[name] then
		_G[name]:Size(size)
		_G[name].c:FontTemplate(nil, E.db.euiscript.autobutton.countFontSize, 'OUTLINE')
		_G[name].k:FontTemplate(nil, E.db.euiscript.autobutton.bindFontSize, 'OUTLINE')
		return _G[name]
	end
	
	-- Create button
	local AutoButton = CreateFrame("Button", name, E.UIParent, "SecureActionButtonTemplate")
	AutoButton:Size(size)
	AutoButton:SetTemplate("Default")
	AutoButton:StyleButton()
	AutoButton:SetClampedToScreen(true)
	AutoButton:SetAttribute("type", "item")
	AutoButton:SetAlpha(0)
	AutoButton:EnableMouse(false)
	AutoButton:RegisterForClicks('AnyUp')

	-- Texture for our button
	AutoButton.t = AutoButton:CreateTexture(nil, "OVERLAY", nil)
	AutoButton.t:Point("TOPLEFT", AutoButton, "TOPLEFT", 2, -2)
	AutoButton.t:Point("BOTTOMRIGHT", AutoButton, "BOTTOMRIGHT", -2, 2)
	AutoButton.t:SetTexCoord(0.1, 0.9, 0.1, 0.9)

	-- Count text for our button
	AutoButton.c = AutoButton:CreateFontString(nil, "OVERLAY")
	AutoButton.c:FontTemplate(nil, E.db.euiscript.autobutton.countFontSize, 'OUTLINE')
	AutoButton.c:SetTextColor(1, 1, 1, 1)
	AutoButton.c:Point("BOTTOMRIGHT", AutoButton, "BOTTOMRIGHT", 0.5, 0)
	AutoButton.c:SetJustifyH("CENTER")	

	-- Binding text for our button
	AutoButton.k = AutoButton:CreateFontString(nil, "OVERLAY")
	AutoButton.k:FontTemplate(nil, E.db.euiscript.autobutton.bindFontSize, 'OUTLINE')
	AutoButton.k:SetTextColor(0.6, 0.6, 0.6)
	AutoButton.k:Point("TOPRIGHT", AutoButton, "TOPRIGHT", 1, -3)
	AutoButton.k:SetJustifyH("RIGHT")		
	
	-- Cooldown
	AutoButton.Cooldown = CreateFrame("Cooldown", nil, AutoButton, "CooldownFrameTemplate")
	AutoButton.Cooldown:Point("TOPLEFT", AutoButton, "TOPLEFT", 2, -2)
	AutoButton.Cooldown:Point("BOTTOMRIGHT", AutoButton, "BOTTOMRIGHT", -2, 2)
	AutoButton.Cooldown:SetSwipeColor(0, 0, 0, 0)
	AutoButton.Cooldown:SetDrawBling(false)
	
	E:RegisterCooldown(AutoButton.Cooldown)
	
	E.FrameLocks[name] = true;
	return AutoButton
end

function S:InsertOpt()
	for k, v in pairs(E.db.euiscript.autobutton.itemList) do
		E.Options.args.euiscript.args.autobutton.args.itemList.values[k] = k
	end
	for k, v in pairs(E.db.euiscript.autobutton.slotList) do
		E.Options.args.euiscript.args.autobutton.args.slotList.values[k] = k
	end
end		

function S:ScanItem(event)
	local db = E.db.euiscript.autobutton
	HideAllButton()
	
	-- Scan bags for Item matchs
	local num = 0
	if db.questNum > 0 then
		for b = 0, NUM_BAG_SLOTS do
			for s = 1, GetContainerNumSlots(b) do
				local itemID = GetContainerItemID(b, s)
				itemID = tonumber(itemID)
				if itemID and IsQuestItem(b, s, itemID) and IsUsableItem(itemID) and haveIt(num, IsUsableItem(itemID)) and not db.blankList[itemID] then
					local itemName = GetItemInfo(itemID)
				
					num = num + 1
					if num > db.questNum then break; end
					
					local AutoButton = _G["AutoQuestButton"..num]
					
					local count = GetItemCount(itemID, nil, 1)
					local itemIcon = GetItemIcon(itemID)
					
					if not AutoButton then break end
					-- Set our texture to the item found in bags
					AutoButton.t:SetTexture(itemIcon)
					AutoButton.itemName = itemName
					AutoButton.itemID = itemID
					AutoButton.spellName = IsUsableItem(itemID)
					AutoButton:SetBackdropBorderColor(1.0, 0.3, 0.3)
	
					-- Get the count if there is one
					if count and count > 1 then
						AutoButton.c:SetText(count)
					else
						AutoButton.c:SetText("")
					end
					
					AutoButton.bag_b = b
					AutoButton.bag_s = s
					AutoButton:SetScript("OnUpdate", function(self, elapsed)
						local cd_start, cd_finish, cd_enable = GetContainerItemCooldown(self.bag_b, self.bag_s)
						if cd_start and cd_enable == 0 then
							self.t:SetVertexColor(0.2,0.2,0.2)
							return;
						end
						CooldownFrame_SetTimer(AutoButton.Cooldown, cd_start, cd_finish, cd_enable)
						if IsItemInRange(itemID, 'target') == 0 then
							self.t:SetVertexColor(1, 0, 0)
						else
							self.t:SetVertexColor(1, 1, 1)
						end						
					end)					
					AutoButtonShow(AutoButton)
				end
			end
		end
	end

	-- Scan inventory for Equipment matches
	num = 0
	if db.slotNum > 0 then
		for w = 1, 18 do
			local slotID = GetInventoryItemID("player", w)
			if slotID and IsSlotItem(slotID) and not db.blankList[slotID] then
				local iSpell = GetItemSpell(slotID)
				local itemName, _, rarity = GetItemInfo(slotID)
				
				local itemIcon = GetInventoryItemTexture("player", w)
				num = num + 1
				if num > db.slotNum then break; end
				
				local AutoButton = _G["AutoSlotButton".. num]
				if not AutoButton then break; end

				if rarity and rarity > 1 then
					local r, g, b = GetItemQualityColor(rarity);
					AutoButton:SetBackdropBorderColor(r, g, b);
				end				
				-- Set our texture to the item found in bags
				AutoButton.t:SetTexture(itemIcon)
				AutoButton.c:SetText("")
			--	AutoButton.itemName = itemName
				AutoButton.slotID = w
				AutoButton.itemID = slotID
				AutoButton.spellName = IsUsableItem(slotID)
				
				AutoButton:SetScript("OnUpdate", function(self, elapsed)
					local cd_start, cd_finish, cd_enable = GetInventoryItemCooldown("player", self.slotID)
					CooldownFrame_SetTimer(AutoButton.Cooldown, cd_start, cd_finish, cd_enable)
				end)				
				AutoButtonShow(AutoButton)
			end
		end
	end
end

local lastUpdate = 0
function S:ScanItemCount(elapsed)
	lastUpdate = lastUpdate + elapsed
	if lastUpdate < 0.5 then
		return
	end
	lastUpdate = 0
	for i = 1, E.db.euiscript.autobutton.questNum do
		local f = _G["AutoQuestButton"..i]
		if f and f.itemName then
			local count = GetItemCount(f.itemID, nil, 1)

			if count and count > 1 then
				f.c:SetText(count)
			else
				f.c:SetText("")
			end
		end
	end
end

function S:UpdateBind()
	local db = E.db.euiscript.autobutton
	if not db then return; end
	
	for i = 1, db.questNum do
		local bindButton = 'CLICK AutoQuestButton'..i..':LeftButton'
		local button = _G['AutoQuestButton'..i]
		local bindText = GetBindingKey(bindButton)
		if not bindText then
			bindText = ''
		else
			bindText = string.gsub(bindText, 'SHIFT--', 'S')
			bindText = string.gsub(bindText, 'CTRL--', 'C')
			bindText = string.gsub(bindText, 'ALT--', 'A')
		end
		
		if button then button.k:SetText(bindText) end
	end
	for i = 1, db.slotNum do
		local bindButton = 'CLICK AutoSlotButton'..i..':LeftButton'
		local button = _G['AutoSlotButton'..i]
		local bindText = GetBindingKey(bindButton)
		if not bindText then
			bindText = ''
		else
			bindText = string.gsub(bindText, 'SHIFT--', 'S')
			bindText = string.gsub(bindText, 'CTRL--', 'C')
			bindText = string.gsub(bindText, 'ALT--', 'A')
		end
		
		if button then button.k:SetText(bindText) end
	end
end

function S:ToggleAutoButton()
	if E.db.euiscript.autobutton.enable then
		self:RegisterEvent("BAG_UPDATE", "ScanItem")
		self:RegisterEvent("UNIT_INVENTORY_CHANGED", "ScanItem")
		self:RegisterEvent("ZONE_CHANGED", "ScanItem")
		self:RegisterEvent("ZONE_CHANGED_NEW_AREA", "ScanItem")
		self:RegisterEvent("UPDATE_BINDINGS", "UpdateBind")
		if not S.Update then S.Update = CreateFrame("Frame") end;
		self.Update:SetScript("OnUpdate", S.ScanItemCount)
		self:ScanItem();
		self:UpdateBind();
	else
		HideAllButton()
		self:UnregisterEvent("BAG_UPDATE")
		self:UnregisterEvent("UNIT_INVENTORY_CHANGED")	
		self:UnregisterEvent("ZONE_CHANGED")
		self:UnregisterEvent("ZONE_CHANGED_NEW_AREA")
		self:UnregisterEvent("UPDATE_BINDINGS")
		if self.Update then self.Update:SetScript("OnUpdate", nil) end
	end
end

function S:UpdateAutoButton()
	local db = E.db.euiscript.autobutton
	local i = 0
	
	local lastButton, lastColumnButton, buttonsPerRow;
	for i = 1, db.questNum do
		local f = CreateButton("AutoQuestButton"..i, db.questSize)
		buttonsPerRow = db.questPerRow
		lastButton = _G["AutoQuestButton"..i-1];
		lastColumnButton = _G["AutoQuestButton"..i-buttonsPerRow];
		
		if db.questNum < db.questPerRow then
			buttonsPerRow = db.questNum;
		end		
		f:ClearAllPoints()
		
		if i == 1 then
			f:Point("LEFT", AutoButtonAnchor, "LEFT", 0, 0)
		elseif (i-1) % buttonsPerRow == 0 then
			f:Point("TOP", lastColumnButton, "BOTTOM", 0, -3)
		else
			f:Point("LEFT", lastButton, "RIGHT", 3, 0)
		end
	end
	
	for i = 1, db.slotNum do
		local f = CreateButton("AutoSlotButton"..i, db.slotSize)
		buttonsPerRow = db.slotPerRow
		lastButton = _G["AutoSlotButton"..i-1];
		lastColumnButton = _G["AutoSlotButton"..i-buttonsPerRow];
		
		if db.slotNum < db.slotPerRow then
			buttonsPerRow = db.questNum;
		end		
		f:ClearAllPoints()
		
		if i == 1 then
			f:Point("LEFT", AutoButtonAnchor2, "LEFT", 0, 0)
		elseif (i-1) % buttonsPerRow == 0 then
			f:Point("TOP", lastColumnButton, "BOTTOM", 0, -3)
		else
			f:Point("LEFT", lastButton, "RIGHT", 3, 0)
		end
	end
	self:ToggleAutoButton()
end

function S:Initialize()
	local db = E.db.euiscript.autobutton
	
	--Convert old ver.
	if E.db.euiscript.auto_quest_button == false then
		db.enable = false
		E.db.euiscript.auto_quest_button = nil
	end
	
	-- Create anchor
	local AutoButtonAnchor = CreateFrame("Frame", "AutoButtonAnchor", UIParent)
	AutoButtonAnchor:SetClampedToScreen(true)
	AutoButtonAnchor:Point("BOTTOMLEFT", RightChatPanel or LeftChatPanel, "TOPLEFT", 0, 4)
	AutoButtonAnchor:Size(db.questNum > 0 and db.questSize * db.questNum or 260, db.questNum > 0 and db.questSize or 40)
	E:CreateMover(AutoButtonAnchor, "AutoButtonAnchorMover", L["Auto QuestItem Button"], nil, nil, nil, "ALL,EUI", function() return E.db.euiscript.autobutton.enable; end)
	
	-- Create anchor2
	local AutoButtonAnchor2 = CreateFrame("Frame", "AutoButtonAnchor2", UIParent)
	AutoButtonAnchor2:SetClampedToScreen(true)
	AutoButtonAnchor2:Point("BOTTOMLEFT", RightChatPanel or LeftChatPanel, "TOPLEFT", 0, 48)
	AutoButtonAnchor2:Size(db.slotNum > 0 and db.slotSize * db.slotNum or 260, db.slotNum > 0 and db.slotSize or 40)
	E:CreateMover(AutoButtonAnchor2, "AutoButtonAnchor2Mover", L["Auto InventoryItem Button"], nil, nil, nil, "ALL,EUI", function() return E.db.euiscript.autobutton.enable; end)
	
	self:UpdateAutoButton()
end

E:RegisterModule(S:GetName())
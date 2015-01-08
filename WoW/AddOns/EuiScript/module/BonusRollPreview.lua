-- Author: p3lim
-- Version: 60000.22-Release
-- Title: Bonus Roll Preview
--rewrite by eui
if IsAddOnLoaded('BonusRollPreview') then return; end
local E, L = unpack(ElvUI) -- Import Functions/Constants, Config, Locales
local ns = {}
local currentEncounterID
local itemButtons = {}
ns.encounterIDs = ns.encounterIDs or {}
ns.itemBlacklist = ns.itemBlacklist or {}
ns.continents = ns.continents or {}
----begin at Pandaria.lua & Draenor.lua
for spellID, encounterID in next, {
	-- World - 322
	[132205] = 691, -- Sha of Anger
	[132206] = 725, -- Salyis' Warband (Galleon)
	[136381] = 814, -- Nalak, The Storm God
	[137554] = 826, -- Oondasta
	[148317] = 857, -- Celestials (also encounterIDs 858, 859 and 860)
	[148316] = 861, -- Ordos, Fire-God of the Yaungol

	-- Mogu'Shan Vaults - 317
	[125144] = 679, -- The Stone Guard
	[132189] = 689, -- Feng the Accursed
	[132190] = 682, -- Gara'jal the Spiritbinder
	[132191] = 687, -- The Spirit Kings
	[132192] = 726, -- Elegon
	[132193] = 677, -- Will of the Emperor

	-- Heart of Fear - 330
	[132194] = 745, -- Imperial Vizier Zor'lok
	[132195] = 744, -- Blade Lord Tay'ak
	[132196] = 713, -- Garalon
	[132197] = 741, -- Wind Lord Mel'jarak
	[132198] = 737, -- Amber-Shaper Un'sok
	[132199] = 743, -- Grand Empress Shek'zeer

	-- Terrace of Endless Spring - 320
	[132200] = 683, -- Protectors of the Endless
	[132204] = 683, -- Protectors of the Endless (Elite)
	[132201] = 742, -- Tsulong
	[132202] = 729, -- Lei Shi
	[132203] = 709, -- Sha of Fear

	-- Throne of Thunder - 362
	[139674] = 827, -- Jin'rokh the Breaker
	[139677] = 819, -- Horridon
	[139679] = 816, -- Council of Elders
	[139680] = 825, -- Tortos
	[139682] = 821, -- Magaera
	[139684] = 828, -- Ji'kun, the Ancient Mother
	[139686] = 818, -- Durumu the Forgotten
	[139687] = 820, -- Primordious
	[139688] = 824, -- Dark Animus
	[139689] = 817, -- Iron Qon
	[139690] = 829, -- Twin Consorts (Empyreal Queens)
	[139691] = 832, -- Lei Shen, The Thunder King
	[139692] = 831, -- Ra-den

	-- Siege of Orgrimmar - 369
	[145909] = 852, -- Immerseus
	[145910] = 849, -- The Fallen Protectors
	[145911] = 866, -- Norushen
	[145912] = 867, -- Sha of Pride
	[145914] = 864, -- Iron Juggernaut
	[145915] = 856, -- Kor'kron Dark Shaman
	[145916] = 850, -- General Nazgrim
	[145917] = 846, -- Malkorok
	[145919] = 870, -- Spoils of Pandaria
	[145920] = 851, -- Thok the Bloodthirsty
	[145918] = 865, -- Siegecrafter Blackfuse
	[145921] = 853, -- Paragons of the Klaxxi
	[145922] = 869,  -- Garrosh Hellscream
	
	-- World - 557
	[178847] = 1291, -- Drov the Ruiner
	[178849] = 1211, -- Tarina the Ageless
	[178851] = 1262, -- Rukhmar

	-- Highmaul - 477
	[177521] = 1128, -- Kargath Bladefist
	[177522] = 971, -- The Butcher
	[177523] = 1195, -- Tectus
	[177524] = 1196, -- Brackenspore
	[177525] = 1148, -- Twin Ogron
	[177526] = 1153, -- Ko'ragh
	[177528] = 1197, -- Imperator Mar'gok

	-- Blackrock Foundry - 457
	[177529] = 1161, -- Gruul
	[177530] = 1202, -- Oregorger
	[177536] = 1122, -- Beastlord Darmac
	[177534] = 1123, -- Flamebender Ka'graz
	[177533] = 1155, -- Hans'gar and Franzok
	[177537] = 1147, -- Operator Thogar
	[177531] = 1154, -- The Blast Furnace
	[177535] = 1162, -- Kromog
	[177538] = 1203, -- The Iron Maidens
	[177539] = 959,   -- Blackhand	
} do
	ns.encounterIDs[spellID] = encounterID
end

-- Galakras has two IDs, pick whatever the client uses
local Handler = CreateFrame('Frame')
Handler:RegisterEvent('PLAYER_LOGIN')
Handler:SetScript('OnEvent', function()
	EJ_SelectInstance(369)
	ns.encounterIDs[145913] = (select(3, EJ_GetEncounterInfoByIndex(5)))
end)

for _, itemID in next, {
	-- Mounts
	87777, -- Reins of the Astral Cloud Serpent
	93666, -- Spawn of Horridon
	95059, -- Cluth of Ji-Kun
	104253, -- Kor'kron Juggernaut

	-- Garrosh Heirlooms (Flex, Normal, Heroic)
	105674, 104409, 105687, -- Hellscream's Barrier
	105672, 104404, 105685, -- Hellscream's Cleaver
	105679, 104405, 105692, -- Hellscream's Decapitator
	105678, 104401, 105691, -- Hellscream's Doomblade
	105673, 104403, 105686, -- Hellscream's Pig Sticker
	105671, 104400, 105684, -- Hellscream's Razor
	105680, 104407, 105693, -- Hellscream's Shield Wall
	105676, 104408, 105689, -- Hellscream's Tome of Destruction
	105677, 104406, 105690, -- Hellscream's War Staff
	105670, 104399, 105683, -- Hellscream's Warbow
	105675, 104402, 105688, -- Hellscream's Warmace
} do
	ns.itemBlacklist[itemID] = true
end

ns.continents[6] = 322
----End of Pandaria.lua 

----begin at Draenor.lua
for spellID, encounterID in next, {
	-- World - 557
	[-1] = 1291, -- Drov the Ruiner
	[-1] = 1211, -- Tarina the Ageless
	[-1] = 1262, -- Rukhmar

	-- Highmaul - 477
	[177521] = 1128, -- Kargath Bladefist
	[177522] = 971, -- The Butcher
	[177523] = 1195, -- Tectus
	[177524] = 1196, -- Brackenspore
	[177525] = 1148, -- Twin Ogron
	[177526] = 1153, -- Ko'ragh
	[177528] = 1197, -- Imperator Mar'gok

	-- Blackrock Foundry - 457
	[177529] = 1161, -- Gruul
	[177530] = 1202, -- Oregorger
	[177536] = 1122, -- Beastlord Darmac
	[177534] = 1123, -- Flamebender Ka'graz
	[177533] = 1155, -- Hans'gar and Franzok
	[177537] = 1147, -- Operator Thogar
	[177531] = 1154, -- The Blast Furnace
	[177535] = 1162, -- Kromog
	[177538] = 1203, -- The Iron Maidens
	[177539] = 959   -- Blackhand
} do
	ns.encounterIDs[spellID] = encounterID
end

ns.continents[7] = 557
----End of Draenor.lua

local BACKDROP = {
	bgFile = [[Interface\ChatFrame\ChatFrameBackground]], tile = true, tileSize = 16,
	edgeFile = [[Interface\Tooltips\UI-Tooltip-Border]], edgeSize = 16,
	insets = {left = 4, right = 4, top = 4, bottom = 4}
}

local Container = CreateFrame('Frame', 'BonusRollPreviewContainer', BonusRollFrame)
local Handle = CreateFrame('Button', 'BonusRollPreviewHandle', BonusRollFrame)

local Hotspot = CreateFrame('Frame', nil, BonusRollFrame)
local Buttons = CreateFrame('Frame', 'BonusRollPreviewSpecButtons', Hotspot)
Buttons:Hide()

local function SpecButtonClick(self)
	SetLootSpecialization(self.specID)
	Buttons:Hide()
	BonusRollFrame.SpecIcon:SetDesaturated(false)
end

local function SpecButtonEnter(self)
	GameTooltip:SetOwner(self, 'ANCHOR_TOPRIGHT')
	GameTooltip:AddLine(self.name, 1, 1, 1)
	GameTooltip:Show()
end

local specButtons
local function HotspotEnter()
	if(not Buttons:IsShown()) then
		if(not specButtons) then
			local numSpecs = GetNumSpecializations()
			for index = 1, numSpecs do
				local specID, name, _, texture = GetSpecializationInfo(index)

				local SpecButton = CreateFrame('Button', nil, Buttons)
				SpecButton:SetPoint('LEFT', index * 28, 0)
				SpecButton:SetSize(22, 22)
				SpecButton:SetScript('OnClick', SpecButtonClick)
				SpecButton:SetScript('OnEnter', SpecButtonEnter)
				SpecButton:SetScript('OnLeave', GameTooltip_Hide)
				SpecButton:SetHighlightTexture([[Interface\Minimap\UI-Minimap-ZoomButton-Highlight]])

				SpecButton.specID = specID
				SpecButton.name = name

				local Icon = SpecButton:CreateTexture(nil, 'OVERLAY', nil, 1)
				Icon:SetAllPoints()
				Icon:SetTexture(texture)

				local Ring = SpecButton:CreateTexture(nil, 'OVERLAY', nil, 2)
				Ring:SetPoint('TOPLEFT', -6, 6)
				Ring:SetSize(58, 58)
				Ring:SetTexture([[Interface\Minimap\Minimap-TrackingBorder]])
			end

			Buttons:SetSize(numSpecs * 28 + 34, 38)

			specButtons = true
		end

		BonusRollFrame.SpecIcon:SetDesaturated(true)
		Buttons:Show()
	end
end

local function HotspotLeave()
	if(not Buttons:IsMouseOver()) then
		BonusRollFrame.SpecIcon:SetDesaturated(false)
		Buttons:Hide()
	end
end

local function ButtonsLeave(self)
	local parent = GetMouseFocus():GetParent()
	if(not Hotspot:IsMouseOver() and not (parent and parent == self)) then
		BonusRollFrame.SpecIcon:SetDesaturated(false)
		self:Hide()
	end
end

local function HookStartRoll(self, frame)
	local specID = GetLootSpecialization()
	if(not specID or specID == 0) then
		SetLootSpecialization(GetSpecializationInfo(GetSpecialization()))
	end
end

local function PositionDownwards()
	return (GetScreenHeight() - (BonusRollFrame:GetTop() or 200)) < 345
end

local collapsed
local function HandleClick(self)
	if(self) then
		collapsed = not collapsed
	else
		collapsed = true
	end

	Handle:ClearAllPoints()
	if(collapsed) then
		if(PositionDownwards()) then
			Handle.Arrow:SetTexCoord(0, 0, 1/2, 0, 0, 1, 1/2, 1)
			Handle:SetPoint('TOP', BonusRollFrame, 'BOTTOM', 0, 2)
		else
			Handle.Arrow:SetTexCoord(1/2, 1, 0, 1, 1/2, 0, 0, 0)
			Handle:SetPoint('BOTTOM', BonusRollFrame, 'TOP', 0, -2)
		end

		Container:Hide()
	else
		if(PositionDownwards()) then
			Handle.Arrow:SetTexCoord(1/2, 1, 1, 1, 1/2, 0, 1, 0)
			Handle:SetPoint('BOTTOM', Container, 0, -14)
		else
			Handle.Arrow:SetTexCoord(1, 0, 1/2, 0, 1, 1, 1/2, 1)
			Handle:SetPoint('TOP', Container, 0, 14)
		end

		Container:Show()
	end
end

local function HandlePosition()
	Container:ClearAllPoints()
	if(PositionDownwards()) then
		Container:SetPoint('TOP', BonusRollFrame, 'BOTTOM')

		Handle.Arrow:SetTexCoord(0, 0, 1/2, 0, 0, 1, 1/2, 1)
		Handle.TopCenter:Hide()
		Handle.TopRight:Hide()
		Handle.TopLeft:Hide()
		Handle.BottomCenter:Show()
		Handle.BottomRight:Show()
		Handle.BottomLeft:Show()
	else
		Container:SetPoint('BOTTOM', BonusRollFrame, 'TOP')

		Handle.Arrow:SetTexCoord(1/2, 1, 0, 1, 1/2, 0, 0, 0)
		Handle.TopCenter:Show()
		Handle.TopRight:Show()
		Handle.TopLeft:Show()
		Handle.BottomCenter:Hide()
		Handle.BottomRight:Hide()
		Handle.BottomLeft:Hide()
	end

	HandleClick()
end

local function ItemButtonUpdate(self, elapsed)
	if(IsModifiedClick('COMPAREITEMS') or (GetCVarBool('alwaysCompareItems') and not IsEquippedItem(self.itemID))) then
		GameTooltip_ShowCompareItem()
	else
		ShoppingTooltip1:Hide()
		ShoppingTooltip2:Hide()
	end

	if(IsModifiedClick('DRESSUP')) then
		ShowInspectCursor()
	else
		ResetCursor()
	end
end

local function ItemButtonClick(self)
	HandleModifiedItemClick(self.itemLink)
end

local function ItemButtonEnter(self)
	GameTooltip:SetOwner(self, 'ANCHOR_TOPLEFT')
	GameTooltip:SetItemByID(self.itemID)

	self:SetScript('OnUpdate', ItemButtonUpdate)
end

local function ItemButtonLeave(self)
	GameTooltip:Hide()

	self:SetScript('OnUpdate', nil)
end

local function GetItemLine(index)
	local ItemButton = itemButtons[index]
	if(not ItemButton) then
		ItemButton = CreateFrame('Button', nil, Container.ScrollChild)
		ItemButton:SetPoint('TOPLEFT', 6, (index - 1) * -40)
		ItemButton:SetPoint('TOPRIGHT', -22, (index - 1) * -40)
		ItemButton:SetHeight(38)

		local Icon = ItemButton:CreateTexture(nil, 'BACKGROUND')
		Icon:SetPoint('TOPLEFT', 1, -1)
		Icon:SetSize(36, 36)
		ItemButton.Icon = Icon

		local Background = ItemButton:CreateTexture(nil, 'BORDER')
		Background:SetAllPoints()
		Background:SetTexture([[Interface\EncounterJournal\UI-EncounterJournalTextures]])
		Background:SetTexCoord(0.00195313, 0.62890625, 0.61816406, 0.66210938)
		Background:SetDesaturated(true)

		local Name = ItemButton:CreateFontString(nil, 'ARTWORK', 'GameFontNormalMed3')
		Name:SetPoint('TOPLEFT', Icon, 'TOPRIGHT', 7, -4)
		Name:SetPoint('TOPRIGHT', -6, -4)
		Name:SetHeight(12)
		Name:SetJustifyH('LEFT')
		ItemButton.Name = Name

		local Class = ItemButton:CreateFontString(nil, 'ARTWORK', 'GameFontHighlight')
		Class:SetPoint('BOTTOMRIGHT', -6, 5)
		Class:SetSize(0, 12)
		Class:SetJustifyH('RIGHT')
		ItemButton.Class = Class

		local Slot = ItemButton:CreateFontString(nil, 'ARTWORK', 'GameFontHighlight')
		Slot:SetPoint('BOTTOMLEFT', Icon, 'BOTTOMRIGHT', 7, 4)
		Slot:SetPoint('BOTTOMRIGHT', Class, 'BOTTOMLEFT', -15, 0)
		Slot:SetSize(0, 12)
		Slot:SetJustifyH('LEFT')
		ItemButton.Slot = Slot

		ItemButton:SetScript('OnClick', ItemButtonClick)
		ItemButton:SetScript('OnEnter', ItemButtonEnter)
		ItemButton:SetScript('OnLeave', ItemButtonLeave)

		itemButtons[index] = ItemButton
	end

	return ItemButton
end

function Container:Populate()
	local numItems = 0
	for index = 1, EJ_GetNumLoot() do
		local name, texture, slot, itemClass, itemID, itemLink, encounterID = EJ_GetLootInfoByIndex(index)
		if(encounterID == currentEncounterID and not ns.itemBlacklist[itemID]) then
			numItems = numItems + 1

			local ItemButton = GetItemLine(numItems)
			ItemButton.Icon:SetTexture(texture)
			ItemButton.Name:SetText(name)
			ItemButton.Slot:SetText(slot)
			ItemButton.Class:SetText(itemClass)

			ItemButton.itemID = itemID
			ItemButton.itemLink = itemLink

			ItemButton:Show()
		end
	end

	self:Hide()
	self:SetHeight(math.min(330, math.max(50, 10 + (numItems * 40))))

	if(numItems > 0) then
		local height = (10 + (numItems * 40)) - self:GetHeight()
		self.Slider:SetMinMaxValues(0, height > 0 and height or 0)
		self.Slider:SetValue(0)

		if(numItems > 8) then
			self:EnableMouseWheel(true)
			self.Slider:Show()
			self.ScrollChild:SetWidth(286)
		else
			self:EnableMouseWheel(false)
			self.Slider:Hide()
			self.ScrollChild:SetWidth(302)
		end

		self.Empty:Hide()
	else
		self.Empty:Show()
	end

	if(EncounterJournal) then
		EncounterJournal:RegisterEvent('EJ_LOOT_DATA_RECIEVED')
		EncounterJournal:RegisterEvent('EJ_DIFFICULTY_UPDATE')
	end
end

function Container:Update()
	if(EncounterJournal) then
		EncounterJournal:UnregisterEvent('EJ_DIFFICULTY_UPDATE')
	end

	for index, button in next, itemButtons do
		button:Hide()
	end

	local _, _, difficulty = GetInstanceInfo()
	EJ_SetDifficulty(difficulty > 0 and difficulty or 4)

	local currentInstance = EJ_GetCurrentInstance()
	if(not currentInstance or currentInstance == 0) then
		local oldMap = GetCurrentMapAreaID()
		SetMapToCurrentZone()
		currentInstance = ns.continents[GetCurrentMapContinent()]
		SetMapByID(oldMap)
	end
	EJ_SelectInstance(currentInstance)
	EJ_SelectEncounter(currentEncounterID)

	local _, _, classID = UnitClass('player')
	EJ_SetLootFilter(classID, GetLootSpecialization() or GetSpecializationInfo(GetSpecialization() or 0) or 0)

	self:Populate()
end

function Container:EJ_LOOT_DATA_RECIEVED(event)
	if(EncounterJournal) then
		EncounterJournal:UnregisterEvent(event)
	end

	self:Populate()
end

function Container:PLAYER_LOOT_SPEC_UPDATED(event)
	self:Update()
	HandlePosition()
end

function Container:SPELL_CONFIRMATION_PROMPT(event, spellID, confirmType, _, _, currencyID)
	if(confirmType == CONFIRMATION_PROMPT_BONUS_ROLL) then
		currentEncounterID = ns.encounterIDs[spellID]

		if(currentEncounterID) then
			local _, count = GetCurrencyInfo(currencyID)
			if(count > 0) then
				self:RegisterEvent('EJ_LOOT_DATA_RECIEVED')
				self:RegisterEvent('PLAYER_LOOT_SPEC_UPDATED')
				self:Update()
			end
		else
			print('|cffff8080BonusRollPreview:|r Found an unknown spell [' .. spellID .. ']. Please report this!')
		end
	end
end

function Container:SPELL_CONFIRMATION_TIMEOUT()
	currentEncounterID = nil

	self:UnregisterEvent('EJ_LOOT_DATA_RECIEVED')
	self:UnregisterEvent('PLAYER_LOOT_SPEC_UPDATED')
end

function Container:PLAYER_LOGIN()
	local oldName = 'HabeebIt'
	if(IsAddOnLoaded(oldName)) then
		DisableAddOn(oldName)
		print('|cffff8080BonusRollPreview:|r You\'re running a conflicting addon, type /reload to resolve')
	end

	local ScrollChild = CreateFrame('Frame', nil, self)
	ScrollChild:SetHeight(1) -- Completely ignores this value, bug?
	self.ScrollChild = ScrollChild

	local Scroll = CreateFrame('ScrollFrame', nil, self)
	Scroll:SetPoint('TOPLEFT', 0, -6)
	Scroll:SetPoint('BOTTOMRIGHT', 0, 6)
	Scroll:SetScrollChild(ScrollChild)

	self:SetWidth(286)
	self:SetFrameLevel(self:GetParent():GetFrameLevel() - 2)
	self:SetBackdrop(BACKDROP)
	self:SetBackdropColor(0, 0, 0, 0.8)
	self:SetBackdropBorderColor(2/3, 2/3, 2/3)
	self:EnableMouseWheel(true)

	local Slider = CreateFrame('Slider', nil, Scroll)
	Slider:SetPoint('TOPRIGHT', -5, -16)
	Slider:SetPoint('BOTTOMRIGHT', -5, 14)
	Slider:SetWidth(16)
	Slider:SetFrameLevel(self:GetFrameLevel() + 10)
	Slider:SetThumbTexture([[Interface\Buttons\UI-ScrollBar-Knob]])
	self.Slider = Slider

	local Thumb = Slider:GetThumbTexture()
	Thumb:SetSize(16, 24)
	Thumb:SetTexCoord(1/4, 3/4, 1/8, 7/8)

	local Up = CreateFrame('Button', nil, Slider)
	Up:SetPoint('BOTTOM', Slider, 'TOP')
	Up:SetSize(16, 16)
	Up:SetNormalTexture([[Interface\Buttons\UI-ScrollBar-ScrollUpButton-Up]])
	Up:SetDisabledTexture([[Interface\Buttons\UI-ScrollBar-ScrollUpButton-Disabled]])
	Up:SetHighlightTexture([[Interface\Buttons\UI-ScrollBar-ScrollUpButton-Highlight]])
	Up:GetNormalTexture():SetTexCoord(1/4, 3/4, 1/4, 3/4)
	Up:GetDisabledTexture():SetTexCoord(1/4, 3/4, 1/4, 3/4)
	Up:GetHighlightTexture():SetTexCoord(1/4, 3/4, 1/4, 3/4)
	Up:GetHighlightTexture():SetBlendMode('ADD')
	Up:SetScript('OnClick', function()
		Slider:SetValue(Slider:GetValue() - Slider:GetHeight() / 3)
	end)

	local Down = CreateFrame('Button', nil, Slider)
	Down:SetPoint('TOP', Slider, 'BOTTOM')
	Down:SetSize(16, 16)
	Down:SetScript('OnClick', ScrollClick)
	Down:SetNormalTexture([[Interface\Buttons\UI-ScrollBar-ScrollDownButton-Up]])
	Down:SetDisabledTexture([[Interface\Buttons\UI-ScrollBar-ScrollDownButton-Disabled]])
	Down:SetHighlightTexture([[Interface\Buttons\UI-ScrollBar-ScrollDownButton-Highlight]])
	Down:GetNormalTexture():SetTexCoord(1/4, 3/4, 1/4, 3/4)
	Down:GetDisabledTexture():SetTexCoord(1/4, 3/4, 1/4, 3/4)
	Down:GetHighlightTexture():SetTexCoord(1/4, 3/4, 1/4, 3/4)
	Down:GetHighlightTexture():SetBlendMode('ADD')
	Down:SetScript('OnClick', function()
		Slider:SetValue(Slider:GetValue() + Slider:GetHeight() / 3)
	end)

	Slider:SetScript('OnValueChanged', function(self, value)
		local min, max = self:GetMinMaxValues()
		if(value == min) then
			Up:Disable()
		else
			Up:Enable()
		end

		if(value == max) then
			Down:Disable()
		else
			Down:Enable()
		end

		local Parent = self:GetParent()
		Parent:SetVerticalScroll(value)
		ScrollChild:SetPoint('TOP', 0, value)
	end)

	Scroll:SetScript('OnMouseWheel', function(self, alpha)
		if(alpha > 0) then
			Slider:SetValue(Slider:GetValue() - Slider:GetHeight() / 3)
		else
			Slider:SetValue(Slider:GetValue() + Slider:GetHeight() / 3)
		end
	end)

	local Empty = self:CreateFontString(nil, 'ARTWORK', 'GameFontHighlight')
	Empty:SetPoint('CENTER')
	Empty:SetText('This encounter has no possible items for\nyour current class and/or specialization.')
	self.Empty = Empty

	Handle:SetSize(64, 16)
	Handle:SetNormalTexture([[Interface\RaidFrame\RaidPanel-Toggle]])
	Handle:SetScript('OnClick', HandleClick)
	Handle.Arrow = Handle:GetNormalTexture()

	local HandleBackground = Handle:CreateTexture(nil, 'BACKGROUND')
	HandleBackground:SetAllPoints()
	HandleBackground:SetTexture(0, 0, 0, 0.8)

	local TopCenter = Handle:CreateTexture(nil, 'BORDER')
	TopCenter:SetPoint('TOP', 0, 4.5)
	TopCenter:SetSize(24, 12)
	TopCenter:SetTexture([[Interface\RaidFrame\RaidPanel-UpperMiddle]])
	Handle.TopCenter = TopCenter

	local TopRight = Handle:CreateTexture(nil, 'BORDER')
	TopRight:SetPoint('TOPRIGHT', 4, 4)
	TopRight:SetSize(24, 20)
	TopRight:SetTexture([[Interface\RaidFrame\RaidPanel-UpperRight]])
	TopRight:SetTexCoord(0, 1, 0, 0.8)
	Handle.TopRight = TopRight

	local TopLeft = Handle:CreateTexture(nil, 'BORDER')
	TopLeft:SetPoint('TOPLEFT', -4, 4)
	TopLeft:SetSize(24, 20)
	TopLeft:SetTexture([[Interface\RaidFrame\RaidPanel-UpperLeft]])
	TopLeft:SetTexCoord(0, 1, 0, 0.8)
	Handle.TopLeft = TopLeft

	local BottomCenter = Handle:CreateTexture(nil, 'BORDER')
	BottomCenter:SetPoint('BOTTOM', 0, -9)
	BottomCenter:SetSize(24, 12)
	BottomCenter:SetTexture([[Interface\RaidFrame\RaidPanel-BottomMiddle]])
	Handle.BottomCenter = BottomCenter

	local BottomRight = Handle:CreateTexture(nil, 'BORDER')
	BottomRight:SetPoint('BOTTOMRIGHT', 4, -6)
	BottomRight:SetSize(24, 22)
	BottomRight:SetTexture([[Interface\RaidFrame\RaidPanel-BottomRight]])
	BottomRight:SetTexCoord(0, 1, 0.1, 1)
	Handle.BottomRight = BottomRight

	local BottomLeft = Handle:CreateTexture(nil, 'BORDER')
	BottomLeft:SetPoint('BOTTOMLEFT', -4, -6)
	BottomLeft:SetSize(24, 22)
	BottomLeft:SetTexture([[Interface\RaidFrame\RaidPanel-BottomLeft]])
	BottomLeft:SetTexCoord(0, 1, 0.1, 1)
	Handle.BottomLeft = BottomLeft

	Hotspot:SetAllPoints(BonusRollFrame.SpecIcon)
	Hotspot:SetScript('OnEnter', HotspotEnter)
	Hotspot:SetScript('OnLeave', HotspotLeave)

	Buttons:SetPoint('LEFT', 4, 4)
	Buttons:SetScript('OnLeave', ButtonsLeave)

	self:RegisterEvent('SPELL_CONFIRMATION_PROMPT')
	self:RegisterEvent('SPELL_CONFIRMATION_TIMEOUT')

	hooksecurefunc('BonusRollFrame_StartBonusRoll', HookStartRoll)
	hooksecurefunc(BonusRollFrame, 'SetPoint', HandlePosition)
end

Container:SetScript('OnEvent', function(self, event, ...) self[event](self, event, ...) end)
Container:RegisterEvent('PLAYER_LOGIN')

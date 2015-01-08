------------------------------------------------------------
-- Title: GemPlus
-- Version: 1.11
-- Author: Abin
------------------------------------------------------------
local E, LL = unpack(ElvUI)
if not E.db.euiscript.gemplus then return; end

local wipe = wipe
local pairs = pairs
local ipairs = ipairs
local tinsert = tinsert
local strfind = strfind
local strmatch = strmatch
local sort = sort
local strsub = strsub
local GetSpellInfo = GetSpellInfo
local _G = _G
local WorldFrame = WorldFrame

local addon = {}
local addonName = LL['GemPlus']

addon.version = '1.11'

-- Localized player stat names, thankfully Blizzard defined them all, that's why this addon does not contain any UTF-8 file.
local L = {
	STR = SPELL_STAT1_NAME, -- "Strength"
	AGI = SPELL_STAT2_NAME, -- "Agility"
	INT = SPELL_STAT4_NAME, -- "Intellect"
	EXP = STAT_EXPERTISE, -- "Expertise"
	PAR = STAT_PARRY, -- "Parry"

	HAS = STAT_HASTE, -- "Haste"
	CRI = MELEE_CRIT_CHANCE, -- "Crit Chance"
	MAS = STAT_MASTERY, -- "Mastery"
	DOD = STAT_DODGE, -- "Dodge"
	RES = STAT_RESILIENCE, -- "PvP Resilience"

	STA = SPELL_STAT3_NAME, -- "Stamina"
	SPI = SPELL_STAT5_NAME, -- "Spirit"
	HIT = STAT_HIT_CHANCE, -- "Hit Chance"
	POW = STAT_PVP_POWER, -- "PvP Power"

	META = META_GEM, -- "Meta"
}

-- Basic gem names & icons
local PRIME_MAP = {
	RED =		{ id = 131686, index = 1, icon = "Interface\\Icons\\Inv_Misc_Gem_X4_Rare_Cut_Red" },
	BLUE =		{ id = 131593, index = 2, icon = "Interface\\Icons\\Inv_Misc_Gem_X4_Rare_Cut_Blue" },
	YELLOW =	{ id = 131695, index = 3, icon = "Interface\\Icons\\Inv_Misc_Gem_X4_Rare_Cut_Yellow" },
	PURPLE =	{ id = 131691, index = 4, icon = "Interface\\Icons\\Inv_Misc_Gem_X4_Rare_Cut_Purple" },
	GREEN =		{ id = 131688, index = 5, icon = "Interface\\Icons\\Inv_Misc_Gem_X4_Rare_Cut_Green" },
	ORANGE =	{ id = 131690, index = 6, icon = "Interface\\Icons\\Inv_Misc_Gem_X4_Rare_Cut_Orange" },
	META =		{ id = 140060, index = 7, icon = "Interface\\Icons\\Inv_Misc_Gem_X4_MetaGem_Cut" },
}

-- Regular gems
local REGULAR_MAP = {
	STR =		{ id = 107705, color = "RED" },
	AGI =		{ id = 107707, color = "RED" },
	INT =		{ id = 107706, color = "RED" },
	EXP =		{ id = 107709, color = "RED" },
	PAR =		{ id = 107708, color = "RED" },

	STA =		{ id = 106950, color = "BLUE" },
	SPI =		{ id = 106949, color = "BLUE" },
	HIT =		{ id = 106947, color = "BLUE" },
	POW =		{ id = 106948, color = "BLUE" },

	HAS =		{ id = 107712, color = "YELLOW" },
	CRI =		{ id = 107713, color = "YELLOW" },
	MAS =		{ id = 107710, color = "YELLOW" },
	DOD =		{ id = 107714, color = "YELLOW" },
	RES =		{ id = 107711, color = "YELLOW" },

	STR_STA =	{ id = 107702, color = "PURPLE" },
	STR_HIT =	{ id = 107695, color = "PURPLE" },
	STR_POW =	{ id = 130658, color = "PURPLE" },
	AGI_STA =	{ id = 107701, color = "PURPLE" },
	AGI_HIT =	{ id = 107696, color = "PURPLE" },
	AGI_POW =	{ id = 130657, color = "PURPLE" },
	INT_SPI =	{ id = 107699, color = "PURPLE" },
	INT_STA =	{ id = 107703, color = "PURPLE" },
	INT_HIT =	{ id = 107704, color = "PURPLE" },
	INT_POW =	{ id = 107698, color = "PURPLE" },
	EXP_STA =	{ id = 107697, color = "PURPLE" },
	EXP_HIT =	{ id = 107693, color = "PURPLE" },
	PAR_STA =	{ id = 107694, color = "PURPLE" },
	PAR_HIT =	{ id = 107700, color = "PURPLE" },

	HAS_STA =	{ id = 107738, color = "GREEN" },
	HAS_SPI =	{ id = 107737, color = "GREEN" },
	HAS_HIT =	{ id = 106955, color = "GREEN" },
	HAS_POW =	{ id = 107745, color = "GREEN" },
	DOD_STA =	{ id = 107744, color = "GREEN" },
	CRI_STA =	{ id = 107739, color = "GREEN" },
	SPI_CRI =	{ id = 106953, color = "GREEN" },
	CRI_HIT =	{ id = 106954, color = "GREEN" },
	CRI_POW =	{ id = 107743, color = "GREEN" },
	HIT_MAS =	{ id = 106956, color = "GREEN" },
	POW_MAS =	{ id = 106957, color = "GREEN" },
	SPI_MAS =	{ id = 106958, color = "GREEN" },
	SPI_RES =	{ id = 106962, color = "GREEN" },
	HIT_DOD =	{ id = 107740, color = "GREEN" },
	MAS_STA =	{ id = 107742, color = "GREEN" },
	RES_STA =	{ id = 107746, color = "GREEN" },
	HIT_RES =	{ id = 106960, color = "GREEN" },
	POW_RES =	{ id = 106961, color = "GREEN" },

	STR_HAS =	{ id = 107721, color = "ORANGE" },
	STR_CRI =	{ id = 107723, color = "ORANGE" },
	STR_MAS =	{ id = 107731, color = "ORANGE" },
	STR_DOD =	{ id = 107717, color = "ORANGE" },
	STR_RES =	{ id = 107730, color = "ORANGE" },
	AGI_HAS =	{ id = 107720, color = "ORANGE" },
	AGI_CRI =	{ id = 107719, color = "ORANGE" },
	AGI_MAS =	{ id = 107715, color = "ORANGE" },
	AGI_DOD =	{ id = 107726, color = "ORANGE" },
	AGI_RES =	{ id = 107725, color = "ORANGE" },
	INT_HAS =	{ id = 107728, color = "ORANGE" },
	INT_CRI =	{ id = 107727, color = "ORANGE" },
	INT_MAS =	{ id = 107716, color = "ORANGE" },
	INT_RES =	{ id = 107736, color = "ORANGE" },
	EXP_HAS =	{ id = 107735, color = "ORANGE" },
	EXP_CRI =	{ id = 107718, color = "ORANGE" },
	EXP_MAS =	{ id = 107724, color = "ORANGE" },
	EXP_DOD =	{ id = 107729, color = "ORANGE" },
	EXP_RES =	{ id = 107734, color = "ORANGE" },
	PAR_HAS =	{ id = 107735, color = "ORANGE" },
	PAR_MAS =	{ id = 107722, color = "ORANGE" },
	PAR_DOD =	{ id = 107733, color = "ORANGE" },
	PAR_RES =	{ id = 107732, color = "ORANGE" },
}

-- Meta gems
local META_MAP = {
	{ id = 107767, color = "META" }, -- STR_CRI
	{ id = 107753, color = "META" }, -- AGI_CRI
	{ id = 107756, color = "META" }, -- INT_CRI
	{ id = 107759, color = "META" }, -- INT_MAN
	{ id = 107764, color = "META" }, -- INT_SIL
	{ id = 107768, color = "META" }, -- SPI_CRI

	{ id = 107754, color = "META" }, -- STA_ARM
	{ id = 107758, color = "META" }, -- STA_SPE
	{ id = 107766, color = "META" }, -- STA_STU

	{ id = 107757, color = "META" }, -- CRI_REF
	{ id = 107760, color = "META" }, -- CRI_LIM
	{ id = 107765, color = "META" }, -- CRI_FEA

	{ id = 107762, color = "META" }, -- DOD_BLO
	{ id = 107763, color = "META" }, -- MAS_SPE
}

local function SortCompFunc(key1, key2)
	if key1 and key2 then
		local index1, index2 = PRIME_MAP[REGULAR_MAP[key1].color].index, PRIME_MAP[REGULAR_MAP[key2].color].index
		if index1 == index2 then
			return key1 < key2
		else
			return index1 < index2
		end
	end
end

function addon:GetDataList(cache, value)
	wipe(cache)
	if value == "META" then
		local i
		for i = 1, #META_MAP do
			tinsert(cache, i)
		end

	elseif value then
		local k, v
		for k, v in pairs(REGULAR_MAP) do
			if strfind(k, value) then
				tinsert(cache, k)
			end
		end

		sort(cache, SortCompFunc)
	else
		tinsert(cache, "STR")
		tinsert(cache, "AGI")
		tinsert(cache, "INT")
		tinsert(cache, "STA")
		tinsert(cache, "SPI")

		tinsert(cache, "HIT")
		tinsert(cache, "EXP")
		tinsert(cache, "CRI")
		tinsert(cache, "HAS")
		tinsert(cache, "MAS")

		tinsert(cache, "PAR")
		tinsert(cache, "DOD")

		tinsert(cache, "RES")
		tinsert(cache, "POW")

		tinsert(cache, "META")
	end
end

function addon:GetDataInfo(key)
	local data

	if type(key) == "number" then
		data = META_MAP[key]
	else
		data = REGULAR_MAP[key]
	end

	if data then
		return data.stats, data.prefix or "", PRIME_MAP[data.color].icon
	end

	return L[key]
end

local function ExtractGemNames(list)
	local _, v
	for _, v in pairs(list) do
		v.name = GetSpellInfo(v.id)
	end
end

local function ExtractRegularStats(stats)
	local s1, s2 = strmatch(stats, "(.+)_(.+)")
	if s1 and s2 then
		return L[s1].." + "..L[s2]
	else
		return L[stats]
	end
end

local function ExtractPrefix(name, color)
	local baseName = PRIME_MAP[color].name
	local prefix
	if name and baseName then
		local index1, index2 = strfind(name, baseName, 1, 1)
		if index1 == 1 then
			prefix = strsub(name, index2 + 1)
		elseif index1 then
			prefix = strsub(name, 1, index1 - 1)
		end
	end
	return prefix
end

do
	-- Extract gem names by GetSpellInfo
	ExtractGemNames(PRIME_MAP)
	ExtractGemNames(REGULAR_MAP)
	ExtractGemNames(META_MAP)

	-- Extract alias and prefixes for regular gems
	local key, data
	for key, data in pairs(REGULAR_MAP) do
		data.prefix = ExtractPrefix(data.name, data.color)
		data.stats = ExtractRegularStats(key)
	end

	-- Extract meta gem prefixes
	for key, data in ipairs(META_MAP) do
		data.prefix = ExtractPrefix(data.name, data.color)
	end
end

-- Meta gem stats info are only available through tooltip scanning!
local tooltip = CreateFrame("GameTooltip", addonName.."ScanTooltip", WorldFrame, "GameTooltipTemplate")
local LINE_PREFIX = tooltip:GetName().."TextLeft"

local function GetTooltipLine(index)
	local line = _G[LINE_PREFIX..index]
	return line and line:GetText()
end

local function ExtractMetaStats(id, name)
	tooltip:SetHyperlink("Hspell:"..id)
	local i
	for i = 4, 10 do
		local line = GetTooltipLine(i)
		if line then
			local _, _, _, stats = strfind(line, "^+(%d+)(.+)") -- Meta stats format: "+n stats and blah blah"
			if stats then
				return "+"..stats
			end
		end
	end
end

local function InitializeMetaStats()
	if not tooltip:IsOwned(WorldFrame) then
		tooltip:SetOwner(WorldFrame, "ANCHOR_NONE")
	end

	local success = 1
	local _, data
	for _, data in ipairs(META_MAP) do
		if data.name and not data.stats then
			data.stats = ExtractMetaStats(data.id, data.name)
			if not data.stats then
				success = nil
			end
		end
	end

	return success
end

-- Tooltip scanning always fail until the game client is completely stable
local frame = CreateFrame("Frame")
frame:SetScript("OnUpdate", function(self, elapsed)
	self.elapsed = (self.elapsed or 0) + elapsed
	if self.elapsed > 1 then
		self.elapsed = 0

		if InitializeMetaStats() then
			self:Hide()
			tooltip:Hide()
		end
	end
end)

local UIDropDownMenu_AddButton = UIDropDownMenu_AddButton
local UIDropDownMenu_Initialize = UIDropDownMenu_Initialize
local CloseDropDownMenus = CloseDropDownMenus
local GetTradeSkillLine = GetTradeSkillLine
local UIFrameFade = UIFrameFade
local UIFrameFadeOut = UIFrameFadeOut

local GameTooltip = GameTooltip
local CLOSE = CLOSE

local TRADESKILL_NAME = GetSpellInfo(25229) -- Get localized tradeskill name
local JEWEL_FILTER_NAME = "AuctionFilterButton8" -- As of 50300, 8 is the class index for jewels

local function Menu_OnClick(self, prefix, menu)
	CloseDropDownMenus()

	if menu.OnCommand then
		menu:OnCommand(menu.editbox, prefix)
	else
		menu.editbox:SetText(prefix)
	end

	menu.editbox:ClearFocus()
end

local function Menu_DropdownInit(self, level, value)
	if not self.editbox then
		return
	end

	if not value then
		UIDropDownMenu_AddButton({ text = addonName, notCheckable = 1, isTitle = 1 })
	end

	local cache = self.cache
	addon:GetDataList(cache, value)

	local i
	for i = 1, #cache do
		local data = { notCheckable = 1 }
		if value then
			data.text, data.arg1, data.icon = addon:GetDataInfo(cache[i])
			data.func = Menu_OnClick
			data.arg2 = self
		else
			local key = cache[i]
			data.text = addon:GetDataInfo(key)
			data.menuList = key
			data.keepShownOnClick = 1
			data.hasArrow = 1
		end

		if data.text then
			data.text = data.text.."    "
		end
		UIDropDownMenu_AddButton(data, level)
	end

	if not value then
		UIDropDownMenu_AddButton({ text = CLOSE, notCheckable = 1 })
	end
end

local function Button_OnEnter(self)
	GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
	GameTooltip:ClearLines()
	GameTooltip:AddLine(addonName)
	GameTooltip:Show()
end

local function Button_OnLeave(self)
	GameTooltip:Hide()
end

local function Button_ShineFadeOut(self)
	self.shining = nil
	UIFrameFadeOut(self.shine, 1)
end

local function Button_OnShow(self)
	self.shine:SetAlpha(0)
	self.shining = 1
	UIFrameFade(self.shine, { mode = "IN", timeToFade = 1, finishedFunc = Button_ShineFadeOut, finishedArg1 = self })
end

local function Menu_OnEvent(self, event)
	if self.runOnce then
		self:UnregisterEvent(event) -- Only run this event script once
	end

	if not self.editbox then
		local editbox = _G[self.editName]
		if not editbox then
			return
		end

		self.editbox = editbox
		self:SetParent(editbox)
		self.relativeTo = editbox

		local button = self.button
		button.editbox = editbox
		button:SetPoint("LEFT", editbox, "LEFT", -4, 0)

		if self.indent then
			editbox:SetTextInsets(18, 0, 0, 0)
		end
	end

	self:Hide()
	if not self.tradeskill or GetTradeSkillLine() == TRADESKILL_NAME then
		self:Show()
	end
end

function addon:CreateMenu(editName, tradeskill, runOnce, indent)
	local menu = CreateFrame("Frame", editName..addonName.."DropDownMenu", UIParent, "UIDropDownMenuTemplate")
	menu:Hide()
	menu.editName = editName
	menu.tradeskill = tradeskill
	menu.runOnce = runOnce
	menu.indent = indent
	menu.cache = {}
	menu.point = "TOPLEFT"
	menu.relativePoint = "BOTTOMLEFT"
	menu.xOffset = -10
	menu.yOffset = 0

	UIDropDownMenu_Initialize(menu, Menu_DropdownInit, "MENU")

	local button = _G[menu:GetName().."Button"]
	menu.button = button
	button:SetSize(18, 18)
	button:SetPushedTexture("Interface\\Buttons\\UI-Quickslot-Depress")
	button:GetPushedTexture():SetAllPoints(button)
	button:SetHighlightTexture("Interface\\Buttons\\ButtonHilight-Square", "ADD")
	button:GetHighlightTexture():SetAllPoints(button)

	local icon = button:CreateTexture(nil, "ARTWORK")
	button.icon = icon
	icon:SetAllPoints(button)
	icon:SetTexture("Interface\\Icons\\Inv_Misc_Gem_01")

	local shine = CreateFrame("Frame", nil, button)
	button.shine = shine
	shine:SetAllPoints(button)
	shine:Hide()

	local texture = shine:CreateTexture(nil, "OVERLAY")
	texture:SetTexture("Interface\\ComboFrame\\ComboPoint")
	texture:SetBlendMode("ADD")
	texture:SetTexCoord(0.5625, 1, 0, 1)
	texture:SetSize(32, 50)
	texture:SetPoint("CENTER", 0, 2)

	button:SetScript("OnEnter", Button_OnEnter)
	button:SetScript("OnLeave", Button_OnLeave)
	button:SetScript("OnShow", Button_OnShow)

	menu:RegisterEvent(tradeskill and "TRADE_SKILL_SHOW" or "AUCTION_HOUSE_SHOW")
	menu:SetScript("OnEvent", Menu_OnEvent)

	return menu
end

function addon:AddSupport(editbox, tradeSkill, OnCommand)
	if type(editbox) ~= "string" then
		return
	end

	local menu = self:CreateMenu(editbox, tradeSkill, nil, 1)

	if type(OnCommand) == "function" then
		menu.OnCommand = OnCommand
	end
end

-- Create menu for auction frame
local menu = addon:CreateMenu("BrowseName", nil, 1, 1)
function menu:OnCommand(editbox, prefix)
	local canSearch = BrowseSearchButton:IsEnabled()

	if canSearch then
		if BrowseResetButton:IsEnabled() then
			BrowseResetButton:Click()
		end

		_G[JEWEL_FILTER_NAME]:Click()
	end

	editbox:SetText(prefix)

	if canSearch then
		BrowseSearchButton:Click()
	end
end
addon:AddSupport("TradeSkillFrameSearchBox", 1)
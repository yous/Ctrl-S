local E, L, V, P, G, _ = unpack(select(2, ...)); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB, Localize Underscore
local LO = E:NewModule('Layout', 'AceEvent-3.0');

local PANEL_HEIGHT = 22;
local SIDE_BUTTON_WIDTH = 16;

E.Layout = LO;

local function Panel_OnShow(self)
	self:SetFrameLevel(0)
	self:SetFrameStrata('BACKGROUND')
end

local menuFrame = CreateFrame("Frame", "MinimapRightClickMenu", E.UIParent)
local menuList = {
	{text = CHARACTER_BUTTON,
	func = function() ToggleCharacter("PaperDollFrame") end},
	{text = SPELLBOOK_ABILITIES_BUTTON,
	func = function() if not SpellBookFrame:IsShown() then ShowUIPanel(SpellBookFrame) else HideUIPanel(SpellBookFrame) end end},
	{text = TALENTS_BUTTON,
	func = function()
		if not PlayerTalentFrame then
			TalentFrame_LoadUI()
		end

		if not GlyphFrame then
			GlyphFrame_LoadUI()
		end
		
		if not PlayerTalentFrame:IsShown() then
			ShowUIPanel(PlayerTalentFrame)
		else
			HideUIPanel(PlayerTalentFrame)
		end
	end},
	{text = MOUNTS,
	func = function()
		TogglePetJournal(1);
	end},
	{text = PETS,
	func = function()
		TogglePetJournal(2)
	end},
	{text = TOY_BOX,
	func = function() 
		TogglePetJournal(3)
	end},	
	{text = L["Farm Mode"],
	func = FarmMode},	
	{text = TIMEMANAGER_TITLE,
	func = function() ToggleFrame(TimeManagerFrame) end},		
	{text = ACHIEVEMENT_BUTTON,
	func = function() ToggleAchievementFrame() end},
	{text = SOCIAL_BUTTON,
	func = function() ToggleFriendsFrame(1) end},
	{text = L["Calendar"],
	func = function() GameTimeFrame:Click() end},
	{text = GARRISON_LANDING_PAGE_TITLE,
	func = function() GarrisonLandingPageMinimapButton_OnClick() end},
	{text = ACHIEVEMENTS_GUILD_TAB,
	func = function()
		if IsInGuild() then
			if not GuildFrame then GuildFrame_LoadUI() end
			GuildFrame_Toggle()
		else
			if not LookingForGuildFrame then LookingForGuildFrame_LoadUI() end
			if not LookingForGuildFrame then return end
			LookingForGuildFrame_Toggle()
		end
	end},
	{text = LFG_TITLE,
	func = function() PVEFrame_ToggleFrame(); end},
--	{text = L["Raid Browser"],
--	func = function() ToggleFrame(RaidBrowserFrame); end},
	{text = ENCOUNTER_JOURNAL,  
	func = function() if not IsAddOnLoaded('Blizzard_EncounterJournal') then EncounterJournal_LoadUI(); end ToggleFrame(EncounterJournal) end},	
	{text = BLIZZARD_STORE,
	func = function() StoreMicroButton:Click() end},
	{text = L["GameMenu"],
    func = function() ToggleFrame(GameMenuFrame) end},	
	{text = HELP_BUTTON,
	func = function() ToggleHelpFrame() end},
}
LO.menuList = menuList

function LO:Initialize()
	menuFrame:SetTemplate("Transparent", true)
	self:CreateChatPanels()
	self:CreateMinimapPanels()
	self:CreateActionbarInfobar()
	self:InfoBar()	
	
	self.BottomPanel = CreateFrame('Frame', 'ElvUI_BottomPanel', E.UIParent)
	self.BottomPanel:SetTemplate('Transparent')
	self.BottomPanel:Point('BOTTOMLEFT', E.UIParent, 'BOTTOMLEFT', -1, -1)
	self.BottomPanel:Point('BOTTOMRIGHT', E.UIParent, 'BOTTOMRIGHT', 1, -1)
	self.BottomPanel:Height(PANEL_HEIGHT)
	self.BottomPanel:SetScript('OnShow', Panel_OnShow)
	E.FrameLocks['ElvUI_BottomPanel'] = true;
	Panel_OnShow(self.BottomPanel)
	self:BottomPanelVisibility()
	
	self.TopPanel = CreateFrame('Frame', 'ElvUI_TopPanel', E.UIParent)
	self.TopPanel:SetTemplate('Transparent')
	self.TopPanel:Point('TOPLEFT', E.UIParent, 'TOPLEFT', -1, 1)
	self.TopPanel:Point('TOPRIGHT', E.UIParent, 'TOPRIGHT', 1, 1)
	self.TopPanel:Height(PANEL_HEIGHT)
	self.TopPanel:SetScript('OnShow', Panel_OnShow)
	Panel_OnShow(self.TopPanel)
	E.FrameLocks['ElvUI_TopPanel'] = true;
	E.FrameLocks['MainABInfobar'] = true;
	E.FrameLocks['ABLeftInfobar'] = true;
	E.FrameLocks['ABRightInfobar'] = true;	
	self:TopPanelVisibility()	
end

function LO:BottomPanelVisibility()
	if E.db.general.bottomPanel then
		self.BottomPanel:Show()
	else
		self.BottomPanel:Hide()
	end
end

function LO:TopPanelVisibility()
	if E.db.general.topPanel then
		self.TopPanel:Show()
	else
		self.TopPanel:Hide()
	end
end

local function ChatPanelLeft_OnFade(self)
	LeftChatPanel:Hide()
end

local function ChatPanelRight_OnFade(self)
	RightChatPanel:Hide()
end

local function ChatButton_OnEnter(self, ...)
	if E.db[self.parent:GetName()..'Faded'] then
		self.parent:Show()
		UIFrameFadeIn(self.parent, 0.2, self.parent:GetAlpha(), 1)
		UIFrameFadeIn(self, 0.2, self:GetAlpha(), 1)
	end

	GameTooltip:SetOwner(self, 'ANCHOR_TOPLEFT', 0, 4)
	GameTooltip:ClearLines()
	GameTooltip:AddDoubleLine(L['Left Click:'], L['Toggle Chat Frame'], 1, 1, 1)
	GameTooltip:Show()
end

local function ChatButton_OnLeave(self, ...)
	if E.db[self.parent:GetName()..'Faded'] then
		UIFrameFadeOut(self.parent, 0.2, self.parent:GetAlpha(), 0)
		UIFrameFadeOut(self, 0.2, self:GetAlpha(), 0)
		self.parent.fadeInfo.finishedFunc = self.parent.fadeFunc
	end
	GameTooltip:Hide()
end

local function ChatButton_OnClick(self, btn)
	GameTooltip:Hide()
	if E.db[self.parent:GetName()..'Faded'] then
		E.db[self.parent:GetName()..'Faded'] = nil
		UIFrameFadeIn(self.parent, 0.2, self.parent:GetAlpha(), 1)
		UIFrameFadeIn(self, 0.2, self:GetAlpha(), 1)
	else
		E.db[self.parent:GetName()..'Faded'] = true
		UIFrameFadeOut(self.parent, 0.2, self.parent:GetAlpha(), 0)
		UIFrameFadeOut(self, 0.2, self:GetAlpha(), 0)
		self.parent.fadeInfo.finishedFunc = self.parent.fadeFunc
	end
end

function HideLeftChat()
	ChatButton_OnClick(LeftChatToggleButton)
end

function HideRightChat()
	ChatButton_OnClick(RightChatToggleButton)
end

function HideBothChat()
	ChatButton_OnClick(LeftChatToggleButton)
	ChatButton_OnClick(RightChatToggleButton)
end

function LO:ToggleChatTabPanels(rightOverride, leftOverride)
	if leftOverride or not E.db.chat.panelTabBackdrop then
		LeftChatTab:Hide()
	else	
		LeftChatTab:Show()
	end
	
	if rightOverride or not E.db.chat.panelTabBackdrop then
		RightChatTab:Hide()
	else
		RightChatTab:Show()	
	end	
end

function LO:SetChatTabStyle()
	if E.db.chat.panelTabTransparency then
		LeftChatTab:SetTemplate("Transparent")
		RightChatTab:SetTemplate("Transparent")
	else
		LeftChatTab:SetTemplate("Default", true)
		RightChatTab:SetTemplate("Default", true)	
	end
end

function LO:SetDataPanelStyle()
	if E.db.datatexts.panelTransparency then
		LeftChatDataPanel:SetTemplate("Transparent")
		LeftChatToggleButton:SetTemplate("Transparent")
		LeftMiniPanel:SetTemplate("Transparent")
		RightChatDataPanel:SetTemplate("Transparent")
		RightChatToggleButton:SetTemplate("Transparent")
		RightMiniPanel:SetTemplate("Transparent")		
		ElvConfigToggle:SetTemplate("Transparent")
	else
		LeftChatDataPanel:SetTemplate("Default", true)
		LeftChatToggleButton:SetTemplate("Default", true)
		LeftMiniPanel:SetTemplate("Default", true)
		RightChatDataPanel:SetTemplate("Default", true)
		RightChatToggleButton:SetTemplate("Default", true)
		RightMiniPanel:SetTemplate("Default", true)		
		ElvConfigToggle:SetTemplate("Default", true)	
	end
end

local function AutoToggleBackdrop(self, event)
	if not E.db.chat.autoToggleBackdrop or E.db.chat.panelBackdrop == 'HIDEBOTH' then return; end
	
	if event == "PLAYER_REGEN_ENABLED" then
		if E.db.chat.panelBackdrop == 'SHOWBOTH' or E.db.chat.panelBackdrop == 'LEFT' then
			LeftChatPanel.backdrop:Show()
		--	LeftChatDataPanel:Show()
		--	LeftChatTab:Show()
		--	LeftChatToggleButton:Show()
		end
		if E.db.chat.panelBackdrop == 'SHOWBOTH' or E.db.chat.panelBackdrop == 'RIGHT' then
			RightChatPanel.backdrop:Show()
		--	RightChatDataPanel:Show()
		--	RightChatTab:Show()
		--	RightChatToggleButton:Show()
		end
		if E:GetModule('Chat').chatbar then E:GetModule('Chat').chatbar:Show() end
	else
		if E.db.chat.panelBackdrop == 'SHOWBOTH' or E.db.chat.panelBackdrop == 'LEFT' then
			LeftChatPanel.backdrop:Hide()
		--	LeftChatDataPanel:Hide()
		--	LeftChatTab:Hide()
		--	LeftChatToggleButton:Hide()
		end
		if E.db.chat.panelBackdrop == 'SHOWBOTH' or E.db.chat.panelBackdrop == 'RIGHT' then
			RightChatPanel.backdrop:Hide()
		--	RightChatDataPanel:Hide()
		--	RightChatTab:Hide()
		--	RightChatToggleButton:Hide()
		end	
		if E:GetModule('Chat').chatbar then E:GetModule('Chat').chatbar:Hide() end
	end
end	

function LO:ToggleChatPanels()
	LeftChatDataPanel:ClearAllPoints()
	RightChatDataPanel:ClearAllPoints()
	local SPACING = (E.PixelMode and 3 or 5)

	if E.db.datatexts.leftChatPanel then
		LeftChatDataPanel:Show()
		LeftChatToggleButton:Show()
	else
		LeftChatDataPanel:Hide()
		LeftChatToggleButton:Hide()
	end
	
	if E.db.datatexts.rightChatPanel then
		RightChatDataPanel:Show()
		RightChatToggleButton:Show()
	else
		RightChatDataPanel:Hide()
		RightChatToggleButton:Hide()
	end	
	
	if E.db.chat.panelBackdrop == 'SHOWBOTH' then
		LeftChatPanel.backdrop:Show()
		RightChatPanel.backdrop:Show()		
		LeftChatDataPanel:Point('BOTTOMLEFT', LeftChatPanel, 'BOTTOMLEFT', SPACING + SIDE_BUTTON_WIDTH, SPACING)
		LeftChatDataPanel:Point('TOPRIGHT', LeftChatPanel, 'BOTTOMRIGHT', -SPACING, (SPACING + PANEL_HEIGHT))		
		RightChatDataPanel:Point('BOTTOMLEFT', RightChatPanel, 'BOTTOMLEFT', SPACING, SPACING)
		RightChatDataPanel:Point('TOPRIGHT', RightChatPanel, 'BOTTOMRIGHT', -(SPACING + SIDE_BUTTON_WIDTH), SPACING + PANEL_HEIGHT)		
		LeftChatToggleButton:Point('BOTTOMLEFT', LeftChatPanel, 'BOTTOMLEFT', SPACING, SPACING)
		RightChatToggleButton:Point('BOTTOMRIGHT', RightChatPanel, 'BOTTOMRIGHT', -SPACING, SPACING)
		LO:ToggleChatTabPanels()
	elseif E.db.chat.panelBackdrop == 'HIDEBOTH' then
		LeftChatPanel.backdrop:Hide()
		RightChatPanel.backdrop:Hide()		
		LeftChatDataPanel:Point('BOTTOMLEFT', LeftChatPanel, 'BOTTOMLEFT', SIDE_BUTTON_WIDTH, 0)
		LeftChatDataPanel:Point('TOPRIGHT', LeftChatPanel, 'BOTTOMRIGHT', 0, PANEL_HEIGHT)		
		RightChatDataPanel:Point('BOTTOMLEFT', RightChatPanel, 'BOTTOMLEFT')
		RightChatDataPanel:Point('TOPRIGHT', RightChatPanel, 'BOTTOMRIGHT', -SIDE_BUTTON_WIDTH, PANEL_HEIGHT)		
		LeftChatToggleButton:Point('BOTTOMLEFT', LeftChatPanel, 'BOTTOMLEFT')
		RightChatToggleButton:Point('BOTTOMRIGHT', RightChatPanel, 'BOTTOMRIGHT')
		LO:ToggleChatTabPanels(true, true)
	elseif E.db.chat.panelBackdrop == 'LEFT' then
		LeftChatPanel.backdrop:Show()
		RightChatPanel.backdrop:Hide()		
		LeftChatDataPanel:Point('BOTTOMLEFT', LeftChatPanel, 'BOTTOMLEFT', SPACING + SIDE_BUTTON_WIDTH, SPACING)
		LeftChatDataPanel:Point('TOPRIGHT', LeftChatPanel, 'BOTTOMRIGHT', -SPACING, (SPACING + PANEL_HEIGHT))			
		RightChatDataPanel:Point('BOTTOMLEFT', RightChatPanel, 'BOTTOMLEFT')
		RightChatDataPanel:Point('TOPRIGHT', RightChatPanel, 'BOTTOMRIGHT', -SIDE_BUTTON_WIDTH, PANEL_HEIGHT)			
		LeftChatToggleButton:Point('BOTTOMLEFT', LeftChatPanel, 'BOTTOMLEFT', SPACING, SPACING)
		RightChatToggleButton:Point('BOTTOMRIGHT', RightChatPanel, 'BOTTOMRIGHT')
		LO:ToggleChatTabPanels(true)
	else
		LeftChatPanel.backdrop:Hide()
		RightChatPanel.backdrop:Show()		
		LeftChatDataPanel:Point('BOTTOMLEFT', LeftChatPanel, 'BOTTOMLEFT', SIDE_BUTTON_WIDTH, 0)
		LeftChatDataPanel:Point('TOPRIGHT', LeftChatPanel, 'BOTTOMRIGHT', 0, PANEL_HEIGHT)			
		RightChatDataPanel:Point('BOTTOMLEFT', RightChatPanel, 'BOTTOMLEFT', SPACING, SPACING)
		RightChatDataPanel:Point('TOPRIGHT', RightChatPanel, 'BOTTOMRIGHT', -(SPACING + SIDE_BUTTON_WIDTH), SPACING + PANEL_HEIGHT)		
		LeftChatToggleButton:Point('BOTTOMLEFT', LeftChatPanel, 'BOTTOMLEFT')
		RightChatToggleButton:Point('BOTTOMRIGHT', RightChatPanel, 'BOTTOMRIGHT', -SPACING, SPACING)
		LO:ToggleChatTabPanels(nil, true)
	end
end

function LO:GetLocTextColor()
	local pvpType = GetZonePVPInfo()
	if pvpType == "arena" then
		return 0.84, 0.03, 0.03
	elseif pvpType == "friendly" then
		return 0.05, 0.85, 0.03
	elseif pvpType == "contested" then
		return 0.9, 0.85, 0.05
	elseif pvpType == "hostile" then 
		return 0.84, 0.03, 0.03
	elseif pvpType == "sanctuary" then
		return 0.035, 0.58, 0.84
	elseif pvpType == "combat" then
		return 0.84, 0.03, 0.03
	else
		return 0.84, 0.03, 0.03
	end	
end

function LO:CreateActionbarInfobar()
	local db = E.db.actionbar
	local backdrop = 0
	
	local mbar = CreateFrame('Frame', 'MainABInfobar', E.UIParent)
	mbar:SetFrameLevel(2)
	mbar:SetTemplate("Default", true)
	mbar:CreateShadow("Default")
	mbar:Point("BOTTOM", E.UIParent, "BOTTOM", 0, 4)
	E:GetModule('DataTexts'):RegisterPanel(mbar, 3, 'ANCHOR_TOPLEFT', -17, 4)
	
	local num = (min(db.bar1.buttons, db.bar1.buttonsPerRow)) / 2
	
	local lbar = CreateFrame('Frame', 'ABLeftInfobar', E.UIParent)
	lbar:SetFrameLevel(2)
	lbar:SetTemplate("Default", true)
	lbar:CreateShadow("Default")
	lbar:Point('BOTTOMRIGHT', 'ElvUIParent', 'BOTTOM', -(4 + db['bar1'].buttonsize * num + db['bar1'].buttonspacing * (num + 1)), 4)
	E:GetModule('DataTexts'):RegisterPanel(lbar, 1, 'ANCHOR_TOPLEFT', -17, 4)

	local rbar = CreateFrame('Frame', 'ABRightInfobar', E.UIParent)
	rbar:SetFrameLevel(2)
	rbar:SetTemplate("Default", true)
	rbar:CreateShadow("Default")
	rbar:Point('BOTTOMLEFT', 'ElvUIParent', 'BOTTOM', 4 + db['bar4'].buttonsize * num + db['bar4'].buttonspacing * (num + 1), 4)
	E:GetModule('DataTexts'):RegisterPanel(rbar, 1, 'ANCHOR_TOPLEFT', -17, 4)
	
	self:UpdateActionbarInfobar()
end

function LO:UpdateActionbarInfobar()
	if E.db.datatexts.panels.MainABInfobar.left == '' and E.db.datatexts.panels.MainABInfobar.middle == '' and E.db.datatexts.panels.MainABInfobar.right == '' and E.db.datatexts.panels.LeftABInfobar == '' and E.db.datatexts.panels.RightABInfobar == '' then return; end

	local db = E.db.actionbar
	local backdrop = 0
	
	if db.bar1.backdrop then backdrop = 8 else backdrop = 0 end
	MainABInfobar:Size(min(db.bar1.buttons, db.bar1.buttonsPerRow) * (db.bar1.buttonsize + db.bar1.buttonspacing) - db.bar1.buttonspacing + backdrop, 23)
	if db.bar5.backdrop then backdrop = 4 else backdrop = 0 end
	ABLeftInfobar:Size(min(db.bar5.buttons, db.bar5.buttonsPerRow) * (db.bar5.buttonsize + db.bar5.buttonspacing) + backdrop, 23)
	if db.bar3.backdrop then backdrop = 4 else backdrop = 0 end
	ABRightInfobar:Size(min(db.bar3.buttons, db.bar3.buttonsPerRow) * (db.bar3.buttonsize + db.bar3.buttonspacing) + backdrop, 23)
end

function LO:CreateChatPanels()
	local SPACING = (E.PixelMode and 3 or 5)
	
	--Left Chat
	local lchat = CreateFrame('Frame', 'LeftChatPanel', E.UIParent)
	lchat:SetFrameStrata('BACKGROUND')
	lchat:Size(E.db.chat.panelWidth, E.db.chat.panelHeight)		
	lchat:Point('BOTTOMLEFT', E.UIParent, 4, 4)
	lchat:SetFrameLevel(lchat:GetFrameLevel() + 2)
	lchat:CreateBackdrop('Transparent')
	lchat.backdrop:SetAllPoints()
	E:CreateMover(lchat, 'LeftChatPanelMover', L['LeftChatPanel'], nil, nil, nil, 'ALL,CHAT', function() if E.db.chat.panelBackdrop == 'SHOWBOTH' or E.db.chat.panelBackdrop == 'LEFT' then return true; else return false; end; end)
	
	--Background Texture
	lchat.tex = lchat:CreateTexture(nil, 'OVERLAY')
	lchat.tex:SetInside()
	lchat.tex:SetTexture(E.db.chat.panelBackdropNameLeft)
	lchat.tex:SetAlpha(E.db.general.backdropfadecolor.a - 0.7 > 0 and E.db.general.backdropfadecolor.a - 0.7 or 0.5)
	
	--Left Chat Tab
	local lchattab = CreateFrame('Frame', 'LeftChatTab', LeftChatPanel)
	lchattab:Point('TOPLEFT', lchat, 'TOPLEFT', 5, E.db["euiscript"].chatbar and -(5 + PANEL_HEIGHT) or -5)
	lchattab:Point('BOTTOMRIGHT', lchat, 'TOPRIGHT', -5, E.db["euiscript"].chatbar and -(5 + PANEL_HEIGHT)*2 or -(5 + PANEL_HEIGHT))
	lchattab:SetTemplate(E.db.chat.panelTabTransparency == true and 'Transparent' or 'Default', true)
	
	--Left Chat Data Panel
	local lchatdp = CreateFrame('Frame', 'LeftChatDataPanel', LeftChatPanel)
	lchatdp:Point('BOTTOMLEFT', lchat, 'BOTTOMLEFT', SPACING + SIDE_BUTTON_WIDTH, SPACING)
	lchatdp:Point('TOPRIGHT', lchat, 'BOTTOMRIGHT', -SPACING, (SPACING + PANEL_HEIGHT))
	lchatdp:SetTemplate(E.db.datatexts.panelTransparency and 'Transparent' or 'Default', true)
	
	E:GetModule('DataTexts'):RegisterPanel(lchatdp, 3, 'ANCHOR_TOPLEFT', -17, 4)
	
	--Left Chat Toggle Button
	local lchattb = CreateFrame('Button', 'LeftChatToggleButton', E.UIParent)
	lchattb.parent = LeftChatPanel
	LeftChatPanel.fadeFunc = ChatPanelLeft_OnFade
	lchattb:Point('TOPRIGHT', lchatdp, 'TOPLEFT', -(E.PixelMode and -1 or 1), 0)
	lchattb:Point('BOTTOMLEFT', lchat, 'BOTTOMLEFT', SPACING, SPACING)
	lchattb:SetTemplate(E.db.datatexts.panelTransparency and 'Transparent' or 'Default', true)
	lchattb:RegisterForClicks('AnyUp')
	lchattb:SetScript('OnEnter', ChatButton_OnEnter)
	lchattb:SetScript('OnLeave', ChatButton_OnLeave)
	lchattb:SetScript('OnClick', ChatButton_OnClick)
	lchattb.text = lchattb:CreateFontString(nil, 'OVERLAY')
	lchattb.text:FontTemplate()
	lchattb.text:SetPoint('CENTER')
	lchattb.text:SetJustifyH('CENTER')
	lchattb.text:SetText('<')
	
	--Right Chat
	local rchat = CreateFrame('Frame', 'RightChatPanel', E.UIParent)
	rchat:SetFrameStrata('BACKGROUND')
	rchat:Size(E.db.chat.separateSizes and E.db.chat.panelWidthRight or E.db.chat.panelWidth, E.db.chat.separateSizes and E.db.chat.panelHeightRight or E.db.chat.panelHeight)
	rchat:Point('BOTTOMRIGHT', E.UIParent, -4, 4)
	rchat:SetFrameLevel(lchat:GetFrameLevel() + 2)
	rchat:CreateBackdrop('Transparent')
	rchat.backdrop:SetAllPoints()	
	E:CreateMover(rchat, 'RightChatPanelMover', L['RightChatPanel'], nil, nil, nil, 'ALL,CHAT', function() if E.db.chat.panelBackdrop == 'SHOWBOTH' or E.db.chat.panelBackdrop == 'RIGHT' then return true; else return false; end; end)
	
	--Background Texture
	rchat.tex = rchat:CreateTexture(nil, 'OVERLAY')
	rchat.tex:SetInside()
	rchat.tex:SetTexture(E.db.chat.panelBackdropNameRight)
	rchat.tex:SetAlpha(E.db.general.backdropfadecolor.a - 0.7 > 0 and E.db.general.backdropfadecolor.a - 0.7 or 0.5)	
	
	--Right Chat Tab
	local rchattab = CreateFrame('Frame', 'RightChatTab', RightChatPanel)
	rchattab:Point('TOPRIGHT', rchat, 'TOPRIGHT', -SPACING, -SPACING)
	rchattab:Point('BOTTOMLEFT', rchat, 'TOPLEFT', SPACING, -(SPACING + PANEL_HEIGHT))
	rchattab:SetTemplate(E.db.chat.panelTabTransparency == true and 'Transparent' or 'Default', true)
	
	--Right Chat Data Panel
	local rchatdp = CreateFrame('Frame', 'RightChatDataPanel', RightChatPanel)
	rchatdp:Point('BOTTOMLEFT', rchat, 'BOTTOMLEFT', SPACING, SPACING)
	rchatdp:Point('TOPRIGHT', rchat, 'BOTTOMRIGHT', -(SPACING + SIDE_BUTTON_WIDTH), SPACING + PANEL_HEIGHT)
	rchatdp:SetTemplate(E.db.datatexts.panelTransparency and 'Transparent' or 'Default', true)
	E:GetModule('DataTexts'):RegisterPanel(rchatdp, 3, 'ANCHOR_TOPRIGHT', 17, 4)
	
	--Right Chat Toggle Button
	local rchattb = CreateFrame('Button', 'RightChatToggleButton', E.UIParent)
	rchattb.parent = RightChatPanel
	RightChatPanel.fadeFunc = ChatPanelRight_OnFade
	rchattb:Point('TOPLEFT', rchatdp, 'TOPRIGHT', (E.PixelMode and -1 or 1), 0)
	rchattb:Point('BOTTOMRIGHT', rchat, 'BOTTOMRIGHT', -SPACING, SPACING)
	rchattb:SetTemplate(E.db.datatexts.panelTransparency and 'Transparent' or 'Default', true)
	rchattb:RegisterForClicks('AnyUp')
	rchattb:SetScript('OnEnter', ChatButton_OnEnter)
	rchattb:SetScript('OnLeave', ChatButton_OnLeave)
	rchattb:SetScript('OnClick', ChatButton_OnClick)
	rchattb.text = rchattb:CreateFontString(nil, 'OVERLAY')
	rchattb.text:FontTemplate()
	rchattb.text:SetPoint('CENTER')
	rchattb.text:SetJustifyH('CENTER')
	rchattb.text:SetText('>')
	
	--[[
	--Left Chat2
    local lchat2 = CreateFrame('Frame', 'LeftChatPanel2', E.UIParent)
    lchat2:SetFrameStrata('BACKGROUND')
    lchat2:Width(420) --패널 높이
    lchat2:Height(180) -- 패널 길이
    lchat2:Point('BOTTOMLEFT', E.UIParent, 404, 4) --위치
    lchat2:SetTemplate('Transparent')
 
    --Left Chat Data Panel2
    local lchatdp2 = CreateFrame('Frame', 'LeftChatDataPanel2', LeftChatPanel2)
    lchatdp2:Point('BOTTOMLEFT', lchat2, 'BOTTOMLEFT', 5 + SIDE_BUTTON_WIDTH, 5)
    lchatdp2:Point('TOPRIGHT', lchat2, 'BOTTOMRIGHT', -5, (5 + PANEL_HEIGHT))
    lchatdp2:SetTemplate('Default', true)
    E:GetModule('DataTexts'):RegisterPanel(lchatdp2, 3, 'ANCHOR_TOPLEFT', -17, 4)
	
	--Left Chat Toggle Button2
    local lchattb2 = CreateFrame('Button', 'LeftChatToggleButton2', E.UIParent)
    lchattb2.parent = LeftChatPanel2
    lchattb2:Point('TOPRIGHT', lchatdp2, 'TOPLEFT', -1, 0)
    lchattb2:Point('BOTTOMLEFT', lchat2, 'BOTTOMLEFT', 5, 5)
    lchattb2:SetTemplate('Default', true)
    lchattb2:SetScript('OnEnter', ChatButton_OnEnter)
    lchattb2:SetScript('OnLeave', ChatButton_OnLeave)
    lchattb2:SetScript('OnClick', ChatButton_OnClick)
    lchattb.text2 = lchattb2:CreateFontString(nil, 'OVERLAY')
    lchattb.text2:FontTemplate()
    lchattb.text2:SetPoint('CENTER')
    lchattb.text2:SetJustifyH('CENTER')
    lchattb.text2:SetText('<')
	--]]
	
	--[[
	--Right Chat2
    local rchat2 = CreateFrame('Frame', 'RightChatPanel2', E.UIParent)
    rchat2:SetFrameStrata('BACKGROUND')
    rchat2:Width(420) --패널높이
    rchat2:Height(180) -- 패널길이
    rchat2:Point('BOTTOMRIGHT', E.UIParent, -404, 4) --위치
    rchat2:SetTemplate('Transparent') 

    --Right Chat Data Panel2
    local rchatdp2 = CreateFrame('Frame', 'RightChatDataPanel2', RightChatPanel2)
    rchatdp2:Point('BOTTOMLEFT', rchat2, 'BOTTOMLEFT', 5, 5)
    rchatdp2:Point('TOPRIGHT', rchat2, 'BOTTOMRIGHT', -(5 + SIDE_BUTTON_WIDTH), 5 + PANEL_HEIGHT)
    rchatdp2:SetTemplate('Default', true)
    E:GetModule('DataTexts'):RegisterPanel(rchatdp2, 3, 'ANCHOR_TOPRIGHT', 17, 4)
 
    --Right Chat Toggle Button2
    local rchattb2 = CreateFrame('Button', 'RightChatToggleButton2', E.UIParent)
    rchattb2.parent = RightChatPanel2
    rchattb2:Point('TOPLEFT', rchatdp2, 'TOPRIGHT', 1, 0)
    rchattb2:Point('BOTTOMRIGHT', rchat2, 'BOTTOMRIGHT', -5, 5)
    rchattb2:SetTemplate('Default', true)
    rchattb2:SetScript('OnEnter', ChatButton_OnEnter)
    rchattb2:SetScript('OnLeave', ChatButton_OnLeave)
    rchattb2:SetScript('OnClick', ChatButton_OnClick)
    rchattb.text2 = rchattb2:CreateFontString(nil, 'OVERLAY')
    rchattb.text2:FontTemplate()
    rchattb.text2:SetPoint('CENTER')
    rchattb.text2:SetJustifyH('CENTER')
    rchattb.text2:SetText('>')
    --]]
	
	--Load Settings
	if E.db['LeftChatPanelFaded'] then
		LeftChatToggleButton:SetAlpha(0)
		LeftChatPanel:Hide()
	end	
	
	if E.db['RightChatPanelFaded'] then
		RightChatToggleButton:SetAlpha(0)
		RightChatPanel:Hide()
	end		
	
	LeftChatPanel:RegisterEvent("PLAYER_REGEN_DISABLED")
	LeftChatPanel:RegisterEvent("PLAYER_REGEN_ENABLED")
	LeftChatPanel:SetScript("OnEvent", AutoToggleBackdrop)
	
	self:ToggleChatPanels()
end

function LO:CreateMinimapPanels()
	local lminipanel = CreateFrame('Frame', 'LeftMiniPanel', Minimap)
	lminipanel:Point('TOPLEFT', Minimap, 'BOTTOMLEFT', -E.Border, (E.PixelMode and 0 or -3))
	lminipanel:Point('BOTTOMRIGHT', Minimap, 'BOTTOM', -E.Spacing, -((E.PixelMode and 0 or 3) + PANEL_HEIGHT))
	lminipanel:SetTemplate(E.db.datatexts.panelTransparency and 'Transparent' or 'Default', true)
	E:GetModule('DataTexts'):RegisterPanel(lminipanel, 1, 'ANCHOR_BOTTOMLEFT', lminipanel:GetWidth() * 2, -4)
	
	local rminipanel = CreateFrame('Frame', 'RightMiniPanel', Minimap)
	rminipanel:Point('TOPRIGHT', Minimap, 'BOTTOMRIGHT', E.Border, (E.PixelMode and 0 or -3))
	rminipanel:Point('BOTTOMLEFT', lminipanel, 'BOTTOMRIGHT', (E.PixelMode and -1 or 1), 0)
	rminipanel:SetTemplate(E.db.datatexts.panelTransparency and 'Transparent' or 'Default', true)
	E:GetModule('DataTexts'):RegisterPanel(rminipanel, 1, 'ANCHOR_BOTTOM', 0, -4)
	
	if E.db.datatexts.minimapPanels then
		LeftMiniPanel:Show()
		RightMiniPanel:Show()
	else
		LeftMiniPanel:Hide()
		RightMiniPanel:Hide()
	end
	
	local configtoggle = CreateFrame('Button', 'ElvConfigToggle', Minimap)
	if E.db.auras.consolidatedBuffs.position == "LEFT" then
		configtoggle:Point('TOPRIGHT', lminipanel, 'TOPLEFT', (E.PixelMode and 1 or -1), 0)
		configtoggle:Point('BOTTOMRIGHT', lminipanel, 'BOTTOMLEFT', (E.PixelMode and 1 or -1), 0)
	else
		configtoggle:Point('TOPLEFT', rminipanel, 'TOPRIGHT', (E.PixelMode and -1 or 1), 0)
		configtoggle:Point('BOTTOMLEFT', rminipanel, 'BOTTOMRIGHT', (E.PixelMode and -1 or 1), 0)
	end
	configtoggle:RegisterForClicks('AnyUp')
	configtoggle:Width(E.ConsolidatedBuffsWidth)
	configtoggle:SetTemplate(E.db.datatexts.panelTransparency and 'Transparent' or 'Default', true)
	configtoggle.text = configtoggle:CreateFontString(nil, 'OVERLAY')
	configtoggle.text:FontTemplate()
	configtoggle.text:SetText('C')
	configtoggle.text:SetPoint('CENTER')
	configtoggle.text:SetJustifyH('CENTER')
	configtoggle:SetScript('OnClick', function(self, btn) 
		if btn == 'LeftButton' then
			E:ToggleConfig()
		else
			E:BGStats()
		end
	end)
	configtoggle:SetScript('OnEnter', function(self)
		GameTooltip:SetOwner(self, 'ANCHOR_BOTTOMRIGHT', 0, -4)
		GameTooltip:ClearLines()
		GameTooltip:AddDoubleLine(L['Left Click:'], L['Toggle Configuration'], 1, 1, 1)
		
		if E.db.datatexts.battleground then
			GameTooltip:AddDoubleLine(L['Right Click:'], L['Show BG Texts'], 1, 1, 1)	
		end
		GameTooltip:Show()
	end)
	configtoggle:SetScript('OnLeave', function(self)
		GameTooltip:Hide()
	end)
end

E:RegisterModule(LO:GetName())
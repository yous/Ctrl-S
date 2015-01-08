local E, L = unpack(ElvUI)
local S = E:GetModule('Skins')
local M = E:NewModule('EuiAddonManager', 'AceEvent-3.0')
local LL = {}
local buttons = {}

-- Addons list
if GetLocale() == 'zhCN' then
	LL.ALOAD_RL = "重新加载UI"
	LL.ALOAD_DEP = "依赖关系: "
	LL.ALOAD_OP_DEP = "可选依赖: "
	LL.ALOAD_AUTHOR = "作者: "
	LL.ALOAD_PROFILES = "配置文件"
	LL.ALOAD_ENABLE_ALL = "全部启用"
	LL.ALOAD_DISABLE_ALL = "全部禁用"
	LL.ALOAD_PROFILE_NAME = "配置文件名称"
	LL.ALOAD_SET_TO = "发送至.."
	LL.ALOAD_ADD_TO = "添加至.."
	LL.ALOAD_REMOVE_FROM = "移除自.."
	LL.ALOAD_DELETE_PROFILE = "删除配置文件"
	LL.ALOAD_CONFIRM_DELETE = "确定删除该配置文件？请按住shift再次点击确认删除。"
	LL.ALOAD_BIND = "绑定当前天赋"
	LL.ALOAD_CANCEL_BIND = "取消绑定"
	LL.ALOAD_AUTORELOAD = "切天赋自动切换配置"
	LL.ALOAD_LOADPROFILE = "载入配置文件 %s, 请点确定来重载插件!"
elseif GetLocale() == 'koKR' then
	LL.ALOAD_RL = "UI 재 시작"
	LL.ALOAD_DEP = "Dependencies: "
	LL.ALOAD_OP_DEP = "Optional Dependencies: "
	LL.ALOAD_AUTHOR = "저자: "
	LL.ALOAD_PROFILES = "프로필"
	LL.ALOAD_ENABLE_ALL = "모두 사용"
	LL.ALOAD_DISABLE_ALL = "모두 사용 안함"
	LL.ALOAD_PROFILE_NAME = "프로필 이름"
	LL.ALOAD_SET_TO = "보내기 ..."
	LL.ALOAD_ADD_TO = "추가 ..."
	LL.ALOAD_REMOVE_FROM = "에서 제거 .."
	LL.ALOAD_DELETE_PROFILE = "프로필 삭제"
	LL.ALOAD_CONFIRM_DELETE = "Are you sure you want to delete this profile? Hold down shift and click again if you are."
	LL.ALOAD_BIND = "현재의 특성을 바인딩합니다."
	LL.ALOAD_CANCEL_BIND = "바인딩 해제"
	LL.ALOAD_AUTORELOAD = "특성과 변경 프로필 변경"
	LL.ALOAD_LOADPROFILE = "구성 파일을로드%s, 플러그인을 다시로드하려면 OK를 클릭하십시오!"
else
	LL.ALOAD_RL = "Reload UI"
	LL.ALOAD_DEP = "Dependencies: "
	LL.ALOAD_OP_DEP = "Optional Dependencies: "
	LL.ALOAD_AUTHOR = "Author: "
	LL.ALOAD_PROFILES = "Profiles"
	LL.ALOAD_ENABLE_ALL = "Enable All"
	LL.ALOAD_DISABLE_ALL = "Disable All"
	LL.ALOAD_PROFILE_NAME = "Profile Name"
	LL.ALOAD_SET_TO = "Set To.."
	LL.ALOAD_ADD_TO = "Add To.."
	LL.ALOAD_REMOVE_FROM = "Remove From.."
	LL.ALOAD_DELETE_PROFILE = "Delete Profile.."
	LL.ALOAD_CONFIRM_DELETE = "Are you sure you want to delete this profile? Hold down shift and click again if you are."
	LL.ALOAD_BIND = "Bind profile to current talent"
	LL.ALOAD_CANCEL_BIND = "Cancel bind to talent"
	LL.ALOAD_AUTORELOAD = "Change talent and change profile"
	LL.ALOAD_LOADPROFILE = "Load %s , please click ok to reloadUI!"
end

----------------------------------------------------------------------------------------
--	Enabled/disable addons without logging out(stAddonManager by Safturento)
----------------------------------------------------------------------------------------
local function CreateMainFrame()
	local AddonManager = CreateFrame("Frame", "AddonManager", UIParent)
	AddonManager:SetFrameStrata("HIGH")
	AddonManager:Hide()

	AddonManager.header = CreateFrame("Button", "AddonManagerHeader", AddonManager)
	AddonManager.header:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, 317)
	AddonManager.header:SetSize(350, 400)
	AddonManager:SetPoint("TOP", AddonManager.header, "TOP", 0, 0)
	AddonManager.header:SetMovable(true)
	AddonManager.header:SetClampedToScreen(true)
	AddonManager.header:RegisterForDrag("LeftButton", "RightButton")
	AddonManager.header:RegisterForClicks("AnyUp");
	AddonManager.header:SetScript("OnDragStart", function(self) self:StartMoving() end)
	AddonManager.header:SetScript("OnDragStop", function(self) self:StopMovingOrSizing() end)
	
	return AddonManager
end

local function GetEnabledAddons()
	local EnabledAddons = {}
	for i = 1, GetNumAddOns() do
		local name, _, _, enabled = GetAddOnInfo(i)
		if enabled then
			tinsert(EnabledAddons, name)
		end
	end
	return EnabledAddons
end

local function CreateMenuButton(parent, width, height, text, ...)
	local button = CreateFrame("Button", nil, parent, "UIPanelButtonTemplate")
	button:SetSize(width, height)
	S:HandleButton(button)
	button:SetText(text)
	if ... then button:SetPoint(...) end
	return button
end

local function CreateWindow(AddonManager)
	local window = AddonManager
	local header = window.header

	tinsert(UISpecialFrames, window:GetName())

	window:Show()
	window:SetSize(350, 400)
	window:CreateBackdrop("Transparent")
	window.backdrop:SetPoint("TOPLEFT", -2, 2)
	window.backdrop:SetPoint("BOTTOMRIGHT", 2, -19)

	header:SetSize(350, 400)

	local hTitle = AddonManager.header:CreateFontString(nil, "OVERLAY", "GameFontNormal")
	hTitle:SetPoint("TOP", 0, -3)
	hTitle:SetText(ADDONS)
	header.title = hTitle

	local close = CreateFrame("Button", window:GetName().."CloseButton", header, "UIPanelCloseButton")
	S:HandleCloseButton(close)
	close:SetFrameLevel(header:GetFrameLevel()+1)
	close:SetPoint("TOPRIGHT", header, "TOPRIGHT")
	close:SetScript("OnClick", function() window:Hide() end)
	header.close = close

	local addonListBG = CreateFrame("Frame", window:GetName().."ScrollBackground", window)
	addonListBG:SetPoint("TOPLEFT", header, "TOPLEFT", 10, -50)
	addonListBG:SetWidth(window:GetWidth() - 20)
	addonListBG:SetHeight(window:GetHeight() - 60)
	addonListBG:CreateBackdrop("Default")

	local scrollFrame = CreateFrame("ScrollFrame", window:GetName().."ScrollFrame", window, "UIPanelScrollFrameTemplate")
	scrollFrame:SetPoint("TOPLEFT", addonListBG, "TOPLEFT", 0, -2)
	scrollFrame:SetWidth(addonListBG:GetWidth() - 25)
	scrollFrame:SetHeight(addonListBG:GetHeight() - 5)
	scrollFrame:SetFrameLevel(window:GetFrameLevel() + 1)

	scrollFrame.Anchor = CreateFrame("Frame", window:GetName().."ScrollAnchor", scrollFrame)
	scrollFrame.Anchor:SetPoint("TOPLEFT", scrollFrame, "TOPLEFT", 0, -3)
	scrollFrame.Anchor:SetWidth(window:GetWidth() - 40)
	scrollFrame.Anchor:SetHeight(scrollFrame:GetHeight())
	scrollFrame.Anchor:SetFrameLevel(scrollFrame:GetFrameLevel() + 1)
	scrollFrame:SetScrollChild(scrollFrame.Anchor)
	S:HandleScrollBar(_G[window:GetName().."ScrollFrameScrollBar"])
	
	-- Load addon information
	AddonManager.AllAddons = M:UpdateAddonList()
	AddonManager.FilteredAddons = M:UpdateAddonList()
	AddonManager.showEnabled = true
	AddonManager.showDisabled = true

	AddonManager.Buttons = {}

	-- Create initial list
	for i, addon in pairs(AddonManager.AllAddons) do
		local button = CreateFrame("CheckButton", window:GetName().."CheckButton"..i, scrollFrame.Anchor, "OptionsCheckButtonTemplate")
		button:SetSize(16, 16)
	--	S:HandleCheckBox(button)
		button:SetFrameLevel(scrollFrame.Anchor:GetFrameLevel()+1)
		button:SetChecked(addon.enabled)

		if i == 1 then
			button:SetPoint("TOPLEFT", scrollFrame.Anchor, "TOPLEFT", 5, -5.5)
		else
			button:SetPoint("TOP", AddonManager.Buttons[i-1], "BOTTOM", 0, -3.5)
		end
		_G[button:GetName().."Text"]:SetText(addon.title)

		button:SetScript("OnEnter", function(self)
			GameTooltip:SetOwner(self, "ANCHOR_BOTTOMLEFT", -3, self:GetHeight())
			GameTooltip:ClearLines()
			if addon.version then
				GameTooltip:AddDoubleLine(addon.title, addon.version)
			else
				GameTooltip:AddLine(addon.title)
			end
			if addon.notes then
				GameTooltip:AddLine(addon.notes, nil, nil, nil, true)
			end
			if addon.dependencies then
				GameTooltip:AddLine(LL.ALOAD_DEP..unpack(addon.dependencies), 1, 0.2, 0, true)
			end
			if addon.optionaldependencies then
				GameTooltip:AddLine(LL.ALOAD_OP_DEP..unpack(addon.optionaldependencies), 1, 0.5, 0, true)
			end
			if addon.author then
				GameTooltip:AddLine(LL.ALOAD_AUTHOR..addon.author, 1, 0.2, 0, true)
			end
			GameTooltip:Show()
		end)
		button:SetScript("OnLeave", function(self) GameTooltip:Hide() end)
		button:SetScript("OnShow", function(self) self:SetChecked(addon.enabled) end)
		button:SetScript("OnClick", function(self)	
			if addon.enabled then
				DisableAddOn(addon.name)
				addon.enabled = false
				addon.enabled = self:GetChecked()
			else
				EnableAddOn(addon.name)
				addon.enabled = true
				addon.enabled = self:GetChecked()
			end			
		end)

		AddonManager.Buttons[i] = button
	end

	-- Search bar
	local searchBar = CreateFrame("EditBox", window:GetName().."SearchBar", window)
	searchBar:SetFrameLevel(window:GetFrameLevel() + 1)
	searchBar:SetPoint("BOTTOMLEFT", addonListBG, "TOPLEFT", 0, 5)
	searchBar:SetWidth(180)
	searchBar:SetHeight(20)
	searchBar:SetFrameLevel(header:GetFrameLevel()+1)
	searchBar:CreateBackdrop("Overlay")
	searchBar.backdrop:SetPoint("TOPLEFT", -2, 0)
	searchBar.backdrop:SetPoint("BOTTOMRIGHT", 2, 0)
	searchBar:FontTemplate(nil, 13)
	searchBar:SetText(SEARCH)
	searchBar:SetAutoFocus(false)
	searchBar:SetTextInsets(1, 0, 0, 0)
	searchBar:SetScript("OnEnterPressed", function(self) self:ClearFocus() end)
	searchBar:SetScript("OnEscapePressed", function(self) searchBar:SetText(SEARCH); M:UpdateList(AddonManager.AllAddons); searchBar:ClearFocus(); end)
	searchBar:SetScript("OnEditFocusGained", function(self) self:HighlightText() end)
	searchBar:SetScript("OnTextChanged", function(self, input)
		if input then
			AddonManager.FilteredAddons = M:UpdateAddonList(self:GetText())
			M:UpdateList(AddonManager.FilteredAddons)
		end
	end)
	AddonManager.searchBar = searchBar

	local profileButton = CreateMenuButton(window, 70, 20, LL.ALOAD_PROFILES, "BOTTOMRIGHT", addonListBG, "TOPRIGHT", 2, 5)
	profileButton:SetPoint("LEFT", searchBar, "RIGHT", 5, 0)
	profileButton:SetFrameLevel(header:GetFrameLevel()+1)
	profileButton:SetScript("OnClick", function(self)
		M:LoadProfileWindow()
	end)
	AddonManager.profileButton = profileButton

	local reloadButton = CreateMenuButton(window, 130, 20, LL.ALOAD_RL, "TOPRIGHT", addonListBG, "BOTTOMRIGHT", 0, -5)
	reloadButton:SetScript("OnClick", function(self)
		if InCombatLockdown() then return end
		ReloadUI()
	end)
	
	local autoReload =  CreateFrame("CheckButton", window:GetName().."AutoReload", addonListBG, "OptionsCheckButtonTemplate")
	_G[autoReload:GetName()..'Text']:SetText(LL.ALOAD_AUTORELOAD)
	autoReload:SetPoint("TOPLEFT", addonListBG, "BOTTOMLEFT", 0, -5)
	autoReload:SetSize(20, 20)
	S:HandleCheckBox(autoReload)
	autoReload:SetChecked(E.db.euiscript.SavedAddonTalentReload)
	autoReload:SetScript("OnClick", function(self)
		if self:GetChecked() then
			E.db.euiscript.SavedAddonTalentReload = true
		else
			E.db.euiscript.SavedAddonTalentReload = false
		end
	end)
	autoReload:SetScript("OnShow", function(self)
		self:SetChecked(E.db.euiscript.SavedAddonTalentReload)
	end)
	AddonManager.reloadButton = reloadButton

	AddonManager.Loaded = true
end

local function CreateProfileWindow(self)
	local window = CreateFrame("Frame", "AddonManagerProfileWindow", self)
	window:SetPoint("TOPLEFT", self, "TOPRIGHT", 5, 0)
	window:SetSize(175, 20)
	window:CreateBackdrop("Transparent")
	window.backdrop:SetPoint("TOPLEFT", 0, 2)
	window.backdrop:SetPoint("BOTTOMRIGHT", 0, -2)

	local title = window:CreateFontString(nil, "OVERLAY", "GameFontNormal")
	title:SetPoint("CENTER")
	title:SetText(LL.ALOAD_PROFILES)
	window.title = title

	local EnableAll = CreateMenuButton(window, (window:GetWidth() - 15) / 2, 20, LL.ALOAD_ENABLE_ALL, "TOPLEFT", window, "BOTTOMLEFT", 5, -5)
	EnableAll:SetScript("OnClick", function(self)
		for i, addon in pairs(AddonManager.AllAddons) do
			EnableAddOn(addon.name)
			if AddonManager.Buttons[i].overlay then
				AddonManager.Buttons[i].overlay:SetVertexColor(1, 0.82, 0, 0.8)
			end
			addon.enabled = true
		end
	end)
	self.EnableAll = EnableAll

	local DisableAll = CreateMenuButton(window, EnableAll:GetWidth(), EnableAll:GetHeight(), LL.ALOAD_DISABLE_ALL, "TOPRIGHT", window, "BOTTOMRIGHT", -5, -5)
	DisableAll:SetScript("OnClick", function(self)
		for i, addon in pairs(AddonManager.AllAddons) do
			if addon.name ~= "ElvUI" then
				DisableAddOn(addon.name)
				if AddonManager.Buttons[i].overlay then
					AddonManager.Buttons[i].overlay:SetVertexColor(0.1, 0.1, 0.1, 1)
				end
				addon.enabled = false
			end
		end
	end)
	self.DisableAll = DisableAll

	local SaveProfile = CreateMenuButton(window, window:GetWidth() - 10, 20, NEW_COMPACT_UNIT_FRAME_PROFILE, "TOPLEFT", EnableAll, "BOTTOMLEFT", 0, -5)
	SaveProfile:SetScript("OnClick", function(self)
		if not self.editbox then
			local editbox = CreateFrame("EditBox", nil, self)
			editbox:SetTemplate("Overlay")
			editbox:SetAllPoints(self)
			editbox:FontTemplate(nil, 13)
			editbox:SetText(LL.ALOAD_PROFILE_NAME)
			editbox:SetAutoFocus(false)
			editbox:SetFocus(true)
			editbox:HighlightText()
			editbox:SetTextInsets(3, 0, 0, 0)
			editbox:SetScript("OnEditFocusGained", function(self) self:HighlightText() end)
			editbox:SetScript("OnEscapePressed", function(self) self:SetText(LL.ALOAD_PROFILE_NAME) self:ClearFocus() self:Hide() end)
			editbox:SetScript("OnEnterPressed", function(self)
				local profileName = self:GetText()
				self:ClearFocus()
				self:SetText(LL.ALOAD_PROFILE_NAME)
				self:Hide()
				if not profileName then return end
				E.db.euiscript.SavedAddonProfiles[profileName] = GetEnabledAddons()
				M:UpdateProfileList()
			end)
			self.editbox = editbox
		else
			self.editbox:Show()
			self.editbox:SetFocus(true)
			self.editbox:HighlightText()
		end
	end)
	self.SaveProfile = SaveProfile

	self:SetScript("OnHide", function(self)
		if self.SaveProfile.editbox then self.SaveProfile.editbox:Hide() end
		window:Hide()
	end)

	self.ProfileWindow = window
	M.AddonManager.ProfileWindow = window
	
	M:UpdateProfileList()
end

function M:UpdateAddonList(query)
	local addons = {}
	for i = 1, GetNumAddOns() do
		local name, title, notes, enabled, loadable, reason, security = GetAddOnInfo(i)
		local lwrTitle, lwrName = strlower(title), strlower(name)
		if (query and (strfind(lwrTitle, strlower(query)) or strfind(lwrName, strlower(query)))) or (not query) then
			addons[i] = {}
			addons[i].name = name
			addons[i].title = title
			addons[i].notes = notes
			addons[i].enabled = enabled
			if GetAddOnMetadata(i, "version") then
				addons[i].version = GetAddOnMetadata(i, "version")
			end
			if GetAddOnDependencies(i) then
				addons[i].dependencies = {GetAddOnDependencies(i)}
			end
			if GetAddOnOptionalDependencies(i) then
				addons[i].optionaldependencies = {GetAddOnOptionalDependencies(i)}
			end
			if GetAddOnMetadata(i, "author") then
				addons[i].author = GetAddOnMetadata(i, "author")
			end
		end
	end
	return addons
end

function M:LoadProfileWindow()
	if self.AddonManager.ProfileWindow then ToggleFrame(self.AddonManager.ProfileWindow) return end
end		

function M:UpdateProfileList()
	local window = M.AddonManager.ProfileWindow
	local sort = function(t, func)
		local temp = {}
		local i = 0

		for n in pairs(t) do
			table.insert(temp, n)
		end

		table.sort(temp, func)

		local iter = function()
			i = i + 1
			if temp[i] == nil then
				return nil
			else
				return temp[i], t[temp[i]]
			end
		end

		return iter
	end

	local function CollapseAllProfiles()
		for i = 1, #buttons do
			buttons[i].overlay2:Hide()
			buttons[i]:SetHeight(20)
		end
	end

	for i = 1, #buttons do
		buttons[i]:Hide()
		CollapseAllProfiles()
	end

	local i = 1
	for profileName, addonList in sort(E.db.euiscript.SavedAddonProfiles, function(a, b) return strlower(b) > strlower(a) end) do
		if not buttons[i] then
			local button = CreateMenuButton(window, window:GetWidth() - 10, 20)

			local overlay2 = CreateFrame("Frame", nil, button)
			overlay2:SetHeight(1)
			overlay2:SetPoint("TOP", button, "TOP", 0, -18)
			overlay2:SetWidth(button:GetWidth() - 10)
			overlay2:SetFrameLevel(button:GetFrameLevel() + 1)
			overlay2:Hide()

			overlay2.set = CreateMenuButton(overlay2, overlay2:GetWidth(), 20, LL.ALOAD_SET_TO, "TOP", button, "TOP", 0, -5)
			overlay2.add = CreateMenuButton(overlay2, overlay2:GetWidth(), 20, LL.ALOAD_ADD_TO, "TOP", overlay2.set, "BOTTOM", 0, -3)
			overlay2.remove = CreateMenuButton(overlay2, overlay2:GetWidth(), 20, LL.ALOAD_REMOVE_FROM, "TOP", overlay2.add, "BOTTOM", 0, -3)
			overlay2.delete = CreateMenuButton(overlay2, overlay2:GetWidth(), 20, LL.ALOAD_DELETE_PROFILE, "TOP", overlay2.remove, "BOTTOM", 0, -3)
			overlay2.bind = CreateMenuButton(overlay2, overlay2:GetWidth(), 20, LL.ALOAD_BIND, "TOP", overlay2.delete, "BOTTOM", 0, -3)
			overlay2.cancelbind = CreateMenuButton(overlay2, overlay2:GetWidth(), 20, LL.ALOAD_CANCEL_BIND, "TOP", overlay2.bind, "BOTTOM", 0, -3)
			
			button.overlay2 = overlay2

			button:SetScript("OnClick", function(self)
				if self.overlay2:IsShown() then
					CollapseAllProfiles()
				else
					CollapseAllProfiles()
					self.overlay2:Show()
					self:SetHeight((20 * 7) + 5)
				end
			end)

			buttons[i] = button
		end

		buttons[i]:Show()
		buttons[i]:SetText(profileName)
		if E.db.euiscript.SavedAddonTalent[profileName] then
			buttons[i]:SetText(profileName.. ' - |cffff0000'.. select(2, GetSpecializationInfo(E.db.euiscript.SavedAddonTalent[profileName])).. '|r')
		end
		local overlay2 = buttons[i].overlay2
		overlay2.set:SetScript("OnClick", function(self)
			DisableAllAddOns()
			EnableAddOn("ElvUI")
			EnableAddOn("EuiScript")
			for i, name in pairs(addonList) do EnableAddOn(name) end
			AddonManager.AllAddons = M:UpdateAddonList()
			M:UpdateList(AddonManager.AllAddons)
			CollapseAllProfiles()
		end)
		overlay2.add:SetScript("OnClick", function(self)
			for i, name in pairs(addonList) do EnableAddOn(name) end
			AddonManager.AllAddons = M:UpdateAddonList()
			M:UpdateList(AddonManager.AllAddons)
			CollapseAllProfiles()
		end)
		overlay2.remove:SetScript("OnClick", function(self)
			for i, name in pairs(addonList) do if name ~= "ElvUI" then DisableAddOn(name) end end
			AddonManager.AllAddons = M:UpdateAddonList()
			M:UpdateList(AddonManager.AllAddons)
			CollapseAllProfiles()
		end)
		overlay2.delete:SetScript("OnClick", function(self)
			if IsShiftKeyDown() then
				E.db.euiscript.SavedAddonProfiles[profileName] = nil
				M:UpdateProfileList()
				CollapseAllProfiles()
			else
				E:Print("|cffff0000"..LL.ALOAD_CONFIRM_DELETE.."|r")
			end
		end)
		overlay2.bind:SetScript("OnClick", function(self)
			if not GetActiveSpecGroup() then
				E:Print(NO.. TALENT)
				CollapseAllProfiles()
				return;
			end
			E.db.euiscript.SavedAddonTalent[profileName] = GetActiveSpecGroup() or nil;
			E:Print(TALENT.. ":".. select(2, GetSpecializationInfo(GetActiveSpecGroup()))..profileName)
			self:GetParent():GetParent():SetText(profileName.. ' - |cffff0000'.. select(2, GetSpecializationInfo(GetActiveSpecGroup())).. '|r')
			CollapseAllProfiles()
		end)
		overlay2.cancelbind:SetScript("OnClick", function(self)
			if not GetActiveSpecGroup() then
				E:Print(NO.. TALENT)
				CollapseAllProfiles()
				return;
			end
			E.db.euiscript.SavedAddonTalent[profileName] = nil;
			self:GetParent():GetParent():SetText(profileName)
			E:Print(CANCEL..TALENT.. ":".. select(2, GetSpecializationInfo(GetActiveSpecGroup()))..profileName)
			CollapseAllProfiles()
		end)
		i = i + 1
	end

	local prevButton
	for i, button in pairs(buttons) do
		if i == 1 then
			button:SetPoint("TOP", M.AddonManager.SaveProfile, "BOTTOM", 0, -5)
		else
			button:SetPoint("TOP", prevButton, "BOTTOM", 0, -5)
		end
		prevButton = button
	end

	if not prevButton then prevButton = M.AddonManager.SaveProfile end
	window.backdrop:ClearAllPoints()
	window.backdrop:SetPoint("TOPLEFT", window, "TOPLEFT", 0, 2)
	window.backdrop:SetPoint("TOPRIGHT", window, "TOPRIGHT", 0, 2)
	window.backdrop:SetPoint("BOTTOM", prevButton, "BOTTOM", 0, -5)
end

function M:UpdateList(AddonsTable)
	-- Start off by hiding all of the buttons
	for _, b in pairs(AddonManager.Buttons) do b:Hide() end
	local i = 1
	for _, addon in pairs(AddonsTable) do
		local button = AddonManager.Buttons[i]
		button:Show()
		button:SetChecked(addon.enabled)
		button:SetScript("OnShow", function(self) self:SetChecked(addon.enabled) end)
		button:SetScript("OnClick", function(self)
			if addon.enabled then
				DisableAddOn(addon.name)
				addon.enabled = false
				addon.enabled = self:GetChecked()
			else
				EnableAddOn(addon.name)
				addon.enabled = true
				addon.enabled = self:GetChecked()
			end
		end)

		_G[button:GetName().."Text"]:SetText(addon.title)
		i = i + 1
	end
end

function M:LoadWindow()
	if self.AddonManager.Loaded then self.AddonManager:Show() return end
end

function M:ACTIVE_TALENT_GROUP_CHANGED()
	if not GetActiveSpecGroup() then return; end
	if not E.db.euiscript.SavedAddonTalentReload then return; end
	for profileName, addonList in pairs(E.db.euiscript.SavedAddonProfiles) do
		if E.db.euiscript.SavedAddonTalent[profileName] == GetActiveSpecGroup() then
			DisableAllAddOns()
			EnableAddOn("ElvUI")
			EnableAddOn("EuiScript")
			E:Print(format("Load %s , please click ok to reloadUI!", profileName))
			for i, name in pairs(addonList) do EnableAddOn(name) end
			M.AddonManager.AllAddons = M:UpdateAddonList()
			M:UpdateList(M.AddonManager.AllAddons)
			E:StaticPopup_Show('CONFIG_RL')
		end
	end
end	
	
function M:Initialize()
	M:RegisterEvent("ACTIVE_TALENT_GROUP_CHANGED")
	
	M.AddonManager = CreateMainFrame()
	
	CreateWindow(M.AddonManager)
	CreateProfileWindow(M.AddonManager)
	
	-- Game menu buttons
	local gmbAddOns = CreateFrame("Button", "GameMenuButtonAddonManager", GameMenuFrame, "GameMenuButtonTemplate")
	gmbAddOns:SetText(E.ValColor..L['Addons Manager']..'|r')
--	S:HandleButton(gmbAddOns)
	gmbAddOns:SetSize(GameMenuButtonMacros:GetWidth(), GameMenuButtonMacros:GetHeight())
	gmbAddOns:SetPoint("TOP", GameMenuButtonEUI, "BOTTOM", 0, -2)
	
	gmbAddOns:SetScript("OnClick", function()
		PlaySound("igMainMenuOption")
		HideUIPanel(GameMenuFrame)
		M:LoadWindow()
	end)
	if E.private.skins.blizzard.enable ~= true or E.private.skins.blizzard.misc ~= true then return end
	E:GetModule('Skins'):HandleButton(gmbAddOns);	
end

E:RegisterModule(M:GetName())
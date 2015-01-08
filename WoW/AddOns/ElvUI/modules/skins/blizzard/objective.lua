local E, L, V, P, G, _ = unpack(select(2, ...)); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB, Localize Underscore
local S = E:GetModule('Skins')

local function LoadSkin()
	if E.private.skins.blizzard.enable ~= true or E.private.skins.blizzard.objective ~= true then return end
	E.Skins:HandleCloseButton(ObjectiveTrackerFrame.HeaderMenu.MinimizeButton, false, '+')

	hooksecurefunc("ObjectiveTracker_Collapse", function()
		ObjectiveTrackerFrame.HeaderMenu.MinimizeButton.text:SetText("+")
	end)

	hooksecurefunc("ObjectiveTracker_Expand", function()
		ObjectiveTrackerFrame.HeaderMenu.MinimizeButton.text:SetText("-")
	end)
	
	for _, headerName in pairs({"QuestHeader", "AchievementHeader", "ScenarioHeader"}) do
		local header = ObjectiveTrackerFrame.BlocksFrame[headerName].Background:Hide()
	end	
end

S:RegisterSkin('ElvUI', LoadSkin)
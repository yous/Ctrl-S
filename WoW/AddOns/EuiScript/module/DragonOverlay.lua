local E = unpack(ElvUI)

local function SetDragonOverlay(Name, Texture)
	if Texture then
		DragonOverlay:SetSize(128, 64)
		DragonOverlay.Texture:SetTexture("Interface\\AddOns\\EuiScript\\textures\\"..Texture)
	end
	if not DragonOverlay:GetPoint() then
		DragonOverlay:SetPoint("CENTER", ElvUF_Target, "TOP", 0, 5)
	end
	if not DragonOverlay:IsShown() then DragonOverlay:Show() end
end

local DragonOverlay = CreateFrame("Frame", "DragonOverlay", UIParent)
DragonOverlay:SetFrameLevel(7)
DragonOverlay.Texture = DragonOverlay:CreateTexture(nil, "ARTWORK")
DragonOverlay.Texture:SetInside(DragonOverlay)
DragonOverlay:RegisterEvent("PLAYER_ENTER_WORLD")
DragonOverlay:RegisterEvent("PLAYER_TARGET_CHANGED")
DragonOverlay:SetScript("OnEvent", function(self, event)
	self:Hide()
	if not E.db.unitframe.units.target.DragonOverlay then return; end
	if event == "PLAYER_ENTER_WORLD" then
		if IsAddOnLoaded('DragonOverlay') then
			DisableAddOn('DragonOverlay');
			return;
		end
		DragonOverlay:SetPoint("CENTER", ElvUF_Target, "TOP", 0, 5)
	else
		local TargetClass = UnitIsPlayer("target") and select(2, UnitClass("target")) or UnitClassification("target")
		if TargetClass == "worldboss" then
			SetDragonOverlay(nil, "Chromatic.tga")
		elseif TargetClass == "elite" then
			SetDragonOverlay(nil, "HeavenlyGolden.tga")
		elseif TargetClass == "rare" then
			SetDragonOverlay(nil, "Onyx.tga")
		elseif TargetClass == "rareelite" then
			SetDragonOverlay(nil, "HeavenlyOnyx.tga")
		end
	end
end)
local E, L, V, P, G, _ = unpack(select(2, ...)); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB, Localize Underscore
local AB = E:GetModule('ActionBars');

local function FixExtraActionCD(cd)
	local start, duration = GetActionCooldown(cd:GetParent().action)
	E.OnSetCooldown(cd, start, duration, 0, 0)
end

function AB:SetupExtraButton()
	ExtraActionBarFrame:SetScale(E.db.actionbar.extraButtonScale);
	DraenorZoneAbilityFrame:SetScale(E.db.actionbar.extraButtonScale);
	
	local holder = CreateFrame("Frame", nil, UIParent, "SecureHandlerStateTemplate")
	holder:Point('TOP', E.UIParent, 'TOP', 0, -250)
	holder:Size(ExtraActionBarFrame:GetSize())
	
	RegisterStateDriver(holder, "visibility", "[petbattle][overridebar][vehicleui] hide; show")
	
	ExtraActionBarFrame:SetParent(holder)
	ExtraActionBarFrame:ClearAllPoints()
	ExtraActionBarFrame:SetPoint('CENTER', holder, 'CENTER')
	DraenorZoneAbilityFrame:SetParent(holder)
	DraenorZoneAbilityFrame:ClearAllPoints()
	DraenorZoneAbilityFrame:SetPoint('CENTER', holder, 'CENTER')

	DraenorZoneAbilityFrame.ignoreFramePositionManager = true		
	ExtraActionBarFrame.ignoreFramePositionManager  = true
	
	for i=1, ExtraActionBarFrame:GetNumChildren() do
		local button = _G["ExtraActionButton"..i]
		if button then
			button.noResize = true;
			button.pushed = true
			button.checked = true
			
			self:StyleButton(button, true)
			button:SetTemplate()
			_G["ExtraActionButton"..i..'Icon']:SetDrawLayer('ARTWORK')
			local tex = button:CreateTexture(nil, 'OVERLAY')
			tex:SetTexture(0.9, 0.8, 0.1, 0.3)
			tex:SetInside()
			button:SetCheckedTexture(tex)

			if(button.cooldown and E.private.cooldown.enable) then
				E:RegisterCooldown(button.cooldown)
				button.cooldown:HookScript("OnShow", FixExtraActionCD)
			end
		end
	end

	local button = DraenorZoneAbilityFrame.SpellButton
	if button then
		button:SetNormalTexture('')
		button:StyleButton(nil, nil, nil, true)
		button:SetTemplate()
		button.Icon:SetDrawLayer('ARTWORK')
		button.Icon:SetTexCoord(unpack(E.TexCoords))
		button.Icon:SetInside()
		
		if(button.Cooldown and E.private.cooldown.enable) then
			E:RegisterCooldown(button.Cooldown)
		end
	end	
	
	if HasExtraActionBar() then
		ExtraActionBarFrame:Show();
	end
	
	E:CreateMover(holder, 'BossButton', L['Boss Button'], nil, nil, nil, 'ALL,ACTIONBARS', function() return E.private.actionbar.enable; end);
end
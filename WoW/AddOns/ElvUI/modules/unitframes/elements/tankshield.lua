local E, L, V, P, G, _ = unpack(select(2, ...)); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB, Localize Underscore
local UF = E:GetModule('UnitFrames');

function UF:Construct_TankShield(frame)
	local bs = CreateFrame("Button", nil, frame, "SecureActionButtonTemplate")
	bs:RegisterForClicks('AnyUp')
	bs:SetTemplate("Default")
	bs:StyleButton()
	bs:SetFrameStrata('LOW')
	bs:SetFrameLevel(frame:GetFrameLevel() + 2)
	bs:SetAlpha(0)
	
	bs.Icon = bs:CreateTexture(nil, 'ARTWORK')
	bs.Icon:Point("TOPLEFT", 2, -2)
	bs.Icon:Point("BOTTOMRIGHT", -2, 2)
	bs.Icon:SetTexCoord(.08, .92, .08, .92)

	bs.time = bs:CreateFontString(nil, 'OVERLAY')
	bs.time:FontTemplate(UF.LSM:Fetch("font", E.db.unitframe.font), E.db.unitframe.units.player.height * 0.6, 'OUTLINE')
	bs.time:SetPoint("CENTER")
	bs.time:SetTextColor(1,1,0)

	bs.text = bs:CreateFontString(nil, 'OVERLAY')
	bs.text:FontTemplate(UF.LSM:Fetch("font", E.db.unitframe.font), E.db.unitframe.fontSize + 2, 'OUTLINE')
	bs.text:Point("BOTTOMRIGHT", bs, "BOTTOMRIGHT", 0, 0)
	
	bs.sb = CreateFrame("StatusBar", nil, bs)
	bs.sb:SetOrientation("VERTICAL")
	bs.sb:SetStatusBarTexture(E["media"].normTex)
	bs.sb:SetStatusBarColor(0.8, 0.1, 0.1)
	bs.sb:CreateBackdrop('Default')	
	bs.sb:SetAlpha(0)
	
	return bs
end
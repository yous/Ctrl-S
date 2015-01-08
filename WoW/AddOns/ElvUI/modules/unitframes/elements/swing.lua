local E, L, V, P, G, _ = unpack(select(2, ...)); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB, Localize Underscore
local UF = E:GetModule('UnitFrames');

function UF:ConstructSwingBar(frame)
	local sbar = CreateFrame("Statusbar", frame:GetName()..'SwingBar', frame)
	UF['statusbars'][sbar] = true
	sbar:SetClampedToScreen(true)
	sbar:CreateBackdrop('Default')
	sbar.bg = sbar:CreateTexture(nil, 'BORDER')
	sbar.bg:Hide()
	
	sbar.Text = sbar:CreateFontString(nil, 'OVERLAY')
	UF:Configure_FontString(sbar.Text)
	sbar.Text:SetTextColor(0.84, 0.75, 0.65)
	
	local holder = CreateFrame('Frame', nil, sbar)
	holder:Point("TOPRIGHT", frame, "BOTTOMRIGHT", 0, -(E.Border * 3))
	sbar:Point('BOTTOMRIGHT', holder, 'BOTTOMRIGHT', -E.Border, E.Border)
	
	sbar.Holder = holder
	
	E:CreateMover(sbar.Holder, frame:GetName()..'SwingBarMover', L['Swing'], nil, -6, nil, 'ALL,SOLO', function() return E.db["unitframe"].units.player.Swing.enable end)
	
	return sbar
end

function UF:ConstructGCDBar(frame)
	local bar = CreateFrame("Frame", nil, frame)
	bar:SetFrameStrata("HIGH")
	bar.Color = {1,1,1}
	bar:SetWidth(frame:GetWidth()-E.Border)
	bar:SetHeight(4)
	
	bar.Color = {1,1,1}
	bar.Height = 3
	bar.Width = 4
	
	return bar
end
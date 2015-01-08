local E, L, V, P, G, _ = unpack(select(2, ...)); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB, Localize Underscore
local UF = E:GetModule('UnitFrames');

local _, ns = ...
local ElvUF = ns.oUF
assert(ElvUF, "ElvUI was unable to locate oUF.")

function UF:Construct_PowerBar(frame, bg, text, textPos, orientation)
	local power
	if E.db.unitframe.transparent and E.db.unitframe.powertrans and E.db.general.transparentStyle == 2 then
		power = E:TranseBar(frame, orientation)
	else
		power = CreateFrame('StatusBar', nil, frame)
	end
	UF['statusbars'][power] = true

	power:SetFrameStrata("LOW")
	power.PostUpdate = self.PostUpdatePower
	
	if bg then
		if E.db.unitframe.transparent and E.db.unitframe.powertrans and E.db.general.transparentStyle == 2 then
			local pbg = CreateFrame("Frame", nil, power)
			pbg:SetFrameLevel(power:GetFrameLevel()-2)
			pbg:SetAllPoints(power)
			pbg:SetAlpha(0)
			local b = pbg:CreateTexture(nil, "BACKGROUND")
			b:SetTexture(E["media"].normTex)
			b:SetAllPoints(power)
			power.bg = b
			power.pbg = pbg
		else
			power.bg = power:CreateTexture(nil, 'BORDER')
			power.bg:SetAllPoints()
			power.bg:SetTexture(E["media"].blankTex)
			if E.db.unitframe.transparent then
				power.bg:SetAlpha(E.db.general.backdropfadecolor.a or 0.4)				
			end
		end
		power.bg.multiplier = 0.2
	end
	
	if text then
		power.value = frame.RaisedElementParent:CreateFontString(nil, 'OVERLAY')	
		UF:Configure_FontString(power.value)
		power.value:SetParent(frame)
		
		local x = -2
		if textPos == 'LEFT' then
			x = 2
		end
		
		power.value:Point(textPos, frame.Health, textPos, x, 0)
	end
		
	power.colorDisconnected = false
	power.colorTapping = false
	power:CreateBackdrop('Default')

	return power
end	

local tokens = { [0] = "MANA", "RAGE", "FOCUS", "ENERGY", "RUNIC_POWER" }
function UF:PostUpdatePower(unit, min, max)
	local pType, _, altR, altG, altB = UnitPowerType(unit)
	local parent = self:GetParent()
	
	if parent.isForced then
		min = random(1, max)
		pType = random(0, 4)
		self:SetValue(min)
		local color = ElvUF['colors'].power[tokens[pType]]
		
		if not self.colorClass then
			self:SetStatusBarColor(color[1], color[2], color[3])
			local mu = self.bg.multiplier or 1
			self.bg:SetVertexColor(color[1] * mu, color[2] * mu, color[3] * mu)
		end
	end	
	
	local db = parent.db	
	if db and db.power and db.power.hideonnpc then
		UF:PostNamePosition(parent, unit)
	end	
end


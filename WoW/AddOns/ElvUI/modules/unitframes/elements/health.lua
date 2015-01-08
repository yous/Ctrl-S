local E, L, V, P, G, _ = unpack(select(2, ...)); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB, Localize Underscore
local UF = E:GetModule('UnitFrames');

local _, ns = ...
local ElvUF = ns.oUF
assert(ElvUF, "ElvUI was unable to locate oUF.")

function UF:Construct_HealthBar(frame, bg, text, textPos, orientation)
	local health
	if E.db.unitframe.transparent and E.db.general.transparentStyle == 2 then
		health = E:TranseBar(frame, orientation)
	else
		health = CreateFrame('StatusBar', nil, frame)
	end
	
	UF['statusbars'][health] = true
	
	health:SetFrameStrata("LOW")
	health.PostUpdate = self.PostUpdateHealth

	if bg then
		if E.db.unitframe.transparent and E.db.general.transparentStyle == 2 then
			local hbg = CreateFrame("Frame", nil, health)
			hbg:SetFrameLevel(health:GetFrameLevel()-2)
			hbg:SetAllPoints(health)
			hbg:SetAlpha(0)
			local b = hbg:CreateTexture(nil, "BACKGROUND")
			b:SetTexture(E["media"].normTex)
			b:SetAllPoints(health)
			health.bg = b
			health.hbg = hbg
		else
			health.bg = health:CreateTexture(nil, 'BORDER')
			health.bg:SetAllPoints()
			health.bg:SetTexture(E["media"].blankTex)
			if E.db.unitframe.transparent then
				health.bg:SetAlpha(E.db.general.backdropfadecolor.a or 0.4)
			end
		end
		health.bg.multiplier = 0.25
	end
	
	if text then
		health.value = frame.RaisedElementParent:CreateFontString(nil, 'OVERLAY')
		UF:Configure_FontString(health.value)
		health.value:SetParent(frame)
		
		local x = -2
		if textPos == 'LEFT' then
			x = 2
		end
		
		health.value:Point(textPos, health, textPos, x, 0)		
	end
	
	health.colorTapping = true	
	health.colorDisconnected = true
	health:CreateBackdrop('Default')	

	return health
end

function UF:PostUpdateHealth(unit, min, max)
	local parent = self:GetParent()
	if parent.isForced then
		min = random(1, max)
		self:SetValue(min)
	end

	if parent.ResurrectIcon then
		parent.ResurrectIcon:SetAlpha(min == 0 and 1 or 0)
	end
	
	local r, g, b = self:GetStatusBarColor()
	local colors = E.db['unitframe']['colors'];
	if (colors.healthclass == true and colors.colorhealthbyvalue == true) or (colors.colorhealthbyvalue and parent.isForced) and not (UnitIsTapped(unit) and not UnitIsTappedByPlayer(unit)) then
		local newr, newg, newb = ElvUF.ColorGradient(min, max, 1, 0, 0, 1, 1, 0, r, g, b)

		self:SetStatusBarColor(newr, newg, newb)
		if self.bg and self.bg.multiplier then
			local mu = self.bg.multiplier
			self.bg:SetVertexColor(newr * mu, newg * mu, newb * mu)
		end
	end

	if colors.classbackdrop then
		local reaction = UnitReaction(unit, 'player')
		local t
		if UnitIsPlayer(unit) then
			local _, class = UnitClass(unit)
			t = parent.colors.class[class]
		elseif reaction then
			t = parent.colors.reaction[reaction]
		end

		if t then
			self.bg:SetVertexColor(t[1], t[2], t[3])
		end
	end
	
	--Backdrop
	if colors.customhealthbackdrop then
		local backdrop = colors.health_backdrop
		self.bg:SetVertexColor(backdrop.r, backdrop.g, backdrop.b)		
	end	
end


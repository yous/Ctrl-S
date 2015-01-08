--[[
	Project.: oUF_TankShield
	File....: oUF_TankShield.lua
	Version.: 50001.2
	Rev Date: 04/11/2012
	Authors.: Eui.cc
]]

local _, ns = ...
local oUF = oUF or ns.oUF

local _, class = UnitClass("player")
local BS_Name, BS_Icon
local BS_Value = false

if class == "DRUID" then
	BS_Name = GetSpellInfo(62606)
elseif class == "DEATHKNIGHT" then
	BS_Name = GetSpellInfo(77535)
	BS_Value = true
elseif class == "PRIEST" then
	BS_Name = GetSpellInfo(17)
elseif class == "PALADIN" then
	BS_Name = GetSpellInfo(132403)
elseif class == 'WARRIOR' then
	BS_Name, _, BS_Icon = GetSpellInfo(132404)
	BS_Spell = GetSpellInfo(112048)
	BS_Shield = GetSpellInfo(871)
elseif class == 'MONK' then
	BS_Name, _, BS_Icon = GetSpellInfo(115307)
	BS_Value = GetSpellInfo(124275)
	BS_Value2 = GetSpellInfo(124274)
	BS_Value3 = GetSpellInfo(124273)
	BS_Spell = GetSpellInfo(119582)
	BS_Shield = GetSpellInfo(115295)
	BS_Spell2 = GetSpellInfo(115203)
	BS_Spell3 = 115308
end

local UnitAura = UnitAura
local InCombatLockdown = InCombatLockdown
local format = string.format
local gsub = string.gsub
local floor = math.floor

local function ShortValue(v)
	if ElvUI then
		return ElvUI[1]:ShortValue(v)
	end
	if v >= 1e6 then
		return ("%.0fm"):format(v / 1e6):gsub("%.?0+([km])$", "%1")
	elseif v >= 1e3 or v <= -1e3 then
		return ("%.0fk"):format(v / 1e3):gsub("%.?0+([km])$", "%1")
	else
		return v
	end
end

local function OnUpdate(self, elapsed)
	local time = GetTime();

	if (time > self.expires) then
		self:SetAlpha(0)
		self.sb:SetAlpha(0)
		self.text:SetText('')
		self.time:SetText('')
		self.expires = 0
		self:SetScript("OnUpdate", nil)
	else
		local remaining = self.expires - time
		self.time:SetText(tostring(floor(remaining)))
	end
end

local function warvalueChanged(self, event, unit)
	if unit ~= 'player' or not BS_Name then return end
	local bar = self.TankShield

	if bar.PreUpdate then
		return bar:PreUpdate(name)
	end
	
	if UnitBuff('player', BS_Name) then
		local _, _, icon, _, _, _, expires, _, _, _, _, _, _, _, value = UnitBuff('player', BS_Name)
		if icon then
			bar:SetAlpha(1)
			bar.Icon:SetDesaturated(false)
			bar.expires = expires
			if (expires > 0) then
				OnUpdate(bar, 0)
				bar:SetScript("OnUpdate", OnUpdate)
			end
		end
	else
		bar.Icon:SetDesaturated(true)
		bar.time:SetText('')
		bar.expires = 0
		bar:SetScript("OnUpdate", nil)
	end

	if UnitBuff('player', BS_Spell) then
		local _, _, icon, _, _, etime, eexpires, _, _, _, _, _, _, _, evalue = UnitBuff('player', BS_Spell)	
		if evalue then
			bar.text:SetText(ShortValue(evalue))
			bar.sb:SetMinMaxValues(0, etime)
			bar.sb:SetValue(floor(eexpires - GetTime()))
			bar.sb:SetAlpha(1)
			bar:SetAlpha(1)
		end
	else
		bar.sb:SetAlpha(0);
		bar.text:SetText('');
		bar.sb:SetMinMaxValues(0, 0)
		bar.sb:SetValue(0)
	end
	
	if UnitBuff('player', BS_Shield) then
		bar:SetBackdropBorderColor(1, 1, 0)
	else
		bar:SetBackdropBorderColor(.31, .31, .31)
	end		
	
	if not UnitBuff('player', BS_Name) and not UnitBuff('player', BS_Spell) then
		bar:SetAlpha(0);
		bar.sb:SetAlpha(0);
	end
	
	if bar.PostUpdate then
		return bar:PostUpdate(name)
	end	
end

local function doubleValueChanged(self, event, unit)
	if unit ~= "player" or not BS_Name then return end
	local bar = self.TankShield

	if bar.PreUpdate then
		return bar:PreUpdate(name)
	end
	
	if UnitBuff('player', BS_Name) then
		local _, _, icon, _, _, _, expires, _, _, _, _, _, _, _, value = UnitBuff('player', BS_Name)
		if icon then
			bar:SetAlpha(1)
			bar.Icon:SetDesaturated(false)
			bar.expires = expires
			if (expires > 0) then
				OnUpdate(bar, 0)
				bar:SetScript("OnUpdate", OnUpdate)
			end
		end
	else
		bar.Icon:SetDesaturated(true)
		bar.time:SetText('')
		bar.expires = 0
		bar:SetScript("OnUpdate", nil)
	end

	local bs_value
	if UnitDebuff('player', BS_Value) then
		bs_value = BS_Value
	elseif UnitDebuff('player', BS_Value2) then
		bs_value = BS_Value2
	elseif UnitDebuff('player', BS_Value3) then
		bs_value = BS_Value3
	end
	local curStagger = UnitStagger("player") or 0;
	if curStagger and bs_value and curStagger > 0 then
		local evalue = select(15, UnitDebuff('player', bs_value))
		bar.text:SetText(ShortValue(evalue) or '')
		local maxhealth = UnitHealthMax("player");
		bar.sb:SetMinMaxValues(0, maxhealth);
		bar.sb:SetValue(curStagger)
		bar.sb:SetAlpha(1)
		bar:SetAlpha(1)
	else
		bar.sb:SetAlpha(0);
		bar.text:SetText('');
		bar.sb:SetMinMaxValues(0, 0)
		bar.sb:SetValue(0)
	end
	
	if UnitBuff('player', BS_Shield) then
		bar:SetBackdropBorderColor(1, 1, 0)
	else
		bar:SetBackdropBorderColor(.31, .31, .31)
	end		
	
	if UnitBuff('player', GetSpellInfo(115308)) then
		local BS_Id = select(11, UnitBuff('player', GetSpellInfo(115308)))
		if BS_Id == 115308 then
			bar.Icon:SetVertexColor(1, .8, 0, .6)
		else
			bar.Icon:SetVertexColor(1, 1, 1, 1)				
		end
	else
		bar.Icon:SetVertexColor(1, 1, 1, 1)		
	end
	
	if not UnitBuff('player', BS_Name) and curStagger == 0 then
		bar:SetAlpha(0);
		bar.sb:SetAlpha(0);
	end
	
	if bar.PostUpdate then
		return bar:PostUpdate(name)
	end	
end
	
local function valueChanged(self, event, unit)
	if unit ~= "player" or not BS_Name then return end
	local bar = self.TankShield
	
	if bar.PreUpdate then
		return bar:PreUpdate(name)
	end	
	
	if UnitBuff('player', BS_Name) then
		local _, _, icon, _, _, _, expires, _, _, _, _, _, _, _, value = UnitBuff('player', BS_Name)
		if value and class == 'DEATHKNIGHT' then
			if not bar.sb.max then bar.sb.max = UnitHealthMax("player") end
			if value > bar.sb.max then value = bar.sb.max end
			bar.sb:SetMinMaxValues(0, bar.sb.max)
			bar.sb:SetValue(value)
			bar.text:SetText(ShortValue(value))
			bar.sb:SetAlpha(1)
		end
		if icon then
			bar:SetAlpha(1)
			bar.Icon:SetTexture(icon)
			bar.expires = expires
			if (expires > 0) then
				OnUpdate(bar, 0)
				bar:SetScript("OnUpdate", OnUpdate)
			end
		end
	else
		bar:SetAlpha(0)
		bar.sb:SetAlpha(0)
		bar.text:SetText('')
		bar.time:SetText('')
		bar.expires = 0
		bar:SetScript("OnUpdate", nil)
	end
	
	if bar.PostUpdate then
		return bar:PostUpdate(name)
	end
end

local function maxChanged(self, event, unit)
	if unit ~= "player" or not BS_Name then return end
	local bar = self.TankShield
	
	local health = UnitHealthMax("player")
	
	if not health then return end
	
	if class == 'MONK' then
		bar.sb.max = 10
		bar.sb:SetMinMaxValues(0, bar.sb.max)
	else
		bar.sb.max = health
		bar.sb:SetMinMaxValues(0, bar.sb.max)
	end
	
	valueChanged(self, event, unit)
end

local function Enable(self, unit)
	local f = self.TankShield
	
	if f and not BS_Name then
		f:SetAlpha(0)
		f.sb:SetAlpha(0)
		return
	end
	
	if f and unit == "player" and BS_Name then
		if class == 'MONK' then
			self:RegisterEvent("UNIT_AURA", doubleValueChanged)
			f:SetAttribute("type1", "spell")
			f:SetAttribute("spell1", BS_Spell)
			f:SetAttribute("type2", "spell")
			f:SetAttribute("spell2", BS_Shield)
			f:SetAttribute("type3", "spell")
			f:SetAttribute("spell3", BS_Spell2)
			f.Icon:SetTexture(BS_Icon)
		elseif class == 'WARRIOR' then
			self:RegisterEvent("UNIT_AURA", warvalueChanged)
			f.Icon:SetTexture(BS_Icon)
		else
			self:RegisterEvent("UNIT_AURA", valueChanged)
		end
		
		if BS_Value then
			self:RegisterEvent("UNIT_MAXHEALTH", maxChanged)
			self:RegisterEvent("UNIT_LEVEL", maxChanged)
		end
		
		f:SetAlpha(0)
		f.sb:SetAlpha(0)
		
		return true
	end
end

local function Disable(self)
	local f = self.TankShield
	
	if f and BS_Name then
		if class == 'MONK' then
			self:UnregisterEvent("UNIT_AURA", doubleValueChanged)
		else
			self:UnregisterEvent("UNIT_AURA", valueChanged)
		end
		if BS_Value then
			self:UnregisterEvent("UNIT_MAXHEALTH", maxChanged)
			self:UnregisterEvent("UNIT_LEVEL", maxChanged)
		end
		f:SetAlpha(0)
		f.sb:SetAlpha(0)
	end
end

oUF:AddElement("TankShield", nil, Enable, Disable)
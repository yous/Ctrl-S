if(select(2, UnitClass('player')) ~= 'SHAMAN') then return end
-- eui.cc modify at 2014.12.21
local _,ns = ...
local cfg = ns.cfg
local oUF = ns.oUF or oUF
assert(oUF, "oUF_Drk was unable to locate oUF install.")

local MAX_MAELSTROM_STACK = 5

local function GetMaelstromStack()
	aura = GetSpellInfo(53817)
	local name, rank, icon, count, debuffType, duration, expirationTime, caster = UnitAura('player', aura, nil, 'HELPFUL')
	return (count or 0)
end

local function Update(self, event, unit)
	if unit ~= 'player' then return end

	local element = self.Maelstrom

	if(element.PreUpdate) then
		element.PreUpdate()
	end

	local stack = GetMaelstromStack();

	for index = 1, MAX_MAELSTROM_STACK do
		if(index <= stack) then
			element[index]:Show()
		else
			element[index]:Hide()
		end
	end
		
	if(element.PostUpdate) then
		return element:PostUpdate(event, stack, MAX_MAELSTROM_STACK)
	end

end

function Path(self, ...)
	return (self.Maelstrom.Override or Update) (self, ...)
end

function ForceUpdate(element)
	return Path(element.__owner, "ForceUpdate", element.__owner.unit)
end

local Visibility = function(self, event, unit)
	local element = self.Maelstrom
	if(GetSpecialization() == 2) then
		element:Show()
	else
		element:Hide()
	end
end

local Enable = function(self, unit)
	local element = self.Maelstrom
	if(element and unit == 'player') then
		element.__owner = self
		element.ForceUpdate = ForceUpdate

		self:RegisterEvent('UNIT_AURA', Path)
		self:RegisterEvent('PLAYER_TALENT_UPDATE', Visibility, true)

       	for index = 1, MAX_MAELSTROM_STACK do
			local point = element[index]
			if(point:IsObjectType'Texture' and not point:GetTexture()) then
				point:SetTexture[[Interface\ComboFrame\ComboPoint]]
				point:SetTexCoord(0, 0.375, 0, 1)
			end
		end

		return true
	end
end

local Disable = function(self)
	local element = self.Maelstrom
	if(element) then
		self:UnregisterEvent('UNIT_AURA', Path)
		self:UnregisterEvent('PLAYER_TALENT_UPDATE', Visibility)
	end
end

oUF:AddElement('Maelstrom', Path, Enable, Disable)
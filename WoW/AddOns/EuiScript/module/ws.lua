local E, L, V, P, G, _ = unpack(ElvUI); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB, Localize Underscore
local WS = E:NewModule("WS", 'AceEvent-3.0');
local LSM = LibStub("LibSharedMedia-3.0")

local buffName, _, buffIcon = GetSpellInfo(115151)
local buffSpell = GetSpellInfo(116680)
local class = select(2, UnitClass("player"));

local function Update(self)
	if not IsInRaid() then return; end
	
	local inInstance, instanceType = IsInInstance()
	local _, _, _, _, maxPlayers, _, _ = GetInstanceInfo()
	local raidNum = GetNumGroupMembers()
	if inInstance and instanceType == "raid" then raidNum = maxPlayers end	
	local num = 0;
	local Expires;
	for i = 1, raidNum do
		local name, _, subgroup = GetRaidRosterInfo(i)
		if subgroup <= math.floor(raidNum / 5) then
			local unit = "raid"..i
			local j = 1
			while UnitBuff(unit, j) do
				if UnitBuff(unit, j) == buffName and select(8, UnitBuff(unit, j)) == 'player' then
					local exipres = select(7, UnitBuff(unit, j))
					
					num = num + 1;
					if not Expires then
						Expires = exipres
					elseif Expires > exipres then
						Expires = exipres
					elseif Expires <= GetTime() then
						Expires = nil
					end
				end
				j = j + 1
			end
		end
	end
	self.text:SetText(num == 0 and '' or tostring(num))
	if Expires then
		local t = Expires - GetTime()
		if t >= 6 then
			self.time:SetFormattedText('%s', tostring(floor(t)))
		else
			self.time:SetFormattedText('%.1f', t)
		end
	else
		self.time:SetText('')
	end
	if num == 0 then self:SetAlpha(0) else self:SetAlpha(1) end
end

function WS:Toggle()
	if E.db.euiscript.wsbutton.enable and GetSpecialization() == 2 then
		EuiMonkHeal:SetScript("OnUpdate", Update);
	else
		EuiMonkHeal:SetScript("OnUpdate", nil);
		EuiMonkHeal:SetAlpha(0);
	end
	self:UpdateSize()
end

function WS:PLAYER_REGEN_ENABLED()
	self.button:Size(E.db.euiscript.wsbutton.size)
	self:UnregisterEvent('PLAYER_REGEN_ENABLED')
end

function WS:UpdateSize()
	if InCombatLockdown() then
		self:RegisterEvent('PLAYER_REGEN_ENABLED')
	else
		self.button:Size(E.db.euiscript.wsbutton.size)
	end
	self.button.time:SetFont(LSM:Fetch("font", E.db.unitframe.font), E.db.euiscript.wsbutton.fontsize * .7, 'OUTLINE')
	self.button.text:SetFont(LSM:Fetch("font", E.db.unitframe.font), E.db.euiscript.wsbutton.fontsize, 'OUTLINE')
end

function WS:Initialize()
	if class ~= 'MONK' then return end;
	if(UnitLevel('player') < 90) then return; end
	
	self:RegisterEvent("PLAYER_TALENT_UPDATE", "Toggle")
	
	local f = CreateFrame("Button", "EuiMonkHeal", UIParent, "SecureActionButtonTemplate")
	f:RegisterForClicks('AnyUp')
	f:SetTemplate("Default")
	f:StyleButton()
	f:SetFrameLevel(5)
	f:SetAlpha(0)
	f:Size(E.db.euiscript.wsbutton.size)
	f:SetPoint("CENTER", UIParent, "CENTER", -400, 0)
	self.button = f

	f.Icon = f:CreateTexture(nil, 'ARTWORK')
	f.Icon:Point("TOPLEFT", 2, -2)
	f.Icon:Point("BOTTOMRIGHT", -2, 2)
	f.Icon:SetTexCoord(.08, .92, .08, .92)
	f.Icon:SetTexture(buffIcon)

	f.time = f:CreateFontString(nil, 'OVERLAY')
	f.time:FontTemplate(LSM:Fetch("font", E.db.unitframe.font), E.db.euiscript.wsbutton.fontsize * .7, 'OUTLINE')
	f.time:SetPoint("BOTTOMRIGHT", f, "BOTTOMRIGHT", 0, 0)
	f.time:SetTextColor(1,1,0)

	f.text = f:CreateFontString(nil, 'OVERLAY')
	f.text:FontTemplate(LSM:Fetch("font", E.db.unitframe.font), E.db.euiscript.wsbutton.fontsize, 'OUTLINE')
	f.text:SetPoint("CENTER", f, "CENTER", 0, 2)
	
	f:SetAttribute("type1", "spell")
	f:SetAttribute("spell1", buffSpell)
	
	E:CreateMover(f, "EuiMonkHealMover", buffName, nil, nil, nil, "ALL,EUI", function() return E.db.euiscript.wsbutton.enable; end)
	
	self:Toggle()
end

E:RegisterModule(WS:GetName())
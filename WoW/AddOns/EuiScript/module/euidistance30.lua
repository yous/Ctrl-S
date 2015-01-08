local E, L, V, P, G, _ = unpack(ElvUI); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB, Localize Underscore
local WS = E:NewModule("Near30", 'AceEvent-3.0');
local LSM = LibStub("LibSharedMedia-3.0")
local twipe = table.wipe

local DebuffID = {
	[158605] = true,
	[164176] = true,
	[164178] = true,
	[164191] = true,
	[158609] = true,
--	[2818] = true, --for test
}
local GroupUnits = {}
	
function WS:UpdateGroupUnits()
	local groupType, groupSize
	twipe(GroupUnits)

	if IsInRaid() then
		groupType = "raid"
		groupSize = GetNumGroupMembers()
	elseif IsInGroup() then
		groupType = "party"
		groupSize = GetNumGroupMembers() - 1
		GroupUnits["player"] = true
	else
		groupType = "solo"
		groupSize = 1
	end

	for index = 1, groupSize do
		local unit = groupType..index
		if not UnitIsUnit(unit, "player") then
			GroupUnits[unit] = true
		end
	end
end

local function Update()	
	local distance
		
	if WS.unit then
		if WS.unit ~= 'player' then
			distance = E:GetDistance('player', WS.unit, true) or NONE
		else
			distance = 'YOU!!!';
		end
		local Expires = select(7, UnitDebuff(WS.unit, GetSpellInfo(WS.spellid)))
		if Expires then
			local t = Expires - GetTime()
			if t >= 5 then
				EuiDistance30.time:SetFormattedText('%s', tostring(floor(t)))
			else
				EuiDistance30.time:SetFormattedText('%.1f', t)
			end
		end
		if distance then
			if type(distance) == 'number' then
				EuiDistance30.text:SetFormattedText('>>%.0f<<', distance);
				if distance >= 35 then
					EuiDistance30.text:SetTextColor(75/255,175/255, 76/255)
				else
					EuiDistance30.text:SetTextColor(0.78,0.25,0.25)
				end
			else
				EuiDistance30.text:SetFormattedText('>>%s<<', distance);
			end
		end
	end	
end

function WS:ScanAura()
	if not IsInInstance() then
		if EuiDistance30:GetAlpha() > 0 then EuiDistance30:SetAlpha(0) end
		return;
	end
	
	if not IsInRaid() then return; end

	local FindDebuffUnit
	local spellID
	local buffName, buffIcon
	
	for groupUnit, _ in pairs(GroupUnits) do
		if UnitIsConnected(groupUnit) then
			for k, v in pairs(DebuffID) do
				buffName, _, buffIcon = GetSpellInfo(k)
				if UnitDebuff(groupUnit, buffName) then
					FindDebuffUnit = groupUnit
					spellID = k
					break;
				end
			end			
		end
		if FindDebuffUnit then break; end
	end
	
	if FindDebuffUnit then
		WS.unit = FindDebuffUnit
		WS.spellid = spellID
		EuiDistance30.Icon:SetTexture(buffIcon)
		if not EuiDistance30:GetScript("OnUpdate") then
			EuiDistance30:SetScript("OnUpdate", Update)
			EuiDistance30:SetAlpha(1)
		end
	else
		WS.unit = nil
		WS.spellid = nil
		EuiDistance30:SetScript("OnUpdate", nil)
		EuiDistance30:SetAlpha(0)
	end
end

function WS:Toggle()
	if E.db.euiscript.euiDistance30.enable then
		self:RegisterEvent("UNIT_AURA", "ScanAura");
		self:RegisterEvent("GROUP_ROSTER_UPDATE", "UpdateGroupUnits")
		EuiDistance30:Show()
		EuiDistance30:SetAlpha(0)
	else
		self:UnregisterEvent("UNIT_AURA");
		self:UnregisterEvent("GROUP_ROSTER_UPDATE")
		EuiDistance30:SetAlpha(0)
		EuiDistance30:Hide()
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
		self.button:Size(E.db.euiscript.euiDistance30.size)
	end
	self.button.time:SetFont(LSM:Fetch("font", E.db.unitframe.font), E.db.euiscript.euiDistance30.fontsize * .9, 'OUTLINE')
	self.button.text:SetFont(LSM:Fetch("font", E.db.unitframe.font), E.db.euiscript.euiDistance30.fontsize, 'OUTLINE')
end

function WS:Initialize()	
	local f = CreateFrame("Button", "EuiDistance30", UIParent, "SecureActionButtonTemplate")
--	f:RegisterForClicks('AnyUp')
	f:SetTemplate("Default")
	f:StyleButton()
	f:SetFrameLevel(5)
	f:SetAlpha(0)
	f:Size(E.db.euiscript.euiDistance30.size)
	f:SetPoint("CENTER", UIParent, "CENTER", -400, 0)
	self.button = f

	f.Icon = f:CreateTexture(nil, 'ARTWORK')
	f.Icon:Point("TOPLEFT", 2, -2)
	f.Icon:Point("BOTTOMRIGHT", -2, 2)
	f.Icon:SetTexCoord(.08, .92, .08, .92)
--	f.Icon:SetTexture(buffIcon)

	f.time = f:CreateFontString(nil, 'OVERLAY')
	f.time:FontTemplate(LSM:Fetch("font", E.db.unitframe.font), E.db.euiscript.euiDistance30.fontsize * .9, 'OUTLINE')
	f.time:SetPoint("CENTER")
	f.time:SetTextColor(1,1,0)

	f.text = f:CreateFontString(nil, 'OVERLAY')
	f.text:FontTemplate(LSM:Fetch("font", E.db.unitframe.font), E.db.euiscript.euiDistance30.fontsize, 'OUTLINE')
	f.text:SetPoint("TOP", f, "BOTTOM", 0, -4)
	
--	f:SetAttribute("type1", "spell")
--	f:SetAttribute("spell1", buffSpell)
	local buffName = GetSpellInfo(158609)
	E:CreateMover(f, "EuiDistance30Mover", buffName, nil, nil, nil, "ALL,EUI", function() return E.db.euiscript.euiDistance30.enable; end)
	
	self:Toggle()
end

E:RegisterModule(WS:GetName())
local E, L, V, P, G, _ = unpack(ElvUI); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB, Localize Underscore
EuiExecute = E:NewModule("Execute", 'AceEvent-3.0', 'AceTimer-3.0');
local LSM = LibStub("LibSharedMedia-3.0")

local class = select(2, UnitClass("player"));
local K = EuiExecute
local unusedOverlays = {}

local function CanSpellBeUsed(id)
	local name = GetSpellInfo(id);
	if not name then return false end
	local start, duration, enabled = GetSpellCooldown(name)
	if enabled == 0 or start == nil or duration == nil then 
		return false
	elseif start > 0 and duration > 1.5 then	--On Cooldown
		return false
	else --Off Cooldown
		return true
	end
end

local function CanKiller(current, max, perc)
	if perc < 100 then
		if (current / max ) * 100 > perc then
			return false;
		else
			return true
		end
	else
		if UnitHealth('player') < current then
			return false;
		else
			return true
		end
	end
end

local function haveDKT15()
	local db = {
		95825,95826,95827,95828,95829,
		95225,95226,95227,95228,95229,
		96569,96570,96571,96572,96573,
	}
	
	local num = 0;
	
	for i = 1, 18 do
		local slotID = GetInventoryItemID("player", i)
		for k = 1, #db do
			if slotID == db[k] then
				num = num + 1;
				break;
			end
		end
	end
	
	if num > 3 then
		return true
	else
		return false
	end
end

local function createOverlay(btn)
	local isize = K.db.size
	local overlay = tremove(unusedOverlays)
	if not overlay then
		overlay = CreateFrame("Frame", nil, btn, "ExecuteSpellActivationAlert")
	end
	overlay:ClearAllPoints()
	overlay:SetParent(btn)
	overlay:SetAlpha(0.7)
	overlay:SetPoint("TOPLEFT", btn, "TOPLEFT", -isize * 0.4, isize * 0.4)
	overlay:SetPoint("BOTTOMRIGHT", btn, "BOTTOMRIGHT", isize * 0.4, -isize * 0.4);
	btn.overlay = overlay
	overlay.animIn:Play()
end

function K:OverlayGlowAnimOutFinished(animGroup)
    local overlay = animGroup:GetParent()
    overlay:Hide()
    tinsert(unusedOverlays, overlay)
end

function K:DKT15()
	local db = E.db.euiscript.executebutton.spellList[class]
	if haveDKT15() then
		if db[1].perc < 45 then db[1].perc = 45 end
		if db[2].perc < 45 then db[2].perc = 45 end
		if db[3].perc < 45 then db[3].perc = 45 end
	end
end

function K:ThrottleSound()
	self.SoundPlayed = nil;
end

function K:Update(event, unit)
	if not UnitName('target') or UnitIsDead('target') or UnitIsGhost('target') or not UnitIsConnected('target') then
		self.button:Hide();
		return
	end

	if unit ~= 'target' then return; end
	
	if not InCombatLockdown() then
		self.button:Hide();
		return
	end
	
	local _, instanceType = IsInInstance()
	if self.db.instance and (instanceType ~= "party" and instanceType ~= "raid" and instanceType ~= 'arena') then
		self.button:Hide();
		return
	end
	
	if unit == 'target' and not UnitCanAttack("player", unit) then
		self.button:Hide();
		return;
	end
	
	if not unit then
		self.button:Hide();
		return
	end
	
	local db = E.db.euiscript.executebutton.spellList[class][GetSpecialization()]
	if not db or not db.spellid or not db.enabled then
		self.button:Hide()
		return;
	end

	if UnitIsDead(unit) or UnitIsGhost(unit) or not UnitIsConnected(unit) then
		self.button:Hide()
		return;
	end

	local current, max = UnitHealth(unit), UnitHealthMax(unit)
	if CanKiller(current, max, db.perc) then
		self.button:Show()
		self.button.text:SetText(GetSpellInfo(db.spellid))
	else
		self.button:Hide()
		return;
	end
	if CanSpellBeUsed(db.spellid) then
		if self.db.sound ~= 'None' and not self.SoundPlayed then
			PlaySoundFile(LSM:Fetch("sound", self.db.sound), "Master")
			self.SoundPlayed = true
			self.SoundTimer = K:ScheduleTimer('ThrottleSound', 2)
		end
		if not self.button.overlay then	self.button:CreateOverlay(); end	
	else
		if self.button.overlay then
			if self.button.overlay.animIn:IsPlaying() then
				self.button.overlay.animIn:Stop()
			end
			self.button.overlay.animOut:Play()
			self.button.overlay = nil
		end	
	end
end

function K:UpdateTalent()
	local db = E.db.euiscript.executebutton.spellList[class][GetSpecialization()]
	if not db or not db.spellid then return; end
	
	local spellName, _, spellIcon = GetSpellInfo(db.spellid)
--	self.button:SetAttribute("type1", "spell")
--	self.button:SetAttribute("spell1", spellName)
	self.button.Icon:SetTexture(spellIcon)
end

function K:Toggle()
	if self.db.enable and (UnitLevel('player') > 80) then
		self:RegisterEvent("PLAYER_TARGET_CHANGED", "Update");
		self:RegisterEvent("UNIT_HEALTH_FREQUENT", "Update");
		self:RegisterEvent("UNIT_MAXHEALTH", "Update");
		self:RegisterEvent("UNIT_CONNECTION", "Update");
		self:RegisterEvent("PLAYER_FLAGS_CHANGED", "Update");
		self:RegisterEvent("ACTIVE_TALENT_GROUP_CHANGED", "UpdateTalent");
		if class == 'DEATHKNIGHT' then
			self:RegisterEvent("UNIT_INVENTORY_CHANGED", "DKT15");
		end
	else
		self:UnregisterEvent("PLAYER_TARGET_CHANGED");
		self:UnregisterEvent("UNIT_HEALTH_FREQUENT");
		self:UnregisterEvent("UNIT_MAXHEALTH");
		self:UnregisterEvent("UNIT_CONNECTION");
		self:UnregisterEvent("PLAYER_FLAGS_CHANGED");	
		self:UnregisterEvent("ACTIVE_TALENT_GROUP_CHANGED");
		if class == 'DEATHKNIGHT' then
			self:UnregisterEvent("UNIT_INVENTORY_CHANGED");
		end
		self.button:Hide();
	end
	self:UpdateSize()
	self:UpdateTalent()
end

function K:UpdateSize()
	self.button:Size(self.db.size)
end

function K:Initialize()
	self.db = E.db.euiscript.executebutton
	
	local f = CreateFrame("Button", nil, UIParent)
	f:RegisterForClicks('AnyUp')
	f:SetTemplate("Default")
	f:StyleButton()
	f:SetFrameLevel(5)
	f:Hide()
	f:Size(self.db.size)
	f:SetPoint("CENTER", UIParent, "CENTER", -400, 200)
	self.button = f  
	
	f.CreateOverlay = createOverlay
	
	f.Icon = f:CreateTexture(nil, 'ARTWORK')
	f.Icon:Point("TOPLEFT", 2, -2)
	f.Icon:Point("BOTTOMRIGHT", -2, 2)
	f.Icon:SetTexCoord(.08, .92, .08, .92)
	
	f.text = f:CreateFontString(nil, 'OVERLAY')
	f.text:FontTemplate(LSM:Fetch("font", E.db.unitframe.font), self.db.fontsize, 'OUTLINE')
	f.text:SetPoint("TOP", f, "BOTTOM", 0, -4)
	f.text:SetTextColor(1,1,0)
	
	E:CreateMover(f, "EuiExecuteMover", GetSpellInfo(5308), nil, nil, nil, "ALL,EUI", function() return E.db.euiscript.executebutton.enable; end)
	
	self:Toggle()
end

E:RegisterModule(K:GetName())
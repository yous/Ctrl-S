local E, L, V, P, G = unpack(ElvUI); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB
local AB = E:GetModule('ActionBars')
if not AB then return; end

function AB:EnableIconIntroTracker()
	IconIntroTracker:SetParent(UIParent)
	IconIntroTracker:Show()
	IconIntroTracker:RegisterEvent("SPELL_PUSHED_TO_ACTIONBAR")
	IconIntroTracker:SetScript("OnEvent", AB.PushToActionBar_OnEvent)
	IconIntroTracker.queue={}
end

function AB:PushToActionBar_OnEvent(event, ...)
    if event == "SPELL_PUSHED_TO_ACTIONBAR" then
		local spellID, slotIndex, slotPos = ...
		if slotPos > AB.db.bar1.buttons then return end

		if not InCombatLockdown() then
			AB.DoIconIntro(self, event, ...)
		else
			tinsert(self.queue, {event, ...})
			self:RegisterEvent("PLAYER_REGEN_ENABLED")
		end
	elseif event == "PLAYER_REGEN_ENABLED" then
		for i=1, #self.queue do
			AB.DoIconIntro(self, unpack(self.queue[i]))
		end
		wipe(self.queue)
		self:UnregisterEvent("PLAYER_REGEN_ENABLED")
    end
end

function AB:DoIconIntro(event, ...)
	local spellID, slotIndex, slotPos = ...
	if HasAction(slotPos) then return end

	IconIntroTracker_OnEvent(self, event, ...)
	PickupSpell(spellID)
	PlaceAction(slotPos)
end

IconIntroTracker_OnEvent = function(self, event, ...)
	if event == "SPELL_PUSHED_TO_ACTIONBAR" then
		local spellID, slotIndex, slotPos = ...;
		local _, _, icon = GetSpellInfo(spellID);
		local freeIcon;

		for a,b in pairs(self.iconList) do
			if b.isFree then
				freeIcon = b;
			end
		end

		if not freeIcon then -- Make a new one
			freeIcon = CreateFrame("FRAME", self:GetName().."Icon"..(#self.iconList+1), UIParent, "IconIntroTemplate");
			self.iconList[#self.iconList+1] = freeIcon;
		end

		freeIcon.icon.icon:SetTexture(icon);
		freeIcon.icon.slot = slotIndex;

		freeIcon:ClearAllPoints();

		freeIcon:SetPoint("CENTER", _G["ElvUI_Bar1Button"..slotPos], 0, 0);
		freeIcon:SetFrameLevel(_G["ElvUI_Bar1Button"..slotPos]:GetFrameLevel()+1);

		freeIcon.icon.flyin:Play(1);
		freeIcon.isFree = false;
	end
end

AB:EnableIconIntroTracker()
AB:SecureHook(AB, "DisableBlizzard", AB.EnableIconIntroTracker)
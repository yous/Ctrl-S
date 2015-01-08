local E, L, V, P, G = unpack(select(2, ...));

local convertName = {
	['DBM_Core'] = 'DBM-Core',
}

local function EventHandler(self, event)
	if(event == "ADDON_LOADED") then
	--	if not E.initialized then return; end
		
		for addonName, value in pairs(E.db.single) do
			if convertName[addonName] then addonName = convertName[addonName] end
			
			if E:IsConfigurableAddOn(addonName) and value then
				LoadAddOn(addonName)
				if addonName == 'MikScrollingBattleText' then
					pcall(MSBT_Toggle);
				end
		--[[	if addonName == 'DBM-Core' then
					if E:IsConfigurableAddOn('DBM-StatusBarTimers') then
						LoadAddOn('DBM-StatusBarTimers')
					end
					if E:IsConfigurableAddOn('DBM-DefaultSkin') then
						LoadAddOn('DBM-DefaultSkin')
					end
				end]]
				if addonName == 'TomTom' then
				--	Eui_TomTom_Toggle();
				end
				if addonName == 'GatherMate2' then
					pcall(Eui_GatherMate_Toggle, true);
				end
				if addonName == 'GladiatorlosSA' then
					pcall(GladiatorlosSA.OnEnable)
				end
				if addonName == 'CoolLine' then
					pcall(CoolLine_Toggle,true);
				end
				if addonName == 'AuctionLite' then
			--		pcall(Atr_OnLoad);
				end
				if addonName == 'GearStatsSummary' then
				--	pcall(GearStatsSummary_OnEvent,GearStatsSummaryFrame,'VARIABLES_LOADED')
				end
			end
		end
		self:UnregisterEvent('ADDON_LOADED')
	end
end

local f = CreateFrame("Frame")
f:SetScript("OnEvent", EventHandler)
f:RegisterEvent("ADDON_LOADED")
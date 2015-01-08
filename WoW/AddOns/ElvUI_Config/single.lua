local E, L, V, P, G, _ = unpack(ElvUI); --Engine

local AD = LibStub('AceAddon-3.0')
local ACD = LibStub("AceConfigDialog-3.0")

local tmpToggle, tmpToggle2, tmpToggle3, tmpToggle4, tmpToggle5
E.Options.args.singleFunc = {
	type = "group",
	name = E.ValColor..'15.'..L['singleFunc']..'|r',
	desc = L['singleFunc desc'],
	childGroups = 'tree',
	get = function(info) return E.db.single[ info[#info] ] end,
	set = function(info, value) E.db.single[ info[#info] ] = value end,
	args = {
		EuiGarrisonHeader = {
			order = 0,
			type = "header",
			name = L["EuiGarrison"],
		},	
		EuiGarrison = {
			order = 1,
			type = 'execute',
			name = L["Enable/Disable"]..L["EuiGarrison"],
			func = function() 
				if E:IsConfigurableAddOn('EuiGarrison') then
					E:Print(L['Disabled']..L["EuiGarrison"]);
					DisableAddOn('EuiGarrison');
					E:StaticPopup_Show("CONFIG_RL");
				else
					E:Print(L["Enabled"]..L["EuiGarrison"]);
					EnableAddOn('EuiGarrison');
					E:StaticPopup_Show("CONFIG_RL");
				end
			end,
		},
		gmm = {
			order = 2,
			type = 'toggle',
			name = L["GarrisonMissionManager"],
			get = function(info) return E.db.euiscript.gmm; end,
			set = function(info, value)
				E.db.euiscript.gmm = value;
				E:StaticPopup_Show("CONFIG_RL");
			end,
		},
		ExtraCDHeader = {
			order = 6,
			type = "header",
			name = L['ExtraCD'],
		},		
		ExtraCD = {
			order = 7,
			type = 'execute',
			name = L["Enable/Disable"]..L["ExtraCD"],
			func = function() 
				if E:IsConfigurableAddOn('ExtraCD') then
					E:Print(L['Disabled']..L["ExtraCD"]);
					DisableAddOn('ExtraCD');
					E:StaticPopup_Show("CONFIG_RL");
				else
					E:Print(L["Enabled"]..L["ExtraCD"]);
					EnableAddOn('ExtraCD');
					E:StaticPopup_Show("CONFIG_RL");
				end
			end,
		},
		ShowExtraCDOpt = {
			order = 8,
			type = 'execute',
			name = L['Show ExtraCD Config'],
			disabled = function() return not IsAddOnLoaded('ExtraCD'); end,
			func = function()
				if not ExtraCD.options then
					ExtraCD:OnOptionCreate();
				end
				InterfaceOptionsFrame_OpenToCategory(ExtraCD.optionFrame)
				InterfaceOptionsFrame_OpenToCategory(ExtraCD.optionFrame)
				E:ToggleConfig();
			end,
		},
		HandyNotes_DraenorTreasuresHeader = {
			order = 9,
			type = "header",
			name = L['HandyNotes_DraenorTreasures'],
		},		
		HandyNotes_DraenorTreasures = {
			order = 10,
			type = 'execute',
			name = L["Enable/Disable"]..L["HandyNotes_DraenorTreasures"],
			func = function() 
				if E:IsConfigurableAddOn('HandyNotes_DraenorTreasures') then
					E:Print(L['Disabled']..L["HandyNotes_DraenorTreasures"]);
					DisableAddOn('HandyNotes_DraenorTreasures');
					E:StaticPopup_Show("CONFIG_RL");
				else
					E:Print(L["Enabled"]..L["HandyNotes_DraenorTreasures"]);
					EnableAddOn('HandyNotes_DraenorTreasures');
					E:StaticPopup_Show("CONFIG_RL");
				end
			end,
		},
		ShowHandyNotes_DraenorTreasuresCfg = {
			order = 11,
			type = 'execute',
			name = L['Show HandyNotes_DraenorTreasures Config'],
			disabled = function() return not IsAddOnLoaded('HandyNotes_DraenorTreasures'); end,
			func = function()
				ACD:Open("HandyNotes");
				E:ToggleConfig();
			end,
		},	
		MikScrollingBattleTextHeader = {
			order = 12,
			type = "header",
			name = L['MikScrollingBattleText'],
		},		
		MikScrollingBattleText = {
			order = 13,
			type = 'execute',
			name = L["Enable/Disable"]..L["MikScrollingBattleText"],
			func = function() 
				if E:IsConfigurableAddOn('MikScrollingBattleText') then
					E:Print(L['Disabled']..L["MikScrollingBattleText"]);
					DisableAddOn('MikScrollingBattleText');
					E:StaticPopup_Show("CONFIG_RL");
				else
					E:Print(L["Enabled"]..L["MikScrollingBattleText"]);
					EnableAddOn('MikScrollingBattleText');
					E:StaticPopup_Show("CONFIG_RL");
				end
			end,
		},
		ShowMSBTOpt = {
			order = 14,
			type = 'execute',
			name = L['Show MikScrollingBattleText Config'],
			disabled = function() return not IsAddOnLoaded('MikScrollingBattleText'); end,
			func = function()
				if E:IsDisabledAddon('MSBTOptions') then
					EnableAddOn('MSBTOptions')
					E:StaticPopup_Show("CONFIG_RL");
				end
				if (not IsAddOnLoaded('MSBTOptions')) then
					LoadAddOn('MSBTOptions');
				end
				if (IsAddOnLoaded('MSBTOptions')) then
					MSBTOptions.Main.ShowMainFrame();
					E:ToggleConfig();
				end
			end,					
		},		
		ToggleBlzCombat = {
			order = 15,
			type = 'toggle',
			name = L['Toggle Blz CombatText'],
			get = function(info) return tmpToggle; end,
			set = function(info, value)
				tmpToggle = value;
				local toggle = 0
				if value then toggle = 1; end
				SetCVar("enableCombatText", toggle)
				SetCVar("fctLowManaHealth", toggle)
				SetCVar("fctAuras", toggle)
				SetCVar("fctCombatState", toggle)
				SetCVar("fctDodgeParryMiss", toggle)
				SetCVar("fctDamageReduction", toggle)
				SetCVar("fctRepChanges", toggle)
				SetCVar("fctHonorGains", toggle)
				SetCVar("fctReactives", toggle)
				SetCVar("fctFriendlyHealers", toggle)
				SetCVar("CombatHealingAbsorbSelf", toggle)
				SetCVar("fctComboPoints", toggle)
				SetCVar("fctEnergyGains", toggle)
				SetCVar("fctPeriodicEnergyGains", toggle)
				SetCVar("fctSpellMechanics", toggle)
				SetCVar("fctSpellMechanicsOther", toggle)
				SetCVar("CombatDamage", toggle)
				SetCVar("CombatLogPeriodicSpells", toggle)
				SetCVar("PetMeleeDamage", toggle)
				SetCVar("CombatHealing", toggle)
				SetCVar("CombatHealingAbsorbTarget", toggle)
			end,
		},
		DBM_CoreHeader = {
			order = 16,
			type = "header",
			name = L['DBM-Core'],
		},			
--[[	DBM_Core = {
			order = 16,
			type = 'toggle',
			name = L['DBM-Core'],
			set = function(info, value)
				E.db.single.DBM_Core = value;
				if value then
					if E:IsConfigurableAddOn('DBM-Core') then
						if (not IsAddOnLoaded('DBM-Core')) then
							LoadAddOn('DBM-Core');
							LoadAddOn('DBM-StatusBarTimers')
							LoadAddOn('DBM-DefaultSkin')
						end
						if AddOnSkins then
							E.private.addonskins.DBM = true;
						end
					end
				else
					if E:IsConfigurableAddOn('DBM-Core') then
						if IsAddOnLoaded('DBM-Core') then
							E:StaticPopup_Show("CONFIG_RL");
							E.private.addonskins.DBM = false
						end
					end					
				end
			end,
		},]]
		ShowDBMOpt = {
			order = 17,
			type = 'execute',
			name = L['Show DBM Config'],
			disabled = function() return not IsAddOnLoaded('DBM-Core'); end,
			func = function()
				DBM:LoadGUI();
				E:ToggleConfig();
			end,					
		},
		TestDBMSound = {
			order = 18,
			type = 'execute',
			name = L['Test DBM Sound'],
			disabled = function() return not IsAddOnLoaded('DBM-Core'); end,
			func = function()
				if E:IsConfigurableAddOn('DBM-Core') then
					DBM:testSound();
				end
			end,
		},	
		OffileDataCenterHeader = {
			order = 19,
			type = "header",
			name = L['OffileDataCenter'],
		},		
		OffileDataCenter = {
			order = 20,
			type = 'execute',
			name = L["Enable/Disable"]..L["OffileDataCenter"],
			func = function() 
				if E:IsConfigurableAddOn('OffileDataCenter') then
					E:Print(L['Disabled']..L["OffileDataCenter"]);
					DisableAddOn('OffileDataCenter');
					E:StaticPopup_Show("CONFIG_RL");
				else
					E:Print(L["Enabled"]..L["OffileDataCenter"]);
					EnableAddOn('OffileDataCenter');
					E:StaticPopup_Show("CONFIG_RL");
				end
			end,
		},
		ShowODCFrame = {
			order = 21,
			type = 'execute',
			name = L['Show OfflineDataCenter Frame'],
			disabled = function() return not IsAddOnLoaded('OffileDataCenter'); end,
			func = function()
				AD:GetAddon("OfflineDataCenter"):ToggleWindow();
				E:ToggleConfig();
			end,
		},
		ShowODCCfg = {
			order = 22,
			type = 'execute',
			name = L['Show OfflineDataCenter Config Frame'],
			disabled = function() return not IsAddOnLoaded('OffileDataCenter'); end,
			func = function()
				ODCFrameSettingSubFrame.configdialog:Click();
				E:ToggleConfig();
			end,
		},
		RaidBuilderHeader = {
			order = 23,
			type = "header",
			name = L['RaidBuilder'],
		},		
		RaidBuilder = {
			order = 24,
			type = 'execute',
			name = L["Enable/Disable"]..L["RaidBuilder"],
			func = function() 
				if E:IsConfigurableAddOn('MeetingStone') then
					E:Print(L['Disabled']..L["RaidBuilder"]);
					DisableAddOn('MeetingStone');
					E:StaticPopup_Show("CONFIG_RL");
				else
					E:Print(L["Enabled"]..L["RaidBuilder"]);
					EnableAddOn('MeetingStone');
					E:StaticPopup_Show("CONFIG_RL");
				end
			end,
		},
		ShowRaidBuilderFrame = {
			order = 25,
			type = 'execute',
			name = L['Show RaidBuilder Config Frame'],
			disabled = function() return not IsAddOnLoaded('MeetingStone'); end,
			func = function()
				AD:GetAddon('MeetingStone'):ToggleModule('MainPanel');
				E:ToggleConfig();
			end,
		},
		ToggleRaidBuilderBrokerPanel = {
			order = 26,
			type = 'execute',
			name = L['Toggle RaidBuilder BrokerPanel'],
			disabled = function() return not IsAddOnLoaded('MeetingStone'); end,
			func = function()
				if AD:GetAddon('MeetingStone'):GetModule('DataBroker').BrokerPanel:IsShown() then
					AD:GetAddon('MeetingStone'):GetModule('DataBroker').BrokerPanel:Hide()
				else
					AD:GetAddon('MeetingStone'):GetModule('DataBroker').BrokerPanel:Show()
				end
			end,
		},		
		SkadaHeader = {
			order = 27,
			type = "header",
			name = L['Skada'],
		},
		Skada = {
			order = 28,
			type = 'execute',
			name = L["Enable/Disable"]..L["Skada"],
			func = function() 
				if E:IsConfigurableAddOn('Skada') then
					E:Print(L['Disabled']..L["Skada"]);
					DisableAddOn('Skada');
					E:StaticPopup_Show("CONFIG_RL");
				else
					E:Print(L["Enabled"]..L["Skada"]);
					EnableAddOn('Skada');
					E:StaticPopup_Show("CONFIG_RL");
				end
			end,
		},			
		ShowSkadaConfig = {
			order = 29,
			type = 'execute',
			name = L['Show Skada Config Frame'],
			disabled = function() return not IsAddOnLoaded('Skada'); end,
			func = function()
				InterfaceOptionsFrame_OpenToCategory(Skada.optionsFrame)
				InterfaceOptionsFrame_OpenToCategory(Skada.optionsFrame)
				E:ToggleConfig();
			end,
		},
		ToggleSkadaWindow = {
			order = 30,
			type = 'execute',
			name = L['Toggle Skada Window'],
			disabled = function() return not IsAddOnLoaded('Skada'); end,
			func = function()
				Skada:ToggleWindow();
				E:ToggleConfig();
			end,
		},
		ResetSkadaProfile = {
			order = 31,
			type = 'execute',
			width = 'full',
			name = L['Reset Skada Profile'],
			disabled = function() return not IsAddOnLoaded('Skada'); end,
			func = function()
				Skada.db:ResetProfile();
				E:ToggleConfig();
			end,
		},
		RareScannerHeader = {
			order = 51,
			type = "header",
			name = L['RareScanner'],
		},	
		RareScanner = {
			order = 52,
			type = 'execute',
			name = L["Enable/Disable"]..L["RareScanner"],
			func = function() 
				if E:IsConfigurableAddOn('RareScanner') then
					E:Print(L['Disabled']..L["RareScanner"]);
					DisableAddOn('RareScanner');
					E:StaticPopup_Show("CONFIG_RL");
				else
					E:Print(L["Enabled"]..L["RareScanner"]);
					EnableAddOn('RareScanner');
					E:StaticPopup_Show("CONFIG_RL");
				end
			end,
		},	
		RareScannerConfigFrame = {
			order = 53,
			type = 'execute',
			name = L['RareScanner Config Frame'],
			disabled = function() return not IsAddOnLoaded('RareScanner'); end,
			func = function()
				if E:IsConfigurableAddOn('RareScanner') then
					InterfaceOptionsFrame_OpenToCategory(AD:GetAddon("RareScanner").optFrame)
					InterfaceOptionsFrame_OpenToCategory(AD:GetAddon("RareScanner").optFrame)
					E:ToggleConfig();
				end
			end,
		},	
		GearStatsSummaryHeader = {
			order = 57,
			type = "header",
			name = L['GearStatsSummary'],
		},
		GearStatsSummary = {
			order = 58,
			type = 'execute',
			name = L["Enable/Disable"]..L["GearStatsSummary"],
			func = function() 
				if E:IsConfigurableAddOn('GearStatsSummary') then
					E:Print(L['Disabled']..L["GearStatsSummary"]);
					DisableAddOn('GearStatsSummary');
					E:StaticPopup_Show("CONFIG_RL");
				else
					E:Print(L["Enabled"]..L["GearStatsSummary"]);
					EnableAddOn('GearStatsSummary');
					E:StaticPopup_Show("CONFIG_RL");
				end
			end,
		},	
	},
}
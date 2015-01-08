local E, L, V, P, G, _ = unpack(ElvUI); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB, Localize Underscore
local DT = E:GetModule('DataTexts')

local datatexts = {}

local function GetEquipmentList()
	local num = GetNumEquipmentSets()
	local list = {['NONE'] = NONE}
	if num == 0 then return list; end
	
	for i = 1, num do
		local name = GetEquipmentSetInfo(i)
		list[name] = name;
	end
	
	return list;
end

function DT:PanelLayoutOptions()	
	for name, _ in pairs(DT.RegisteredDataTexts) do
		datatexts[name] = L[name]
	end
	datatexts[''] = NONE
	
	local table = E.Options.args.datatexts.args.panels.args
	local i = 0
	for pointLoc, tab in pairs(P.datatexts.panels) do
		i = i + 1
		if not _G[pointLoc] then table[pointLoc] = nil; return; end
		if type(tab) == 'table' then
			table[pointLoc] = {
				type = 'group',
				args = {},
				name = L[pointLoc] or pointLoc,
				guiInline = true,
				order = i + -10,
			}			
			for option, value in pairs(tab) do
				table[pointLoc].args[option] = {
					type = 'select',
					name = L[option] or option:upper(),
					values = datatexts,
					get = function(info) return E.db.datatexts.panels[pointLoc][ info[#info] ] end,
					set = function(info, value)
						E.db.datatexts.panels[pointLoc][ info[#info] ] = value; 
						if pointLoc == 'TopDataTextsBar3' then E:StaticPopup_Show("PRIVATE_RL") end;
						DT:LoadDataTexts();
					end,
				}
			end
		elseif type(tab) == 'string' then
			table[pointLoc] = {
				type = 'select',
				name = L[pointLoc] or pointLoc,
				values = datatexts,
				get = function(info) return E.db.datatexts.panels[pointLoc] end,
				set = function(info, value) 
					E.db.datatexts.panels[pointLoc] = value;
					DT:LoadDataTexts()
				end,	
			}						
		end
	end
end

E.Options.args.datatexts = {
	type = "group",
	name = '12.'..L["DataTexts"],
	childGroups = "tab",
	get = function(info) return E.db.datatexts[ info[#info] ] end,
	set = function(info, value) E.db.datatexts[ info[#info] ] = value; DT:LoadDataTexts() end,
	args = {
		intro = {
			order = 1,
			type = "description",
			name = L["DATATEXT_DESC"],
		},
		time24 = {
			order = 2,
			type = 'toggle',
			name = L['24-Hour Time'],
			desc = L['Toggle 24-hour mode for the time datatext.'],
		},
		localtime = {
			order = 3,
			type = 'toggle',
			name = L['Local Time'],
			desc = L['If not set to true then the server time will be displayed instead.'],
		},
		battleground = {
			order = 4,
			type = 'toggle',
			name = L['Battleground Texts'],
			desc = L['When inside a battleground display personal scoreboard information on the main datatext bars.'],
		},
		customColor = {
			order = 5,
			type = "select",
			name = COLOR,
			values = {
				[1] = CLASS_COLORS,
				[2] = CUSTOM,
				[3] = L["Value Color"],
			},
		},
		userColor = {
			order = 6,
			type = "color",
			name = COLOR_PICKER,
			disabled = function() return E.db.datatexts.customColor == 1 or E.db.datatexts.customColor == 3 end,
			get = function(info)
				local t = E.db.datatexts.userColor
				return t.r, t.g, t.b, t.a
				end,
			set = function(info, r, g, b)
				local t = E.db.datatexts.userColor
				t.r, t.g, t.b = r, g, b
				DT:LoadDataTexts();
			end,
		},		
		minimapPanels = {
			order = 10,
			name = L['Minimap Panels'],
			desc = L['Display minimap panels below the minimap, used for datatexts.'],
			type = 'toggle',
			set = function(info, value) 
				E.db.datatexts[ info[#info] ] = value
				E:GetModule('Minimap'):UpdateSettings()
			end,					
		},		
		leftChatPanel = {
			order = 11,
			name = L['Datatext Panel (Left)'],
			desc = L['Display data panels below the chat, used for datatexts.'],
			type = 'toggle',
			set = function(info, value) 
				E.db.datatexts[ info[#info] ] = value
				if E.db.LeftChatPanelFaded then
					E.db.LeftChatPanelFaded = true;
					HideLeftChat()
				end
				E:GetModule('Chat'):UpdateAnchors()
				E:GetModule('Layout'):ToggleChatPanels()
				E:GetModule('Bags'):PositionBagFrames()
			end,					
		},		
		rightChatPanel = {
			order = 12,
			name = L['Datatext Panel (Right)'],
			desc = L['Display data panels below the chat, used for datatexts.'],
			type = 'toggle',
			set = function(info, value) 
				E.db.datatexts[ info[#info] ] = value
				if E.db.RightChatPanelFaded then
					E.db.RightChatPanelFaded = true;
					HideRightChat()
				end		
				E:GetModule('Chat'):UpdateAnchors()
				E:GetModule('Layout'):ToggleChatPanels()
				E:GetModule('Bags'):PositionBagFrames()
			end,					
		},			
		panelTransparency = {
			order = 13,
			name = L['Panel Transparency'],
			type = 'toggle',
			set = function(info, value) 
				E.db.datatexts[ info[#info] ] = value
				E:GetModule('Layout'):SetDataPanelStyle()
			end,				
		},
		goldFormat = {
			order = 14,
			type = 'select',
			name = L["Gold Format"],
			desc = L["The display format of the money text that is shown in the gold datatext and its tooltip."],
			values = {
				['SMART'] = L['Smart'],
				['FULL'] = L['Full'],
				['SHORT'] = L['Short'],
				['SHORTINT'] = L['Short (Whole Numbers)'],
				['CONDENSED'] = L['Condensed'],
				['BLIZZARD'] = L['Blizzard Style'],
			},
		},
		goldCoins = {
			order = 15,
			type = 'toggle',
			name = L['Show Coins'],
			desc = L['Use coin icons instead of colored text.'],
		},		
		width = {
			order = 16,
			name = L['TopInfobar width'],
			type = 'range',
			min = 20, max = 200, step = 1,
			set = function(info, value)
				E.db.infobar.width = value
				E:GetModule('Layout'):ChangeSize(TopDataTextsBar1);
				E:GetModule('Layout'):ChangeSize(TopDataTextsBar2);
				E:GetModule('Layout'):ChangeSize(TopDataTextsBar3, 3);
				E:GetModule('Layout'):ChangeSize(TopDataTextsBar4, 3);
				E:GetModule('Layout'):ChangePositon()
				DT:UpdateAllDimensions()
			end,
			get = function(info) return E.db.infobar.width; end,
		},
		height = {
			order = 17,
			type = 'range',
			min = 10, max = 100, step = 1,
			name = L['TopInfobar height'],
			set = function(info, value)
				E.db.infobar.height = value
				E:GetModule('Layout'):ChangeSize(TopDataTextsBar1);
				E:GetModule('Layout'):ChangeSize(TopDataTextsBar2);
				E:GetModule('Layout'):ChangeSize(TopDataTextsBar3, 3);
				E:GetModule('Layout'):ChangeSize(TopDataTextsBar4, 3);
				E:GetModule('Layout'):ChangePositon()
				DT:UpdateAllDimensions()
			end,
			get = function(info) return E.db.infobar.height; end,
		},			
		panels = {
			type = 'group',
			name = L['Panels'],
			order = 100,	
			args = {},
			guiInline = true,
		},
		fontGroup = {
			order = 120,
			type = 'group',
			guiInline = true,
			name = L['Fonts'],
			args = {
				font = {
					type = "select", dialogControl = 'LSM30_Font',
					order = 4,
					name = L["Font"],
					values = AceGUIWidgetLSMlists.font,
				},
				fontSize = {
					order = 5,
					name = L["Font Size"],
					type = "range",
					min = 6, max = 22, step = 1,
				},	
				fontOutline = {
					order = 6,
					name = L["Font Outline"],
					desc = L["Set the font outline."],
					type = "select",
					values = {
						['NONE'] = L['None'],
						['OUTLINE'] = 'OUTLINE',
					--	['MONOCHROMEOUTLINE'] = 'MONOCROMEOUTLINE',
						['THICKOUTLINE'] = 'THICKOUTLINE',
					},
				},	
			},
		},	
		spec = {
			order = 130,
			type = 'group',
			guiInline = true,
			name = L['Spec Binding Equipment'],
			args = {
				spec1 = {
					type = 'select',
					order = 1,
					name = L['Primary Talents'],
					values = GetEquipmentList,
					get = function(info, k) return E.db.datatexts.spec1; end,
					set = function(info, k, v) E.db.datatexts.spec1 = k; end,
				},
				spec2 = {
					type = 'select',
					order = 2,
					name = L['Secondary Talents'],
					values = GetEquipmentList,
					get = function(info, k) return E.db.datatexts.spec2; end,
					set = function(info, k, v) E.db.datatexts.spec2 = k; end,
				},
			},
		},
	},
}

DT:PanelLayoutOptions()	
local E, L, V, P, G, _ = unpack(ElvUI); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB, Localize Underscore

local tsort, tinsert = table.sort, table.insert
local DEFAULT_WIDTH = 890;
local DEFAULT_HEIGHT = 651;
local AC = LibStub("AceConfig-3.0")
local ACD = LibStub("AceConfigDialog-3.0")
local ACR = LibStub("AceConfigRegistry-3.0")

AC:RegisterOptionsTable("ElvUI", E.Options)
ACD:SetDefaultSize("ElvUI", DEFAULT_WIDTH, DEFAULT_HEIGHT)	

E.Options.args = {
	ElvUI_Header = {
		order = 1,
		type = "header",
		name = L["Version"]..format(": |cff99ff33%s|r",E.version).." Build"..format(": |cffFFFFFF%s|r",E.build),
		width = "full",		
	},
	LoginMessage = {
		order = 2,
		type = 'toggle',
		name = L['Login Message'],
		get = function(info) return E.db.general.loginmessage end,
		set = function(info, value) E.db.general.loginmessage = value end,
	},	
	ToggleTutorial = {
		order = 3,
		type = 'execute',
		name = L['Toggle Tutorials'],
		func = function() E:Tutorials(true); E:ToggleConfig()  end,
	},
	Install = {
		order = 4,
		type = 'execute',
		name = L['Install'],
		desc = L['Run the installation process.'],
		func = function() E:Install(); E:ToggleConfig() end,
	},	
	ToggleAnchors = {
		order = 5,
		type = "execute",
		name = L["Toggle Anchors"],
		desc = L["Unlock various elements of the UI to be repositioned."],
		func = function() E:ToggleConfigMode() end,
	},
	ResetAllMovers = {
		order = 6,
		type = "execute",
		name = L["Reset Anchors"],
		desc = L["Reset all frames to their original positions."],
		func = function() E:ResetUI() end,
	},	
}

E.Options.args.general = {
	type = "group",
	name = '01.'..L["General"],
	order = 1,
	childGroups = "tab",
	get = function(info) return E.db.general[ info[#info] ] end,
	set = function(info, value) E.db.general[ info[#info] ] = value end,
	args = {
		intro = {
			order = 1,
			type = "description",
			name = L["ELVUI_DESC"],
		},			
		general = {
			order = 2,
			type = "group",
			name = L["General"],
			args = {
				autoScale = {
					order = 0,
					name = L["Auto Scale"],
					desc = L["Automatically scale the User Interface based on your screen resolution"],
					type = "toggle",	
					get = function(info) return E.global.general.autoScale end,
					set = function(info, value) E.global.general[ info[#info] ] = value; E:StaticPopup_Show("GLOBAL_RL") end
				},
				uiscale = {
					order = 1,
					name = L["UI Scale"],
					desc = L["Controls the scaling of the entire User Interface"],
					disabled = function(info) return E.global.general.autoScale end,
					type = "range",
					min = 0.64, max = 1.15, step = 0.01,
					isPercent = true,
					set = function(info, value) SetCVar("uiScale", value); E:StaticPopup_Show('CONFIG_RL') end,
					get = function() return tonumber(format('%.2f', GetCVar('uiScale'))) end,
				},	
				eyefinity = {
					order = 3,
					name = L["Multi-Monitor Support"],
					desc = L["Attempt to support eyefinity/nvidia surround."],
					type = "toggle",	
					get = function(info) return E.global.general.eyefinity end,
					set = function(info, value) E.global.general[ info[#info] ] = value; E:StaticPopup_Show("GLOBAL_RL") end
				},
				interruptAnnounce = {
					order = 11,
					name = L['Announce Interrupts'],
					desc = L['Announce when you interrupt a spell to the specified chat channel.'],
					type = 'select',
					values = {
						['NONE'] = NONE,
						['SAY'] = SAY,
						['PARTY'] = PARTY,
						['RAID'] = RAID,
					},
				},
				autoRepair = {
					order = 2,
					name = L['Auto Repair'],
					desc = L['Automatically repair using the following method when visiting a merchant.'],
					type = 'select',
					values = {
						['NONE'] = NONE,
						['GUILD'] = GUILD,
						['PLAYER'] = PLAYER,
					},				
				},		
				autoAcceptInvite = {
					order = 5,
					name = L['Accept Invites'],
					desc = L['Automatically accept invites from guild/friends.'],
					type = 'toggle',
				},
				hideErrorFrame = {
					order = 6,
					name = L["Hide Error Text"],
					desc = L["Hides the red error text at the top of the screen while in combat."],
					type = "toggle"
				},				
				-- vendorGrays = {
					-- order = 6,
					-- name = L['Vendor Grays'],
					-- desc = L['Automatically vendor gray items when visiting a vendor.'],
					-- type = 'toggle',				
				-- },
				-- autoRoll = {
					-- order = 8,
					-- name = L['Auto Greed/DE'],
					-- desc = L['Automatically select greed or disenchant (when available) on green quality items. This will only work if you are the max level.'],
					-- type = 'toggle',		
					-- disabled = function() return not E.private.general.lootRoll end
				-- },
				disableOmnicc = {
					order = 7,
					name = L['Disable Omnicc Show'],
					type = 'toggle',
					set = function(info, value) E.db.general.disableOmnicc = value; E:StaticPopup_Show("PRIVATE_RL") end,
				},
				loot = {
					order = 9,
					type = "toggle",
					name = L['Loot'],
					desc = L['Enable/Disable the loot frame.'],
					get = function(info) return E.private.general.loot end,
					set = function(info, value) E.private.general.loot = value; E:StaticPopup_Show("PRIVATE_RL") end
				},
				lootRoll = {
					order = 10,
					type = "toggle",
					name = L['Loot Roll'],
					desc = L['Enable/Disable the loot roll frame.'],
					get = function(info) return E.private.general.lootRoll end,
					set = function(info, value) E.private.general.lootRoll = value; E:StaticPopup_Show("PRIVATE_RL") end
				},
				lootWidth = {
					order = 11,
					type = 'range',
					min = 100, max = 1000, step = 1,
					disabled = function() return not E.private.general.lootRoll end,
					name = L["Loot Roll's width"],
					get = function(info) return E.db.general.lootWidth end,
					set = function(info, value) E.db.general.lootWidth = value; E:StaticPopup_Show("PRIVATE_RL") end,
				},
				lootHeight = {
					order = 12,
					type = 'range',
					min = 5, max = 60, step = 1,
					disabled = function() return not E.private.general.lootRoll end,
					name = L["Loot Roll's height"],
					get = function(info) return E.db.general.lootHeight end,
					set = function(info, value) E.db.general.lootHeight = value; E:StaticPopup_Show("PRIVATE_RL") end,
				},	
				resetLootSize = {
					order = 13,
					type = 'execute',
					name = L['reset loot size'],
					func = function() 
						E.db.general.lootHeight = 28;
						E.db.general.lootWidth = 328;
						E:StaticPopup_Show("CONFIG_RL");
					end,
				},
				chatBubbles = {
					order = 14,
					type = "select",
					name = L['Chat Bubbles Style'],
					desc = L['Skin the blizzard chat bubbles.'],
					get = function(info) return E.private.general.chatBubbles end,
					set = function(info, value) E.private.general.chatBubbles = value; E:StaticPopup_Show("PRIVATE_RL") end,
					values = {
						['backdrop'] = L['Skin Backdrop'],
						['nobackdrop'] = L['Remove Backdrop'],
						['disabled'] = L['Disabled']
					},
				},	
				taintLog = {
					order = 15,
					type = "toggle",
					name = L["Log Taints"],
					desc = L["Send ADDON_ACTION_BLOCKED errors to the Lua Error frame. These errors are less important in most cases and will not effect your game performance. Also a lot of these errors cannot be fixed. Please only report these errors if you notice a Defect in gameplay."],
				},	
				bottomPanel = {
					order = 16,
					type = 'toggle',
					name = L['Bottom Panel'],
					desc = L['Display a panel across the bottom of the screen. This is for cosmetic only.'],
					get = function(info) return E.db.general.bottomPanel end,
					set = function(info, value) E.db.general.bottomPanel = value; E:GetModule('Layout'):BottomPanelVisibility() end						
				},
				topPanel = {
					order = 17,
					type = 'toggle',
					name = L['Top Panel'],
					desc = L['Display a panel across the top of the screen. This is for cosmetic only.'],
					get = function(info) return E.db.general.topPanel end,
					set = function(info, value) E.db.general.topPanel = value; E:GetModule('Layout'):TopPanelVisibility() end						
				},	
				afk = {
					order = 18,
					type = 'toggle',
					name = L['AFK Mode'],
					desc = L['When you go AFK display the AFK screen.'],
					get = function(info) return E.db.general.afk end,
					set = function(info, value) E.db.general.afk = value; E:GetModule('AFK'):Toggle() end,
				},				
			},
		},
		media = {
			order = 3,
			type = "group",
			name = L["Media"],
			get = function(info) return E.db.general[ info[#info] ] end,
			set = function(info, value) E.db.general[ info[#info] ] = value end,	
			args = {
				fonts = {
					order = 1,
					type = "group",
					name = L["Fonts"],
					guiInline = true,
					args = {
						fontSize = {
							order = 0,
							name = L["Font Size"],
							desc = L["Set the font size for everything in UI. Note: This doesn't effect somethings that have their own seperate options (UnitFrame Font, Datatext Font, ect..)"],
							type = "range",
							min = 6, max = 22, step = 1,
							set = function(info, value) E.db.general[ info[#info] ] = value; E:UpdateMedia(); E:UpdateFontTemplates(); end,
						},	
						questfontSize = {
							order = 1,
							name = L["Quest Font Size"],
							type = "range",
							min = 6, max = 22, step = 1,
							set = function(info, value) ObjectiveFont:SetFont(E.media.normFont,value);E.db.general.questfontSize=value; end,
						},														
						font = {
							type = "select", dialogControl = 'LSM30_Font',
							order = 2,
							name = L["Default Font"],
							desc = L["The font that the core of the UI will use."],
							values = AceGUIWidgetLSMlists.font,	
							set = function(info, value) E.db.general[ info[#info] ] = value; E:UpdateMedia(); E:UpdateFontTemplates(); end,
						},
						dmgfont = {
							type = "select", dialogControl = 'LSM30_Font',
							order = 3,
							name = L["CombatText Font"],
							desc = L["The font that combat text will use. |cffFF0000WARNING: This requires a game restart or re-log for this change to take effect.|r"],
							values = AceGUIWidgetLSMlists.font,
							get = function(info) return E.private.general[ info[#info] ] end,							
							set = function(info, value) E.private.general[ info[#info] ] = value; E:UpdateMedia(); E:UpdateFontTemplates(); E:StaticPopup_Show("PRIVATE_RL"); end,
						},
						namefont = {
							type = "select", dialogControl = 'LSM30_Font',
							order = 4,
							name = L["Name Font"],
							desc = L["The font that appears on the text above players heads. |cffFF0000WARNING: This requires a game restart or re-log for this change to take effect.|r"],
							values = AceGUIWidgetLSMlists.font,
							get = function(info) return E.private.general[ info[#info] ] end,							
							set = function(info, value) E.private.general[ info[#info] ] = value; E:UpdateMedia(); E:UpdateFontTemplates(); E:StaticPopup_Show("PRIVATE_RL"); end,
						},
				--[[		watchFontSize = {
							order = 5,
							name = L["Watch Frame"].. L["Font Size"],
							type = "range",
							min = 6, max = 22, step = 1,
							set = function(info, value) E.db.general[ info[#info] ] = value; WatchFrame_Update(); end,
						},]]
						replaceBlizzFonts = {
							order = 5,
							type = 'toggle',
							name = L['Replace Blizzard Fonts'],
							desc = L['Replaces the default Blizzard fonts on various panels and frames with the fonts chosen in the Media section of the ElvUI config. NOTE: Any font that inherits from the fonts ElvUI usually replaces will be affected as well if you disable this. Enabled by default.'],
							get = function(info) return E.private.general[ info[#info] ] end,
							set = function(info, value) E.private.general[ info[#info] ] = value; E:StaticPopup_Show("PRIVATE_RL"); end,
						},						
					},
				},	
				textures = {
					order = 2,
					type = "group",
					name = L["Textures"],
					guiInline = true,
					args = {
						normTex = {
							type = "select", dialogControl = 'LSM30_Statusbar',
							order = 1,
							name = L["Primary Texture"],
							desc = L["The texture that will be used mainly for statusbars."],
							values = AceGUIWidgetLSMlists.statusbar,
							get = function(info) return E.private.general[ info[#info] ] end,
							set = function(info, value) E.private.general[ info[#info] ] = value; E:StaticPopup_Show("PRIVATE_RL") end							
						},
						glossTex = {
							type = "select", dialogControl = 'LSM30_Statusbar',
							order = 2,
							name = L["Secondary Texture"],
							desc = L["This texture will get used on objects like chat windows and dropdown menus."],
							values = AceGUIWidgetLSMlists.statusbar,	
							get = function(info) return E.private.general[ info[#info] ] end,
							set = function(info, value) E.private.general[ info[#info] ] = value; E:StaticPopup_Show("PRIVATE_RL") end
						},				
					},
				},
				colors = {
					order = 3,
					type = "group",
					name = L["Colors"],
					guiInline = true,
					args = {
						bordercolor = {
							type = "color",
							order = 1,
							name = L["Border Color"],
							desc = L["Main border color of the UI. |cffFF0000This is disabled if you are using the pixel perfect theme.|r"],
							hasAlpha = false,
							get = function(info)
								local t = E.db.general[ info[#info] ]
								local d = P.general[info[#info]]
								return t.r, t.g, t.b, t.a, d.r, d.g, d.b
							end,
							set = function(info, r, g, b)
								E.db.general[ info[#info] ] = {}
								local t = E.db.general[ info[#info] ]
								t.r, t.g, t.b = r, g, b
								E:UpdateMedia()
								E:UpdateBorderColors()
							end,	
							disabled = function() return E.PixelMode end,
						},
						backdropcolor = {
							type = "color",
							order = 2,
							name = L["Backdrop Color"],
							desc = L["Main backdrop color of the UI."],
							hasAlpha = false,
							get = function(info)
								local t = E.db.general[ info[#info] ]
								local d = P.general[info[#info]]
								return t.r, t.g, t.b, t.a, d.r, d.g, d.b
							end,
							set = function(info, r, g, b)
								E.db.general[ info[#info] ] = {}
								local t = E.db.general[ info[#info] ]
								t.r, t.g, t.b = r, g, b
								E:UpdateMedia()
								E:UpdateBackdropColors()
							end,						
						},
						backdropfadecolor = {
							type = "color",
							order = 3,
							name = L["Backdrop Faded Color"],
							desc = L["Backdrop color of transparent frames"],
							hasAlpha = true,
							get = function(info)
								local t = E.db.general[ info[#info] ]
								local d = P.general[info[#info]]
								return t.r, t.g, t.b, t.a, d.r, d.g, d.b
							end,
							set = function(info, r, g, b, a)
								E.db.general[ info[#info] ] = {}
								local t = E.db.general[ info[#info] ]	
								t.r, t.g, t.b, t.a = r, g, b, a
								E:UpdateMedia()
								E:UpdateBackdropColors()
							end,						
						},				
						valuecolor = {
							type = "color",
							order = 4,
							name = L["Value Color"],
							desc = L["Color some texts use."],
							hasAlpha = false,
							get = function(info)
								local t = E.db.general[ info[#info] ]
								local d = P.general[info[#info]]
								return t.r, t.g, t.b, t.a, d.r, d.g, d.b
							end,
							set = function(info, r, g, b, a)
								E.db.general[ info[#info] ] = {}
								local t = E.db.general[ info[#info] ]	
								t.r, t.g, t.b, t.a = r, g, b, a
								E:UpdateMedia()
							end,						
						},
						transparent = {
							type = "toggle",
							order = 5,
							name = L["Transparent Theme"],
							desc = L["Transparent Theme desc"],
							set = function(info, value)
								E.db.general.transparent = value
								E.db.unitframe.transparent = value
								if value then E:SetupTheme("transparent", true) else E:SetupTheme("classic", true) end
								E:StaticPopup_Show("PRIVATE_RL")
							end,
						},
						transparentStyle = {
							type = "range",
							order = 6,
							min = 1, max = 2, step = 1,
							name = L['Transparent Theme Style'],
							desc = L["1:New Style;\n2:Old Style"],
							disabled = function() return not E.db.general.transparent end,
							set = function(info, value)
								E.db.general.transparentStyle = value
								E:StaticPopup_Show("PRIVATE_RL")
							end,
						},						
						pixelPerfect = {
							order = 7,
							name = L['Pixel Perfect'],
							desc = L['The Pixel Perfect option will change the overall apperance of your UI. Using Pixel Perfect is a slight performance increase over the traditional layout.'],
							type = 'toggle',
							get = function(info) return E.private.general.pixelPerfect end,
							set = function(info, value) E.private.general.pixelPerfect = value; E:StaticPopup_Show("PRIVATE_RL") end					
						},
					},
				},
			},
		},		
		minimap = {
			order = 4,
			get = function(info) return E.db.general.minimap[ info[#info] ] end,	
			type = "group",
			name = MINIMAP_LABEL,
			args = {
				enable = {
					order = 1,
					type = "toggle",
					name = L["Enable"],
					desc = L['Enable/Disable the minimap. |cffFF0000Warning: This will prevent you from seeing the consolidated buffs bar, and prevent you from seeing the minimap datatexts.|r'],
					get = function(info) return E.private.general.minimap[ info[#info] ] end,
					set = function(info, value) E.private.general.minimap[ info[#info] ] = value; E:StaticPopup_Show("PRIVATE_RL") end,	
				},
				size = {
					order = 2,
					type = "range",
					name = L["Size"],
					desc = L['Adjust the size of the minimap.'],
					min = 120, max = 250, step = 1,
					set = function(info, value) E.db.general.minimap[ info[#info] ] = value; E:GetModule('Minimap'):UpdateSettings() end,	
					disabled = function() return not E.private.general.minimap.enable end,
				},	
				locationText = {
					order = 3,
					type = 'select',
					name = L['Location Text'],
					desc = L['Change settings for the display of the location text that is on the minimap.'],
					get = function(info) return E.db.general.minimap.locationText end,
					set = function(info, value) E.db.general.minimap.locationText = value; E:GetModule('Minimap'):UpdateSettings(); E:GetModule('Minimap'):Update_ZoneText() end,
					values = {
						['MOUSEOVER'] = L['Minimap Mouseover'],
						['SHOW'] = L['Always Display'],
						['HIDE'] = L['Hide'],
					},
					disabled = function() return not E.private.general.minimap.enable end,
				},	
				spacer = {
					order = 4,
					type = "description",
					name = "\n",
				},
				icons = {
					order = 5,
					type = 'group',
					name = L["Minimap Buttons"],
					args = {
						garrison = {
							order = 1,
							type = 'group',
							name = GARRISON_LOCATION_TOOLTIP,
							get = function(info) return E.db.general.minimap.icons.garrison[ info[#info] ] end,
							set = function(info, value) E.db.general.minimap.icons.garrison[ info[#info] ] = value; E:GetModule('Minimap'):UpdateSettings() end,
							args = {
								scale = {
									order = 1,
									type = 'range',
									name = L["Scale"],
									min = 0.5, max = 2, step = 0.05,
								},
								position = {
									order = 2,
									type = 'select',
									name = L["Position"],
									disabled = function() return E.private.general.minimap.hideGarrison end,
									values = {
										["LEFT"] = L["Left"],
										["RIGHT"] = L["Right"],
										["TOP"] = L["Top"],
										["BOTTOM"] = L["Bottom"],
										["TOPLEFT"] = L["Top Left"],
										["TOPRIGHT"] = L["Top Right"],
										["BOTTOMLEFT"] = L["Bottom Left"],
										["BOTTOMRIGHT"] = L["Bottom Right"],
									},
								},
								xOffset = {
									order = 3,
									type = 'range',
									name = L['xOffset'],
									min = -100, max = 100, step = 1,
									disabled = function() return E.private.general.minimap.hideGarrison end,
								},
								yOffset = {
									order = 4,
									type = 'range',
									name = L['yOffset'],
									min = -100, max = 100, step = 1,
									disabled = function() return E.private.general.minimap.hideGarrison end,
								},
								hideGarrison = {
									order = 5,
									type = 'toggle',
									name = L["Hide"],
									get = function(info) return E.private.general.minimap.hideGarrison end,
									set = function(info, value) E.private.general.minimap.hideGarrison = value; E:StaticPopup_Show("PRIVATE_RL") end,
								},
							},
						},
						calendar = {
							order = 2,
							type = 'group',
							name = L["Calendar"],
							get = function(info) return E.db.general.minimap.icons.calendar[ info[#info] ] end,
							set = function(info, value) E.db.general.minimap.icons.calendar[ info[#info] ] = value; E:GetModule('Minimap'):UpdateSettings() end,
							args = {
								scale = {
									order = 1,
									type = 'range',
									name = L["Scale"],
									min = 0.5, max = 2, step = 0.05,
								},
								position = {
									order = 2,
									type = 'select',
									name = L["Position"],
									disabled = function() return E.private.general.minimap.hideCalendar end,
									values = {
										["LEFT"] = L["Left"],
										["RIGHT"] = L["Right"],
										["TOP"] = L["Top"],
										["BOTTOM"] = L["Bottom"],
										["TOPLEFT"] = L["Top Left"],
										["TOPRIGHT"] = L["Top Right"],
										["BOTTOMLEFT"] = L["Bottom Left"],
										["BOTTOMRIGHT"] = L["Bottom Right"],
									},
								},
								xOffset = {
									order = 3,
									type = 'range',
									name = L['xOffset'],
									min = -100, max = 100, step = 1,
									disabled = function() return E.private.general.minimap.hideCalendar end,
								},
								yOffset = {
									order = 4,
									type = 'range',
									name = L['yOffset'],
									min = -100, max = 100, step = 1,
									disabled = function() return E.private.general.minimap.hideCalendar end,
								},
								hideCalendar = {
									order = 5,
									type = 'toggle',
									name = L["Hide"],
									get = function(info) return E.private.general.minimap.hideCalendar end,
									set = function(info, value) E.private.general.minimap.hideCalendar = value; E:GetModule('Minimap'):UpdateSettings() end,
								},
							},
						},
						mail = {
							order = 3,
							type = 'group',
							name = MAIL_LABEL,
							get = function(info) return E.db.general.minimap.icons.mail[ info[#info] ] end,
							set = function(info, value) E.db.general.minimap.icons.mail[ info[#info] ] = value; E:GetModule('Minimap'):UpdateSettings() end,
							args = {
								scale = {
									order = 1,
									type = 'range',
									name = L["Scale"],
									min = 0.5, max = 2, step = 0.05,
								},
								position = {
									order = 2,
									type = 'select',
									name = L["Position"],
									values = {
										["LEFT"] = L["Left"],
										["RIGHT"] = L["Right"],
										["TOP"] = L["Top"],
										["BOTTOM"] = L["Bottom"],
										["TOPLEFT"] = L["Top Left"],
										["TOPRIGHT"] = L["Top Right"],
										["BOTTOMLEFT"] = L["Bottom Left"],
										["BOTTOMRIGHT"] = L["Bottom Right"],
									},
								},
								xOffset = {
									order = 3,
									type = 'range',
									name = L['xOffset'],
									min = -100, max = 100, step = 1,
								},
								yOffset = {
									order = 4,
									type = 'range',
									name = L['yOffset'],
									min = -100, max = 100, step = 1,
								},
							},
						},
						lfgEye = {
							order = 3,
							type = 'group',
							name = L['LFG Queue'],
							get = function(info) return E.db.general.minimap.icons.lfgEye[ info[#info] ] end,
							set = function(info, value) E.db.general.minimap.icons.lfgEye[ info[#info] ] = value; E:GetModule('Minimap'):UpdateSettings() end,
							args = {
								scale = {
									order = 1,
									type = 'range',
									name = L["Scale"],
									min = 0.5, max = 2, step = 0.05,
								},
								position = {
									order = 2,
									type = 'select',
									name = L["Position"],
									values = {
										["LEFT"] = L["Left"],
										["RIGHT"] = L["Right"],
										["TOP"] = L["Top"],
										["BOTTOM"] = L["Bottom"],
										["TOPLEFT"] = L["Top Left"],
										["TOPRIGHT"] = L["Top Right"],
										["BOTTOMLEFT"] = L["Bottom Left"],
										["BOTTOMRIGHT"] = L["Bottom Right"],
									},
								},
								xOffset = {
									order = 3,
									type = 'range',
									name = L['xOffset'],
									min = -100, max = 100, step = 1,
								},
								yOffset = {
									order = 4,
									type = 'range',
									name = L['yOffset'],
									min = -100, max = 100, step = 1,
								},
							},
						},
						difficulty = {
							order = 4,
							type = 'group',
							name = L['Instance Difficulty'],
							get = function(info) return E.db.general.minimap.icons.difficulty[ info[#info] ] end,
							set = function(info, value) E.db.general.minimap.icons.difficulty[ info[#info] ] = value; E:GetModule('Minimap'):UpdateSettings() end,
							args = {
								scale = {
									order = 1,
									type = 'range',
									name = L["Scale"],
									min = 0.5, max = 2, step = 0.05,
								},
								position = {
									order = 2,
									type = 'select',
									name = L["Position"],
									values = {
										["LEFT"] = L["Left"],
										["RIGHT"] = L["Right"],
										["TOP"] = L["Top"],
										["BOTTOM"] = L["Bottom"],
										["TOPLEFT"] = L["Top Left"],
										["TOPRIGHT"] = L["Top Right"],
										["BOTTOMLEFT"] = L["Bottom Left"],
										["BOTTOMRIGHT"] = L["Bottom Right"],
									},
								},
								xOffset = {
									order = 3,
									type = 'range',
									name = L['xOffset'],
									min = -100, max = 100, step = 1,
								},
								yOffset = {
									order = 4,
									type = 'range',
									name = L['yOffset'],
									min = -100, max = 100, step = 1,
								},
							},
						},
						challengeMode = {
							order = 5,
							type = 'group',
							name = CHALLENGE_MODE,
							get = function(info) return E.db.general.minimap.icons.challengeMode[ info[#info] ] end,
							set = function(info, value) E.db.general.minimap.icons.challengeMode[ info[#info] ] = value; E:GetModule('Minimap'):UpdateSettings() end,
							args = {
								scale = {
									order = 1,
									type = 'range',
									name = L["Scale"],
									min = 0.5, max = 2, step = 0.05,
								},
								position = {
									order = 2,
									type = 'select',
									name = L["Position"],
									values = {
										["LEFT"] = L["Left"],
										["RIGHT"] = L["Right"],
										["TOP"] = L["Top"],
										["BOTTOM"] = L["Bottom"],
										["TOPLEFT"] = L["Top Left"],
										["TOPRIGHT"] = L["Top Right"],
										["BOTTOMLEFT"] = L["Bottom Left"],
										["BOTTOMRIGHT"] = L["Bottom Right"],
									},
								},
								xOffset = {
									order = 3,
									type = 'range',
									name = L['xOffset'],
									min = -100, max = 100, step = 1,
								},
								yOffset = {
									order = 4,
									type = 'range',
									name = L['yOffset'],
									min = -100, max = 100, step = 1,
								},
							},
						},
					},
				},
			},		
		},
		experience = {
			order = 5,
			get = function(info) return E.db.general.experience[ info[#info] ] end,
			set = function(info, value) E.db.general.experience[ info[#info] ] = value; E:GetModule('Misc'):UpdateExpRepDimensions() end,		
			type = "group",
			name = XPBAR_LABEL,
			args = {
				enable = {
					order = 0,
					type = "toggle",
					name = L["Enable"],
					set = function(info, value) E.db.general.experience[ info[#info] ] = value; E:GetModule('Misc'):EnableDisable_ExperienceBar() end,
				},
				mouseover = {
					order = 1,
					type = "toggle",
					name = L['Mouseover'],
				},
				spacer = {
					order = 2,
					type = 'description',
					name = ' '
				},					
				width = {
					order = 3,
					type = "range",
					name = L["Width"],
					min = 2, max = 800, step = 1,
				},
				height = {
					order = 4,
					type = "range",
					name = L["Height"],
					min = 2, max = 800, step = 1,
				},
				orientation = {
					order = 5,
					type = "select",
					name = L['Orientation'],
					values = {
						['HORIZONTAL'] = L['Horizontal'],
						['VERTICAL'] = L['Vertical']
					}
				},				
				textFormat = {
					order = 6,
					type = 'select',
					name = L["Text Format"],
					values = {
						NONE = NONE,
						PERCENT = L["Percent"],
						CURMAX = L["Current - Max"],
						CURPERC = L["Current - Percent"],
					},
					set = function(info, value) E.db.general.experience[ info[#info] ] = value; E:GetModule('Misc'):UpdateExperience() end,
				},		
				textSize = {
					order = 7,
					name = L["Font Size"],
					type = "range",
					min = 6, max = 22, step = 1,		
				},				
			},
		},
		reputation = {
			order = 6,
			get = function(info) return E.db.general.reputation[ info[#info] ] end,
			set = function(info, value) E.db.general.reputation[ info[#info] ] = value; E:GetModule('Misc'):UpdateExpRepDimensions() end,		
			type = "group",
			name = REPUTATION,
			args = {
				enable = {
					order = 0,
					type = "toggle",
					name = L["Enable"],
					set = function(info, value) E.db.general.reputation[ info[#info] ] = value; E:GetModule('Misc'):EnableDisable_ReputationBar() end,
				},
				mouseover = {
					order = 1,
					type = "toggle",
					name = L['Mouseover'],
				},
				spacer = {
					order = 2,
					type = 'description',
					name = ' '
				},				
				width = {
					order = 3,
					type = "range",
					name = L["Width"],
					min = 2, max = 800, step = 1,
				},
				height = {
					order = 4,
					type = "range",
					name = L["Height"],
					min = 2, max = 800, step = 1,
				},
				orientation = {
					order = 5,
					type = "select",
					name = L['Orientation'],
					values = {
						['HORIZONTAL'] = L['Horizontal'],
						['VERTICAL'] = L['Vertical']
					}
				},					
				textFormat = {
					order = 6,
					type = 'select',
					name = L["Text Format"],
					values = {
						NONE = NONE,
						PERCENT = L["Percent"],
						CURMAX = L["Current - Max"],
						CURPERC = L["Current - Percent"],
					},
					set = function(info, value) E.db.general.reputation[ info[#info] ] = value; E:GetModule('Misc'):UpdateReputation() end,
				},		
				textSize = {
					order = 7,
					name = L["Font Size"],
					type = "range",
					min = 6, max = 22, step = 1,		
				},				
			},
		},	
		threat = {
			order = 7,
			get = function(info) return E.db.general.threat[ info[#info] ] end,
			set = function(info, value) E.db.general.threat[ info[#info] ] = value; E:GetModule('Threat'):ToggleEnable()end,		
			type = "group",
			name = L['Threat'],
			args = {
				enable = {
					order = 1,
					type = "toggle",
					name = L["Enable"],
				},
				position = {
					order = 2,
					type = 'select',
					name = L['Position'],
					desc = L['Adjust the position of the threat bar to either the left or right datatext panels.'],
					values = {
						['LEFTCHAT'] = L['Left Chat'],
						['RIGHTCHAT'] = L['Right Chat'],
					},
					set = function(info, value) E.db.general.threat[ info[#info] ] = value; E:GetModule('Threat'):UpdatePosition() end,	
				},
				textSize = {
					order = 3,
					name = L["Font Size"],
					type = "range",
					min = 6, max = 22, step = 1,	
					set = function(info, value) E.db.general.threat[ info[#info] ] = value; E:GetModule('Threat'):UpdatePosition() end,	
				},		
			},
		},	
		totems = {
			order = 8,
			type = "group",
			name = L["Class Bar"],
			get = function(info) return E.db.general.totems[ info[#info] ] end,
			set = function(info, value) E.db.general.totems[ info[#info] ] = value; E:GetModule('Totems'):PositionAndSize() end,
			args = {
				enable = {
					order = 1,
					type = "toggle",
					name = L["Enable"],
					set = function(info, value) E.db.general.totems[ info[#info] ] = value; E:GetModule('Totems'):ToggleEnable() end,
				},					
				size = {
					order = 2,
					type = 'range',
					name = L["Button Size"],
					min = 24, max = 60, step = 1,
				},
				spacing = {
					order = 3,
					type = 'range',
					name = L['Button Spacing'],
					min = 1, max = 10, step = 1,			
				},
				sortDirection = {
					order = 4,
					type = 'select',
					name = L["Sort Direction"],
					values = {
						['ASCENDING'] = L['Ascending'],
						['DESCENDING'] = L['Descending'],
					},
				},
				growthDirection = {
					order = 5,
					type = 'select',
					name = L['Bar Direction'],
					values = {
						['VERTICAL'] = L['Vertical'],
						['HORIZONTAL'] = L['Horizontal'],
					},
				},
			},
		},
		cooldown = {
			type = "group",
			order = 10,
			name = L['Cooldown Text'],
			get = function(info)
				local t = E.db.cooldown[ info[#info] ]
				local d = P.cooldown[info[#info]]
				return t.r, t.g, t.b, t.a, d.r, d.g, d.b
			end,
			set = function(info, r, g, b)
				E.db.cooldown[ info[#info] ] = {}
				local t = E.db.cooldown[ info[#info] ]
				t.r, t.g, t.b = r, g, b
				E:UpdateCooldownSettings();
			end,	
			args = {
				enable = {
					type = "toggle",
					order = 1,
					name = L['Enable'],
					desc = L['Display cooldown text on anything with the cooldown spiral.'],
					get = function(info) return E.private.cooldown[ info[#info] ] end,
					set = function(info, value) E.private.cooldown[ info[#info] ] = value; E:StaticPopup_Show("PRIVATE_RL") end				
				},			
				threshold = {
					type = 'range',
					name = L['Low Threshold'],
					desc = L['Threshold before text turns red and is in decimal form. Set to -1 for it to never turn red'],
					min = -1, max = 20, step = 1,	
					order = 2,
					get = function(info) return E.db.cooldown[ info[#info] ] end,
					set = function(info, value)
						E.db.cooldown[ info[#info] ] = value
						E:UpdateCooldownSettings();
					end,				
				},
				fontSize = {
					type = 'range',
					name = L["Font Size"],
					min = 5, max = 50, step = 1,
					order = 2,
					get = function(info) return E.db.cooldown.fontSize end,
					set = function(info, value)
						E.db.cooldown.fontSize = value
						E:UpdateCooldownSettings();
						E:StaticPopup_Show("PRIVATE_RL");
					end,
				},
				expiringColor = {
					type = 'color',
					order = 4,
					name = L['Expiring'],
					desc = L['Color when the text is about to expire'],					
				},
				secondsColor = {
					type = 'color',
					order = 5,
					name = L['Seconds'],
					desc = L['Color when the text is in the seconds format.'],			
				},
				minutesColor = {
					type = 'color',
					order = 6,
					name = L['Minutes'],
					desc = L['Color when the text is in the minutes format.'],		
				},
				hoursColor = {
					type = 'color',
					order = 7,
					name = L['Hours'],
					desc = L['Color when the text is in the hours format.'],				
				},	
				daysColor = {
					type = 'color',
					order = 8,
					name = L['Days'],
					desc = L['Color when the text is in the days format.'],			
				},				
			},
		},		
		objectiveFrame = {
			order = 11,
			type = "group",
			name = L['Objective Frame'],
			get = function(info) return E.db.general[ info[#info] ] end,
			set = function(info, value) E.db.general[ info[#info] ] = value end,
			args = {
				objectiveFrameHeight = {
					order = 1,
					type = 'range',
					name = L["Objective Frame Height"],
					desc = L["Height of the objective tracker. Increase size to be able to see more objectives."],
					min = 400, max = E.screenheight, step = 1,
					set = function(info, value) E.db.general.objectiveFrameHeight = value; E:GetModule('Blizzard'):ObjectiveFrameHeight(); end,
				},
				bonusObjectivePosition = {
					order = 2,
					type = 'select',
					name = L["Bonus Reward Position"],
					desc = L["Position of bonus quest reward frame relative to the objective tracker."],
					values = {
						['RIGHT'] = L["Right"],
						['LEFT'] = L["Left"],
						['AUTO'] = L["Auto"],
					},			
				},
			},
		},
	},	
}

local DONATOR_STRING = ""
local CNDONATOR_STRING = ""
local CNDONATOR_STRING2 = ""
local CNDONATOR_STRING3 = ""
local DEVELOPER_STRING = ""
local TESTER_STRING = ""
local LINE_BREAK = "\n"
local DONATORS = {
	"Dandruff",
	"Tobur/Tarilya",
	"Netu",
	"Alluren",
	"Thorgnir",
	"Emalal",
	"Bendmeova",
	"Curl",
	"Zarac",
	"Emmo",
	"Oz",
	"Hawké",
	"Aynya",
	"Tahira",
	"Karsten Lumbye Thomsen",
	"Thomas B. aka Pitschiqüü",
	"Sea Garnet",
	"Paul Storry",
	"Azagar",
	"Archury",
	"Donhorn",
	"Woodson Harmon",
	"Phoenyx",
	"Feat",
	"Konungr",
	"Leyrin",
	"Dragonsys",
	"Tkalec",
	"Paavi",
	"Giorgio",
	"Bearscantank",
	"Eidolic",
	"Cosmo",
	"Adorno",
	"Domoaligato",
	"Smorg"
}

local CNDONATORS = {
	"wxbbf",
	"sammyda",
	"zmmjoy1028",
	"lileimu0126",
	"happy_fly_pig",
	"lulu5205200701",
	"qq52776758",
	"lulu5205200701",
	"玩酷轨迹",
	"泉0510",
	"皮蛋oo",
	"雨季雷",
	"lmnno",
	"feliciagao",
	"炽天使zz",
	"忘归猪",
	"marger52",
	"maimang",
	"凌乱兰花",
	"不会吐泡的鱼",
	"gd2933",
	"realzhumen",
	"itachi_203",
	"wzadjl",
	"chaoyi3456",
	"shameless_pig",
	"chise1",
	"默默远去",
	"大只标",
	"波谲云诡1314",
	"大唐风羽",
	"叹息的足迹",
	"曦月刃语",
	"samwoody",
	"oinoon",
	"tb379270_2012",
	"被人踹下天",
	"风之路人11",
	"wargreymon1234",
	"chris6522",
	"情侣t恤",
	"lyq402631678",
	"silverhawx",
	"terrymu",
	"jianxinbang",
	"yydatou2",
	"liubin5381",
	"jh967354",
	"shome",
	"santon123",
	"chenyunlong00",
	"kaminakeita",
	"gypazyy",
	"belthil17",
	"deathduo",
	"吧嗒吧嗒大学生",
	"路过的羽毛",
	"open1648",
	"bigzmeng617",
	"geenar",
	"fxymike",
	"叶落心安",
	"duyu75526150",
	"jiangxuxing1985_",
	"上帝的知己",
	"atcc7212",
	"gugg594254843",
	"wawq919",
	"arler",
	"listzj",
	"xiaoxiao4433",
	"皮蛋仔sean",
	"路过的羽毛",
	"miaofu1982",
	"jedi_chen",
	"ryumiya",
	"孤独的饼子",
	"chenyn66",
	"醉恋琉璃",
	"ye2311",
	"cityrat",
	"zhaopeng0905",
	"hanuqq",
	"tb69493153",
	"亲亲丶亲爱的",
	"qcdz008",
	"来自淮安",
	"立派的变态",
	"快播小百合",
	"尤娜天使",
	"天国沙迦",
	"isyours",
	"xiaoshoushi",
	"chenguobao369",
	"刘晨曦1984",
	"许海飞xhf",
	"starryson",
	"lsy9202",
	"zpwbmw",
	"cz_lingling",
	"惋水语自然",
	"forpyp",
	"路过的羽毛",
	"66272089w",
	"wowmojovan",
	"huojey",
	"dlsdccdcc",
	"wuge19870501",
	"dongyizhi90",
	"奉天笑笑生",
	"fzh冯子豪",
	"玩酷轨迹",
	"wang730122wxk",
	"紫夜灬毒酒", --"卩灬丶丿王丶爷"
	"archer0808",
	"dark09",
	"ggl_axs",
	"宁夏红丶",
	"luxuxin530754137",
	"jyy402",
	"azur2e",
	"tb5187319_88",
	"豆子丶",
	"tb497346_2011",
	"橙子酱53105981",
	"foxsmely",
	"gorden_gan",
	"pjh79",
	"御剑乘风酒剑仙",
	"天若o有情_2009",
	"renchao15",
	"aierlanhai",
	"曾经丶烽",
	"linbin814619",
	"bysharrka",
	"ywj373303873",
	"aslick",
	"maling871128",
	"zhaokeith",
	"esc丶卟点",
	"shortland",
	"szc0635",
	"tatsuyahome",
	"aeon_sakura",
	"eddiegsp3",
	"血鹰幽灵",
	"levisli888",
	"jianshen3868",
	"elafor",
	"knight_5201314",	
	"咆哮的柴郡猫",
	"立派的变态",
	"yirong_sun",
	"永远的亚瑟",
	"孤星丶夜",
	"最帅的牛", --ianliuh
	"fht112233",
	"a503113120",
	"天王永存",
	"xiaoshoushi",
	"sasoricat",
	"巨烦人",
	"demodevil",
	"sandylester88",
	"临界冰封",
	"shxx_lee",
	"xiaxiaowei_516",
	"gongyong982715",
	"ivan90511",
	"kingyb26",
	"tb337033_99",
	"iverson21cn",
	"zoorre",
	"boatman13",
	"抢啊抢啊抢",
	"我是山猪2011",
	"Paramahamsa",  --shhope
	"bibi6",
	"肾不由己1989",
	"qyzod",
	"joydarken",
	"slovxy",
	"achongnrg",
	"leebv",
	"xj138154",
	"ley2008",
	"路过的羽毛",
	"wsyf8754210",
	"samsung_55",
	"q301076955",
	"宁静之神46566",
	"a13656506079",
	"hlcwin",
	"游离之魂",
	"sybasta",
	"orbneil",
	"好人fk",
	"sy04816leo",
	"heaven589",
	"zhouhao27",
	"feng9016",
	"kyuubifox",
	"tb425775_00",
	"kalrend",
	"lyqhzls14",
	"夭夭茶",
	"daftjoker",
	"我是山猪2011",
	"cfjie",
	"zuiairongx",
	"nomibuy",
	"小虎第一小虎第一",	
}
local CNDONATORS2 = {
	"买东西的jlu",
	"dizzy11",
	"baixf0703",
	"tb425775_00",
	"卷囡囡",
	"羽毛的标准",
	"fightingbug",
	"indigo0000",
	"tom60876",
	"mijiemijie198610",
	"akonwang1988 ",
	"tzlsj00",
	"杨柳岸残钺",
	"q489842856",
	"suancaihit",
	"dlsdccdcc",
	"我是山猪2011",
	"起床嘘嘘",
	"liudilin1992",
	"diyun0607",
	"yaibj",
	"雪线伊人",
	"k100992994",
	"小萨乐",
	"末日呈",
	"cesarmarui",
	"aihooo",
	"shadow477",
	"曲建行",
	"tessaex",
	"encili",
	"cutlass_sz",
	"c27346734",
	"computer0102",
	"jsjhgp1989",
	"caoshui_2008",
	"mingxiuyu",
	"123321awy",
	"藍幽魅兒",
	"hlf9527",
	"像雨一样忧伤",
	"hujintao8",
	"落雪无痕9371",
	"sunnying1218",
	"oenzoo",
	"一死谢天下",
	"shihaomrzhang",
	"jurane",
	"胖熊回家",
	"shajia221",
	"fzq5201",
	"sirius冲儿",
	"咆哮的柴郡猫",
	"sm00haha",
	"潘德威",
	"earldliu",
	"dubaoli060431",
	"醉爱无痕",
	"喜欢jing3",
	"蒋松儒",
	"sophie000088",
	"my58026",
	"ayoko",
	"狂暴之魂",
	"浮云丶寂凉",
	"clampjay12",
	"辛晓康",
	"ley2008",
	"awgy97",
	"longzi1439",
	"臭蛋小超人",
	"manstein623",
	"daivd_dai",
	"liangrouchang",
	"拉拉kop",
	"2wsx2005",
	"颓废的食神",
	"zhou_love_zhu",
	"makiyo0218",
	"ajijiawei1",
	"wjzh19940530",
	"林吴珂",
	"cjy530qs",
	"tb3182534_2011",
	"washhongname",
	"seven_夜",
	"豆子丶",
	"曹晨阳",
	"欧阳义煌",
	"sabarwow2",
	"qianjx8888",
	"ankang1666",
	"世界神殿",
	"dulluke",
	"xcx2200",
	"ss19880630",
	"a13946283",
	"tb425775_00",
	"木易念_张",
	"wangde649868",
	"tb843273_2011",
	"晨曦星",
	"cqing888",
	"wkw533038",
	"lxjdsmm",
	"口袋里的坦克",
	"tb95188807",
	"ghp1165",
	"remix熙",
	"马雁阳",
	"花已落下",
	"柒小7_7",
	"茶靡花事了",
	"riley1983",
	"shyzd",
	"與汝同思",
	"云蛋风轻kimi",
	"insov",
	"zp1989717",
	"ginraiy",
	"youdianfano",
	"东腿爸爸",
	"han30_0213",
	"asdf01989119",
	"gangerster",
	"msmicrosoft",
	"wenjianbin115",
	"wyang1027",
	"mdoexeryher",
	"堕落刺客.m",
	"polinell",
	"tb_ljx",
	"merkava3",
	"jaminjing",
	"雷亦歌",
	"vishnv",
	"布布的布",
	"摇不尽的风情", --max1032
	"zmy4528",
	"hlf9527",
	"枸杞子西洋参",
	"itoluthp",
	"lightbring",
	"thecrucifix",
	"a308253730",
	"chongchongok",
	"zerocraft",
	"上帝的知己",
	"月华无双",
	"马路西安",
	"龙骨平原-Drusus", --赵世康1
	"紫苑迷娈",
	"yoyo1943123",
	"爱的no1",
	"zytzx",
	"ajax1035",
	"一叫千门万户开",
	"b蜗牛",
	"wangziyueaacom",
	"x363170927",
	"青空的留白",
	"风蓝夕颜",
	"yxaml",
	"cumt001",
	"闫小幸0806",
	"wasky520",
	"快乐吖点",
	"冷芯琥珀",
	"tb267280_2013",
	"ouchukun",
	"wangzihyf",
	"mars89326",
	"mybackbone",
	"dubaoli060431",
	"markeloff95",
	"jxaa011975",
	"q87799",
	"68xing",
	"黄冬冬丶",
	"圣光一闪",--gaoqiyuan
	"乐taotao",
	"南宫之宇",
	"hotandcool",
	"cd86757",
	"薛云月11",
	"wsheng82",
	"买东西滴1982",
	"ph851112",
	"大藏乡",
	"wht3833",
	"传说有钱人",
	"sakrar",
	"飞火流枫",
	"小小woman",
	"bingheyizu",
	"x363170927",
	"且看风去风留d",
	"ephraimjj",
	"li729253213",
	"百羽百末",
	"li729253213",
	"guobenjing1992",
	"li729253213",
	"酃恋辰兮",
	"znxts",
	"li729253213",
	"默默远去",
	"laodiaozl",
	"soi一fong",
	"qwpmom",
	"丶丶丶夜冬 ",
	"起个b名想一周",
	"zhangqibei1993316",
	"春奈酱",--crazy9287
	"丨小小苏丨",
	"陨落的半神",--tb_2365641
	"ypy283217",
	"tb858705_22",
	"zkshahaha",
	"暧沐涕",
	"morrisduan",
	"大德无德",
	"lilolau",
	"王飞爱朦朦",
	"hisyf",
	"flynewhome",
}

local CNDONATORS3 = {
	"niwei831206",
	"霜月球",
	"ftx121416",
	"卫原明",
	"牛德华不牛",
	"jasonmaker",
	"insee884",
	"小新09180",
	"相思蓝枫叶",
	"q6890338",
	"kdiwang",
	"jqllove2",
	"ykp2008q",
	"tyadan",
	"52dulang",
	"国产金刚互撸娃",
	"antaxzj",
	"剧毒创伤",
	"我是山猪2011",
	"如风灬似水",
	"最爱回锅肉", --zhwfrank
	"zhpeng120",
	"psp星痕",
	"caatkl",
	"tb92330716",
	"gxy3223553",
	"lean28",
	"白403600533",
	"wwhdd96727",
	"波风皆人1314",
	"xlssce",
	"dwnokia",
	"aiken2132",
	"桔子的崩坏",
	"donkey_41",
	"a244988253",
	"跋扈的飞扬",
	"一筐包子",
	"miss采薇",
	"爱yy的蜗牛",
	"luanshun1",
	"诚意拍拍工作室",
	"a6322978",
	"mrxux",
	"nayazj",
	"ksanasetsuna",
	"cd122431897",
	"junny9985",
	"tb5370284_2011",
	"small871204",
	"yl50420031",
	"nj966",
	"zhao466807256",
	"丶丢雷劳模", --qq524991989  
	"牙牙xb",
	"zhouyx5",
	"testb35513",
	"爱购320",
	"freejansen",
	"ksanasetsuna",
	"何晓宇1993",
	"死亡之翼利维坦",--zhuyukai_kai
	"tb22004_34",
	"lxgxy520lx",
	"tb44963",
	"kiraxfree",
	"好名字全让取了",
	"天真的创伤",--myth家驹03
	"小小的皓轩",
	"影子_同学",
	"gangerster",
	"躺在七楼",
	"chaoren18ac",
	"salaleenom",
	"炫紫忧梦",
	"tb9769994",
	"口袋里的坦克",
	"罗凯健",
	"sagacityshen",
	"金大奇奇",
	"飘落的冰晶缘",
	"not_animals",
	"yszdlm2009",
	"wusi19821211",
	"丫丫的大唐",
	"铭记丶回忆",
	"a18627814951",
	"wuhao290",
	"春哥很疯狂",
	"王颛321",
	"春奈酱",--crazy9287
	"me丨白",
	"laolv198811",
	"zeratul44",
	"tonken2046",
	"kid_9463",
	"qiutiangoal",
	"jikai01c",
	"dcdb723",
	"dc910714dyz",
	"无名de信仰",
	"alicend",
	"th02689",
	"化作万风",
	"random_fly",
	"njjwl2005",
	"redgo111",
	"yerobin00",
	"渡_kitchen",
	"多多可爱多0408",
	"yumeng4442",
	"wendi_5",
	"yao19911019",
	"无缘之锋",
	"永恒的泡泡",
	"sookie",
	"gengye1860",
	"nan129588",
	"stalker11",
	"斐洛蒙",
	"exxx2014",
	"上帝的知己",
	"lovehein",
	"你买卖我卖买",
	"han30_0213",
	"sbh1941",
	"口袋里的坦克",
}

local DEVELOPERS = {
	"Tukz",
	"Haste",
	"Nightcracker",
	"Omega1970",
	"Hydrazine"
}

local TESTERS = {
	"Tukui Community",
	"Affinity",
	"Modarch",
	"Bladesdruid",
	"Tirain",
	"Phima",
	"Veiled",
	"Blazeflack",
	"Repooc",
	"Darth Predator",
	'Alex',
	'Nidra',
	'Kurhyus',
	'BuG',
	'Yachanay',
	'Catok'
}

if not E.zhlocale then
	tsort(DONATORS, function(a,b) return a < b end) --Alphabetize
	for _, donatorName in pairs(DONATORS) do
		tinsert(E.CreditsList, donatorName)
		DONATOR_STRING = DONATOR_STRING..LINE_BREAK..donatorName
	end

	tsort(DEVELOPERS, function(a,b) return a < b end) --Alphabetize
	for _, devName in pairs(DEVELOPERS) do
		tinsert(E.CreditsList, devName)
		DEVELOPER_STRING = DEVELOPER_STRING..LINE_BREAK..devName
	end

	tsort(TESTERS, function(a,b) return a < b end) --Alphabetize
	for _, testerName in pairs(TESTERS) do
		tinsert(E.CreditsList, testerName)
		TESTER_STRING = TESTER_STRING..LINE_BREAK..testerName
	end
else
	tsort(CNDONATORS, function(a,b) return a < b end) --Alphabetize
	for _, testerName in pairs(CNDONATORS) do
		tinsert(E.CreditsList, testerName)
	end
end	

local cni = 0
for _, cndonatorName in pairs(CNDONATORS) do
	cni = cni + 1
	if mod(cni, 20) == 0 then
		CNDONATOR_STRING = CNDONATOR_STRING..LINE_BREAK..LINE_BREAK..cndonatorName
	else
		CNDONATOR_STRING = CNDONATOR_STRING.. (CNDONATOR_STRING ~= "" and ", " or "")..cndonatorName
	end
end
cni = 0
for _, cndonatorName in pairs(CNDONATORS2) do
	cni = cni + 1
	if mod(cni, 20) == 0 then
		CNDONATOR_STRING2 = CNDONATOR_STRING2..LINE_BREAK..LINE_BREAK..cndonatorName
	else
		CNDONATOR_STRING2 = CNDONATOR_STRING2.. (CNDONATOR_STRING2 ~= "" and ", " or "")..cndonatorName
	end
end
cni = 0
for _, cndonatorName in pairs(CNDONATORS3) do
	cni = cni + 1
	if mod(cni, 20) == 0 then
		CNDONATOR_STRING3 = CNDONATOR_STRING3..LINE_BREAK..LINE_BREAK..cndonatorName
	else
		CNDONATOR_STRING3 = CNDONATOR_STRING3.. (CNDONATOR_STRING3 ~= "" and ", " or "")..cndonatorName
	end
end

E.Options.args.credits = {
	type = "group",
	name = L["Credits"],
	order = -2,
	args = {
		text = {
			order = 1,
			type = "description",
			fontSize = "medium",
			name = L['ELVUI_CREDITS']..'\n\n'..L['Coding:']..DEVELOPER_STRING..'\n\n'..L['Testing:']..TESTER_STRING..'\n\n'..L['Donations:']..DONATOR_STRING,
		},
	},
}

if E.zhlocale then
	E.Options.args.credits2 = {
		type = "group",
		name = L['Donations:']..'2',
		order = -1,
		args = {
			text = {
				order = 1,
				type = "description",
				fontSize = "medium",
				name = '',
			},
		},
	}
	E.Options.args.credits3 = {
		type = "group",
		name = L['Donations:']..'3',
		order = -1,
		args = {
			text = {
				order = 1,
				type = "description",
				fontSize = "medium",
				name = '',
			},
		},
	}	
	E.Options.args.credits.args.text.name = '|cffC495DD'.. L['EUI_DONATOR']..'|r\n\n\n'..CNDONATOR_STRING
	E.Options.args.credits2.args.text.name = '|cffC495DD'.. L['EUI_DONATOR']..'|r\n\n\n'..CNDONATOR_STRING2
	E.Options.args.credits3.args.text.name = '|cffC495DD'.. L['EUI_DONATOR']..'|r\n\n\n'..CNDONATOR_STRING3
	E.Options.args.credits.name = L['Donations:']
end


--Create Profiles Table
E.Options.args.profiles = LibStub("AceDBOptions-3.0"):GetOptionsTable(E.data);
AC:RegisterOptionsTable("ElvProfiles", E.Options.args.profiles)
E.Options.args.profiles.order = -10

LibStub('LibDualSpec-1.0'):EnhanceOptions(E.Options.args.profiles, E.data)

if not E.Options.args.profiles.plugins then
	E.Options.args.profiles.plugins = {}
end

E.Options.args.profiles.plugins["ElvUI"] = {
	desc = {
		name = L["This feature will allow you to transfer, settings to other characters."],
		type = 'description',
		order = 40.4,
	},
	distributeProfile = {
		name = L["Share Current Profile"],
		desc = L["Sends your current profile to your target."],
		type = 'execute',
		order = 40.5,
		func = function()
			if not UnitExists("target") or not UnitIsPlayer("target") or not UnitIsFriend("player", "target") or UnitIsUnit("player", "target") then
				E:Print(L["You must be targeting a player."])
				return
			end
			local name, server = UnitName("target")
			if name and (not server or server == "") then
				E:GetModule("Distributor"):Distribute(name)
			elseif server then
				E:GetModule("Distributor"):Distribute(name, true)
			end
		end,
	},
	distributeGlobal = {
		name = L["Share Filters"],
		desc = L["Sends your filter settings to your target."],
		type = 'execute',
		order = 40.6,
		func = function()
			if not UnitExists("target") or not UnitIsPlayer("target") or not UnitIsFriend("player", "target") or UnitIsUnit("player", "target") then
				E:Print(L["You must be targeting a player."])
				return
			end
			
			local name, server = UnitName("target")
			if name and (not server or server == "") then
				E:GetModule("Distributor"):Distribute(name, false, true)
			elseif server then
				E:GetModule("Distributor"):Distribute(name, true, true)
			end
		end,
	},		
}
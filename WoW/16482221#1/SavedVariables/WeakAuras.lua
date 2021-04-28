
WeakAurasSaved = {
	["dbVersion"] = 45,
	["displays"] = {
		["!돌"] = {
			["actions"] = {
				["finish"] = {
				},
				["init"] = {
					["custom"] = "-- Custom Option Key\naura_env.options = {'party', 'guild', 'spam'}\n\n-- Custom Option Table\naura_env.types = {}\n\nfor _, v in ipairs(aura_env.options) do\n    \n    if aura_env.config[\"enabled\"..v] then\n        aura_env.types[v] = true\n    end\n    \nend\n\n-- Keystone Item IDs\naura_env.ids = {\n    [138019] = true, -- Legion\n    [158923] = true, -- BfA\n    [180653] = true, -- Shadowlands\n    [151086] = true, -- Tournament\n}\n\n-- Make sure key is nil to force update\naura_env.key = nil\n\n-- Search the Bags for the item IDs from the table above\naura_env.update = function()\n    for bag = 0, NUM_BAG_SLOTS do\n        local bSlots = GetContainerNumSlots(bag)\n        for slot = 1, bSlots do\n            local itemLink, _, _, itemID = select(7, GetContainerItemInfo(bag, slot))\n            if aura_env.ids[itemID] then\n                aura_env.key = itemLink\n                return\n            end\n        end\n    end\nend\n\n-- Channel and Anti-Spam check\naura_env.link = function(channel)\n    \n    channel = channel or \"PARTY\"\n    \n    if channel == \"PARTY\" then\n        if aura_env.config.spam and (aura_env.timeParty or 0) > (GetTime() - 30) then\n            return\n        end\n        aura_env.timeParty = GetTime()\n    else\n        if aura_env.config.spam and (aura_env.timeGuild or 0) > (GetTime() - 30) then\n            return\n        end\n        aura_env.timeGuild = GetTime()\n    end\n    \n    if aura_env.key == nil then aura_env.update() end\n    if aura_env.key ~= nil then \n        SendChatMessage(aura_env.key..\" (\"..aura_env.covenantName..\")\", channel)\n    end\nend\n\n-- Covenant print (by Stanzilla)\nlocal covenantID = C_Covenants.GetActiveCovenantID()\nlocal data = C_Covenants.GetCovenantData(covenantID)\n\nif data then \n    aura_env.covenantName = data.name\nend",
					["do_custom"] = true,
				},
				["start"] = {
				},
			},
			["anchorFrameType"] = "SCREEN",
			["anchorPoint"] = "CENTER",
			["animation"] = {
				["finish"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["start"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
			},
			["authorOptions"] = {
				{
					["noMerge"] = true,
					["text"] = "Options",
					["type"] = "header",
					["useName"] = true,
					["width"] = 1,
				}, -- [1]
				{
					["default"] = true,
					["key"] = "party",
					["name"] = "Party Chat",
					["type"] = "toggle",
					["useDesc"] = false,
					["width"] = 1,
				}, -- [2]
				{
					["default"] = true,
					["key"] = "guild",
					["name"] = "Guild Chat",
					["type"] = "toggle",
					["useDesc"] = false,
					["width"] = 1,
				}, -- [3]
				{
					["default"] = true,
					["key"] = "spam",
					["name"] = "Spam Protection",
					["type"] = "toggle",
					["useDesc"] = false,
					["width"] = 1,
				}, -- [4]
				{
					["noMerge"] = true,
					["text"] = "Credits",
					["type"] = "header",
					["useName"] = true,
					["width"] = 1,
				}, -- [5]
				{
					["fontSize"] = "medium",
					["text"] = "Author: Luckyone (EU) - LaughingSkull\n\nDiscord: discord.gg/xRY4bwA\n\nCredits: AcidWeb, Azilroka, Buds",
					["type"] = "description",
					["width"] = 2,
				}, -- [6]
			},
			["automaticWidth"] = "Auto",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["config"] = {
				["guild"] = true,
				["party"] = true,
				["spam"] = true,
			},
			["customTextUpdate"] = "event",
			["desc"] = "Made by Luckyone",
			["displayText"] = "",
			["displayText_format_p_format"] = "timed",
			["displayText_format_p_time_dynamic_threshold"] = 60,
			["displayText_format_p_time_format"] = 0,
			["displayText_format_p_time_precision"] = 1,
			["fixedWidth"] = 200,
			["font"] = "Expressway",
			["fontSize"] = 12,
			["frameStrata"] = 2,
			["id"] = "!돌",
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["internalVersion"] = 45,
			["justify"] = "CENTER",
			["load"] = {
				["class"] = {
					["multi"] = {
					},
				},
				["level"] = "40",
				["level_operator"] = ">",
				["size"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["use_encounter"] = false,
				["use_level"] = true,
				["use_never"] = false,
				["zoneIds"] = "",
			},
			["outline"] = "OUTLINE",
			["preferToUpdate"] = false,
			["regionType"] = "text",
			["selfPoint"] = "CENTER",
			["semver"] = "4.3.0",
			["shadowColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["shadowXOffset"] = 0,
			["shadowYOffset"] = 0,
			["subRegions"] = {
			},
			["tocversion"] = 90005,
			["triggers"] = {
				[1] = {
					["trigger"] = {
						["custom"] = "function(event, message)\n    if event == \"BAG_UPDATE\" then\n        aura_env.update()\n    elseif message and (string.lower(message) == \"!keys\" or string.lower(message) == \"!돌\") then\n        if event == \"CHAT_MSG_GUILD\" and aura_env.config.guild then\n            aura_env.link(\"GUILD\")\n        elseif event ~= \"CHAT_MSG_GUILD\" and aura_env.config.party then\n            aura_env.link()\n        end\n    end\nend",
						["custom_hide"] = "timed",
						["custom_type"] = "event",
						["debuffType"] = "HELPFUL",
						["duration"] = "1",
						["dynamicDuration"] = true,
						["event"] = "Combat Log",
						["events"] = "BAG_UPDATE, CHAT_MSG_PARTY, CHAT_MSG_PARTY_LEADER, CHAT_MSG_GUILD",
						["names"] = {
						},
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "custom",
						["unevent"] = "timed",
						["unit"] = "player",
					},
					["untrigger"] = {
					},
				},
				["activeTriggerMode"] = -10,
			},
			["uid"] = "EwlIjQfR(4D",
			["url"] = "https://wago.io/bfakeys/32",
			["version"] = 32,
			["wordWrap"] = "WordWrap",
			["xOffset"] = 0,
			["yOffset"] = 0,
		},
		["04 Edge of Annihilation Initial Spawn / Duration"] = {
			["actions"] = {
				["finish"] = {
				},
				["init"] = {
				},
				["start"] = {
					["do_sound"] = false,
					["sound"] = " custom",
				},
			},
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["anchorPoint"] = "CENTER",
			["animation"] = {
				["finish"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["main"] = {
					["alpha"] = 0,
					["colorA"] = 1,
					["colorB"] = 0,
					["colorFunc"] = "    function(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n      local angle = (progress * 4 * math.pi) - (math.pi / 2)\n      local newProgress = ((math.sin(angle) + 1)/2);\n      return WeakAuras.GetHSVTransition(newProgress, r1, g1, b1, a1, r2, g2, b2, a2)\n    end\n  ",
					["colorG"] = 0.007843137254902,
					["colorR"] = 1,
					["colorType"] = "custom",
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["rotate"] = 0,
					["scalex"] = 1,
					["scaley"] = 1,
					["type"] = "none",
					["use_color"] = false,
					["x"] = 0,
					["y"] = 0,
				},
				["start"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
			},
			["authorOptions"] = {
			},
			["auto"] = false,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["conditions"] = {
				{
					["changes"] = {
						{
							["property"] = "sub.4.text_visible",
							["value"] = true,
						}, -- [1]
						{
							["property"] = "sub.1.text_visible",
							["value"] = false,
						}, -- [2]
						{
							["property"] = "sub.5.glow",
						}, -- [3]
						{
							["property"] = "desaturate",
							["value"] = true,
						}, -- [4]
						{
							["property"] = "sound",
							["value"] = {
								["sound"] = "Interface\\Addons\\SharedMedia_Causese\\sound\\Soon.ogg",
								["sound_channel"] = "Master",
								["sound_type"] = "Play",
							},
						}, -- [5]
					},
					["check"] = {
						["checks"] = {
							{
								["trigger"] = 1,
								["value"] = 0,
								["variable"] = "show",
							}, -- [1]
							{
								["trigger"] = 2,
								["value"] = 1,
								["variable"] = "show",
							}, -- [2]
						},
						["trigger"] = -2,
						["variable"] = "AND",
					},
				}, -- [1]
				{
					["changes"] = {
						{
							["property"] = "sound",
							["value"] = {
								["sound"] = "Interface\\Addons\\SharedMedia_Causese\\sound\\Avoid.ogg",
								["sound_channel"] = "Master",
								["sound_type"] = "Play",
							},
						}, -- [1]
					},
					["check"] = {
						["trigger"] = 1,
						["value"] = 1,
						["variable"] = "show",
					},
				}, -- [2]
			},
			["config"] = {
			},
			["cooldown"] = true,
			["cooldownEdge"] = false,
			["cooldownSwipe"] = true,
			["cooldownTextDisabled"] = true,
			["desaturate"] = false,
			["displayIcon"] = "2101973",
			["frameStrata"] = 1,
			["height"] = 80,
			["icon"] = true,
			["iconSource"] = -1,
			["id"] = "04 Edge of Annihilation Initial Spawn / Duration",
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["internalVersion"] = 45,
			["inverse"] = false,
			["keepAspectRatio"] = false,
			["load"] = {
				["class"] = {
					["multi"] = {
					},
				},
				["encounterid"] = "2405",
				["size"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["use_encounterid"] = true,
				["zoneIds"] = "",
			},
			["preferToUpdate"] = false,
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["semver"] = "1.0.141",
			["subRegions"] = {
				{
					["anchorXOffset"] = 0,
					["anchorYOffset"] = 0,
					["rotateText"] = "NONE",
					["text_anchorPoint"] = "OUTER_BOTTOM",
					["text_automaticWidth"] = "Auto",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_fixedWidth"] = 64,
					["text_font"] = "Arial Narrow",
					["text_fontSize"] = 16,
					["text_fontType"] = "OUTLINE",
					["text_justify"] = "CENTER",
					["text_selfPoint"] = "AUTO",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_shadowXOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["text_text"] = "Avoid",
					["text_text_format_s_format"] = "none",
					["text_text_format_tooltip1_format"] = "none",
					["text_visible"] = true,
					["text_wordWrap"] = "WordWrap",
					["type"] = "subtext",
				}, -- [1]
				{
					["anchorXOffset"] = 0,
					["anchorYOffset"] = 0,
					["rotateText"] = "NONE",
					["text_anchorPoint"] = "CENTER",
					["text_automaticWidth"] = "Auto",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_fixedWidth"] = 64,
					["text_font"] = "Friz Quadrata TT",
					["text_fontSize"] = 25,
					["text_fontType"] = "THICKOUTLINE",
					["text_justify"] = "CENTER",
					["text_selfPoint"] = "AUTO",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_shadowXOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["text_text"] = "%p",
					["text_text_format_p_format"] = "timed",
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["text_text_format_p_time_format"] = 0,
					["text_text_format_p_time_precision"] = 1,
					["text_visible"] = true,
					["text_wordWrap"] = "WordWrap",
					["type"] = "subtext",
				}, -- [2]
				{
					["anchorXOffset"] = 0,
					["anchorYOffset"] = 0,
					["rotateText"] = "NONE",
					["text_anchorPoint"] = "INNER_BOTTOMRIGHT",
					["text_anchorXOffset"] = 6,
					["text_anchorYOffset"] = -6,
					["text_automaticWidth"] = "Auto",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_fixedWidth"] = 64,
					["text_font"] = "Arial Narrow",
					["text_fontSize"] = 25,
					["text_fontType"] = "OUTLINE",
					["text_justify"] = "CENTER",
					["text_selfPoint"] = "AUTO",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_shadowXOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["text_text"] = "%s",
					["text_text_format_p_format"] = "timed",
					["text_text_format_p_time_dynamic_threshold"] = 60,
					["text_text_format_p_time_format"] = 0,
					["text_text_format_p_time_precision"] = 1,
					["text_text_format_s_format"] = "none",
					["text_visible"] = false,
					["text_wordWrap"] = "WordWrap",
					["type"] = "subtext",
				}, -- [3]
				{
					["anchorXOffset"] = 0,
					["anchorYOffset"] = 0,
					["rotateText"] = "NONE",
					["text_anchorPoint"] = "OUTER_BOTTOM",
					["text_automaticWidth"] = "Auto",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_fixedWidth"] = 64,
					["text_font"] = "Arial Narrow",
					["text_fontSize"] = 16,
					["text_fontType"] = "OUTLINE",
					["text_justify"] = "CENTER",
					["text_selfPoint"] = "AUTO",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_shadowXOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["text_text"] = "Avoid Inc",
					["text_text_format_p_format"] = "timed",
					["text_text_format_p_time_dynamic_threshold"] = 60,
					["text_text_format_p_time_format"] = 0,
					["text_text_format_p_time_precision"] = 1,
					["text_visible"] = false,
					["text_wordWrap"] = "WordWrap",
					["type"] = "subtext",
				}, -- [4]
				{
					["glow"] = true,
					["glowBorder"] = false,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["glowFrequency"] = 0.25,
					["glowLength"] = 10,
					["glowLines"] = 18,
					["glowScale"] = 1,
					["glowThickness"] = 2.15,
					["glowType"] = "Pixel",
					["glowXOffset"] = 0,
					["glowYOffset"] = 0,
					["type"] = "subglow",
					["useGlowColor"] = true,
				}, -- [5]
			},
			["tocversion"] = 90002,
			["triggers"] = {
				[1] = {
					["trigger"] = {
						["auranames"] = {
						},
						["debuffType"] = "HARMFUL",
						["duration"] = "10",
						["event"] = "Combat Log",
						["fetchTooltip"] = false,
						["genericShowOn"] = "showOnCooldown",
						["names"] = {
						},
						["realSpellName"] = 0,
						["spellId"] = "328789",
						["spellIds"] = {
						},
						["spellName"] = 0,
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "combatlog",
						["unevent"] = "timed",
						["unit"] = "boss1",
						["useName"] = true,
						["use_absorbMode"] = true,
						["use_genericShowOn"] = true,
						["use_specific_unit"] = true,
						["use_spellId"] = true,
						["use_spellName"] = false,
						["use_track"] = true,
						["use_unit"] = true,
					},
					["untrigger"] = {
						["unit"] = "boss1",
						["use_specific_unit"] = true,
					},
				},
				[2] = {
					["trigger"] = {
						["check"] = "event",
						["custom"] = "function(allstates, event, ...)\n    if event == \"UNIT_SPELLCAST_START\" then\n        local unit, _, spellID = ...\n        if unit and spellID == 328880 then\n            local _, _, _, startMS, endMS, _, _, _, spellId = UnitCastingInfo(unit)\n            if spellId\n            and spellId == spellID then \n                allstates[spellID] = {\n                    show = true,\n                    changed = true,\n                    progressType = \"timed\",\n                    duration = ((endMS-startMS)/1000) + 6,\n                    expirationTime = (endMS/1000) + 6,\n                    autoHide = true,\n                } \n                return true\n            end\n        end\n    end\nend",
						["custom_hide"] = "timed",
						["custom_type"] = "stateupdate",
						["debuffType"] = "HELPFUL",
						["events"] = "UNIT_SPELLCAST_START:boss1",
						["type"] = "custom",
						["unit"] = "player",
					},
					["untrigger"] = {
					},
				},
				["activeTriggerMode"] = -10,
				["customTriggerLogic"] = "function(t)\n    return t[1] or t[2] and not t[1]\nend",
				["disjunctive"] = "custom",
			},
			["uid"] = "lOzpr993)wz",
			["url"] = "https://wago.io/slraid1/142",
			["version"] = 142,
			["width"] = 80,
			["xOffset"] = 0,
			["yOffset"] = 0,
			["zoom"] = 0.3,
		},
		["Belligerent Boast"] = {
			["actions"] = {
				["finish"] = {
				},
				["init"] = {
				},
				["start"] = {
					["do_sound"] = false,
					["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\BikeHorn.ogg",
				},
			},
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["anchorPoint"] = "CENTER",
			["animation"] = {
				["finish"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["start"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
			},
			["authorOptions"] = {
			},
			["auto"] = true,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["conditions"] = {
				{
					["changes"] = {
						{
							["property"] = "sub.2.text_visible",
						}, -- [1]
						{
							["property"] = "sub.3.text_visible",
							["value"] = true,
						}, -- [2]
						{
							["property"] = "sub.1.glow",
							["value"] = true,
						}, -- [3]
						{
							["property"] = "sound",
							["value"] = {
								["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\BikeHorn.ogg",
								["sound_channel"] = "Master",
								["sound_type"] = "Play",
							},
						}, -- [4]
					},
					["check"] = {
						["trigger"] = 2,
						["value"] = 1,
						["variable"] = "show",
					},
				}, -- [1]
				{
					["changes"] = {
						{
							["property"] = "chat",
							["value"] = {
								["message"] = "3",
								["message_type"] = "SAY",
							},
						}, -- [1]
					},
					["check"] = {
						["checks"] = {
							{
								["value"] = 1,
								["variable"] = "show",
							}, -- [1]
							{
								["op"] = "<=",
								["trigger"] = 2,
								["value"] = "3",
								["variable"] = "expirationTime",
							}, -- [2]
						},
						["op"] = "<=",
						["trigger"] = -2,
						["variable"] = "AND",
					},
				}, -- [2]
				{
					["changes"] = {
						{
							["property"] = "chat",
							["value"] = {
								["message"] = "2",
								["message_type"] = "SAY",
							},
						}, -- [1]
					},
					["check"] = {
						["checks"] = {
							{
								["value"] = 1,
								["variable"] = "show",
							}, -- [1]
							{
								["op"] = "<=",
								["trigger"] = 2,
								["value"] = "2",
								["variable"] = "expirationTime",
							}, -- [2]
						},
						["op"] = "<=",
						["trigger"] = -2,
						["variable"] = "AND",
					},
				}, -- [3]
				{
					["changes"] = {
						{
							["property"] = "chat",
							["value"] = {
								["message"] = "1",
								["message_type"] = "SAY",
							},
						}, -- [1]
					},
					["check"] = {
						["checks"] = {
							{
								["value"] = 1,
								["variable"] = "show",
							}, -- [1]
							{
								["op"] = "<=",
								["trigger"] = 2,
								["value"] = "1",
								["variable"] = "expirationTime",
							}, -- [2]
						},
						["op"] = "<=",
						["trigger"] = -2,
						["variable"] = "AND",
					},
				}, -- [4]
			},
			["config"] = {
			},
			["cooldown"] = true,
			["cooldownEdge"] = false,
			["cooldownSwipe"] = true,
			["cooldownTextDisabled"] = false,
			["desaturate"] = false,
			["displayIcon"] = "3528311",
			["frameStrata"] = 1,
			["height"] = 50,
			["icon"] = true,
			["iconSource"] = -1,
			["id"] = "Belligerent Boast",
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["internalVersion"] = 45,
			["inverse"] = false,
			["keepAspectRatio"] = false,
			["load"] = {
				["affixes"] = {
					["multi"] = {
						[121] = true,
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["use_affixes"] = false,
				["zoneIds"] = "",
			},
			["parent"] = "Dungeons - Mythic+ Affixes ",
			["preferToUpdate"] = false,
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["semver"] = "1.0.3",
			["subRegions"] = {
				{
					["glow"] = false,
					["glowBorder"] = false,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["glowFrequency"] = 0.25,
					["glowLength"] = 10,
					["glowLines"] = 8,
					["glowScale"] = 1,
					["glowThickness"] = 1,
					["glowType"] = "buttonOverlay",
					["glowXOffset"] = 0,
					["glowYOffset"] = 0,
					["type"] = "subglow",
					["useGlowColor"] = false,
				}, -- [1]
				{
					["anchorXOffset"] = 0,
					["anchorYOffset"] = 0,
					["rotateText"] = "NONE",
					["text_anchorPoint"] = "OUTER_BOTTOM",
					["text_automaticWidth"] = "Auto",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_fixedWidth"] = 64,
					["text_font"] = "Friz Quadrata TT",
					["text_fontSize"] = 12,
					["text_fontType"] = "OUTLINE",
					["text_justify"] = "CENTER",
					["text_selfPoint"] = "AUTO",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_shadowXOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["text_text"] = "%1.unit",
					["text_text_format_1.unitName_abbreviate"] = false,
					["text_text_format_1.unitName_abbreviate_max"] = 8,
					["text_text_format_1.unitName_color"] = "class",
					["text_text_format_1.unitName_format"] = "Unit",
					["text_text_format_1.unitName_realm_name"] = "never",
					["text_text_format_1.unit_abbreviate"] = true,
					["text_text_format_1.unit_abbreviate_max"] = 7,
					["text_text_format_1.unit_color"] = "class",
					["text_text_format_1.unit_format"] = "Unit",
					["text_text_format_1.unit_realm_name"] = "never",
					["text_text_format_p_format"] = "timed",
					["text_text_format_p_time_dynamic_threshold"] = 60,
					["text_text_format_p_time_format"] = 0,
					["text_text_format_p_time_precision"] = 1,
					["text_text_format_unitName_abbreviate"] = false,
					["text_text_format_unitName_abbreviate_max"] = 8,
					["text_text_format_unitName_color"] = "class",
					["text_text_format_unitName_format"] = "Unit",
					["text_text_format_unitName_realm_name"] = "never",
					["text_visible"] = true,
					["text_wordWrap"] = "WordWrap",
					["type"] = "subtext",
				}, -- [2]
				{
					["anchorXOffset"] = 0,
					["anchorYOffset"] = 0,
					["rotateText"] = "NONE",
					["text_anchorPoint"] = "OUTER_BOTTOM",
					["text_automaticWidth"] = "Auto",
					["text_color"] = {
						1, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_fixedWidth"] = 64,
					["text_font"] = "Friz Quadrata TT",
					["text_fontSize"] = 12,
					["text_fontType"] = "OUTLINE",
					["text_justify"] = "CENTER",
					["text_selfPoint"] = "AUTO",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_shadowXOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["text_text"] = "On You",
					["text_text_format_p_format"] = "timed",
					["text_text_format_p_time_dynamic_threshold"] = 60,
					["text_text_format_p_time_format"] = 0,
					["text_text_format_p_time_precision"] = 1,
					["text_visible"] = false,
					["text_wordWrap"] = "WordWrap",
					["type"] = "subtext",
				}, -- [3]
			},
			["tocversion"] = 90002,
			["triggers"] = {
				[1] = {
					["trigger"] = {
						["auranames"] = {
							"342466", -- [1]
						},
						["auraspellids"] = {
							"342466", -- [1]
						},
						["debuffType"] = "HARMFUL",
						["duration"] = "7",
						["event"] = "Cooldown Progress (Spell)",
						["genericShowOn"] = "showOnCooldown",
						["match_count"] = "0",
						["match_countOperator"] = ">",
						["names"] = {
						},
						["realSpellName"] = 0,
						["spellId"] = "342466",
						["spellIds"] = {
						},
						["spellName"] = 0,
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_SUCCESS",
						["type"] = "aura2",
						["unevent"] = "auto",
						["unit"] = "group",
						["useExactSpellId"] = true,
						["useMatch_count"] = true,
						["useName"] = false,
						["use_genericShowOn"] = true,
						["use_spellId"] = true,
						["use_spellName"] = true,
						["use_track"] = true,
					},
					["untrigger"] = {
					},
				},
				[2] = {
					["trigger"] = {
						["auranames"] = {
							"342466", -- [1]
						},
						["auraspellids"] = {
							"342466", -- [1]
						},
						["debuffType"] = "HARMFUL",
						["duration"] = "7",
						["event"] = "Cooldown Progress (Spell)",
						["genericShowOn"] = "showOnCooldown",
						["match_count"] = "0",
						["match_countOperator"] = ">",
						["names"] = {
						},
						["realSpellName"] = 0,
						["spellId"] = "342466",
						["spellIds"] = {
						},
						["spellName"] = 0,
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_SUCCESS",
						["type"] = "aura2",
						["unevent"] = "auto",
						["unit"] = "player",
						["useExactSpellId"] = true,
						["useMatch_count"] = true,
						["useName"] = false,
						["use_genericShowOn"] = true,
						["use_spellId"] = true,
						["use_spellName"] = true,
						["use_track"] = true,
					},
					["untrigger"] = {
					},
				},
				["activeTriggerMode"] = -10,
				["customTriggerLogic"] = "function(t)\n    return t[1] or t[2] and t[3]\nend\n\n\n",
				["disjunctive"] = "any",
			},
			["uid"] = "mencn4TFY64",
			["url"] = "https://wago.io/EE8ENuch7/4",
			["version"] = 4,
			["width"] = 50,
			["xOffset"] = 210,
			["yOffset"] = -340,
			["zoom"] = 0.3,
		},
		["Belligerent Boast CD"] = {
			["actions"] = {
				["finish"] = {
				},
				["init"] = {
				},
				["start"] = {
				},
			},
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["anchorPoint"] = "CENTER",
			["animation"] = {
				["finish"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["start"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
			},
			["authorOptions"] = {
			},
			["auto"] = false,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["config"] = {
			},
			["cooldown"] = true,
			["cooldownEdge"] = false,
			["cooldownSwipe"] = true,
			["cooldownTextDisabled"] = false,
			["desaturate"] = false,
			["displayIcon"] = "3528311",
			["frameStrata"] = 1,
			["height"] = 50,
			["icon"] = true,
			["iconSource"] = 0,
			["id"] = "Belligerent Boast CD",
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["internalVersion"] = 45,
			["inverse"] = false,
			["keepAspectRatio"] = false,
			["load"] = {
				["affixes"] = {
					["multi"] = {
						[121] = true,
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["use_affixes"] = false,
				["zoneIds"] = "",
			},
			["parent"] = "Dungeons - Mythic+ Affixes ",
			["preferToUpdate"] = false,
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["semver"] = "1.0.3",
			["subRegions"] = {
				{
					["glow"] = false,
					["glowBorder"] = false,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["glowFrequency"] = 0.25,
					["glowLength"] = 10,
					["glowLines"] = 8,
					["glowScale"] = 1,
					["glowThickness"] = 1,
					["glowType"] = "buttonOverlay",
					["glowXOffset"] = 0,
					["glowYOffset"] = 0,
					["type"] = "subglow",
					["useGlowColor"] = false,
				}, -- [1]
				{
					["anchorXOffset"] = 0,
					["anchorYOffset"] = 0,
					["rotateText"] = "NONE",
					["text_anchorPoint"] = "OUTER_BOTTOM",
					["text_automaticWidth"] = "Auto",
					["text_color"] = {
						1, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_fixedWidth"] = 64,
					["text_font"] = "Friz Quadrata TT",
					["text_fontSize"] = 12,
					["text_fontType"] = "OUTLINE",
					["text_justify"] = "CENTER",
					["text_selfPoint"] = "AUTO",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_shadowXOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["text_text"] = "CD",
					["text_text_format_p_format"] = "timed",
					["text_text_format_p_time_dynamic_threshold"] = 60,
					["text_text_format_p_time_format"] = 0,
					["text_text_format_p_time_precision"] = 1,
					["text_visible"] = true,
					["text_wordWrap"] = "WordWrap",
					["type"] = "subtext",
				}, -- [2]
			},
			["tocversion"] = 90002,
			["triggers"] = {
				[1] = {
					["trigger"] = {
						["auranames"] = {
							"340880", -- [1]
						},
						["debuffType"] = "HELPFUL",
						["duration"] = "7",
						["event"] = "Combat Log",
						["names"] = {
						},
						["spellId"] = "342466",
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_AURA_APPLIED",
						["type"] = "combatlog",
						["unevent"] = "timed",
						["unit"] = "player",
						["useName"] = true,
						["use_spellId"] = true,
					},
					["untrigger"] = {
					},
				},
				[2] = {
					["trigger"] = {
						["auranames"] = {
							"342466", -- [1]
						},
						["debuffType"] = "HARMFUL",
						["type"] = "aura2",
						["unit"] = "player",
						["useName"] = true,
					},
					["untrigger"] = {
					},
				},
				[3] = {
					["trigger"] = {
						["auranames"] = {
							"342466", -- [1]
						},
						["debuffType"] = "HARMFUL",
						["match_count"] = "0",
						["match_countOperator"] = ">",
						["type"] = "aura2",
						["unit"] = "group",
						["useMatch_count"] = true,
						["useName"] = true,
					},
					["untrigger"] = {
					},
				},
				["activeTriggerMode"] = -10,
				["customTriggerLogic"] = "function(t)\n    return t[1] and not (t[2] or t[3])\nend\n\n\n",
				["disjunctive"] = "custom",
			},
			["uid"] = "9y)kMLsIlCW",
			["url"] = "https://wago.io/EE8ENuch7/4",
			["version"] = 4,
			["width"] = 50,
			["xOffset"] = 210,
			["yOffset"] = -340,
			["zoom"] = 0.3,
		},
		["Bursting"] = {
			["actions"] = {
				["finish"] = {
				},
				["init"] = {
				},
				["start"] = {
				},
			},
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["anchorPoint"] = "CENTER",
			["animation"] = {
				["finish"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["start"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
			},
			["authorOptions"] = {
			},
			["auto"] = true,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["config"] = {
			},
			["cooldown"] = true,
			["cooldownEdge"] = false,
			["cooldownSwipe"] = true,
			["cooldownTextDisabled"] = false,
			["cooldownTextEnabled"] = true,
			["customTextUpdate"] = "update",
			["desaturate"] = false,
			["frameStrata"] = 1,
			["height"] = 50,
			["icon"] = true,
			["iconSource"] = -1,
			["id"] = "Bursting",
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["internalVersion"] = 45,
			["inverse"] = true,
			["keepAspectRatio"] = false,
			["load"] = {
				["affixes"] = {
					["multi"] = {
					},
					["single"] = 11,
				},
				["class"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
						["challenge"] = true,
					},
					["single"] = "challenge",
				},
				["faction"] = {
					["multi"] = {
					},
				},
				["ingroup"] = {
					["multi"] = {
					},
				},
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["role"] = {
					["multi"] = {
						["DAMAGER"] = true,
						["HEALER"] = true,
						["TANK"] = true,
					},
				},
				["size"] = {
					["multi"] = {
						["party"] = true,
					},
					["single"] = "party",
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["talent2"] = {
					["multi"] = {
					},
				},
				["talent3"] = {
					["multi"] = {
					},
				},
				["use_affixes"] = true,
				["use_difficulty"] = true,
				["use_never"] = false,
				["use_size"] = true,
				["zoneIds"] = "",
			},
			["parent"] = "Dungeons - Mythic+ Affixes ",
			["preferToUpdate"] = false,
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["semver"] = "1.0.3",
			["stickyDuration"] = false,
			["subRegions"] = {
				{
					["anchorXOffset"] = 0,
					["anchorYOffset"] = 0,
					["rotateText"] = "NONE",
					["text_anchorPoint"] = "INNER_BOTTOMRIGHT",
					["text_automaticWidth"] = "Auto",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_fixedWidth"] = 64,
					["text_font"] = "Friz Quadrata TT",
					["text_fontSize"] = 18,
					["text_fontType"] = "OUTLINE",
					["text_justify"] = "CENTER",
					["text_selfPoint"] = "AUTO",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_shadowXOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["text_text"] = "%s",
					["text_text_format_s_format"] = "none",
					["text_visible"] = true,
					["text_wordWrap"] = "WordWrap",
					["type"] = "subtext",
				}, -- [1]
			},
			["tocversion"] = 90002,
			["triggers"] = {
				[1] = {
					["trigger"] = {
						["auraspellids"] = {
							"240443", -- [1]
						},
						["buffShowOn"] = "showOnActive",
						["debuffType"] = "HARMFUL",
						["event"] = "Health",
						["fullscan"] = true,
						["name"] = "Burst",
						["name_operator"] = "==",
						["names"] = {
							"Burst", -- [1]
						},
						["spellId"] = 240443,
						["spellIds"] = {
							240443, -- [1]
						},
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "aura2",
						["unit"] = "player",
						["useExactSpellId"] = true,
						["use_name"] = true,
						["use_spellId"] = true,
					},
					["untrigger"] = {
					},
				},
				["activeTriggerMode"] = -10,
				["disjunctive"] = "all",
			},
			["uid"] = "i5vfJS3wZme",
			["url"] = "https://wago.io/EE8ENuch7/4",
			["version"] = 4,
			["width"] = 50,
			["xOffset"] = 210,
			["yOffset"] = -340,
			["zoom"] = 0,
		},
		["Bursting with Pride Stacks"] = {
			["actions"] = {
				["finish"] = {
				},
				["init"] = {
				},
				["start"] = {
				},
			},
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["anchorPoint"] = "CENTER",
			["animation"] = {
				["finish"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["start"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
			},
			["authorOptions"] = {
			},
			["auto"] = true,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["config"] = {
			},
			["cooldown"] = true,
			["cooldownEdge"] = false,
			["cooldownSwipe"] = true,
			["cooldownTextDisabled"] = false,
			["desaturate"] = false,
			["displayIcon"] = "3528307",
			["frameStrata"] = 1,
			["height"] = 50,
			["icon"] = true,
			["iconSource"] = -1,
			["id"] = "Bursting with Pride Stacks",
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["internalVersion"] = 45,
			["inverse"] = false,
			["keepAspectRatio"] = false,
			["load"] = {
				["affixes"] = {
					["multi"] = {
						[121] = true,
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["use_affixes"] = false,
				["zoneIds"] = "",
			},
			["parent"] = "Dungeons - Mythic+ Affixes ",
			["preferToUpdate"] = false,
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["semver"] = "1.0.3",
			["subRegions"] = {
				{
					["glow"] = false,
					["glowBorder"] = false,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["glowFrequency"] = 0.25,
					["glowLength"] = 10,
					["glowLines"] = 8,
					["glowScale"] = 1,
					["glowThickness"] = 1,
					["glowType"] = "buttonOverlay",
					["glowXOffset"] = 0,
					["glowYOffset"] = 0,
					["type"] = "subglow",
					["useGlowColor"] = false,
				}, -- [1]
				{
					["anchorXOffset"] = 0,
					["anchorYOffset"] = 0,
					["rotateText"] = "NONE",
					["text_anchorPoint"] = "OUTER_BOTTOM",
					["text_automaticWidth"] = "Auto",
					["text_color"] = {
						1, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_fixedWidth"] = 64,
					["text_font"] = "Friz Quadrata TT",
					["text_fontSize"] = 12,
					["text_fontType"] = "OUTLINE",
					["text_justify"] = "CENTER",
					["text_selfPoint"] = "AUTO",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_shadowXOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["text_text"] = "AoE",
					["text_text_format_p_format"] = "timed",
					["text_text_format_p_time_dynamic_threshold"] = 60,
					["text_text_format_p_time_format"] = 0,
					["text_text_format_p_time_precision"] = 1,
					["text_text_format_s_format"] = "none",
					["text_visible"] = true,
					["text_wordWrap"] = "WordWrap",
					["type"] = "subtext",
				}, -- [2]
				{
					["anchorXOffset"] = 0,
					["anchorYOffset"] = 0,
					["rotateText"] = "NONE",
					["text_anchorPoint"] = "INNER_BOTTOMRIGHT",
					["text_automaticWidth"] = "Auto",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_fixedWidth"] = 64,
					["text_font"] = "Friz Quadrata TT",
					["text_fontSize"] = 14,
					["text_fontType"] = "OUTLINE",
					["text_justify"] = "CENTER",
					["text_selfPoint"] = "AUTO",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_shadowXOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["text_text"] = "%2.s",
					["text_text_format_2.s_format"] = "none",
					["text_text_format_p_format"] = "timed",
					["text_text_format_p_time_dynamic_threshold"] = 60,
					["text_text_format_p_time_format"] = 0,
					["text_text_format_p_time_precision"] = 1,
					["text_text_format_s_format"] = "none",
					["text_visible"] = true,
					["text_wordWrap"] = "WordWrap",
					["type"] = "subtext",
				}, -- [3]
			},
			["tocversion"] = 90002,
			["triggers"] = {
				[1] = {
					["trigger"] = {
						["debuffType"] = "HELPFUL",
						["duration"] = "2",
						["event"] = "Combat Log",
						["genericShowOn"] = "showOnCooldown",
						["names"] = {
						},
						["realSpellName"] = 0,
						["spellId"] = "340873",
						["spellIds"] = {
						},
						["spellName"] = 0,
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_AURA_APPLIED_DOSE",
						["type"] = "combatlog",
						["unevent"] = "timed",
						["unit"] = "player",
						["use_genericShowOn"] = true,
						["use_spellId"] = true,
						["use_spellName"] = false,
						["use_track"] = true,
					},
					["untrigger"] = {
					},
				},
				[2] = {
					["trigger"] = {
						["auranames"] = {
							"340873", -- [1]
						},
						["debuffType"] = "HELPFUL",
						["event"] = "Health",
						["fetchTooltip"] = true,
						["match_count"] = "0",
						["match_countOperator"] = ">",
						["names"] = {
						},
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "aura2",
						["unit"] = "nameplate",
						["useMatch_count"] = true,
						["useName"] = true,
					},
					["untrigger"] = {
					},
				},
				["activeTriggerMode"] = -10,
				["disjunctive"] = "any",
			},
			["uid"] = "LbQrgIfAdYj",
			["url"] = "https://wago.io/EE8ENuch7/4",
			["version"] = 4,
			["width"] = 50,
			["xOffset"] = 210,
			["yOffset"] = -340,
			["zoom"] = 0.3,
		},
		["Deathwalker's Spirit Fixate Nameplate Indicator"] = {
			["actions"] = {
				["finish"] = {
				},
				["init"] = {
					["custom"] = "aura_env.guids  = {}\naura_env.trackedUnitName = \"원한의 망령\"",
					["do_custom"] = true,
				},
				["start"] = {
					["do_sound"] = true,
					["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\AirHorn.ogg",
					["sound_channel"] = "Master",
				},
			},
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["anchorPoint"] = "CENTER",
			["animation"] = {
				["finish"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["start"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
			},
			["authorOptions"] = {
				{
					["bigStep"] = 1,
					["default"] = 0,
					["key"] = "xOffset",
					["max"] = 200,
					["min"] = -200,
					["name"] = "X-Offset",
					["step"] = 1,
					["type"] = "range",
					["useDesc"] = false,
					["width"] = 1,
				}, -- [1]
				{
					["bigStep"] = 1,
					["default"] = 0,
					["key"] = "yOffset",
					["max"] = 200,
					["min"] = -200,
					["name"] = "Y-Offset",
					["step"] = 1,
					["type"] = "range",
					["useDesc"] = false,
					["width"] = 1,
				}, -- [2]
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["conditions"] = {
				{
					["changes"] = {
						{
						}, -- [1]
					},
					["check"] = {
					},
				}, -- [1]
			},
			["config"] = {
				["xOffset"] = 50,
				["yOffset"] = -10,
			},
			["cooldown"] = false,
			["cooldownEdge"] = false,
			["cooldownSwipe"] = true,
			["cooldownTextDisabled"] = false,
			["customText"] = "function()\n    if aura_env.state and aura_env.state.PassUnit then\n        local region = aura_env.region\n        local plate = C_NamePlate.GetNamePlateForUnit(aura_env.state.PassUnit)\n        if plate then\n            region:ClearAllPoints()\n            region:SetPoint(\"BOTTOM\", plate, \"TOP\", aura_env.config.xOffset, aura_env.config.yOffset)\n            region:Show()\n        else\n            region:Hide()\n        end\n    end\nend\n\n\n",
			["desaturate"] = false,
			["desc"] = "Puts an indicator on Spiteful Shades that target you and plays a sound notification.\nYou can offset the anchor to your liking in the \"Custom Options\" tab.",
			["displayIcon"] = 236188,
			["frameStrata"] = 1,
			["height"] = 40,
			["icon"] = true,
			["iconSource"] = 0,
			["id"] = "Deathwalker's Spirit Fixate Nameplate Indicator",
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["internalVersion"] = 45,
			["inverse"] = false,
			["keepAspectRatio"] = false,
			["load"] = {
				["affixes"] = {
					["multi"] = {
						[123] = true,
					},
					["single"] = 123,
				},
				["class"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
						["challenge"] = true,
					},
					["single"] = "challenge",
				},
				["size"] = {
					["multi"] = {
						["party"] = true,
					},
					["single"] = "party",
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["use_combat"] = true,
				["use_zoneIds"] = true,
				["zoneIds"] = "1680, 1678, 1679, 1677",
			},
			["preferToUpdate"] = false,
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["semver"] = "1.0.0",
			["subRegions"] = {
				{
					["anchorXOffset"] = 0,
					["anchorYOffset"] = 0,
					["rotateText"] = "NONE",
					["text_anchorPoint"] = "INNER_BOTTOMRIGHT",
					["text_automaticWidth"] = "Auto",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_fixedWidth"] = 64,
					["text_font"] = "Friz Quadrata TT",
					["text_fontSize"] = 12,
					["text_fontType"] = "OUTLINE",
					["text_justify"] = "CENTER",
					["text_selfPoint"] = "AUTO",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_shadowXOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["text_text"] = "%c",
					["text_text_format_s_format"] = "none",
					["text_visible"] = true,
					["text_wordWrap"] = "WordWrap",
					["type"] = "subtext",
				}, -- [1]
				{
					["glow"] = true,
					["glowBorder"] = false,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["glowFrequency"] = 0.25,
					["glowLength"] = 10,
					["glowLines"] = 8,
					["glowScale"] = 1,
					["glowThickness"] = 1,
					["glowType"] = "buttonOverlay",
					["glowXOffset"] = 0,
					["glowYOffset"] = 0,
					["type"] = "subglow",
					["useGlowColor"] = false,
				}, -- [2]
			},
			["tocversion"] = 90005,
			["triggers"] = {
				[1] = {
					["trigger"] = {
						["check"] = "event",
						["custom"] = "function(allstates, event, unit, ...)    \n    if event == \"NAME_PLATE_UNIT_ADDED\" then\n        if unit and unit ~= \"target\" then \n            if aura_env.guids[UnitGUID(unit)] then\n                allstates[UnitGUID(unit)] = { \n                    show = true,\n                    changed = true,\n                    PassUnit = unit,\n                    progressType = \"static\",\n                }\n            end\n        end\n    end\n    if event == \"NAME_PLATE_UNIT_REMOVED\" then\n        if unit then \n            if allstates[UnitGUID(unit)] then\n                allstates[UnitGUID(unit)].changed = true\n                allstates[UnitGUID(unit)].PassUnit = \"none\"\n            end\n        end    \n    end\n    if event == \"UNIT_THREAT_LIST_UPDATE\" then\n        if unit then            \n            local _,_, threatPct, _, _ = UnitDetailedThreatSituation(\"player\", unit)\n            if threatPct == 100 and GetUnitName(unit) == aura_env.trackedUnitName then\n                for i=1,255 do\n                    local u = \"nameplate\"..i\n                    if UnitExists(u) then\n                        if u == unit then\n                            allstates[UnitGUID(unit)] = { \n                                show = true,\n                                changed = true,\n                                PassUnit = u,\n                                progressType = \"static\",\n                            }\n                        end\n                    end\n                end\n            end\n        end\n    end\n    return true\nend\n\n\n",
						["custom_hide"] = "timed",
						["custom_type"] = "stateupdate",
						["debuffType"] = "HELPFUL",
						["duration"] = "1",
						["event"] = "Combat Log",
						["events"] = "NAME_PLATE_UNIT_ADDED, NAME_PLATE_UNIT_REMOVED, UNIT_THREAT_LIST_UPDATE",
						["nameplateType"] = "hostile",
						["names"] = {
						},
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "custom",
						["unevent"] = "timed",
						["unit"] = "nameplate",
						["use_absorbMode"] = true,
						["use_nameplateType"] = true,
						["use_unit"] = true,
					},
					["untrigger"] = {
						["unit"] = "nameplate",
					},
				},
				["activeTriggerMode"] = -10,
			},
			["uid"] = "azRGIcJ3PL)",
			["url"] = "https://wago.io/2HrxIGmjL/1",
			["version"] = 1,
			["width"] = 40,
			["xOffset"] = 0,
			["yOffset"] = 0,
			["zoom"] = 0,
		},
		["Dungeon RIO and Class"] = {
			["actions"] = {
				["finish"] = {
				},
				["init"] = {
					["custom"] = "local function GetRioScore(fullname)    \n    local score = 0;    \n    \n    if not RaiderIO then return score end;\n    \n    if not string.match(fullname, \"-\") then\n        local realmName = string.gsub(GetRealmName(), \" \", \"\");\n        fullname = fullname..\"-\"..realmName;        \n    end\n    \n    local FACTIONS = { Alliance = 1, Horde = 2, Neutral = 3 }\n    local playerFactionID = FACTIONS[UnitFactionGroup(\"player\")]    \n    local playerProfile = RaiderIO.GetProfile(fullname, playerFactionID);\n    local currentScore = 0;\n    local previousScore = 0;\n    \n    if (playerProfile ~= nil) then\n        if playerProfile.mythicKeystoneProfile ~= nil then\n            currentScore = playerProfile.mythicKeystoneProfile.currentScore or 0;    \n            previousScore = playerProfile.mythicKeystoneProfile.previousScore or 0;\n        end\n    end    \n    \n    score = currentScore\n    \n    local previousRIO = _G[\"ShowRIORaitingWA1PreviousRIO\"];\n    \n    if previousRIO == true and currentScore < previousScore then\n        score = previousScore\n    end\n    \n    return score;\nend\n\nlocal function componentToHex(c)\n    c = math.floor(c * 255)    \n    local hex = string.format(\"%x\", c)    \n    if (hex:len() == 1) then\n        return \"0\"..hex;\n    end    \n    return hex;\nend\n\nlocal function rgbToHex(r, g, b)\n    return componentToHex(r)..componentToHex(g)..componentToHex(b);\nend\n\nlocal function getColorStr(hexColor)\n    return \"|cff\"..hexColor..\"+|r\";\nend\n\nlocal function getRioScoreColorText(rioScore) \n    if not RaiderIO then return nil end;\n    \n    local r, g, b = RaiderIO.GetScoreColor(rioScore);\n    local hex = rgbToHex(r, g, b);    \n    return getColorStr(hex);\nend\n\nlocal function getRioScoreText(rioScore)\n    local colorText = getRioScoreColorText(rioScore);\n    if colorText == nil then return \"\" end\n    \n    local rioText = colorText:gsub(\"+\", rioScore);\n    \n    local textFormat = _G[\"ShowRIORaitingWA1TextFormatRIO\"]\n    local trim = _G[\"ShowRIORaitingWA1Trim\"]\n    if (textFormat ~= nil and trim ~= nil and trim(textFormat) ~= \"\") then\n        rioText = textFormat:gsub(\"@rio\", rioText)        \n    end\n    \n    return rioText..\" \";\nend\n\nlocal function getIndex(values, val)\n    local index={};\n    \n    for k,v in pairs(values) do\n        index[v]=k;\n    end\n    \n    return index[val];\nend\n\nlocal function filterTable(t, ids)\n    for i, id in ipairs(ids) do\n        for j = #t, 1, -1 do\n            if ( t[j] == id ) then\n                tremove(t, j);\n                break;\n            end\n        end\n    end\nend\n\nlocal function addFilteredId(self, id)\n    if ( not self.filteredIDs ) then\n        self.filteredIDs = { };\n    end\n    tinsert(self.filteredIDs, id);\nend\n\naura_env.Trim = function(str)\n    local match = string.match\n    return match(str,'^()%s*$') and '' or match(str,'^%s*(.*%S)')\nend\n\naura_env.UpdateApplicantMember = function(member, appID, memberIdx, ...)     \n    if( RaiderIO == nil ) then return; end    \n    if( _G[\"ShowRIORaitingWA1NotShowApplicantRio\"] == true ) then return; end\n    \n    local textName = member.Name:GetText();\n    local name, class = C_LFGList.GetApplicantMemberInfo(appID, memberIdx);\n    local rioScore = GetRioScore(name);    \n    local rioText;    \n    if (rioScore > 0) then\n        rioText = getRioScoreText(rioScore);\n    else\n        rioText = \"\";\n    end\n    \n    if ( memberIdx > 1 ) then\n        member.Name:SetText(\"  \"..rioText..textName);\n    else\n        member.Name:SetText(rioText..textName);\n    end\n    \n    local nameLength = 100;\n    if ( relationship ) then\n        nameLength = nameLength - 22;\n    end\n    \n    if ( member.Name:GetWidth() > nameLength ) then\n        member.Name:SetWidth(nameLength);\n    end\nend\n\naura_env.SearchEntryUpdate = function(entry, ...)\n    if( not LFGListFrame.SearchPanel:IsShown() ) then return; end\n    \n    local categoryID = LFGListFrame.SearchPanel.categoryID;\n    local resultID = entry.resultID;\n    local resultInfo = C_LFGList.GetSearchResultInfo(resultID);\n    local leaderName = resultInfo.leaderName;\n    entry.rioScore = 0;\n    \n    if (leaderName ~= nil) then\n        entry.rioScore = GetRioScore(leaderName);\n    end\n    \n    for i = 1, 5 do\n        local texture = \"tex\"..i;                \n        if (entry.DataDisplay.Enumerate[texture]) then\n            entry.DataDisplay.Enumerate[texture]:Hide();\n        end                \n    end\n    \n    if (categoryID == 2 and _G[\"ShowRIORaitingWA1NotShowClasses\"] ~= true) then\n        local numMembers = resultInfo.numMembers;\n        local _, appStatus, pendingStatus, appDuration = C_LFGList.GetApplicationInfo(resultID);\n        local isApplication = entry.isApplication;\n        \n        entry.DataDisplay:SetPoint(\"RIGHT\", entry.DataDisplay:GetParent(), \"RIGHT\", 0, -5);\n        \n        local orderIndexes = {};\n        \n        for i=1, numMembers do                    \n            local role, class = C_LFGList.GetSearchResultMemberInfo(resultID, i);\n            local orderIndex = getIndex(LFG_LIST_GROUP_DATA_ROLE_ORDER, role);\n            table.insert(orderIndexes, {orderIndex, class});\n        end\n        \n        table.sort(orderIndexes, function(a,b)\n                return a[1] < b[1]\n        end);\n        \n        local xOffset = -88;\n        \n        for i = 1, numMembers do\n            local class = orderIndexes[i][2];\n            local classColor = RAID_CLASS_COLORS[class];\n            local r, g, b, a = classColor:GetRGBA();\n            local texture = \"tex\"..i;\n            \n            if (not entry.DataDisplay.Enumerate[texture]) then\n                entry.DataDisplay.Enumerate[texture] = entry.DataDisplay.Enumerate:CreateTexture(nil, \"ARTWORK\");\n                entry.DataDisplay.Enumerate[texture]:SetSize(10, 3);\n                entry.DataDisplay.Enumerate[texture]:SetPoint(\"RIGHT\", entry.DataDisplay.Enumerate, \"RIGHT\", xOffset, 15);\n            end\n            \n            entry.DataDisplay.Enumerate[texture]:Show();                    \n            entry.DataDisplay.Enumerate[texture]:SetColorTexture(r, g, b, 0.75);\n            \n            xOffset = xOffset + 18;                    \n        end\n    end            \n    \n    local name = entry.Name:GetText() or \"\";\n    \n    local rioText;    \n    if (entry.rioScore > 0 and _G[\"ShowRIORaitingWA1NotShowRio\"] ~= true) then\n        rioText = getRioScoreText(entry.rioScore);\n    else\n        rioText = \"\";\n    end\n    entry.Name:SetText(rioText..name);\nend\n\naura_env.SortSearchResults = function(results)    \n    local sortMethod = _G[\"ShowRIORaitingWA1SortMethod\"] or 1;\n    local removeRole = _G[\"ShowRIORaitingWA1RemoveWithoutRole\"] or false;\n    local minRio = _G[\"ShowRIORaitingWA1MinRio\"] or -1;\n    local maxRio = _G[\"ShowRIORaitingWA1MaxRio\"] or 9999;\n    local filterRIO = _G[\"ShowRIORaitingWA1FilterRIO\"] or false;\n    local categoryID = LFGListFrame.SearchPanel.categoryID;\n    \n    local function RemainingSlotsForLocalPlayerRole(lfgSearchResultID)    \n        local roleRemainingKeyLookup = {\n            [\"TANK\"] = \"TANK_REMAINING\",\n            [\"HEALER\"] = \"HEALER_REMAINING\",\n            [\"DAMAGER\"] = \"DAMAGER_REMAINING\",\n        };\n        local roles = C_LFGList.GetSearchResultMemberCounts(lfgSearchResultID);\n        local playerRole = GetSpecializationRole(GetSpecialization());\n        return roles[roleRemainingKeyLookup[playerRole]];\n    end\n    \n    local function FilterSearchResults(searchResultID)\n        local searchResultInfo = C_LFGList.GetSearchResultInfo(searchResultID);\n        \n        if (searchResultInfo == nil) then\n            return;\n        end        \n        \n        local remainingRole = RemainingSlotsForLocalPlayerRole(searchResultID) > 0\n        \n        if removeRole == true then            \n            if (remainingRole == false) then\n                addFilteredId(LFGListFrame.SearchPanel, searchResultID);\n            end\n        end \n        \n        local leaderName = searchResultInfo.leaderName;\n        local rioScore = 0;\n        \n        if (leaderName ~= nil) then\n            rioScore = GetRioScore(leaderName);\n        end \n        \n        if (not RaiderIO) then filterRIO = false end\n        \n        if (filterRIO == true) then            \n            if (rioScore < minRio or rioScore > maxRio) then\n                addFilteredId(LFGListFrame.SearchPanel, searchResultID);\n            end\n        end\n    end\n    \n    local function SortSearchResultsCB(searchResultID1, searchResultID2)\n        local searchResultInfo1 = C_LFGList.GetSearchResultInfo(searchResultID1);\n        local searchResultInfo2 = C_LFGList.GetSearchResultInfo(searchResultID2);\n        \n        if (searchResultInfo1 == nil) then\n            return false;\n        end        \n        \n        if (searchResultInfo2 == nil) then\n            return true;\n        end    \n        \n        local remainingRole1 = RemainingSlotsForLocalPlayerRole(searchResultID1) > 0;\n        local remainingRole2 = RemainingSlotsForLocalPlayerRole(searchResultID2) > 0;\n        \n        local leaderName1 = searchResultInfo1.leaderName;\n        local leaderName2 = searchResultInfo2.leaderName;\n        \n        local rioScore1 = 0;\n        local rioScore2 = 0;       \n        \n        if (leaderName1 ~= nil) then\n            rioScore1 = GetRioScore(leaderName1);\n        end   \n        if (leaderName2 ~= nil) then\n            rioScore2 = GetRioScore(leaderName2);\n        end       \n        \n        if (remainingRole1 ~= remainingRole2) then\n            return remainingRole1;\n        end\n        \n        if (sortMethod == 3) then\n            return rioScore1 > rioScore2;\n        else\n            return rioScore1 < rioScore2;\n        end\n    end\n    \n    if (#results > 0 and categoryID == 2) then\n        for i,id in ipairs(results) do\n            FilterSearchResults(id)\n        end\n        \n        if (LFGListFrame.SearchPanel.filteredIDs) then\n            filterTable(LFGListFrame.SearchPanel.results, LFGListFrame.SearchPanel.filteredIDs);\n            LFGListFrame.SearchPanel.filteredIDs = nil;\n        end\n    end\n    \n    if sortMethod ~= 1 then\n        table.sort(results, SortSearchResultsCB);\n    end\n    \n    if #results > 0 then\n        LFGListSearchPanel_UpdateResults(LFGListFrame.SearchPanel);\n    end\nend\n\naura_env.SortApplicants = function(applicants)    \n    local sortMethod = _G[\"ShowRIORaitingWA1ApplicantSortMethod\"] or 1;\n    local minRio = _G[\"ShowRIORaitingWA1ApplicantMinRio\"] or -1;\n    local maxRio = _G[\"ShowRIORaitingWA1ApplicantMaxRio\"] or 9999;\n    local filterRIO = _G[\"ShowRIORaitingWA1ApplicantFilterRIO\"] or false;\n    local categoryID = LFGListFrame.CategorySelection.selectedCategory;\n    \n    local function FilterApplicants(applicantID)\n        local applicantInfo = C_LFGList.GetApplicantInfo(applicantID);\n        \n        if (applicantInfo == nil) then\n            return;\n        end \n        \n        local name = C_LFGList.GetApplicantMemberInfo(applicantInfo.applicantID, 1);\n        local rioScore = 0;\n        \n        if (name ~= nil) then\n            rioScore = GetRioScore(name);\n        end   \n        \n        if (filterRIO == true) then\n            if (rioScore < minRio or rioScore > maxRio) then\n                addFilteredId(LFGListFrame.ApplicationViewer, applicantID)\n            end\n        end\n    end\n    \n    local function SortApplicantsCB(applicantID1, applicantID2)\n        local applicantInfo1 = C_LFGList.GetApplicantInfo(applicantID1);\n        local applicantInfo2 = C_LFGList.GetApplicantInfo(applicantID2);\n        \n        if (applicantInfo1 == nil) then\n            return false;\n        end        \n        \n        if (applicantInfo2 == nil) then\n            return true;\n        end    \n        \n        local name1 = C_LFGList.GetApplicantMemberInfo(applicantInfo1.applicantID, 1);\n        local name2 = C_LFGList.GetApplicantMemberInfo(applicantInfo2.applicantID, 1);\n        \n        local rioScore1 = 0;\n        local rioScore2 = 0;       \n        \n        if (name1 ~= nil) then\n            rioScore1 = GetRioScore(name1);\n        end   \n        if (name2 ~= nil) then\n            rioScore2 = GetRioScore(name2);\n        end\n        \n        if (sortMethod == 3) then\n            return rioScore1 > rioScore2;\n        else\n            return rioScore1 < rioScore2;\n        end\n    end\n    \n    if (categoryID == 2 and #applicants > 0) then\n        for i,id in ipairs(applicants) do\n            FilterApplicants(id)\n        end\n        \n        if (LFGListFrame.ApplicationViewer.filteredIDs) then\n            filterTable(applicants, LFGListFrame.ApplicationViewer.filteredIDs);\n            LFGListFrame.ApplicationViewer.filteredIDs = nil;\n        end\n    end\n    \n    if (sortMethod ~= 1 and #applicants > 1) then \n        table.sort(applicants, SortApplicantsCB);        \n        LFGListApplicationViewer_UpdateResults(LFGListFrame.ApplicationViewer);\n    end\n    \n    if (#applicants > 0) then        \n        LFGListApplicationViewer_UpdateResults(LFGListFrame.ApplicationViewer);\n    end\nend\n\nlocal isLoad = _G[\"ShowRIORaitingWA1\"];\n\n_G[\"ShowRIORaitingWA1NotShowRio\"] = aura_env.config.NotShowRio\n_G[\"ShowRIORaitingWA1NotShowApplicantRio\"] = aura_env.config.NotShowApplicantRio\n_G[\"ShowRIORaitingWA1NotShowClasses\"] = aura_env.config.NotShowClasses \n_G[\"ShowRIORaitingWA1TextFormatRIO\"] = aura_env.config.TextFormatRIO;\n_G[\"ShowRIORaitingWA1Trim\"] = aura_env.Trim;\n_G[\"ShowRIORaitingWA1SortMethod\"] = aura_env.config.RioSort;\n_G[\"ShowRIORaitingWA1ApplicantSortMethod\"] = aura_env.config.ApplicantRioSort;\n_G[\"ShowRIORaitingWA1RemoveWithoutRole\"] = aura_env.config.RemoveWithoutRole;\n_G[\"ShowRIORaitingWA1MinRio\"] = aura_env.config.MinRio;\n_G[\"ShowRIORaitingWA1MaxRio\"] = aura_env.config.MaxRio;\n_G[\"ShowRIORaitingWA1ApplicantMinRio\"] = aura_env.config.ApplicantMinRio;\n_G[\"ShowRIORaitingWA1ApplicantMaxRio\"] = aura_env.config.ApplicantMaxRio;\n_G[\"ShowRIORaitingWA1FilterRIO\"] = aura_env.config.FilterRIO;\n_G[\"ShowRIORaitingWA1ApplicantFilterRIO\"] = aura_env.config.ApplicantFilterRIO;\n_G[\"ShowRIORaitingWA1PreviousRIO\"] = aura_env.config.ShowPreviousRIO;\n\nif (not isLoad) then \n    hooksecurefunc(\"LFGListUtil_SortSearchResults\", aura_env.SortSearchResults);\n    hooksecurefunc(\"LFGListSearchEntry_Update\", aura_env.SearchEntryUpdate);\n    hooksecurefunc(\"LFGListUtil_SortApplicants\", aura_env.SortApplicants);\n    hooksecurefunc(\"LFGListApplicationViewer_UpdateApplicantMember\", aura_env.UpdateApplicantMember);\n    _G[\"ShowRIORaitingWA1\"] = true;\nend",
					["do_custom"] = true,
				},
				["start"] = {
				},
			},
			["anchorFrameType"] = "SCREEN",
			["anchorPoint"] = "CENTER",
			["animation"] = {
				["finish"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["start"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
			},
			["authorOptions"] = {
				{
					["default"] = "",
					["desc"] = "use tag @rio for show rio rating text",
					["key"] = "TextFormatRIO",
					["length"] = 10,
					["multiline"] = false,
					["name"] = "Text format RIO",
					["type"] = "input",
					["useDesc"] = true,
					["useLength"] = false,
					["width"] = 2,
				}, -- [1]
				{
					["default"] = true,
					["key"] = "ShowPreviousRIO",
					["name"] = "Show previous season RIO rating",
					["type"] = "toggle",
					["useDesc"] = false,
					["width"] = 1,
				}, -- [2]
				{
					["default"] = false,
					["key"] = "NotShowClasses",
					["name"] = "Don't show classes",
					["type"] = "toggle",
					["useDesc"] = false,
					["width"] = 2,
				}, -- [3]
				{
					["default"] = false,
					["key"] = "NotShowRio",
					["name"] = "Don't show leader RIO",
					["type"] = "toggle",
					["useDesc"] = false,
					["width"] = 2,
				}, -- [4]
				{
					["default"] = false,
					["key"] = "NotShowApplicantRio",
					["name"] = "Don't show applicant RIO",
					["type"] = "toggle",
					["useDesc"] = false,
					["width"] = 2,
				}, -- [5]
				{
					["default"] = false,
					["desc"] = "Remove parties without slot for your role",
					["key"] = "RemoveWithoutRole",
					["name"] = "Don't show parties without slot for your role",
					["type"] = "toggle",
					["useDesc"] = true,
					["width"] = 2,
				}, -- [6]
				{
					["noMerge"] = false,
					["text"] = "",
					["type"] = "header",
					["useName"] = false,
					["width"] = 1,
				}, -- [7]
				{
					["default"] = false,
					["key"] = "FilterRIO",
					["name"] = "Enable RIO rating filter for groups",
					["type"] = "toggle",
					["useDesc"] = false,
					["width"] = 2,
				}, -- [8]
				{
					["default"] = -1,
					["key"] = "MinRio",
					["max"] = 9999,
					["min"] = -1,
					["name"] = "Minimal RIO rating",
					["step"] = 1,
					["type"] = "number",
					["useDesc"] = false,
					["width"] = 1,
				}, -- [9]
				{
					["default"] = 9999,
					["key"] = "MaxRio",
					["max"] = 9999,
					["min"] = -1,
					["name"] = "Maximum RIO rating",
					["step"] = 1,
					["type"] = "number",
					["useDesc"] = false,
					["width"] = 1,
				}, -- [10]
				{
					["noMerge"] = false,
					["text"] = "",
					["type"] = "header",
					["useName"] = false,
					["width"] = 1,
				}, -- [11]
				{
					["default"] = false,
					["key"] = "ApplicantFilterRIO",
					["name"] = "Enable RIO rating filter for applicants",
					["type"] = "toggle",
					["useDesc"] = false,
					["width"] = 2,
				}, -- [12]
				{
					["default"] = -1,
					["key"] = "ApplicantMinRio",
					["max"] = 9999,
					["min"] = -1,
					["name"] = "Minimal applicant RIO rating",
					["step"] = 1,
					["type"] = "number",
					["useDesc"] = false,
					["width"] = 1,
				}, -- [13]
				{
					["default"] = 9999,
					["key"] = "ApplicantMaxRio",
					["max"] = 9999,
					["min"] = -1,
					["name"] = "Maximum applicant RIO rating",
					["step"] = 1,
					["type"] = "number",
					["useDesc"] = false,
					["width"] = 1,
				}, -- [14]
				{
					["noMerge"] = false,
					["text"] = "",
					["type"] = "header",
					["useName"] = false,
					["width"] = 1,
				}, -- [15]
				{
					["default"] = 1,
					["key"] = "RioSort",
					["name"] = "Sort by RIO rating",
					["type"] = "select",
					["useDesc"] = false,
					["values"] = {
						"None", -- [1]
						"Ascending", -- [2]
						"Descending", -- [3]
					},
					["width"] = 1,
				}, -- [16]
				{
					["default"] = 1,
					["key"] = "ApplicantRioSort",
					["name"] = "Applicants sort by RIO rating",
					["type"] = "select",
					["useDesc"] = false,
					["values"] = {
						"None", -- [1]
						"Ascending", -- [2]
						"Descending", -- [3]
					},
					["width"] = 1,
				}, -- [17]
			},
			["automaticWidth"] = "Auto",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["config"] = {
				["ApplicantFilterRIO"] = false,
				["ApplicantMaxRio"] = 9999,
				["ApplicantMinRio"] = 2500,
				["ApplicantRioSort"] = 3,
				["FilterRIO"] = false,
				["MaxRio"] = 9999,
				["MinRio"] = 1000,
				["NotShowApplicantRio"] = false,
				["NotShowClasses"] = false,
				["NotShowRio"] = false,
				["RemoveWithoutRole"] = true,
				["RioSort"] = 3,
				["ShowPreviousRIO"] = true,
				["TextFormatRIO"] = "[@rio]",
			},
			["customTextUpdate"] = "event",
			["displayText"] = "%p\n",
			["displayText_format_p_format"] = "timed",
			["displayText_format_p_time_dynamic_threshold"] = 60,
			["displayText_format_p_time_format"] = 0,
			["displayText_format_p_time_precision"] = 1,
			["fixedWidth"] = 200,
			["font"] = "Friz Quadrata TT",
			["fontSize"] = 12,
			["frameStrata"] = 1,
			["id"] = "Dungeon RIO and Class",
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["internalVersion"] = 45,
			["justify"] = "LEFT",
			["load"] = {
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["use_never"] = false,
				["zoneIds"] = "",
			},
			["outline"] = "OUTLINE",
			["preferToUpdate"] = true,
			["regionType"] = "text",
			["selfPoint"] = "BOTTOM",
			["semver"] = "1.0.14",
			["shadowColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["shadowXOffset"] = 1,
			["shadowYOffset"] = -1,
			["subRegions"] = {
			},
			["tocversion"] = 90005,
			["triggers"] = {
				[1] = {
					["trigger"] = {
						["buffShowOn"] = "showOnActive",
						["custom_hide"] = "custom",
						["custom_type"] = "event",
						["debuffType"] = "HELPFUL",
						["duration"] = "1",
						["event"] = "Conditions",
						["events"] = "PLAYER_ENTERING_WORLD",
						["names"] = {
						},
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "unit",
						["unevent"] = "auto",
						["unit"] = "target",
						["use_absorbMode"] = true,
						["use_alwaystrue"] = true,
						["use_unit"] = true,
					},
					["untrigger"] = {
					},
				},
				["activeTriggerMode"] = -10,
				["disjunctive"] = "any",
			},
			["uid"] = "IxpIcJ0ZtE8",
			["url"] = "https://wago.io/klC4qqHaF/15",
			["version"] = 15,
			["wordWrap"] = "WordWrap",
			["xOffset"] = 0,
			["yOffset"] = 0,
		},
		["Dungeons - Mythic+ Affixes "] = {
			["actions"] = {
				["finish"] = {
				},
				["init"] = {
				},
				["start"] = {
				},
			},
			["align"] = "CENTER",
			["anchorFrameType"] = "SCREEN",
			["anchorPoint"] = "CENTER",
			["animate"] = true,
			["animation"] = {
				["finish"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["start"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
			},
			["arcLength"] = 360,
			["authorOptions"] = {
			},
			["backdropColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0.5, -- [4]
			},
			["background"] = "None",
			["backgroundInset"] = 0,
			["border"] = false,
			["borderBackdrop"] = "Blizzard Tooltip",
			["borderColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["borderEdge"] = "1 Pixel",
			["borderInset"] = 0,
			["borderOffset"] = 16,
			["borderSize"] = 2,
			["columnSpace"] = 1,
			["conditions"] = {
			},
			["config"] = {
			},
			["constantFactor"] = "RADIUS",
			["controlledChildren"] = {
				"Necrotic Wound", -- [1]
				"Bursting", -- [2]
				"Grevious", -- [3]
				"Quaking", -- [4]
				"Sanguine DOT", -- [5]
				"Sanguine Heal", -- [6]
				"Explosive Orbs", -- [7]
				"Spiteful Focus", -- [8]
				"Prideful Buff", -- [9]
				"Bursting with Pride Stacks", -- [10]
				"Belligerent Boast", -- [11]
				"Belligerent Boast CD", -- [12]
			},
			["desc"] = "Created by Abbygale\nwww.twitch.tv/abbygale",
			["frameStrata"] = 1,
			["fullCircle"] = true,
			["gridType"] = "RD",
			["gridWidth"] = 5,
			["groupIcon"] = "135760",
			["grow"] = "RIGHT",
			["height"] = 64,
			["id"] = "Dungeons - Mythic+ Affixes ",
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["internalVersion"] = 45,
			["limit"] = 5,
			["load"] = {
				["affixes"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["faction"] = {
					["multi"] = {
					},
				},
				["ingroup"] = {
					["multi"] = {
					},
				},
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["role"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["talent2"] = {
					["multi"] = {
					},
				},
				["talent3"] = {
					["multi"] = {
					},
				},
				["use_class"] = false,
				["zoneIds"] = "",
			},
			["preferToUpdate"] = false,
			["radius"] = 200,
			["regionType"] = "dynamicgroup",
			["rotation"] = 0,
			["rowSpace"] = 1,
			["scale"] = 1,
			["selfPoint"] = "LEFT",
			["semver"] = "1.0.3",
			["sort"] = "none",
			["space"] = 4,
			["stagger"] = 0,
			["tocversion"] = 90002,
			["triggers"] = {
				[1] = {
					["trigger"] = {
						["buffShowOn"] = "showOnActive",
						["debuffType"] = "HELPFUL",
						["event"] = "Health",
						["names"] = {
						},
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "aura",
						["unit"] = "player",
					},
					["untrigger"] = {
					},
				},
				["activeTriggerMode"] = -10,
				["disjunctive"] = "all",
			},
			["uid"] = "oK)Fw75Rz)R",
			["url"] = "https://wago.io/EE8ENuch7/4",
			["useLimit"] = false,
			["version"] = 4,
			["width"] = 525.99996948242,
			["xOffset"] = 0,
			["yOffset"] = 300,
		},
		["EDE [DOS] Blood Barrier Inc"] = {
			["actions"] = {
				["finish"] = {
					["do_sound"] = false,
				},
				["init"] = {
				},
				["start"] = {
					["do_sound"] = true,
					["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\WarningSiren.ogg",
				},
			},
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["anchorPoint"] = "CENTER",
			["animation"] = {
				["finish"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["start"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
			},
			["authorOptions"] = {
			},
			["auto"] = false,
			["backgroundColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				0.5, -- [4]
			},
			["barColor"] = {
				1, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["config"] = {
			},
			["cooldown"] = true,
			["cooldownEdge"] = false,
			["cooldownSwipe"] = true,
			["cooldownTextDisabled"] = false,
			["desaturate"] = false,
			["displayIcon"] = "1394889",
			["frameStrata"] = 1,
			["height"] = 1,
			["icon"] = true,
			["iconSource"] = 0,
			["icon_color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["icon_side"] = "RIGHT",
			["id"] = "EDE [DOS] Blood Barrier Inc",
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["internalVersion"] = 45,
			["inverse"] = false,
			["keepAspectRatio"] = false,
			["load"] = {
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
						["party"] = true,
					},
					["single"] = "party",
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["use_size"] = true,
				["use_zoneIds"] = false,
				["zoneIds"] = ", g413",
			},
			["orientation"] = "HORIZONTAL",
			["parent"] = "Ellesmere's Dungeon Essentials",
			["preferToUpdate"] = true,
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["semver"] = "1.0.9",
			["spark"] = false,
			["sparkBlendMode"] = "ADD",
			["sparkColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["sparkHeight"] = 30,
			["sparkHidden"] = "NEVER",
			["sparkOffsetX"] = 0,
			["sparkOffsetY"] = 0,
			["sparkRotation"] = 0,
			["sparkRotationMode"] = "AUTO",
			["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
			["sparkWidth"] = 10,
			["subRegions"] = {
			},
			["texture"] = "Blizzard",
			["tocversion"] = 90002,
			["triggers"] = {
				[1] = {
					["trigger"] = {
						["auranames"] = {
							"", -- [1]
						},
						["debuffType"] = "HARMFUL",
						["destUnit"] = "player",
						["duration"] = "20",
						["event"] = "Cast",
						["genericShowOn"] = "showOnCooldown",
						["names"] = {
						},
						["realSpellName"] = 0,
						["spellId"] = 322759,
						["spellIds"] = {
						},
						["spellName"] = 0,
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_SUCCESS",
						["type"] = "unit",
						["unevent"] = "auto",
						["unit"] = "boss",
						["useName"] = true,
						["use_absorbMode"] = true,
						["use_destUnit"] = false,
						["use_genericShowOn"] = true,
						["use_spellId"] = true,
						["use_spellName"] = true,
						["use_track"] = true,
						["use_unit"] = true,
					},
					["untrigger"] = {
						["unit"] = "boss",
					},
				},
				["activeTriggerMode"] = -10,
			},
			["uid"] = "DIDqJJlVmg(",
			["url"] = "https://wago.io/uYX5mP3U5/10",
			["useAdjustededMax"] = false,
			["useAdjustededMin"] = false,
			["version"] = 10,
			["width"] = 1,
			["xOffset"] = -3000,
			["yOffset"] = 0,
			["zoom"] = 0,
		},
		["EDE [DOS] Erupting Darkness"] = {
			["actions"] = {
				["finish"] = {
					["do_sound"] = false,
				},
				["init"] = {
				},
				["start"] = {
					["do_sound"] = true,
					["sound"] = "Interface\\Addons\\Details\\sounds\\sound_gun2.ogg",
				},
			},
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["anchorPoint"] = "CENTER",
			["animation"] = {
				["finish"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["start"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
			},
			["authorOptions"] = {
			},
			["auto"] = false,
			["backgroundColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				0.5, -- [4]
			},
			["barColor"] = {
				1, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["config"] = {
			},
			["cooldown"] = true,
			["cooldownEdge"] = false,
			["cooldownSwipe"] = true,
			["cooldownTextDisabled"] = false,
			["desaturate"] = false,
			["displayIcon"] = "136181",
			["frameStrata"] = 1,
			["height"] = 1,
			["icon"] = true,
			["iconSource"] = 0,
			["icon_color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["icon_side"] = "RIGHT",
			["id"] = "EDE [DOS] Erupting Darkness",
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["internalVersion"] = 45,
			["inverse"] = false,
			["keepAspectRatio"] = false,
			["load"] = {
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
						["party"] = true,
					},
					["single"] = "party",
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["use_size"] = true,
				["use_zoneIds"] = false,
				["zoneIds"] = ", g413",
			},
			["orientation"] = "HORIZONTAL",
			["parent"] = "Ellesmere's Dungeon Essentials",
			["preferToUpdate"] = true,
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["semver"] = "1.0.9",
			["spark"] = false,
			["sparkBlendMode"] = "ADD",
			["sparkColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["sparkHeight"] = 30,
			["sparkHidden"] = "NEVER",
			["sparkOffsetX"] = 0,
			["sparkOffsetY"] = 0,
			["sparkRotation"] = 0,
			["sparkRotationMode"] = "AUTO",
			["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
			["sparkWidth"] = 10,
			["subRegions"] = {
			},
			["texture"] = "Blizzard",
			["tocversion"] = 90002,
			["triggers"] = {
				[1] = {
					["trigger"] = {
						["auranames"] = {
							"", -- [1]
						},
						["debuffType"] = "HARMFUL",
						["destUnit"] = "player",
						["duration"] = "2",
						["event"] = "Cast",
						["genericShowOn"] = "showOnCooldown",
						["nameplateType"] = "hostile",
						["names"] = {
						},
						["realSpellName"] = 0,
						["spellId"] = 334051,
						["spellIds"] = {
						},
						["spellName"] = 0,
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "unit",
						["unevent"] = "auto",
						["unit"] = "nameplate",
						["useName"] = true,
						["use_absorbMode"] = true,
						["use_destUnit"] = false,
						["use_genericShowOn"] = true,
						["use_nameplateType"] = false,
						["use_spellId"] = true,
						["use_spellName"] = true,
						["use_track"] = true,
						["use_unit"] = true,
					},
					["untrigger"] = {
						["unit"] = "nameplate",
					},
				},
				["activeTriggerMode"] = -10,
			},
			["uid"] = "6YMXGijvpCg",
			["url"] = "https://wago.io/uYX5mP3U5/10",
			["useAdjustededMax"] = false,
			["useAdjustededMin"] = false,
			["version"] = 10,
			["width"] = 1,
			["xOffset"] = -3000,
			["yOffset"] = 0,
			["zoom"] = 0,
		},
		["EDE [HOA] Stone Breath"] = {
			["actions"] = {
				["finish"] = {
				},
				["init"] = {
				},
				["start"] = {
					["do_sound"] = true,
					["sound"] = "Interface\\Addons\\Details\\sounds\\sound_gun2.ogg",
				},
			},
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["anchorPoint"] = "CENTER",
			["animation"] = {
				["finish"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["start"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
			},
			["authorOptions"] = {
			},
			["auto"] = true,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["config"] = {
			},
			["cooldown"] = true,
			["cooldownEdge"] = false,
			["cooldownSwipe"] = true,
			["cooldownTextDisabled"] = false,
			["desaturate"] = false,
			["displayIcon"] = "463521",
			["frameStrata"] = 1,
			["height"] = 1,
			["icon"] = true,
			["iconSource"] = -1,
			["id"] = "EDE [HOA] Stone Breath",
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["internalVersion"] = 45,
			["inverse"] = false,
			["keepAspectRatio"] = false,
			["load"] = {
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["use_zoneIds"] = true,
				["zoneIds"] = "g409",
			},
			["parent"] = "Ellesmere's Dungeon Essentials",
			["preferToUpdate"] = true,
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["semver"] = "1.0.9",
			["subRegions"] = {
			},
			["tocversion"] = 90002,
			["triggers"] = {
				[1] = {
					["trigger"] = {
						["auraspellids"] = {
							"326632", -- [1]
						},
						["debuffType"] = "HARMFUL",
						["duration"] = "1",
						["event"] = "Cast",
						["nameplateType"] = "hostile",
						["names"] = {
						},
						["spellId"] = 346866,
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "unit",
						["unevent"] = "auto",
						["unit"] = "nameplate",
						["useExactSpellId"] = true,
						["use_absorbMode"] = true,
						["use_nameplateType"] = true,
						["use_spellId"] = true,
						["use_unit"] = true,
					},
					["untrigger"] = {
						["unit"] = "nameplate",
					},
				},
				["activeTriggerMode"] = -10,
			},
			["uid"] = "ZL7TE0vdMKQ",
			["url"] = "https://wago.io/uYX5mP3U5/10",
			["version"] = 10,
			["width"] = 1,
			["xOffset"] = -3000,
			["yOffset"] = 0,
			["zoom"] = 0.3,
		},
		["EDE [HOA] Unleashed Suffering"] = {
			["actions"] = {
				["finish"] = {
				},
				["init"] = {
				},
				["start"] = {
					["do_sound"] = true,
					["sound"] = "Interface\\Addons\\Details\\sounds\\sound_gun2.ogg",
				},
			},
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["anchorPoint"] = "CENTER",
			["animation"] = {
				["finish"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["start"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
			},
			["authorOptions"] = {
			},
			["auto"] = false,
			["backgroundColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				0.5, -- [4]
			},
			["barColor"] = {
				1, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["config"] = {
			},
			["cooldown"] = true,
			["cooldownEdge"] = false,
			["cooldownSwipe"] = true,
			["cooldownTextDisabled"] = false,
			["desaturate"] = false,
			["displayIcon"] = "1035037",
			["frameStrata"] = 1,
			["height"] = 1,
			["icon"] = true,
			["iconSource"] = 0,
			["icon_color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["icon_side"] = "RIGHT",
			["id"] = "EDE [HOA] Unleashed Suffering",
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["internalVersion"] = 45,
			["inverse"] = false,
			["keepAspectRatio"] = false,
			["load"] = {
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["use_zoneIds"] = true,
				["zoneIds"] = "g409",
			},
			["orientation"] = "HORIZONTAL",
			["parent"] = "Ellesmere's Dungeon Essentials",
			["preferToUpdate"] = true,
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["semver"] = "1.0.9",
			["spark"] = false,
			["sparkBlendMode"] = "ADD",
			["sparkColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["sparkHeight"] = 30,
			["sparkHidden"] = "NEVER",
			["sparkOffsetX"] = 0,
			["sparkOffsetY"] = 0,
			["sparkRotation"] = 0,
			["sparkRotationMode"] = "AUTO",
			["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
			["sparkWidth"] = 10,
			["subRegions"] = {
			},
			["texture"] = "Blizzard",
			["tocversion"] = 90002,
			["triggers"] = {
				[1] = {
					["trigger"] = {
						["auranames"] = {
							"", -- [1]
						},
						["buffShowOn"] = "showOnActive",
						["debuffType"] = "HARMFUL",
						["destUnit"] = "player",
						["duration"] = "3",
						["event"] = "Cast",
						["genericShowOn"] = "showOnCooldown",
						["names"] = {
						},
						["percentpower"] = "90",
						["percentpower_operator"] = ">",
						["realSpellName"] = 0,
						["spellId"] = "323236",
						["spellIds"] = {
						},
						["spellName"] = 0,
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "unit",
						["unevent"] = "auto",
						["unit"] = "boss",
						["useName"] = true,
						["use_absorbMode"] = true,
						["use_cloneId"] = true,
						["use_destUnit"] = false,
						["use_genericShowOn"] = true,
						["use_percentpower"] = true,
						["use_powertype"] = false,
						["use_spellId"] = true,
						["use_spellName"] = true,
						["use_track"] = true,
						["use_unit"] = true,
					},
					["untrigger"] = {
						["unit"] = "boss",
					},
				},
				["activeTriggerMode"] = -10,
			},
			["uid"] = "PlSFl(tgKML",
			["url"] = "https://wago.io/uYX5mP3U5/10",
			["useAdjustededMax"] = false,
			["useAdjustededMin"] = false,
			["useTooltip"] = false,
			["version"] = 10,
			["width"] = 1,
			["xOffset"] = -3000,
			["yOffset"] = 0,
			["zoom"] = 0,
		},
		["EDE [MOTS] Bewildering Pollen (Boss) 2"] = {
			["actions"] = {
				["finish"] = {
				},
				["init"] = {
				},
				["start"] = {
					["do_sound"] = true,
					["sound"] = "Interface\\Addons\\Details\\sounds\\sound_gun2.ogg",
				},
			},
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["anchorPoint"] = "CENTER",
			["animation"] = {
				["finish"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["start"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
			},
			["authorOptions"] = {
			},
			["auto"] = false,
			["backgroundColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				0.5, -- [4]
			},
			["barColor"] = {
				1, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["config"] = {
			},
			["cooldown"] = true,
			["cooldownEdge"] = false,
			["cooldownSwipe"] = true,
			["cooldownTextDisabled"] = false,
			["desaturate"] = false,
			["displayIcon"] = "134219",
			["frameStrata"] = 1,
			["height"] = 1,
			["icon"] = true,
			["iconSource"] = 0,
			["icon_color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["icon_side"] = "RIGHT",
			["id"] = "EDE [MOTS] Bewildering Pollen (Boss) 2",
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["internalVersion"] = 45,
			["inverse"] = false,
			["keepAspectRatio"] = false,
			["load"] = {
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["use_encounter"] = true,
				["use_zoneIds"] = true,
				["zoneIds"] = "1669",
			},
			["orientation"] = "HORIZONTAL",
			["parent"] = "Ellesmere's Dungeon Essentials",
			["preferToUpdate"] = true,
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["semver"] = "1.0.9",
			["spark"] = false,
			["sparkBlendMode"] = "ADD",
			["sparkColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["sparkHeight"] = 30,
			["sparkHidden"] = "NEVER",
			["sparkOffsetX"] = 0,
			["sparkOffsetY"] = 0,
			["sparkRotation"] = 0,
			["sparkRotationMode"] = "AUTO",
			["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
			["sparkWidth"] = 10,
			["subRegions"] = {
			},
			["texture"] = "Blizzard",
			["tocversion"] = 90002,
			["triggers"] = {
				[1] = {
					["trigger"] = {
						["auranames"] = {
							"", -- [1]
						},
						["buffShowOn"] = "showOnActive",
						["debuffType"] = "HELPFUL",
						["destUnit"] = "player",
						["duration"] = "3.5",
						["event"] = "Cast",
						["genericShowOn"] = "showOnCooldown",
						["names"] = {
						},
						["percentpower"] = "90",
						["percentpower_operator"] = ">",
						["realSpellName"] = 0,
						["spellId"] = 323137,
						["spellIds"] = {
						},
						["spellName"] = 0,
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "unit",
						["unevent"] = "auto",
						["unit"] = "boss",
						["useName"] = true,
						["use_absorbMode"] = true,
						["use_cloneId"] = true,
						["use_destUnit"] = false,
						["use_genericShowOn"] = true,
						["use_percentpower"] = true,
						["use_powertype"] = false,
						["use_spellId"] = true,
						["use_spellName"] = true,
						["use_track"] = true,
						["use_unit"] = true,
					},
					["untrigger"] = {
						["unit"] = "boss",
					},
				},
				["activeTriggerMode"] = -10,
			},
			["uid"] = "TsDdJ5(NjSe",
			["url"] = "https://wago.io/uYX5mP3U5/10",
			["useAdjustededMax"] = false,
			["useAdjustededMin"] = false,
			["useTooltip"] = false,
			["version"] = 10,
			["width"] = 1,
			["xOffset"] = -3000,
			["yOffset"] = 0,
			["zoom"] = 0,
		},
		["EDE [MOTS] Bewildering Pollen (Trash)"] = {
			["actions"] = {
				["finish"] = {
				},
				["init"] = {
				},
				["start"] = {
					["do_sound"] = true,
					["sound"] = "Interface\\Addons\\Details\\sounds\\sound_gun2.ogg",
				},
			},
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["anchorPoint"] = "CENTER",
			["animation"] = {
				["finish"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["start"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
			},
			["authorOptions"] = {
			},
			["auto"] = true,
			["backgroundColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				0.5, -- [4]
			},
			["barColor"] = {
				1, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["config"] = {
			},
			["cooldown"] = true,
			["cooldownEdge"] = false,
			["cooldownSwipe"] = true,
			["cooldownTextDisabled"] = false,
			["desaturate"] = false,
			["displayIcon"] = "134219",
			["frameStrata"] = 1,
			["height"] = 1,
			["icon"] = true,
			["iconSource"] = -1,
			["icon_color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["icon_side"] = "RIGHT",
			["id"] = "EDE [MOTS] Bewildering Pollen (Trash)",
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["internalVersion"] = 45,
			["inverse"] = false,
			["keepAspectRatio"] = false,
			["load"] = {
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["use_encounter"] = false,
				["use_zoneIds"] = true,
				["zoneIds"] = "1669",
			},
			["orientation"] = "HORIZONTAL",
			["parent"] = "Ellesmere's Dungeon Essentials",
			["preferToUpdate"] = true,
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["semver"] = "1.0.9",
			["spark"] = false,
			["sparkBlendMode"] = "ADD",
			["sparkColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["sparkHeight"] = 30,
			["sparkHidden"] = "NEVER",
			["sparkOffsetX"] = 0,
			["sparkOffsetY"] = 0,
			["sparkRotation"] = 0,
			["sparkRotationMode"] = "AUTO",
			["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
			["sparkWidth"] = 10,
			["subRegions"] = {
			},
			["texture"] = "Blizzard",
			["tocversion"] = 90002,
			["triggers"] = {
				[1] = {
					["trigger"] = {
						["auranames"] = {
							"322487", -- [1]
						},
						["buffShowOn"] = "showOnActive",
						["combinePerUnit"] = false,
						["debuffType"] = "HARMFUL",
						["destUnit"] = "player",
						["duration"] = "2",
						["event"] = "Cast",
						["genericShowOn"] = "showOnCooldown",
						["match_count"] = "0",
						["match_countOperator"] = ">",
						["names"] = {
						},
						["percentpower"] = "90",
						["percentpower_operator"] = ">",
						["realSpellName"] = 0,
						["showClones"] = true,
						["spellId"] = 321968,
						["spellIds"] = {
						},
						["spellName"] = 0,
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_SUCCESS",
						["type"] = "unit",
						["unevent"] = "auto",
						["unit"] = "nameplate",
						["useMatch_count"] = true,
						["useName"] = true,
						["use_absorbMode"] = true,
						["use_cloneId"] = true,
						["use_destUnit"] = false,
						["use_genericShowOn"] = true,
						["use_percentpower"] = true,
						["use_powertype"] = false,
						["use_sourceUnit"] = true,
						["use_spellId"] = true,
						["use_spellName"] = true,
						["use_track"] = true,
						["use_unit"] = true,
					},
					["untrigger"] = {
						["unit"] = "nameplate",
					},
				},
				["activeTriggerMode"] = -10,
			},
			["uid"] = "WXh3uyi22y8",
			["url"] = "https://wago.io/uYX5mP3U5/10",
			["useAdjustededMax"] = false,
			["useAdjustededMin"] = false,
			["useTooltip"] = false,
			["version"] = 10,
			["width"] = 1,
			["xOffset"] = -3000,
			["yOffset"] = 0,
			["zoom"] = 0,
		},
		["EDE [MOT] Tongue Lashing"] = {
			["actions"] = {
				["finish"] = {
				},
				["init"] = {
				},
				["start"] = {
					["do_sound"] = true,
					["sound"] = "Interface\\Addons\\Details\\sounds\\sound_gun2.ogg",
				},
			},
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["anchorPoint"] = "CENTER",
			["animation"] = {
				["finish"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["start"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
			},
			["authorOptions"] = {
			},
			["auto"] = true,
			["backgroundColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				0.5, -- [4]
			},
			["barColor"] = {
				1, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["config"] = {
			},
			["cooldown"] = true,
			["cooldownEdge"] = false,
			["cooldownSwipe"] = true,
			["cooldownTextDisabled"] = false,
			["desaturate"] = false,
			["displayIcon"] = "350575",
			["frameStrata"] = 1,
			["height"] = 1,
			["icon"] = true,
			["iconSource"] = -1,
			["icon_color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["icon_side"] = "RIGHT",
			["id"] = "EDE [MOT] Tongue Lashing",
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["internalVersion"] = 45,
			["inverse"] = false,
			["keepAspectRatio"] = false,
			["load"] = {
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["use_zoneIds"] = true,
				["zoneIds"] = "1669",
			},
			["orientation"] = "HORIZONTAL",
			["parent"] = "Ellesmere's Dungeon Essentials",
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["semver"] = "1.0.9",
			["spark"] = false,
			["sparkBlendMode"] = "ADD",
			["sparkColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["sparkHeight"] = 30,
			["sparkHidden"] = "NEVER",
			["sparkOffsetX"] = 0,
			["sparkOffsetY"] = 0,
			["sparkRotation"] = 0,
			["sparkRotationMode"] = "AUTO",
			["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
			["sparkWidth"] = 10,
			["subRegions"] = {
				{
					["anchorXOffset"] = 0,
					["anchorYOffset"] = 0,
					["rotateText"] = "NONE",
					["text_anchorPoint"] = "CENTER",
					["text_anchorXOffset"] = 0,
					["text_anchorYOffset"] = 0,
					["text_automaticWidth"] = "Auto",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_fixedWidth"] = 64,
					["text_font"] = "Friz Quadrata TT",
					["text_fontSize"] = 28,
					["text_fontType"] = "OUTLINE",
					["text_justify"] = "CENTER",
					["text_selfPoint"] = "AUTO",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_shadowXOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["text_text"] = "%p",
					["text_text_format_p_format"] = "timed",
					["text_text_format_p_time_dynamic_threshold"] = 3,
					["text_text_format_p_time_format"] = 0,
					["text_text_format_p_time_precision"] = 1,
					["text_text_format_s_format"] = "none",
					["text_visible"] = false,
					["text_wordWrap"] = "WordWrap",
					["type"] = "subtext",
				}, -- [1]
				{
					["anchorXOffset"] = 0,
					["anchorYOffset"] = 0,
					["rotateText"] = "NONE",
					["text_anchorPoint"] = "OUTER_BOTTOM",
					["text_anchorYOffset"] = 0,
					["text_automaticWidth"] = "Auto",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_fixedWidth"] = 64,
					["text_font"] = "Friz Quadrata TT",
					["text_fontSize"] = 17,
					["text_fontType"] = "OUTLINE",
					["text_justify"] = "CENTER",
					["text_selfPoint"] = "AUTO",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_shadowXOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["text_text"] = "frontal",
					["text_text_format_p_format"] = "timed",
					["text_text_format_p_time_dynamic_threshold"] = 60,
					["text_text_format_p_time_format"] = 0,
					["text_text_format_p_time_precision"] = 1,
					["text_visible"] = true,
					["text_wordWrap"] = "WordWrap",
					["type"] = "subtext",
				}, -- [2]
			},
			["texture"] = "Blizzard",
			["tocversion"] = 90002,
			["triggers"] = {
				[1] = {
					["trigger"] = {
						["auranames"] = {
							"322487", -- [1]
						},
						["buffShowOn"] = "showOnActive",
						["combinePerUnit"] = false,
						["debuffType"] = "HARMFUL",
						["destUnit"] = "player",
						["duration"] = "2",
						["event"] = "Cast",
						["genericShowOn"] = "showOnCooldown",
						["match_count"] = "0",
						["match_countOperator"] = ">",
						["names"] = {
						},
						["percentpower"] = "90",
						["percentpower_operator"] = ">",
						["realSpellName"] = 0,
						["showClones"] = true,
						["spellId"] = 340300,
						["spellIds"] = {
						},
						["spellName"] = 0,
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_SUCCESS",
						["type"] = "unit",
						["unevent"] = "auto",
						["unit"] = "nameplate",
						["useMatch_count"] = true,
						["useName"] = true,
						["use_absorbMode"] = true,
						["use_cloneId"] = true,
						["use_destUnit"] = false,
						["use_genericShowOn"] = true,
						["use_percentpower"] = true,
						["use_powertype"] = false,
						["use_sourceUnit"] = true,
						["use_spellId"] = true,
						["use_spellName"] = true,
						["use_track"] = true,
						["use_unit"] = true,
					},
					["untrigger"] = {
						["unit"] = "nameplate",
					},
				},
				["activeTriggerMode"] = -10,
			},
			["uid"] = "pIbcgyXfszD",
			["url"] = "https://wago.io/uYX5mP3U5/10",
			["useAdjustededMax"] = false,
			["useAdjustededMin"] = false,
			["useTooltip"] = false,
			["version"] = 10,
			["width"] = 1,
			["xOffset"] = -3000,
			["yOffset"] = 0,
			["zoom"] = 0,
		},
		["EDE [MTS] Radiant Breath"] = {
			["actions"] = {
				["finish"] = {
					["do_sound"] = false,
				},
				["init"] = {
				},
				["start"] = {
					["do_sound"] = true,
					["sound"] = "Interface\\Addons\\Details\\sounds\\sound_gun2.ogg",
				},
			},
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["anchorPoint"] = "CENTER",
			["animation"] = {
				["finish"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["start"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
			},
			["authorOptions"] = {
			},
			["auto"] = true,
			["backgroundColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				0.5, -- [4]
			},
			["barColor"] = {
				1, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["config"] = {
			},
			["cooldown"] = true,
			["cooldownEdge"] = false,
			["cooldownSwipe"] = true,
			["cooldownTextDisabled"] = false,
			["desaturate"] = false,
			["displayIcon"] = "3528278",
			["frameStrata"] = 1,
			["height"] = 1,
			["icon"] = true,
			["iconSource"] = -1,
			["icon_color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["icon_side"] = "RIGHT",
			["id"] = "EDE [MTS] Radiant Breath",
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["internalVersion"] = 45,
			["inverse"] = false,
			["keepAspectRatio"] = false,
			["load"] = {
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
						["party"] = true,
					},
					["single"] = "party",
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["use_size"] = true,
				["use_zoneIds"] = false,
				["zoneIds"] = ", g13334",
			},
			["orientation"] = "HORIZONTAL",
			["parent"] = "Ellesmere's Dungeon Essentials",
			["preferToUpdate"] = true,
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["semver"] = "1.0.9",
			["spark"] = false,
			["sparkBlendMode"] = "ADD",
			["sparkColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["sparkHeight"] = 30,
			["sparkHidden"] = "NEVER",
			["sparkOffsetX"] = 0,
			["sparkOffsetY"] = 0,
			["sparkRotation"] = 0,
			["sparkRotationMode"] = "AUTO",
			["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
			["sparkWidth"] = 10,
			["subRegions"] = {
			},
			["texture"] = "Blizzard",
			["tocversion"] = 90002,
			["triggers"] = {
				[1] = {
					["trigger"] = {
						["auranames"] = {
							"322487", -- [1]
						},
						["buffShowOn"] = "showOnActive",
						["combinePerUnit"] = false,
						["debuffType"] = "HARMFUL",
						["destUnit"] = "player",
						["duration"] = "2",
						["event"] = "Cast",
						["genericShowOn"] = "showOnCooldown",
						["match_count"] = "0",
						["match_countOperator"] = ">",
						["names"] = {
						},
						["percentpower"] = "90",
						["percentpower_operator"] = ">",
						["realSpellName"] = 0,
						["showClones"] = true,
						["spellId"] = 340160,
						["spellIds"] = {
						},
						["spellName"] = 0,
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_SUCCESS",
						["type"] = "unit",
						["unevent"] = "auto",
						["unit"] = "nameplate",
						["useMatch_count"] = true,
						["useName"] = true,
						["use_absorbMode"] = true,
						["use_cloneId"] = true,
						["use_destUnit"] = false,
						["use_genericShowOn"] = true,
						["use_percentpower"] = true,
						["use_powertype"] = false,
						["use_sourceUnit"] = true,
						["use_spellId"] = true,
						["use_spellName"] = true,
						["use_track"] = true,
						["use_unit"] = true,
					},
					["untrigger"] = {
						["unit"] = "nameplate",
					},
				},
				["activeTriggerMode"] = -10,
			},
			["uid"] = "wChrOtjXFYi",
			["url"] = "https://wago.io/uYX5mP3U5/10",
			["useAdjustededMax"] = false,
			["useAdjustededMin"] = false,
			["useTooltip"] = false,
			["version"] = 10,
			["width"] = 1,
			["xOffset"] = -3000,
			["yOffset"] = 0,
			["zoom"] = 0,
		},
		["EDE [NW] Gut Slice"] = {
			["actions"] = {
				["finish"] = {
				},
				["init"] = {
				},
				["start"] = {
					["do_sound"] = true,
					["sound"] = "Interface\\Addons\\Details\\sounds\\sound_gun2.ogg",
				},
			},
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["anchorPoint"] = "CENTER",
			["animation"] = {
				["finish"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["start"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
			},
			["authorOptions"] = {
			},
			["auto"] = true,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["config"] = {
			},
			["cooldown"] = true,
			["cooldownEdge"] = false,
			["cooldownSwipe"] = true,
			["cooldownTextDisabled"] = false,
			["desaturate"] = false,
			["displayIcon"] = "132155",
			["frameStrata"] = 1,
			["height"] = 1,
			["icon"] = true,
			["iconSource"] = -1,
			["id"] = "EDE [NW] Gut Slice",
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["internalVersion"] = 45,
			["inverse"] = false,
			["keepAspectRatio"] = false,
			["load"] = {
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["use_zoneIds"] = true,
				["zoneIds"] = "g410",
			},
			["parent"] = "Ellesmere's Dungeon Essentials",
			["preferToUpdate"] = true,
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["semver"] = "1.0.9",
			["subRegions"] = {
			},
			["tocversion"] = 90002,
			["triggers"] = {
				[1] = {
					["trigger"] = {
						["auraspellids"] = {
							"321821", -- [1]
						},
						["debuffType"] = "HARMFUL",
						["destUnit"] = "player",
						["duration"] = "1",
						["event"] = "Cast",
						["fetchTooltip"] = false,
						["names"] = {
						},
						["remaining"] = "3",
						["remaining_operator"] = "<",
						["spellId"] = 333477,
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "unit",
						["unevent"] = "auto",
						["unit"] = "nameplate",
						["useExactSpellId"] = true,
						["use_absorbMode"] = true,
						["use_destUnit"] = false,
						["use_remaining"] = false,
						["use_spellId"] = true,
						["use_unit"] = true,
					},
					["untrigger"] = {
						["unit"] = "nameplate",
					},
				},
				["activeTriggerMode"] = -10,
			},
			["uid"] = "XaBAZl6ZXVB",
			["url"] = "https://wago.io/uYX5mP3U5/10",
			["version"] = 10,
			["width"] = 1,
			["xOffset"] = -3000,
			["yOffset"] = 0,
			["zoom"] = 0.3,
		},
		["EDE [NW] Necrotic Breath"] = {
			["actions"] = {
				["finish"] = {
				},
				["init"] = {
				},
				["start"] = {
					["do_sound"] = true,
					["sound"] = "Interface\\Addons\\Details\\sounds\\sound_gun2.ogg",
				},
			},
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["anchorPoint"] = "CENTER",
			["animation"] = {
				["finish"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["start"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
			},
			["authorOptions"] = {
			},
			["auto"] = false,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["config"] = {
			},
			["cooldown"] = true,
			["cooldownEdge"] = false,
			["cooldownSwipe"] = true,
			["cooldownTextDisabled"] = false,
			["desaturate"] = false,
			["displayIcon"] = "2576093",
			["frameStrata"] = 1,
			["height"] = 1,
			["icon"] = true,
			["iconSource"] = 0,
			["id"] = "EDE [NW] Necrotic Breath",
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["internalVersion"] = 45,
			["inverse"] = false,
			["keepAspectRatio"] = false,
			["load"] = {
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["use_encounter"] = true,
				["use_zoneIds"] = true,
				["zoneIds"] = "g410",
			},
			["parent"] = "Ellesmere's Dungeon Essentials",
			["preferToUpdate"] = true,
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["semver"] = "1.0.9",
			["subRegions"] = {
			},
			["tocversion"] = 90002,
			["triggers"] = {
				[1] = {
					["trigger"] = {
						["auranames"] = {
							"333633", -- [1]
						},
						["debuffType"] = "HARMFUL",
						["destUnit"] = "player",
						["duration"] = "10",
						["event"] = "Cast",
						["genericShowOn"] = "showOnCooldown",
						["names"] = {
						},
						["realSpellName"] = 0,
						["spell"] = "333488",
						["spellId"] = 333488,
						["spellIds"] = {
						},
						["spellName"] = 0,
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_SUCCESS",
						["type"] = "unit",
						["unevent"] = "auto",
						["unit"] = "boss",
						["useName"] = true,
						["use_absorbMode"] = true,
						["use_destUnit"] = false,
						["use_genericShowOn"] = true,
						["use_spell"] = false,
						["use_spellId"] = true,
						["use_spellName"] = true,
						["use_track"] = true,
						["use_unit"] = true,
					},
					["untrigger"] = {
						["unit"] = "boss",
					},
				},
				["activeTriggerMode"] = -10,
			},
			["uid"] = "f40QVOFJkHZ",
			["url"] = "https://wago.io/uYX5mP3U5/10",
			["version"] = 10,
			["width"] = 1,
			["xOffset"] = -3000,
			["yOffset"] = 0,
			["zoom"] = 0,
		},
		["EDE [NW] Repentance Check"] = {
			["actions"] = {
				["finish"] = {
					["do_sound"] = false,
					["sound"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Sounds\\hurricane.ogg",
					["stop_sound"] = true,
				},
				["init"] = {
				},
				["start"] = {
					["do_glow"] = false,
					["do_loop"] = false,
					["do_sound"] = false,
					["glow_action"] = "show",
					["glow_frame_type"] = "FRAMESELECTOR",
					["glow_type"] = "buttonOverlay",
					["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\BikeHorn.ogg",
					["sound_repeat"] = 10,
				},
			},
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["anchorPoint"] = "CENTER",
			["animation"] = {
				["finish"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["preset"] = "bounce",
					["type"] = "preset",
				},
				["start"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
			},
			["authorOptions"] = {
			},
			["auto"] = false,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["conditions"] = {
				{
					["changes"] = {
						{
						}, -- [1]
					},
					["check"] = {
					},
				}, -- [1]
			},
			["config"] = {
			},
			["cooldown"] = false,
			["cooldownEdge"] = false,
			["cooldownSwipe"] = true,
			["cooldownTextDisabled"] = false,
			["customTextUpdate"] = "update",
			["desaturate"] = false,
			["displayIcon"] = "135942",
			["frameStrata"] = 3,
			["height"] = 80,
			["icon"] = true,
			["iconSource"] = 0,
			["id"] = "EDE [NW] Repentance Check",
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["internalVersion"] = 45,
			["inverse"] = false,
			["keepAspectRatio"] = false,
			["load"] = {
				["affixes"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
					["single"] = "PALADIN",
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["faction"] = {
					["multi"] = {
					},
				},
				["ingroup"] = {
					["multi"] = {
						["group"] = true,
						["raid"] = true,
					},
				},
				["instance_type"] = {
					["single"] = 23,
				},
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["role"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
						["arena"] = true,
						["flexible"] = true,
						["fortyman"] = true,
						["party"] = true,
						["pvp"] = true,
						["scenario"] = true,
						["ten"] = true,
						["twenty"] = true,
						["twentyfive"] = true,
					},
				},
				["spec"] = {
					["multi"] = {
						true, -- [1]
					},
					["single"] = 1,
				},
				["spellknown"] = 53563,
				["talent"] = {
					["multi"] = {
						[7] = true,
						[9] = true,
					},
					["single"] = 19,
				},
				["talent2"] = {
					["multi"] = {
						[20] = true,
					},
					["single"] = 20,
				},
				["talent3"] = {
					["multi"] = {
					},
				},
				["use_class"] = true,
				["use_combat"] = false,
				["use_encounterid"] = false,
				["use_instance_type"] = true,
				["use_never"] = false,
				["use_spec"] = false,
				["use_spellknown"] = false,
				["use_talent"] = false,
				["use_zoneIds"] = true,
				["zoneIds"] = "g410",
			},
			["parent"] = "Ellesmere's Dungeon Essentials",
			["preferToUpdate"] = true,
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["semver"] = "1.0.9",
			["stickyDuration"] = false,
			["subRegions"] = {
				{
					["glow"] = true,
					["glowBorder"] = false,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["glowFrequency"] = 0.25,
					["glowLength"] = 10,
					["glowLines"] = 8,
					["glowScale"] = 1,
					["glowThickness"] = 1,
					["glowType"] = "buttonOverlay",
					["glowXOffset"] = 0,
					["glowYOffset"] = 0,
					["type"] = "subglow",
					["useGlowColor"] = false,
				}, -- [1]
			},
			["tocversion"] = 90002,
			["triggers"] = {
				[1] = {
					["trigger"] = {
						["auranames"] = {
							"Beacon of Light", -- [1]
						},
						["auraspellids"] = {
							"53563", -- [1]
						},
						["buffShowOn"] = "showOnActive",
						["combineMatches"] = "showLowest",
						["custom_hide"] = "timed",
						["debuffType"] = "HELPFUL",
						["duration"] = "1",
						["event"] = "Talent Known",
						["genericShowOn"] = "showOnCooldown",
						["group_count"] = "0",
						["group_countOperator"] = "==",
						["ignoreDead"] = false,
						["inverse"] = true,
						["name"] = "Greater Blessing of Wisdom",
						["names"] = {
							"Beacon of Light", -- [1]
						},
						["ownOnly"] = true,
						["realSpellName"] = 0,
						["spellId"] = "203539",
						["spellIds"] = {
						},
						["spellName"] = 0,
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["talent"] = {
							["single"] = 8,
						},
						["type"] = "unit",
						["unevent"] = "auto",
						["unit"] = "group",
						["useAffected"] = true,
						["useExactSpellId"] = true,
						["useGroup_count"] = true,
						["useName"] = false,
						["use_debuffClass"] = false,
						["use_genericShowOn"] = true,
						["use_inverse"] = true,
						["use_specific_unit"] = false,
						["use_spellId"] = true,
						["use_spellName"] = true,
						["use_talent"] = true,
						["use_tooltip"] = false,
						["use_track"] = true,
						["use_unit"] = true,
					},
					["untrigger"] = {
					},
				},
				["activeTriggerMode"] = -10,
				["disjunctive"] = "all",
			},
			["uid"] = "ItfMSDCrEVV",
			["url"] = "https://wago.io/uYX5mP3U5/10",
			["version"] = 10,
			["width"] = 80,
			["xOffset"] = -15,
			["yOffset"] = 90,
			["zoom"] = 0,
		},
		["EDE [NW] Shadow Well"] = {
			["actions"] = {
				["finish"] = {
				},
				["init"] = {
				},
				["start"] = {
					["do_sound"] = true,
					["sound"] = "Interface\\Addons\\Details\\sounds\\sound_gun2.ogg",
				},
			},
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["anchorPoint"] = "CENTER",
			["animation"] = {
				["finish"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["start"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
			},
			["authorOptions"] = {
			},
			["auto"] = true,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["config"] = {
			},
			["cooldown"] = true,
			["cooldownEdge"] = false,
			["cooldownSwipe"] = true,
			["cooldownTextDisabled"] = false,
			["desaturate"] = false,
			["displayIcon"] = "2576095",
			["frameStrata"] = 1,
			["height"] = 1,
			["icon"] = true,
			["iconSource"] = -1,
			["id"] = "EDE [NW] Shadow Well",
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["internalVersion"] = 45,
			["inverse"] = false,
			["keepAspectRatio"] = false,
			["load"] = {
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["use_zoneIds"] = true,
				["zoneIds"] = "g410",
			},
			["parent"] = "Ellesmere's Dungeon Essentials",
			["preferToUpdate"] = true,
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["semver"] = "1.0.9",
			["subRegions"] = {
			},
			["tocversion"] = 90002,
			["triggers"] = {
				[1] = {
					["trigger"] = {
						["auraspellids"] = {
							"321821", -- [1]
						},
						["debuffType"] = "HARMFUL",
						["destUnit"] = "player",
						["duration"] = "1",
						["event"] = "Cast",
						["fetchTooltip"] = false,
						["names"] = {
						},
						["remaining"] = "3",
						["remaining_operator"] = "<",
						["spellId"] = 320571,
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "unit",
						["unevent"] = "auto",
						["unit"] = "nameplate",
						["useExactSpellId"] = true,
						["use_absorbMode"] = true,
						["use_destUnit"] = false,
						["use_remaining"] = false,
						["use_spellId"] = true,
						["use_unit"] = true,
					},
					["untrigger"] = {
						["unit"] = "nameplate",
					},
				},
				["activeTriggerMode"] = -10,
			},
			["uid"] = "1rfAzY5xQ6k",
			["url"] = "https://wago.io/uYX5mP3U5/10",
			["version"] = 10,
			["width"] = 1,
			["xOffset"] = -3000,
			["yOffset"] = 0,
			["zoom"] = 0.3,
		},
		["EDE [OTHERS] Blinding Light Check"] = {
			["actions"] = {
				["finish"] = {
					["do_sound"] = false,
					["sound"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Sounds\\hurricane.ogg",
					["stop_sound"] = true,
				},
				["init"] = {
				},
				["start"] = {
					["do_glow"] = false,
					["do_loop"] = false,
					["do_sound"] = false,
					["glow_action"] = "show",
					["glow_frame_type"] = "FRAMESELECTOR",
					["glow_type"] = "buttonOverlay",
					["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\BikeHorn.ogg",
					["sound_repeat"] = 10,
				},
			},
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["anchorPoint"] = "CENTER",
			["animation"] = {
				["finish"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["preset"] = "bounce",
					["type"] = "preset",
				},
				["start"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
			},
			["authorOptions"] = {
			},
			["auto"] = false,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["conditions"] = {
				{
					["changes"] = {
						{
						}, -- [1]
					},
					["check"] = {
					},
				}, -- [1]
			},
			["config"] = {
			},
			["cooldown"] = false,
			["cooldownEdge"] = false,
			["cooldownSwipe"] = true,
			["cooldownTextDisabled"] = false,
			["customTextUpdate"] = "update",
			["desaturate"] = false,
			["displayIcon"] = "571553",
			["frameStrata"] = 3,
			["height"] = 80,
			["icon"] = true,
			["iconSource"] = 0,
			["id"] = "EDE [OTHERS] Blinding Light Check",
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["internalVersion"] = 45,
			["inverse"] = false,
			["keepAspectRatio"] = false,
			["load"] = {
				["affixes"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
					["single"] = "PALADIN",
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["faction"] = {
					["multi"] = {
					},
				},
				["ingroup"] = {
					["multi"] = {
						["group"] = true,
						["raid"] = true,
					},
				},
				["instance_type"] = {
					["single"] = 23,
				},
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["role"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
						["arena"] = true,
						["flexible"] = true,
						["fortyman"] = true,
						["party"] = true,
						["pvp"] = true,
						["scenario"] = true,
						["ten"] = true,
						["twenty"] = true,
						["twentyfive"] = true,
					},
				},
				["spec"] = {
					["multi"] = {
						true, -- [1]
					},
					["single"] = 1,
				},
				["spellknown"] = 53563,
				["talent"] = {
					["multi"] = {
						[7] = true,
						[8] = true,
					},
					["single"] = 19,
				},
				["talent2"] = {
					["multi"] = {
						[20] = true,
					},
					["single"] = 20,
				},
				["talent3"] = {
					["multi"] = {
					},
				},
				["use_class"] = true,
				["use_combat"] = false,
				["use_encounterid"] = false,
				["use_instance_type"] = true,
				["use_never"] = false,
				["use_spec"] = false,
				["use_spellknown"] = false,
				["use_talent"] = false,
				["use_zoneIds"] = true,
				["zoneIds"] = "1680, 1678, 1679, 1677, 1663, 1664, 1665, 1669, 1674, 1697, 1675, 1676, 1692, 1693, 1694, 1695, 1683, 1684, 1685, 1686, 1687",
			},
			["parent"] = "Ellesmere's Dungeon Essentials",
			["preferToUpdate"] = true,
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["semver"] = "1.0.9",
			["stickyDuration"] = false,
			["subRegions"] = {
				{
					["glow"] = true,
					["glowBorder"] = false,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["glowFrequency"] = 0.25,
					["glowLength"] = 10,
					["glowLines"] = 8,
					["glowScale"] = 1,
					["glowThickness"] = 1,
					["glowType"] = "buttonOverlay",
					["glowXOffset"] = 0,
					["glowYOffset"] = 0,
					["type"] = "subglow",
					["useGlowColor"] = false,
				}, -- [1]
			},
			["tocversion"] = 90002,
			["triggers"] = {
				[1] = {
					["trigger"] = {
						["auranames"] = {
							"Beacon of Light", -- [1]
						},
						["auraspellids"] = {
							"53563", -- [1]
						},
						["buffShowOn"] = "showOnActive",
						["combineMatches"] = "showLowest",
						["custom_hide"] = "timed",
						["debuffType"] = "HELPFUL",
						["duration"] = "1",
						["event"] = "Talent Known",
						["genericShowOn"] = "showOnCooldown",
						["group_count"] = "0",
						["group_countOperator"] = "==",
						["ignoreDead"] = false,
						["inverse"] = true,
						["name"] = "Greater Blessing of Wisdom",
						["names"] = {
							"Beacon of Light", -- [1]
						},
						["ownOnly"] = true,
						["realSpellName"] = 0,
						["spellId"] = "203539",
						["spellIds"] = {
						},
						["spellName"] = 0,
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["talent"] = {
							["single"] = 9,
						},
						["type"] = "unit",
						["unevent"] = "auto",
						["unit"] = "group",
						["useAffected"] = true,
						["useExactSpellId"] = true,
						["useGroup_count"] = true,
						["useName"] = false,
						["use_debuffClass"] = false,
						["use_genericShowOn"] = true,
						["use_inverse"] = true,
						["use_specific_unit"] = false,
						["use_spellId"] = true,
						["use_spellName"] = true,
						["use_talent"] = true,
						["use_tooltip"] = false,
						["use_track"] = true,
						["use_unit"] = true,
					},
					["untrigger"] = {
					},
				},
				["activeTriggerMode"] = -10,
				["disjunctive"] = "all",
			},
			["uid"] = "1ePm4dV(vOc",
			["url"] = "https://wago.io/uYX5mP3U5/10",
			["version"] = 10,
			["width"] = 80,
			["xOffset"] = -15,
			["yOffset"] = 90,
			["zoom"] = 0,
		},
		["EDE [PF] Belch Plague"] = {
			["actions"] = {
				["finish"] = {
					["do_sound"] = false,
				},
				["init"] = {
				},
				["start"] = {
					["do_sound"] = true,
					["sound"] = "Interface\\Addons\\Details\\sounds\\sound_gun2.ogg",
				},
			},
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["anchorPoint"] = "CENTER",
			["animation"] = {
				["finish"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["start"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
			},
			["authorOptions"] = {
			},
			["auto"] = false,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["config"] = {
			},
			["cooldown"] = true,
			["cooldownEdge"] = false,
			["cooldownSwipe"] = true,
			["cooldownTextDisabled"] = false,
			["customText"] = "",
			["desaturate"] = false,
			["displayIcon"] = "132108",
			["frameStrata"] = 1,
			["height"] = 1,
			["icon"] = true,
			["iconSource"] = 0,
			["id"] = "EDE [PF] Belch Plague",
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["internalVersion"] = 45,
			["inverse"] = false,
			["keepAspectRatio"] = false,
			["load"] = {
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
						["party"] = true,
					},
					["single"] = "party",
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["use_size"] = true,
				["use_zoneIds"] = false,
				["zoneIds"] = ", g415",
			},
			["parent"] = "Ellesmere's Dungeon Essentials",
			["preferToUpdate"] = true,
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["semver"] = "1.0.9",
			["subRegions"] = {
			},
			["tocversion"] = 90002,
			["triggers"] = {
				[1] = {
					["trigger"] = {
						["auraspellids"] = {
						},
						["debuffType"] = "HARMFUL",
						["duration"] = "5",
						["event"] = "Cast",
						["genericShowOn"] = "showOnCooldown",
						["names"] = {
						},
						["realSpellName"] = 0,
						["spellId"] = 327233,
						["spellIds"] = {
						},
						["spellName"] = 0,
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "unit",
						["unevent"] = "auto",
						["unit"] = "nameplate",
						["use_absorbMode"] = true,
						["use_cloneId"] = true,
						["use_genericShowOn"] = true,
						["use_spellId"] = true,
						["use_spellName"] = true,
						["use_track"] = true,
						["use_unit"] = true,
					},
					["untrigger"] = {
						["unit"] = "nameplate",
					},
				},
				["activeTriggerMode"] = -10,
				["disjunctive"] = "any",
			},
			["uid"] = "jSoO8VxYfO0",
			["url"] = "https://wago.io/uYX5mP3U5/10",
			["version"] = 10,
			["width"] = 1,
			["xOffset"] = -3000,
			["yOffset"] = 0,
			["zoom"] = 0.3,
		},
		["EDE [PF] Festering Belch"] = {
			["actions"] = {
				["finish"] = {
				},
				["init"] = {
				},
				["start"] = {
					["do_sound"] = true,
					["sound"] = "Interface\\Addons\\Details\\sounds\\sound_gun2.ogg",
				},
			},
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["anchorPoint"] = "CENTER",
			["animation"] = {
				["finish"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["start"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
			},
			["authorOptions"] = {
			},
			["auto"] = true,
			["backgroundColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				0.5, -- [4]
			},
			["barColor"] = {
				1, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["config"] = {
			},
			["cooldown"] = true,
			["cooldownEdge"] = false,
			["cooldownSwipe"] = true,
			["cooldownTextDisabled"] = false,
			["customText"] = "function()\n    if aura_env.state and aura_env.state.destName then\n    return WA_ClassColorName(aura_env.state.destName)    \n    end\nend",
			["desaturate"] = false,
			["displayIcon"] = "134437",
			["frameStrata"] = 1,
			["height"] = 1,
			["icon"] = true,
			["iconSource"] = -1,
			["icon_color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["icon_side"] = "RIGHT",
			["id"] = "EDE [PF] Festering Belch",
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["internalVersion"] = 45,
			["inverse"] = false,
			["keepAspectRatio"] = false,
			["load"] = {
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["use_zoneIds"] = true,
				["zoneIds"] = "g415",
			},
			["orientation"] = "HORIZONTAL",
			["parent"] = "Ellesmere's Dungeon Essentials",
			["preferToUpdate"] = true,
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["semver"] = "1.0.9",
			["spark"] = false,
			["sparkBlendMode"] = "ADD",
			["sparkColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["sparkHeight"] = 30,
			["sparkHidden"] = "NEVER",
			["sparkOffsetX"] = 0,
			["sparkOffsetY"] = 0,
			["sparkRotation"] = 0,
			["sparkRotationMode"] = "AUTO",
			["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
			["sparkWidth"] = 10,
			["subRegions"] = {
			},
			["texture"] = "Blizzard",
			["tocversion"] = 90002,
			["triggers"] = {
				[1] = {
					["trigger"] = {
						["auraspellids"] = {
						},
						["debuffType"] = "HARMFUL",
						["duration"] = "1",
						["event"] = "Cast",
						["names"] = {
						},
						["spellId"] = 318949,
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "unit",
						["unevent"] = "auto",
						["unit"] = "nameplate",
						["use_absorbMode"] = true,
						["use_spellId"] = true,
						["use_unit"] = true,
					},
					["untrigger"] = {
						["unit"] = "nameplate",
					},
				},
				["activeTriggerMode"] = -10,
				["customTriggerLogic"] = "function(t)\nreturn t[1]\nend",
				["disjunctive"] = "any",
			},
			["uid"] = "TYAZN)BAw(e",
			["url"] = "https://wago.io/uYX5mP3U5/10",
			["useAdjustededMax"] = false,
			["useAdjustededMin"] = false,
			["useTooltip"] = false,
			["version"] = 10,
			["width"] = 1,
			["xOffset"] = -3000,
			["yOffset"] = 0,
			["zoom"] = 0,
		},
		["EDE [PF] Wing Buffet"] = {
			["actions"] = {
				["finish"] = {
				},
				["init"] = {
				},
				["start"] = {
					["do_sound"] = true,
					["sound"] = "Interface\\Addons\\Details\\sounds\\sound_gun2.ogg",
				},
			},
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["anchorPoint"] = "CENTER",
			["animation"] = {
				["finish"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["start"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
			},
			["authorOptions"] = {
			},
			["auto"] = true,
			["backgroundColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				0.5, -- [4]
			},
			["barColor"] = {
				1, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["config"] = {
			},
			["cooldown"] = true,
			["cooldownEdge"] = false,
			["cooldownSwipe"] = true,
			["cooldownTextDisabled"] = false,
			["customText"] = "",
			["desaturate"] = false,
			["displayIcon"] = "1320372",
			["frameStrata"] = 1,
			["height"] = 1,
			["icon"] = true,
			["iconSource"] = -1,
			["icon_color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["icon_side"] = "RIGHT",
			["id"] = "EDE [PF] Wing Buffet",
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["internalVersion"] = 45,
			["inverse"] = false,
			["keepAspectRatio"] = false,
			["load"] = {
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["use_zoneIds"] = true,
				["zoneIds"] = "g415",
			},
			["orientation"] = "HORIZONTAL",
			["parent"] = "Ellesmere's Dungeon Essentials",
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["semver"] = "1.0.9",
			["spark"] = false,
			["sparkBlendMode"] = "ADD",
			["sparkColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["sparkHeight"] = 30,
			["sparkHidden"] = "NEVER",
			["sparkOffsetX"] = 0,
			["sparkOffsetY"] = 0,
			["sparkRotation"] = 0,
			["sparkRotationMode"] = "AUTO",
			["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
			["sparkWidth"] = 10,
			["subRegions"] = {
				{
					["anchorXOffset"] = 0,
					["anchorYOffset"] = 0,
					["rotateText"] = "NONE",
					["text_anchorPoint"] = "CENTER",
					["text_anchorXOffset"] = 0,
					["text_anchorYOffset"] = 0,
					["text_automaticWidth"] = "Auto",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_fixedWidth"] = 64,
					["text_font"] = "Friz Quadrata TT",
					["text_fontSize"] = 28,
					["text_fontType"] = "OUTLINE",
					["text_justify"] = "CENTER",
					["text_selfPoint"] = "AUTO",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_shadowXOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["text_text"] = "%p",
					["text_text_format_p_format"] = "timed",
					["text_text_format_p_time_dynamic_threshold"] = 3,
					["text_text_format_p_time_format"] = 0,
					["text_text_format_p_time_precision"] = 1,
					["text_text_format_s_format"] = "none",
					["text_visible"] = false,
					["text_wordWrap"] = "WordWrap",
					["type"] = "subtext",
				}, -- [1]
				{
					["anchorXOffset"] = 0,
					["anchorYOffset"] = 0,
					["rotateText"] = "NONE",
					["text_anchorPoint"] = "OUTER_BOTTOM",
					["text_anchorYOffset"] = 0,
					["text_automaticWidth"] = "Auto",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_fixedWidth"] = 64,
					["text_font"] = "Friz Quadrata TT",
					["text_fontSize"] = 17,
					["text_fontType"] = "OUTLINE",
					["text_justify"] = "CENTER",
					["text_selfPoint"] = "AUTO",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_shadowXOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["text_text"] = "cleave",
					["text_text_format_1.destUnit_abbreviate"] = false,
					["text_text_format_1.destUnit_abbreviate_max"] = 8,
					["text_text_format_1.destUnit_color"] = "class",
					["text_text_format_1.destUnit_format"] = "Unit",
					["text_text_format_1.destUnit_realm_name"] = "never",
					["text_text_format_1_format"] = "none",
					["text_text_format_p_format"] = "timed",
					["text_text_format_p_time_dynamic_threshold"] = 60,
					["text_text_format_p_time_format"] = 0,
					["text_text_format_p_time_precision"] = 1,
					["text_visible"] = true,
					["text_wordWrap"] = "WordWrap",
					["type"] = "subtext",
				}, -- [2]
			},
			["texture"] = "Blizzard",
			["tocversion"] = 90002,
			["triggers"] = {
				[1] = {
					["trigger"] = {
						["auraspellids"] = {
						},
						["debuffType"] = "HARMFUL",
						["duration"] = "6",
						["event"] = "Cast",
						["genericShowOn"] = "showOnCooldown",
						["names"] = {
						},
						["realSpellName"] = 0,
						["spellId"] = 330404,
						["spellIds"] = {
						},
						["spellName"] = 0,
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "unit",
						["unevent"] = "auto",
						["unit"] = "nameplate",
						["use_absorbMode"] = true,
						["use_cloneId"] = true,
						["use_genericShowOn"] = true,
						["use_spellId"] = true,
						["use_spellName"] = true,
						["use_track"] = true,
						["use_unit"] = true,
					},
					["untrigger"] = {
						["unit"] = "nameplate",
					},
				},
				["activeTriggerMode"] = -10,
			},
			["uid"] = "Z)n57)4aRQy",
			["url"] = "https://wago.io/uYX5mP3U5/10",
			["useAdjustededMax"] = false,
			["useAdjustededMin"] = false,
			["useTooltip"] = false,
			["version"] = 10,
			["width"] = 1,
			["xOffset"] = -3000,
			["yOffset"] = 0,
			["zoom"] = 0,
		},
		["EDE [SD] Echoing Thrust"] = {
			["actions"] = {
				["finish"] = {
					["do_sound"] = false,
				},
				["init"] = {
				},
				["start"] = {
					["do_sound"] = true,
					["sound"] = "Interface\\Addons\\Details\\sounds\\sound_gun2.ogg",
				},
			},
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["anchorPoint"] = "CENTER",
			["animation"] = {
				["finish"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["start"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
			},
			["authorOptions"] = {
			},
			["auto"] = true,
			["backgroundColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				0.5, -- [4]
			},
			["barColor"] = {
				1, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["config"] = {
			},
			["cooldown"] = true,
			["cooldownEdge"] = false,
			["cooldownSwipe"] = true,
			["cooldownTextDisabled"] = false,
			["desaturate"] = false,
			["displayIcon"] = "3259845",
			["frameStrata"] = 1,
			["height"] = 1,
			["icon"] = true,
			["iconSource"] = -1,
			["icon_color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["icon_side"] = "RIGHT",
			["id"] = "EDE [SD] Echoing Thrust",
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["internalVersion"] = 45,
			["inverse"] = false,
			["keepAspectRatio"] = false,
			["load"] = {
				["class"] = {
					["multi"] = {
					},
				},
				["role"] = {
					["multi"] = {
						["TANK"] = true,
					},
					["single"] = "TANK",
				},
				["size"] = {
					["multi"] = {
						["party"] = true,
					},
					["single"] = "party",
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["use_size"] = true,
				["use_zoneIds"] = false,
				["zoneIds"] = ", g412",
			},
			["orientation"] = "HORIZONTAL",
			["parent"] = "Ellesmere's Dungeon Essentials",
			["preferToUpdate"] = true,
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["semver"] = "1.0.9",
			["spark"] = false,
			["sparkBlendMode"] = "ADD",
			["sparkColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["sparkHeight"] = 30,
			["sparkHidden"] = "NEVER",
			["sparkOffsetX"] = 0,
			["sparkOffsetY"] = 0,
			["sparkRotation"] = 0,
			["sparkRotationMode"] = "AUTO",
			["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
			["sparkWidth"] = 10,
			["subRegions"] = {
			},
			["texture"] = "Blizzard",
			["tocversion"] = 90002,
			["triggers"] = {
				[1] = {
					["trigger"] = {
						["auranames"] = {
							"", -- [1]
						},
						["buffShowOn"] = "showOnActive",
						["debuffType"] = "HARMFUL",
						["destUnit"] = "player",
						["duration"] = "5",
						["event"] = "Cast",
						["names"] = {
						},
						["npcId"] = "165318",
						["percentpower"] = "90",
						["percentpower_operator"] = ">",
						["spellId"] = 320991,
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_SUCCESS",
						["type"] = "unit",
						["unevent"] = "auto",
						["unit"] = "nameplate",
						["useName"] = true,
						["use_absorbMode"] = true,
						["use_cloneId"] = true,
						["use_destUnit"] = false,
						["use_npcId"] = false,
						["use_percentpower"] = true,
						["use_powertype"] = false,
						["use_sourceUnit"] = true,
						["use_spellId"] = true,
						["use_unit"] = true,
					},
					["untrigger"] = {
						["unit"] = "nameplate",
					},
				},
				["activeTriggerMode"] = -10,
			},
			["uid"] = "gUk85eBA88J",
			["url"] = "https://wago.io/uYX5mP3U5/10",
			["useAdjustededMax"] = false,
			["useAdjustededMin"] = false,
			["useTooltip"] = false,
			["version"] = 10,
			["width"] = 1,
			["xOffset"] = -3000,
			["yOffset"] = 0,
			["zoom"] = 0,
		},
		["EDE [SD] Growing Mistrust"] = {
			["actions"] = {
				["finish"] = {
				},
				["init"] = {
				},
				["start"] = {
					["do_sound"] = true,
					["sound"] = "Interface\\Addons\\Details\\sounds\\sound_gun2.ogg",
				},
			},
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["anchorPoint"] = "CENTER",
			["animation"] = {
				["finish"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["start"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
			},
			["authorOptions"] = {
			},
			["auto"] = true,
			["backgroundColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				0.5, -- [4]
			},
			["barColor"] = {
				1, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["config"] = {
			},
			["cooldown"] = true,
			["cooldownEdge"] = false,
			["cooldownSwipe"] = true,
			["cooldownTextDisabled"] = false,
			["desaturate"] = false,
			["displayIcon"] = "3528309",
			["frameStrata"] = 1,
			["height"] = 1,
			["icon"] = true,
			["iconSource"] = 0,
			["icon_color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["icon_side"] = "RIGHT",
			["id"] = "EDE [SD] Growing Mistrust",
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["internalVersion"] = 45,
			["inverse"] = false,
			["keepAspectRatio"] = false,
			["load"] = {
				["class"] = {
					["multi"] = {
					},
				},
				["role"] = {
					["multi"] = {
						["TANK"] = true,
					},
					["single"] = "TANK",
				},
				["size"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["use_zoneIds"] = true,
				["zoneIds"] = "g412",
			},
			["orientation"] = "HORIZONTAL",
			["parent"] = "Ellesmere's Dungeon Essentials",
			["preferToUpdate"] = true,
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["semver"] = "1.0.9",
			["spark"] = false,
			["sparkBlendMode"] = "ADD",
			["sparkColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["sparkHeight"] = 30,
			["sparkHidden"] = "NEVER",
			["sparkOffsetX"] = 0,
			["sparkOffsetY"] = 0,
			["sparkRotation"] = 0,
			["sparkRotationMode"] = "AUTO",
			["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
			["sparkWidth"] = 10,
			["subRegions"] = {
			},
			["texture"] = "Blizzard",
			["tocversion"] = 90002,
			["triggers"] = {
				[1] = {
					["trigger"] = {
						["auranames"] = {
							"", -- [1]
						},
						["buffShowOn"] = "showOnActive",
						["debuffType"] = "HARMFUL",
						["destUnit"] = "player",
						["duration"] = "5",
						["event"] = "Combat Log",
						["names"] = {
						},
						["npcId"] = "165318",
						["percentpower"] = "90",
						["percentpower_operator"] = ">",
						["sourceNpcId"] = "162049",
						["sourceUnit"] = "player",
						["spell"] = "Growing Mistrust",
						["spellId"] = 322169,
						["spellIds"] = {
						},
						["spellName"] = "Growing Mistrust",
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_SUCCESS",
						["type"] = "combatlog",
						["unevent"] = "timed",
						["unit"] = "nameplate",
						["useName"] = true,
						["use_absorbMode"] = true,
						["use_cloneId"] = false,
						["use_destUnit"] = false,
						["use_npcId"] = false,
						["use_percentpower"] = true,
						["use_powertype"] = false,
						["use_sourceNpcId"] = true,
						["use_sourceUnit"] = false,
						["use_spell"] = true,
						["use_spellId"] = false,
						["use_spellName"] = false,
						["use_unit"] = true,
					},
					["untrigger"] = {
						["unit"] = "nameplate",
					},
				},
				["activeTriggerMode"] = -10,
			},
			["uid"] = "fdE9bSI4Q5L",
			["url"] = "https://wago.io/uYX5mP3U5/10",
			["useAdjustededMax"] = false,
			["useAdjustededMin"] = false,
			["useTooltip"] = false,
			["version"] = 10,
			["width"] = 1,
			["xOffset"] = -3000,
			["yOffset"] = 0,
			["zoom"] = 0,
		},
		["EDE [SD] Severing Slice"] = {
			["actions"] = {
				["finish"] = {
				},
				["init"] = {
				},
				["start"] = {
					["do_sound"] = true,
					["sound"] = "Interface\\Addons\\Details\\sounds\\sound_gun2.ogg",
				},
			},
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["anchorPoint"] = "CENTER",
			["animation"] = {
				["finish"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["start"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
			},
			["authorOptions"] = {
			},
			["auto"] = true,
			["backgroundColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				0.5, -- [4]
			},
			["barColor"] = {
				1, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["config"] = {
			},
			["cooldown"] = true,
			["cooldownEdge"] = false,
			["cooldownSwipe"] = true,
			["cooldownTextDisabled"] = false,
			["desaturate"] = false,
			["displayIcon"] = "1476626",
			["frameStrata"] = 1,
			["height"] = 1,
			["icon"] = true,
			["iconSource"] = -1,
			["icon_color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["icon_side"] = "RIGHT",
			["id"] = "EDE [SD] Severing Slice",
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["internalVersion"] = 45,
			["inverse"] = false,
			["keepAspectRatio"] = false,
			["load"] = {
				["class"] = {
					["multi"] = {
					},
				},
				["role"] = {
					["multi"] = {
						["TANK"] = true,
					},
					["single"] = "TANK",
				},
				["size"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["use_zoneIds"] = true,
				["zoneIds"] = "g412",
			},
			["orientation"] = "HORIZONTAL",
			["parent"] = "Ellesmere's Dungeon Essentials",
			["preferToUpdate"] = true,
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["semver"] = "1.0.9",
			["spark"] = false,
			["sparkBlendMode"] = "ADD",
			["sparkColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["sparkHeight"] = 30,
			["sparkHidden"] = "NEVER",
			["sparkOffsetX"] = 0,
			["sparkOffsetY"] = 0,
			["sparkRotation"] = 0,
			["sparkRotationMode"] = "AUTO",
			["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
			["sparkWidth"] = 10,
			["subRegions"] = {
			},
			["texture"] = "Blizzard",
			["tocversion"] = 90002,
			["triggers"] = {
				[1] = {
					["trigger"] = {
						["auranames"] = {
							"", -- [1]
						},
						["buffShowOn"] = "showOnActive",
						["debuffType"] = "HARMFUL",
						["destUnit"] = "player",
						["duration"] = "5",
						["event"] = "Cast",
						["names"] = {
						},
						["npcId"] = "165318",
						["percentpower"] = "90",
						["percentpower_operator"] = ">",
						["spellId"] = 322429,
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_SUCCESS",
						["type"] = "unit",
						["unevent"] = "auto",
						["unit"] = "nameplate",
						["useName"] = true,
						["use_absorbMode"] = true,
						["use_cloneId"] = true,
						["use_destUnit"] = false,
						["use_npcId"] = false,
						["use_percentpower"] = true,
						["use_powertype"] = false,
						["use_sourceUnit"] = true,
						["use_spellId"] = true,
						["use_unit"] = true,
					},
					["untrigger"] = {
						["unit"] = "nameplate",
					},
				},
				["activeTriggerMode"] = -10,
			},
			["uid"] = "TwCn5rllTb3",
			["url"] = "https://wago.io/uYX5mP3U5/10",
			["useAdjustededMax"] = false,
			["useAdjustededMin"] = false,
			["useTooltip"] = false,
			["version"] = 10,
			["width"] = 1,
			["xOffset"] = -3000,
			["yOffset"] = 0,
			["zoom"] = 0,
		},
		["EDE [SD] Sweeping Slash"] = {
			["actions"] = {
				["finish"] = {
				},
				["init"] = {
				},
				["start"] = {
					["do_sound"] = true,
					["sound"] = "Interface\\Addons\\Details\\sounds\\sound_gun2.ogg",
				},
			},
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["anchorPoint"] = "CENTER",
			["animation"] = {
				["finish"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["start"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
			},
			["authorOptions"] = {
			},
			["auto"] = true,
			["backgroundColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				0.5, -- [4]
			},
			["barColor"] = {
				1, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["config"] = {
			},
			["cooldown"] = true,
			["cooldownEdge"] = false,
			["cooldownSwipe"] = true,
			["cooldownTextDisabled"] = false,
			["desaturate"] = false,
			["displayIcon"] = "463521",
			["frameStrata"] = 1,
			["height"] = 1,
			["icon"] = true,
			["iconSource"] = -1,
			["icon_color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["icon_side"] = "RIGHT",
			["id"] = "EDE [SD] Sweeping Slash",
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["internalVersion"] = 45,
			["inverse"] = false,
			["keepAspectRatio"] = false,
			["load"] = {
				["class"] = {
					["multi"] = {
					},
				},
				["role"] = {
					["multi"] = {
						["TANK"] = true,
					},
					["single"] = "TANK",
				},
				["size"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["use_zoneIds"] = true,
				["zoneIds"] = "g412",
			},
			["orientation"] = "HORIZONTAL",
			["parent"] = "Ellesmere's Dungeon Essentials",
			["preferToUpdate"] = true,
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["semver"] = "1.0.9",
			["spark"] = false,
			["sparkBlendMode"] = "ADD",
			["sparkColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["sparkHeight"] = 30,
			["sparkHidden"] = "NEVER",
			["sparkOffsetX"] = 0,
			["sparkOffsetY"] = 0,
			["sparkRotation"] = 0,
			["sparkRotationMode"] = "AUTO",
			["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
			["sparkWidth"] = 10,
			["subRegions"] = {
			},
			["texture"] = "Blizzard",
			["tocversion"] = 90002,
			["triggers"] = {
				[1] = {
					["trigger"] = {
						["auranames"] = {
							"", -- [1]
						},
						["buffShowOn"] = "showOnActive",
						["debuffType"] = "HARMFUL",
						["destUnit"] = "player",
						["duration"] = "5",
						["event"] = "Cast",
						["names"] = {
						},
						["npcId"] = "165318",
						["percentpower"] = "90",
						["percentpower_operator"] = ">",
						["spellId"] = 334329,
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_SUCCESS",
						["type"] = "unit",
						["unevent"] = "auto",
						["unit"] = "nameplate",
						["useName"] = true,
						["use_absorbMode"] = true,
						["use_cloneId"] = true,
						["use_destUnit"] = false,
						["use_npcId"] = false,
						["use_percentpower"] = true,
						["use_powertype"] = false,
						["use_sourceUnit"] = true,
						["use_spellId"] = true,
						["use_unit"] = true,
					},
					["untrigger"] = {
						["unit"] = "nameplate",
					},
				},
				["activeTriggerMode"] = -10,
			},
			["uid"] = "R1UDDXjbxNU",
			["url"] = "https://wago.io/uYX5mP3U5/10",
			["useAdjustededMax"] = false,
			["useAdjustededMin"] = false,
			["useTooltip"] = false,
			["version"] = 10,
			["width"] = 1,
			["xOffset"] = -3000,
			["yOffset"] = 0,
			["zoom"] = 0,
		},
		["EDE [SOA] Charged Spear"] = {
			["actions"] = {
				["finish"] = {
				},
				["init"] = {
				},
				["start"] = {
					["do_sound"] = true,
					["sound"] = "Interface\\Addons\\Details\\sounds\\sound_gun2.ogg",
				},
			},
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["anchorPoint"] = "CENTER",
			["animation"] = {
				["finish"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["start"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
			},
			["authorOptions"] = {
			},
			["auto"] = true,
			["backgroundColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				0.5, -- [4]
			},
			["barColor"] = {
				1, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["config"] = {
			},
			["cooldown"] = true,
			["cooldownEdge"] = false,
			["cooldownSwipe"] = true,
			["cooldownTextDisabled"] = false,
			["desaturate"] = false,
			["displayIcon"] = "838552",
			["frameStrata"] = 1,
			["height"] = 1,
			["icon"] = true,
			["iconSource"] = -1,
			["icon_color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["icon_side"] = "RIGHT",
			["id"] = "EDE [SOA] Charged Spear",
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["internalVersion"] = 45,
			["inverse"] = false,
			["keepAspectRatio"] = false,
			["load"] = {
				["class"] = {
					["multi"] = {
					},
				},
				["role"] = {
					["multi"] = {
						["TANK"] = true,
					},
					["single"] = "TANK",
				},
				["size"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["use_zoneIds"] = true,
				["zoneIds"] = "g419",
			},
			["orientation"] = "HORIZONTAL",
			["parent"] = "Ellesmere's Dungeon Essentials",
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["semver"] = "1.0.9",
			["spark"] = false,
			["sparkBlendMode"] = "ADD",
			["sparkColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["sparkHeight"] = 30,
			["sparkHidden"] = "NEVER",
			["sparkOffsetX"] = 0,
			["sparkOffsetY"] = 0,
			["sparkRotation"] = 0,
			["sparkRotationMode"] = "AUTO",
			["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
			["sparkWidth"] = 10,
			["subRegions"] = {
				{
					["anchorXOffset"] = 0,
					["anchorYOffset"] = 0,
					["rotateText"] = "NONE",
					["text_anchorPoint"] = "CENTER",
					["text_anchorXOffset"] = 0,
					["text_anchorYOffset"] = 0,
					["text_automaticWidth"] = "Auto",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_fixedWidth"] = 64,
					["text_font"] = "Friz Quadrata TT",
					["text_fontSize"] = 28,
					["text_fontType"] = "OUTLINE",
					["text_justify"] = "CENTER",
					["text_selfPoint"] = "AUTO",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_shadowXOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["text_text"] = "%p",
					["text_text_format_p_format"] = "timed",
					["text_text_format_p_time_dynamic_threshold"] = 3,
					["text_text_format_p_time_format"] = 0,
					["text_text_format_p_time_precision"] = 1,
					["text_text_format_s_format"] = "none",
					["text_visible"] = false,
					["text_wordWrap"] = "WordWrap",
					["type"] = "subtext",
				}, -- [1]
				{
					["anchorXOffset"] = 0,
					["anchorYOffset"] = 0,
					["rotateText"] = "NONE",
					["text_anchorPoint"] = "OUTER_BOTTOM",
					["text_anchorYOffset"] = 0,
					["text_automaticWidth"] = "Auto",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_fixedWidth"] = 64,
					["text_font"] = "Friz Quadrata TT",
					["text_fontSize"] = 17,
					["text_fontType"] = "OUTLINE",
					["text_justify"] = "CENTER",
					["text_selfPoint"] = "AUTO",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_shadowXOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["text_text"] = "spear",
					["text_text_format_p_format"] = "timed",
					["text_text_format_p_time_dynamic_threshold"] = 60,
					["text_text_format_p_time_format"] = 0,
					["text_text_format_p_time_precision"] = 1,
					["text_visible"] = true,
					["text_wordWrap"] = "WordWrap",
					["type"] = "subtext",
				}, -- [2]
			},
			["texture"] = "Blizzard",
			["tocversion"] = 90002,
			["triggers"] = {
				[1] = {
					["trigger"] = {
						["auranames"] = {
							"317936", -- [1]
						},
						["debuffType"] = "HARMFUL",
						["destUnit"] = "player",
						["duration"] = "3",
						["event"] = "Cast",
						["genericShowOn"] = "showOnCooldown",
						["names"] = {
						},
						["realSpellName"] = "324444",
						["spellId"] = 328462,
						["spellIds"] = {
						},
						["spellName"] = "324444",
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_SUCCESS",
						["type"] = "unit",
						["unevent"] = "auto",
						["unit"] = "nameplate",
						["useName"] = true,
						["use_absorbMode"] = true,
						["use_destUnit"] = false,
						["use_genericShowOn"] = true,
						["use_spellId"] = true,
						["use_spellName"] = true,
						["use_track"] = true,
						["use_unit"] = true,
					},
					["untrigger"] = {
						["unit"] = "nameplate",
					},
				},
				["activeTriggerMode"] = -10,
			},
			["uid"] = "yQ51A8ad8Z9",
			["url"] = "https://wago.io/uYX5mP3U5/10",
			["useAdjustededMax"] = false,
			["useAdjustededMin"] = false,
			["useTooltip"] = false,
			["version"] = 10,
			["width"] = 1,
			["xOffset"] = -3000,
			["yOffset"] = 0,
			["zoom"] = 0,
		},
		["EDE [SOA] Crashing Strike"] = {
			["actions"] = {
				["finish"] = {
				},
				["init"] = {
				},
				["start"] = {
					["do_sound"] = true,
					["sound"] = "Interface\\Addons\\Details\\sounds\\sound_gun2.ogg",
				},
			},
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["anchorPoint"] = "CENTER",
			["animation"] = {
				["finish"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["start"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
			},
			["authorOptions"] = {
			},
			["auto"] = true,
			["backgroundColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				0.5, -- [4]
			},
			["barColor"] = {
				1, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["config"] = {
			},
			["cooldown"] = true,
			["cooldownEdge"] = false,
			["cooldownSwipe"] = true,
			["cooldownTextDisabled"] = false,
			["desaturate"] = false,
			["displayIcon"] = "135398",
			["frameStrata"] = 1,
			["height"] = 1,
			["icon"] = true,
			["iconSource"] = -1,
			["icon_color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["icon_side"] = "RIGHT",
			["id"] = "EDE [SOA] Crashing Strike",
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["internalVersion"] = 45,
			["inverse"] = false,
			["keepAspectRatio"] = false,
			["load"] = {
				["class"] = {
					["multi"] = {
					},
				},
				["role"] = {
					["multi"] = {
						["TANK"] = true,
					},
					["single"] = "TANK",
				},
				["size"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["use_zoneIds"] = true,
				["zoneIds"] = "g419",
			},
			["orientation"] = "HORIZONTAL",
			["parent"] = "Ellesmere's Dungeon Essentials",
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["semver"] = "1.0.9",
			["spark"] = false,
			["sparkBlendMode"] = "ADD",
			["sparkColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["sparkHeight"] = 30,
			["sparkHidden"] = "NEVER",
			["sparkOffsetX"] = 0,
			["sparkOffsetY"] = 0,
			["sparkRotation"] = 0,
			["sparkRotationMode"] = "AUTO",
			["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
			["sparkWidth"] = 10,
			["subRegions"] = {
				{
					["anchorXOffset"] = 0,
					["anchorYOffset"] = 0,
					["rotateText"] = "NONE",
					["text_anchorPoint"] = "CENTER",
					["text_anchorXOffset"] = 0,
					["text_anchorYOffset"] = 0,
					["text_automaticWidth"] = "Auto",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_fixedWidth"] = 64,
					["text_font"] = "Friz Quadrata TT",
					["text_fontSize"] = 28,
					["text_fontType"] = "OUTLINE",
					["text_justify"] = "CENTER",
					["text_selfPoint"] = "AUTO",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_shadowXOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["text_text"] = "%p",
					["text_text_format_p_format"] = "timed",
					["text_text_format_p_time_dynamic_threshold"] = 3,
					["text_text_format_p_time_format"] = 0,
					["text_text_format_p_time_precision"] = 1,
					["text_text_format_s_format"] = "none",
					["text_visible"] = false,
					["text_wordWrap"] = "WordWrap",
					["type"] = "subtext",
				}, -- [1]
				{
					["anchorXOffset"] = 0,
					["anchorYOffset"] = 0,
					["rotateText"] = "NONE",
					["text_anchorPoint"] = "OUTER_BOTTOM",
					["text_anchorYOffset"] = 0,
					["text_automaticWidth"] = "Auto",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_fixedWidth"] = 64,
					["text_font"] = "Friz Quadrata TT",
					["text_fontSize"] = 17,
					["text_fontType"] = "OUTLINE",
					["text_justify"] = "CENTER",
					["text_selfPoint"] = "AUTO",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_shadowXOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["text_text"] = "smash",
					["text_text_format_p_format"] = "timed",
					["text_text_format_p_time_dynamic_threshold"] = 60,
					["text_text_format_p_time_format"] = 0,
					["text_text_format_p_time_precision"] = 1,
					["text_visible"] = true,
					["text_wordWrap"] = "WordWrap",
					["type"] = "subtext",
				}, -- [2]
			},
			["texture"] = "Blizzard",
			["tocversion"] = 90002,
			["triggers"] = {
				[1] = {
					["trigger"] = {
						["auranames"] = {
							"317936", -- [1]
						},
						["debuffType"] = "HARMFUL",
						["destUnit"] = "player",
						["duration"] = "3",
						["event"] = "Cast",
						["genericShowOn"] = "showOnCooldown",
						["names"] = {
						},
						["realSpellName"] = "324444",
						["spellId"] = 317985,
						["spellIds"] = {
						},
						["spellName"] = "324444",
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_SUCCESS",
						["type"] = "unit",
						["unevent"] = "auto",
						["unit"] = "nameplate",
						["useName"] = true,
						["use_absorbMode"] = true,
						["use_destUnit"] = false,
						["use_genericShowOn"] = true,
						["use_spellId"] = true,
						["use_spellName"] = true,
						["use_track"] = true,
						["use_unit"] = true,
					},
					["untrigger"] = {
						["unit"] = "nameplate",
					},
				},
				["activeTriggerMode"] = -10,
			},
			["uid"] = "62sKmsg24vb",
			["url"] = "https://wago.io/uYX5mP3U5/10",
			["useAdjustededMax"] = false,
			["useAdjustededMin"] = false,
			["useTooltip"] = false,
			["version"] = 10,
			["width"] = 1,
			["xOffset"] = -3000,
			["yOffset"] = 0,
			["zoom"] = 0,
		},
		["EDE [SOA] Crescendo"] = {
			["actions"] = {
				["finish"] = {
				},
				["init"] = {
				},
				["start"] = {
					["do_sound"] = true,
					["sound"] = "Interface\\Addons\\Details\\sounds\\sound_gun2.ogg",
				},
			},
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["anchorPoint"] = "CENTER",
			["animation"] = {
				["finish"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["start"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
			},
			["authorOptions"] = {
			},
			["auto"] = true,
			["backgroundColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				0.5, -- [4]
			},
			["barColor"] = {
				1, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["config"] = {
			},
			["cooldown"] = true,
			["cooldownEdge"] = false,
			["cooldownSwipe"] = true,
			["cooldownTextDisabled"] = false,
			["desaturate"] = false,
			["displayIcon"] = "135398",
			["frameStrata"] = 1,
			["height"] = 1,
			["icon"] = true,
			["iconSource"] = -1,
			["icon_color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["icon_side"] = "RIGHT",
			["id"] = "EDE [SOA] Crescendo",
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["internalVersion"] = 45,
			["inverse"] = false,
			["keepAspectRatio"] = false,
			["load"] = {
				["class"] = {
					["multi"] = {
					},
				},
				["role"] = {
					["multi"] = {
						["TANK"] = true,
					},
					["single"] = "TANK",
				},
				["size"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["use_zoneIds"] = true,
				["zoneIds"] = "g419",
			},
			["orientation"] = "HORIZONTAL",
			["parent"] = "Ellesmere's Dungeon Essentials",
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["semver"] = "1.0.9",
			["spark"] = false,
			["sparkBlendMode"] = "ADD",
			["sparkColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["sparkHeight"] = 30,
			["sparkHidden"] = "NEVER",
			["sparkOffsetX"] = 0,
			["sparkOffsetY"] = 0,
			["sparkRotation"] = 0,
			["sparkRotationMode"] = "AUTO",
			["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
			["sparkWidth"] = 10,
			["subRegions"] = {
				{
					["anchorXOffset"] = 0,
					["anchorYOffset"] = 0,
					["rotateText"] = "NONE",
					["text_anchorPoint"] = "CENTER",
					["text_anchorXOffset"] = 0,
					["text_anchorYOffset"] = 0,
					["text_automaticWidth"] = "Auto",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_fixedWidth"] = 64,
					["text_font"] = "Friz Quadrata TT",
					["text_fontSize"] = 28,
					["text_fontType"] = "OUTLINE",
					["text_justify"] = "CENTER",
					["text_selfPoint"] = "AUTO",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_shadowXOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["text_text"] = "%p",
					["text_text_format_p_format"] = "timed",
					["text_text_format_p_time_dynamic_threshold"] = 3,
					["text_text_format_p_time_format"] = 0,
					["text_text_format_p_time_precision"] = 1,
					["text_text_format_s_format"] = "none",
					["text_visible"] = false,
					["text_wordWrap"] = "WordWrap",
					["type"] = "subtext",
				}, -- [1]
				{
					["anchorXOffset"] = 0,
					["anchorYOffset"] = 0,
					["rotateText"] = "NONE",
					["text_anchorPoint"] = "OUTER_BOTTOM",
					["text_anchorYOffset"] = 0,
					["text_automaticWidth"] = "Auto",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_fixedWidth"] = 64,
					["text_font"] = "Friz Quadrata TT",
					["text_fontSize"] = 17,
					["text_fontType"] = "OUTLINE",
					["text_justify"] = "CENTER",
					["text_selfPoint"] = "AUTO",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_shadowXOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["text_text"] = "smash",
					["text_text_format_p_format"] = "timed",
					["text_text_format_p_time_dynamic_threshold"] = 60,
					["text_text_format_p_time_format"] = 0,
					["text_text_format_p_time_precision"] = 1,
					["text_visible"] = true,
					["text_wordWrap"] = "WordWrap",
					["type"] = "subtext",
				}, -- [2]
			},
			["texture"] = "Blizzard",
			["tocversion"] = 90002,
			["triggers"] = {
				[1] = {
					["trigger"] = {
						["auranames"] = {
							"317936", -- [1]
						},
						["debuffType"] = "HARMFUL",
						["destUnit"] = "player",
						["duration"] = "3",
						["event"] = "Cast",
						["genericShowOn"] = "showOnCooldown",
						["names"] = {
						},
						["realSpellName"] = "324444",
						["spellId"] = 328217,
						["spellIds"] = {
						},
						["spellName"] = "324444",
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_SUCCESS",
						["type"] = "unit",
						["unevent"] = "auto",
						["unit"] = "nameplate",
						["useName"] = true,
						["use_absorbMode"] = true,
						["use_destUnit"] = false,
						["use_genericShowOn"] = true,
						["use_spellId"] = true,
						["use_spellName"] = true,
						["use_track"] = true,
						["use_unit"] = true,
					},
					["untrigger"] = {
						["unit"] = "nameplate",
					},
				},
				["activeTriggerMode"] = -10,
			},
			["uid"] = "9kOltC1KKQg",
			["url"] = "https://wago.io/uYX5mP3U5/10",
			["useAdjustededMax"] = false,
			["useAdjustededMin"] = false,
			["useTooltip"] = false,
			["version"] = 10,
			["width"] = 1,
			["xOffset"] = -3000,
			["yOffset"] = 0,
			["zoom"] = 0,
		},
		["EDE [SOA] Diminuendo"] = {
			["actions"] = {
				["finish"] = {
				},
				["init"] = {
				},
				["start"] = {
					["do_sound"] = true,
					["sound"] = "Interface\\Addons\\Details\\sounds\\sound_gun2.ogg",
				},
			},
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["anchorPoint"] = "CENTER",
			["animation"] = {
				["finish"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["start"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
			},
			["authorOptions"] = {
			},
			["auto"] = true,
			["backgroundColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				0.5, -- [4]
			},
			["barColor"] = {
				1, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["config"] = {
			},
			["cooldown"] = true,
			["cooldownEdge"] = false,
			["cooldownSwipe"] = true,
			["cooldownTextDisabled"] = false,
			["desaturate"] = false,
			["displayIcon"] = "135398",
			["frameStrata"] = 1,
			["height"] = 1,
			["icon"] = true,
			["iconSource"] = -1,
			["icon_color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["icon_side"] = "RIGHT",
			["id"] = "EDE [SOA] Diminuendo",
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["internalVersion"] = 45,
			["inverse"] = false,
			["keepAspectRatio"] = false,
			["load"] = {
				["class"] = {
					["multi"] = {
					},
				},
				["role"] = {
					["multi"] = {
						["TANK"] = true,
					},
					["single"] = "TANK",
				},
				["size"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["use_zoneIds"] = true,
				["zoneIds"] = "g419",
			},
			["orientation"] = "HORIZONTAL",
			["parent"] = "Ellesmere's Dungeon Essentials",
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["semver"] = "1.0.9",
			["spark"] = false,
			["sparkBlendMode"] = "ADD",
			["sparkColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["sparkHeight"] = 30,
			["sparkHidden"] = "NEVER",
			["sparkOffsetX"] = 0,
			["sparkOffsetY"] = 0,
			["sparkRotation"] = 0,
			["sparkRotationMode"] = "AUTO",
			["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
			["sparkWidth"] = 10,
			["subRegions"] = {
				{
					["anchorXOffset"] = 0,
					["anchorYOffset"] = 0,
					["rotateText"] = "NONE",
					["text_anchorPoint"] = "CENTER",
					["text_anchorXOffset"] = 0,
					["text_anchorYOffset"] = 0,
					["text_automaticWidth"] = "Auto",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_fixedWidth"] = 64,
					["text_font"] = "Friz Quadrata TT",
					["text_fontSize"] = 28,
					["text_fontType"] = "OUTLINE",
					["text_justify"] = "CENTER",
					["text_selfPoint"] = "AUTO",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_shadowXOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["text_text"] = "%p",
					["text_text_format_p_format"] = "timed",
					["text_text_format_p_time_dynamic_threshold"] = 3,
					["text_text_format_p_time_format"] = 0,
					["text_text_format_p_time_precision"] = 1,
					["text_text_format_s_format"] = "none",
					["text_visible"] = false,
					["text_wordWrap"] = "WordWrap",
					["type"] = "subtext",
				}, -- [1]
				{
					["anchorXOffset"] = 0,
					["anchorYOffset"] = 0,
					["rotateText"] = "NONE",
					["text_anchorPoint"] = "OUTER_BOTTOM",
					["text_anchorYOffset"] = 0,
					["text_automaticWidth"] = "Auto",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_fixedWidth"] = 64,
					["text_font"] = "Friz Quadrata TT",
					["text_fontSize"] = 17,
					["text_fontType"] = "OUTLINE",
					["text_justify"] = "CENTER",
					["text_selfPoint"] = "AUTO",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_shadowXOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["text_text"] = "smash",
					["text_text_format_p_format"] = "timed",
					["text_text_format_p_time_dynamic_threshold"] = 60,
					["text_text_format_p_time_format"] = 0,
					["text_text_format_p_time_precision"] = 1,
					["text_visible"] = true,
					["text_wordWrap"] = "WordWrap",
					["type"] = "subtext",
				}, -- [2]
			},
			["texture"] = "Blizzard",
			["tocversion"] = 90002,
			["triggers"] = {
				[1] = {
					["trigger"] = {
						["auranames"] = {
							"317936", -- [1]
						},
						["debuffType"] = "HARMFUL",
						["destUnit"] = "player",
						["duration"] = "3",
						["event"] = "Cast",
						["genericShowOn"] = "showOnCooldown",
						["names"] = {
						},
						["realSpellName"] = "324444",
						["spellId"] = 328458,
						["spellIds"] = {
						},
						["spellName"] = "324444",
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_SUCCESS",
						["type"] = "unit",
						["unevent"] = "auto",
						["unit"] = "nameplate",
						["useName"] = true,
						["use_absorbMode"] = true,
						["use_destUnit"] = false,
						["use_genericShowOn"] = true,
						["use_spellId"] = true,
						["use_spellName"] = true,
						["use_track"] = true,
						["use_unit"] = true,
					},
					["untrigger"] = {
						["unit"] = "nameplate",
					},
				},
				["activeTriggerMode"] = -10,
			},
			["uid"] = "U5afqIKLQYh",
			["url"] = "https://wago.io/uYX5mP3U5/10",
			["useAdjustededMax"] = false,
			["useAdjustededMin"] = false,
			["useTooltip"] = false,
			["version"] = 10,
			["width"] = 1,
			["xOffset"] = -3000,
			["yOffset"] = 0,
			["zoom"] = 0,
		},
		["EDE [SOA] Run Through"] = {
			["actions"] = {
				["finish"] = {
				},
				["init"] = {
				},
				["start"] = {
					["do_sound"] = true,
					["sound"] = "Interface\\Addons\\Details\\sounds\\sound_gun2.ogg",
				},
			},
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["anchorPoint"] = "CENTER",
			["animation"] = {
				["finish"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["start"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
			},
			["authorOptions"] = {
			},
			["auto"] = false,
			["backgroundColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				0.5, -- [4]
			},
			["barColor"] = {
				1, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["config"] = {
			},
			["cooldown"] = true,
			["cooldownEdge"] = false,
			["cooldownSwipe"] = true,
			["cooldownTextDisabled"] = false,
			["desaturate"] = false,
			["displayIcon"] = "132337",
			["frameStrata"] = 1,
			["height"] = 1,
			["icon"] = true,
			["iconSource"] = 0,
			["icon_color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["icon_side"] = "RIGHT",
			["id"] = "EDE [SOA] Run Through",
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["internalVersion"] = 45,
			["inverse"] = false,
			["keepAspectRatio"] = false,
			["load"] = {
				["class"] = {
					["multi"] = {
					},
				},
				["role"] = {
					["multi"] = {
						["TANK"] = true,
					},
					["single"] = "TANK",
				},
				["size"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["use_zoneIds"] = true,
				["zoneIds"] = "g419",
			},
			["orientation"] = "HORIZONTAL",
			["parent"] = "Ellesmere's Dungeon Essentials",
			["preferToUpdate"] = true,
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["semver"] = "1.0.9",
			["spark"] = false,
			["sparkBlendMode"] = "ADD",
			["sparkColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["sparkHeight"] = 30,
			["sparkHidden"] = "NEVER",
			["sparkOffsetX"] = 0,
			["sparkOffsetY"] = 0,
			["sparkRotation"] = 0,
			["sparkRotationMode"] = "AUTO",
			["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
			["sparkWidth"] = 10,
			["subRegions"] = {
			},
			["texture"] = "Blizzard",
			["tocversion"] = 90002,
			["triggers"] = {
				[1] = {
					["trigger"] = {
						["auranames"] = {
							"323943", -- [1]
						},
						["debuffType"] = "HARMFUL",
						["destUnit"] = "player",
						["duration"] = "2",
						["event"] = "Cast",
						["genericShowOn"] = "showOnCooldown",
						["names"] = {
						},
						["realSpellName"] = "323943",
						["spellId"] = 323943,
						["spellIds"] = {
						},
						["spellName"] = "323943",
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "unit",
						["unevent"] = "auto",
						["unit"] = "boss",
						["useName"] = true,
						["use_absorbMode"] = true,
						["use_destUnit"] = false,
						["use_genericShowOn"] = true,
						["use_spellId"] = true,
						["use_spellName"] = true,
						["use_track"] = true,
						["use_unit"] = true,
					},
					["untrigger"] = {
						["unit"] = "boss",
					},
				},
				["activeTriggerMode"] = -10,
			},
			["uid"] = "qADD0kZB8Zh",
			["url"] = "https://wago.io/uYX5mP3U5/10",
			["useAdjustededMax"] = false,
			["useAdjustededMin"] = false,
			["useTooltip"] = false,
			["version"] = 10,
			["width"] = 1,
			["xOffset"] = -3000,
			["yOffset"] = 0,
			["zoom"] = 0,
		},
		["EDE [TOP] Death Winds"] = {
			["actions"] = {
				["finish"] = {
					["do_sound"] = false,
				},
				["init"] = {
				},
				["start"] = {
					["do_sound"] = true,
					["sound"] = "Interface\\Addons\\Details\\sounds\\sound_gun2.ogg",
					["sound_channel"] = "SFX",
				},
			},
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["anchorPoint"] = "CENTER",
			["animation"] = {
				["finish"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["start"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
			},
			["authorOptions"] = {
			},
			["auto"] = false,
			["backgroundColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				0.5, -- [4]
			},
			["barColor"] = {
				1, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["config"] = {
			},
			["cooldown"] = true,
			["cooldownEdge"] = false,
			["cooldownSwipe"] = true,
			["cooldownTextDisabled"] = false,
			["desaturate"] = false,
			["displayIcon"] = "3528295",
			["frameStrata"] = 1,
			["height"] = 1,
			["icon"] = true,
			["iconSource"] = -1,
			["icon_color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["icon_side"] = "RIGHT",
			["id"] = "EDE [TOP] Death Winds",
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["internalVersion"] = 45,
			["inverse"] = false,
			["keepAspectRatio"] = false,
			["load"] = {
				["class"] = {
					["multi"] = {
					},
				},
				["role"] = {
					["multi"] = {
						["TANK"] = true,
					},
					["single"] = "TANK",
				},
				["size"] = {
					["multi"] = {
						["party"] = true,
					},
					["single"] = "party",
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["use_size"] = true,
				["use_zoneIds"] = false,
				["zoneIds"] = ", g414",
			},
			["orientation"] = "HORIZONTAL",
			["parent"] = "Ellesmere's Dungeon Essentials",
			["preferToUpdate"] = true,
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["semver"] = "1.0.9",
			["spark"] = false,
			["sparkBlendMode"] = "ADD",
			["sparkColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["sparkHeight"] = 30,
			["sparkHidden"] = "NEVER",
			["sparkOffsetX"] = 0,
			["sparkOffsetY"] = 0,
			["sparkRotation"] = 0,
			["sparkRotationMode"] = "AUTO",
			["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
			["sparkWidth"] = 10,
			["subRegions"] = {
			},
			["texture"] = "Blizzard",
			["tocversion"] = 90002,
			["triggers"] = {
				[1] = {
					["trigger"] = {
						["auranames"] = {
							"330700", -- [1]
						},
						["debuffType"] = "HARMFUL",
						["destUnit"] = "player",
						["duration"] = "2.5",
						["event"] = "Cast",
						["genericShowOn"] = "showOnCooldown",
						["names"] = {
						},
						["realSpellName"] = "317231",
						["spellId"] = 333294,
						["spellIds"] = {
						},
						["spellName"] = "317231",
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "unit",
						["unevent"] = "auto",
						["unit"] = "nameplate",
						["useName"] = true,
						["use_absorbMode"] = true,
						["use_destUnit"] = false,
						["use_genericShowOn"] = true,
						["use_spellId"] = true,
						["use_spellName"] = true,
						["use_track"] = true,
						["use_unit"] = true,
					},
					["untrigger"] = {
						["unit"] = "nameplate",
					},
				},
				["activeTriggerMode"] = -10,
			},
			["uid"] = "6BUGWC)1ZRb",
			["url"] = "https://wago.io/uYX5mP3U5/10",
			["useAdjustededMax"] = false,
			["useAdjustededMin"] = false,
			["useTooltip"] = false,
			["version"] = 10,
			["width"] = 1,
			["xOffset"] = -3000,
			["yOffset"] = 0,
			["zoom"] = 0,
		},
		["EDE [TOP] Ghostly Charge"] = {
			["actions"] = {
				["finish"] = {
					["do_sound"] = false,
				},
				["init"] = {
				},
				["start"] = {
					["do_sound"] = true,
					["sound"] = "Interface\\Addons\\Details\\sounds\\sound_gun2.ogg",
				},
			},
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["anchorPoint"] = "CENTER",
			["animation"] = {
				["finish"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["start"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
			},
			["authorOptions"] = {
			},
			["auto"] = false,
			["backgroundColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				0.5, -- [4]
			},
			["barColor"] = {
				1, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["config"] = {
			},
			["cooldown"] = true,
			["cooldownEdge"] = false,
			["cooldownSwipe"] = true,
			["cooldownTextDisabled"] = false,
			["desaturate"] = false,
			["displayIcon"] = "3511738",
			["frameStrata"] = 1,
			["height"] = 1,
			["icon"] = true,
			["iconSource"] = 0,
			["icon_color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["icon_side"] = "RIGHT",
			["id"] = "EDE [TOP] Ghostly Charge",
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["internalVersion"] = 45,
			["inverse"] = false,
			["keepAspectRatio"] = false,
			["load"] = {
				["class"] = {
					["multi"] = {
					},
				},
				["role"] = {
					["multi"] = {
						["TANK"] = true,
					},
					["single"] = "TANK",
				},
				["size"] = {
					["multi"] = {
						["party"] = true,
					},
					["single"] = "party",
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["use_size"] = true,
				["use_zoneIds"] = false,
				["zoneIds"] = ", g414",
			},
			["orientation"] = "HORIZONTAL",
			["parent"] = "Ellesmere's Dungeon Essentials",
			["preferToUpdate"] = true,
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["semver"] = "1.0.9",
			["spark"] = false,
			["sparkBlendMode"] = "ADD",
			["sparkColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["sparkHeight"] = 30,
			["sparkHidden"] = "NEVER",
			["sparkOffsetX"] = 0,
			["sparkOffsetY"] = 0,
			["sparkRotation"] = 0,
			["sparkRotationMode"] = "AUTO",
			["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
			["sparkWidth"] = 10,
			["subRegions"] = {
			},
			["texture"] = "Blizzard",
			["tocversion"] = 90002,
			["triggers"] = {
				[1] = {
					["trigger"] = {
						["auranames"] = {
							"", -- [1]
							"324449", -- [2]
						},
						["debuffType"] = "HARMFUL",
						["destUnit"] = "player",
						["duration"] = "2",
						["event"] = "Combat Log",
						["genericShowOn"] = "showOnCooldown",
						["names"] = {
						},
						["realSpellName"] = "339751",
						["spellId"] = "339706",
						["spellIds"] = {
						},
						["spellName"] = "339751",
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "combatlog",
						["unevent"] = "timed",
						["unit"] = "boss",
						["useName"] = true,
						["use_absorbMode"] = true,
						["use_destUnit"] = false,
						["use_genericShowOn"] = true,
						["use_spellId"] = true,
						["use_spellName"] = false,
						["use_track"] = true,
						["use_unit"] = true,
					},
					["untrigger"] = {
						["unit"] = "boss",
					},
				},
				["activeTriggerMode"] = -10,
			},
			["uid"] = "fg2HTz7oNrE",
			["url"] = "https://wago.io/uYX5mP3U5/10",
			["useAdjustededMax"] = false,
			["useAdjustededMin"] = false,
			["useTooltip"] = false,
			["version"] = 10,
			["width"] = 1,
			["xOffset"] = -3000,
			["yOffset"] = 0,
			["zoom"] = 0,
		},
		["EDE [TOP] Vile Eruption"] = {
			["actions"] = {
				["finish"] = {
					["do_sound"] = false,
				},
				["init"] = {
				},
				["start"] = {
					["do_sound"] = true,
					["sound"] = "Interface\\Addons\\Details\\sounds\\sound_gun2.ogg",
				},
			},
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["anchorPoint"] = "CENTER",
			["animation"] = {
				["finish"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["start"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
			},
			["authorOptions"] = {
			},
			["auto"] = false,
			["backgroundColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				0.5, -- [4]
			},
			["barColor"] = {
				1, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["config"] = {
			},
			["cooldown"] = true,
			["cooldownEdge"] = false,
			["cooldownSwipe"] = true,
			["cooldownTextDisabled"] = false,
			["desaturate"] = false,
			["displayIcon"] = "136182",
			["frameStrata"] = 1,
			["height"] = 1,
			["icon"] = true,
			["iconSource"] = -1,
			["icon_color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["icon_side"] = "RIGHT",
			["id"] = "EDE [TOP] Vile Eruption",
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["internalVersion"] = 45,
			["inverse"] = false,
			["keepAspectRatio"] = false,
			["load"] = {
				["class"] = {
					["multi"] = {
					},
				},
				["role"] = {
					["multi"] = {
						["TANK"] = true,
					},
					["single"] = "TANK",
				},
				["size"] = {
					["multi"] = {
						["party"] = true,
					},
					["single"] = "party",
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["use_size"] = true,
				["use_zoneIds"] = false,
				["zoneIds"] = ", g414",
			},
			["orientation"] = "HORIZONTAL",
			["parent"] = "Ellesmere's Dungeon Essentials",
			["preferToUpdate"] = true,
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["semver"] = "1.0.9",
			["spark"] = false,
			["sparkBlendMode"] = "ADD",
			["sparkColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["sparkHeight"] = 30,
			["sparkHidden"] = "NEVER",
			["sparkOffsetX"] = 0,
			["sparkOffsetY"] = 0,
			["sparkRotation"] = 0,
			["sparkRotationMode"] = "AUTO",
			["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
			["sparkWidth"] = 10,
			["subRegions"] = {
			},
			["texture"] = "Blizzard",
			["tocversion"] = 90002,
			["triggers"] = {
				[1] = {
					["trigger"] = {
						["auranames"] = {
							"330700", -- [1]
						},
						["debuffType"] = "HARMFUL",
						["destUnit"] = "player",
						["duration"] = "2.5",
						["event"] = "Cast",
						["genericShowOn"] = "showOnCooldown",
						["names"] = {
						},
						["realSpellName"] = "317231",
						["spellId"] = 330592,
						["spellIds"] = {
						},
						["spellName"] = "317231",
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "unit",
						["unevent"] = "auto",
						["unit"] = "nameplate",
						["useName"] = true,
						["use_absorbMode"] = true,
						["use_destUnit"] = false,
						["use_genericShowOn"] = true,
						["use_spellId"] = true,
						["use_spellName"] = true,
						["use_track"] = true,
						["use_unit"] = true,
					},
					["untrigger"] = {
						["unit"] = "nameplate",
					},
				},
				["activeTriggerMode"] = -10,
			},
			["uid"] = "iho8vMeNRic",
			["url"] = "https://wago.io/uYX5mP3U5/10",
			["useAdjustededMax"] = false,
			["useAdjustededMin"] = false,
			["useTooltip"] = false,
			["version"] = 10,
			["width"] = 1,
			["xOffset"] = -3000,
			["yOffset"] = 0,
			["zoom"] = 0,
		},
		["EDE[TOP] Dark Devastation"] = {
			["actions"] = {
				["finish"] = {
					["do_sound"] = false,
				},
				["init"] = {
				},
				["start"] = {
					["do_sound"] = true,
					["sound"] = "Interface\\Addons\\Details\\sounds\\sound_gun2.ogg",
				},
			},
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["anchorPoint"] = "CENTER",
			["animation"] = {
				["finish"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["start"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
			},
			["authorOptions"] = {
			},
			["auto"] = false,
			["backgroundColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				0.5, -- [4]
			},
			["barColor"] = {
				1, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["config"] = {
			},
			["cooldown"] = true,
			["cooldownEdge"] = false,
			["cooldownSwipe"] = true,
			["cooldownTextDisabled"] = false,
			["desaturate"] = false,
			["displayIcon"] = "2576088",
			["frameStrata"] = 1,
			["height"] = 1,
			["icon"] = true,
			["iconSource"] = 0,
			["icon_color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["icon_side"] = "RIGHT",
			["id"] = "EDE[TOP] Dark Devastation",
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["internalVersion"] = 45,
			["inverse"] = false,
			["keepAspectRatio"] = false,
			["load"] = {
				["class"] = {
					["multi"] = {
					},
				},
				["role"] = {
					["multi"] = {
						["TANK"] = true,
					},
					["single"] = "TANK",
				},
				["size"] = {
					["multi"] = {
						["party"] = true,
					},
					["single"] = "party",
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["use_size"] = true,
				["use_zoneIds"] = false,
				["zoneIds"] = ", g414",
			},
			["orientation"] = "HORIZONTAL",
			["parent"] = "Ellesmere's Dungeon Essentials",
			["preferToUpdate"] = true,
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["semver"] = "1.0.9",
			["spark"] = false,
			["sparkBlendMode"] = "ADD",
			["sparkColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["sparkHeight"] = 30,
			["sparkHidden"] = "NEVER",
			["sparkOffsetX"] = 0,
			["sparkOffsetY"] = 0,
			["sparkRotation"] = 0,
			["sparkRotationMode"] = "AUTO",
			["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
			["sparkWidth"] = 10,
			["subRegions"] = {
			},
			["texture"] = "Blizzard",
			["tocversion"] = 90002,
			["triggers"] = {
				[1] = {
					["trigger"] = {
						["auranames"] = {
							"Remove Haunted Memento", -- [1]
							"319626", -- [2]
						},
						["debuffType"] = "HARMFUL",
						["destUnit"] = "player",
						["duration"] = "1.5",
						["event"] = "Cast",
						["genericShowOn"] = "showOnCooldown",
						["names"] = {
						},
						["realSpellName"] = "323608",
						["spellId"] = 323608,
						["spellIds"] = {
						},
						["spellName"] = "323608",
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "unit",
						["unevent"] = "auto",
						["unit"] = "boss",
						["useName"] = true,
						["use_absorbMode"] = true,
						["use_destUnit"] = false,
						["use_genericShowOn"] = true,
						["use_spellId"] = true,
						["use_spellName"] = true,
						["use_track"] = true,
						["use_unit"] = true,
					},
					["untrigger"] = {
						["unit"] = "boss",
					},
				},
				["activeTriggerMode"] = -10,
			},
			["uid"] = "mm0UDC2ijhX",
			["url"] = "https://wago.io/uYX5mP3U5/10",
			["useAdjustededMax"] = false,
			["useAdjustededMin"] = false,
			["useTooltip"] = false,
			["version"] = 10,
			["width"] = 1,
			["xOffset"] = -3000,
			["yOffset"] = 0,
			["zoom"] = 0,
		},
		["Ellesmere's Dungeon Essentials"] = {
			["actions"] = {
				["finish"] = {
				},
				["init"] = {
				},
				["start"] = {
				},
			},
			["align"] = "CENTER",
			["anchorFrameType"] = "SCREEN",
			["anchorPoint"] = "CENTER",
			["animate"] = false,
			["animation"] = {
				["finish"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["start"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
			},
			["arcLength"] = 360,
			["authorOptions"] = {
			},
			["backdropColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0.5, -- [4]
			},
			["border"] = false,
			["borderBackdrop"] = "Blizzard Tooltip",
			["borderColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["borderEdge"] = "Square Full White",
			["borderInset"] = 1,
			["borderOffset"] = 4,
			["borderSize"] = 2,
			["columnSpace"] = 1,
			["conditions"] = {
			},
			["config"] = {
			},
			["constantFactor"] = "RADIUS",
			["controlledChildren"] = {
				"EDE [DOS] Blood Barrier Inc", -- [1]
				"EDE [DOS] Erupting Darkness", -- [2]
				"EDE [MTS] Radiant Breath", -- [3]
				"EDE [NW] Gut Slice", -- [4]
				"EDE [PF] Belch Plague", -- [5]
				"EDE [SD] Echoing Thrust", -- [6]
				"EDE [SD] Severing Slice", -- [7]
				"EDE [SD] Growing Mistrust", -- [8]
				"EDE [TOP] Vile Eruption", -- [9]
				"EDE [TOP] Death Winds", -- [10]
				"EDE[TOP] Dark Devastation", -- [11]
				"EDE [TOP] Ghostly Charge", -- [12]
				"EDE [HOA] Stone Breath", -- [13]
				"EDE [HOA] Unleashed Suffering", -- [14]
				"EDE [SOA] Run Through", -- [15]
				"EDE [NW] Necrotic Breath", -- [16]
				"EDE [SD] Sweeping Slash", -- [17]
				"EDE [PF] Festering Belch", -- [18]
				"EDE [PF] Wing Buffet", -- [19]
				"EDE [MOT] Tongue Lashing", -- [20]
				"EDE [NW] Repentance Check", -- [21]
				"EDE [OTHERS] Blinding Light Check", -- [22]
				"EDE [NW] Shadow Well", -- [23]
				"EDE [MOTS] Bewildering Pollen (Boss) 2", -- [24]
				"EDE [MOTS] Bewildering Pollen (Trash)", -- [25]
				"EDE [SOA] Crescendo", -- [26]
				"EDE [SOA] Charged Spear", -- [27]
				"EDE [SOA] Crashing Strike", -- [28]
				"EDE [SOA] Diminuendo", -- [29]
			},
			["frameStrata"] = 1,
			["fullCircle"] = true,
			["gridType"] = "RD",
			["gridWidth"] = 5,
			["grow"] = "RIGHT",
			["id"] = "Ellesmere's Dungeon Essentials",
			["information"] = {
			},
			["internalVersion"] = 45,
			["limit"] = 5,
			["load"] = {
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["zoneIds"] = "",
			},
			["preferToUpdate"] = true,
			["radius"] = 200,
			["regionType"] = "dynamicgroup",
			["rotation"] = 0,
			["rowSpace"] = 1,
			["scale"] = 1,
			["selfPoint"] = "LEFT",
			["semver"] = "1.0.9",
			["sort"] = "none",
			["space"] = 2,
			["stagger"] = 0,
			["subRegions"] = {
			},
			["tocversion"] = 90002,
			["triggers"] = {
				{
					["trigger"] = {
						["debuffType"] = "HELPFUL",
						["event"] = "Health",
						["names"] = {
						},
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "aura2",
						["unit"] = "player",
					},
					["untrigger"] = {
					},
				}, -- [1]
			},
			["uid"] = "8bL1ytmZrbb",
			["url"] = "https://wago.io/uYX5mP3U5/10",
			["useLimit"] = false,
			["version"] = 10,
			["xOffset"] = -23.999877929688,
			["yOffset"] = 9.9998779296875,
		},
		["Explosive Orbs"] = {
			["actions"] = {
				["finish"] = {
				},
				["init"] = {
					["custom"] = "aura_env.units = {}\nlocal C = aura_env.config\nlocal glowKey = \"explosiveOrbs20\"\nlocal tidyplatesHeight = 8\nlocal GMAP = {\n  color = C.glowColor,\n  type = C.glowType,\n  particles = C.glowParticles,\n  frequency = C.glowFrequency,\n  xOffset = C.glowXOffset,\n  yOffset = C.glowYOffset,\n  length = C.glowLength,\n  thickness = C.glowThickness,\n  border = C.glowBorder,\n  scale = C.glowScale\n}\nlocal SOUNDS = {\n  '',\n  [[Interface\\AddOns\\WeakAuras\\PowerAurasMedia\\Sounds\\Sonar.ogg]],\n  [[Interface\\AddOns\\WeakAuras\\Media\\Sounds\\AirHorn.ogg]],\n  [[Interface\\AddOns\\WeakAuras\\Media\\Sounds\\BikeHorn.ogg]],\n  [[Interface\\AddOns\\WeakAuras\\PowerAurasMedia\\Sounds\\wilhelm.ogg]],\n  [[Interface\\AddOns\\WeakAuras\\PowerAurasMedia\\Sounds\\phone.ogg]],\n  [[Interface\\AddOns\\WeakAuras\\PowerAurasMedia\\Sounds\\BITE.ogg]],\n  [[Interface\\AddOns\\WeakAuras\\PowerAurasMedia\\Sounds\\bam.ogg]],\n}\n\nlocal function getFrame(unit)\n  local nameplate = C_NamePlate.GetNamePlateForUnit(unit)\n    if not nameplate then return end\n    if nameplate.unitFrame and nameplate.unitFrame.HealthBar then\n        -- elvui\n        return nameplate.unitFrame.HealthBar\n    elseif nameplate.unitFramePlater then\n        -- plater\n        return nameplate.unitFramePlater.healthBar\n    elseif nameplate.kui then\n        -- kui\n        return nameplate.kui.HealthBar\n    elseif nameplate.extended then\n        -- tidyplates\n        nameplate.extended.visual.healthbar:SetHeight(tidyplatesHeight)\n        return nameplate.extended.visual.healthbar\n    elseif nameplate.TPFrame then\n        -- tidyplates: threat plates\n        return nameplate.TPFrame.visual.healthbar\n    elseif nameplate.ouf then\n        -- bdNameplates\n        return nameplate.ouf.Health\n    elseif nameplate.UnitFrame then\n        -- default\n        return nameplate.UnitFrame.healthBar\n    else\n        return nameplate\n    end\nend\n\n\nlocal LCG = LibStub(\"LibCustomGlow-1.0\")\n\n--[[\n@param unit string unitID\n@param show bool Show Glow\n@param customColors table Color table to use for flow\n]]\nlocal function glow(unit, show, customColors)\n  if not C.glowEnable or not unit then return end\n  local frame = getFrame(unit)\n  if not frame then return end\n\n  local glowType = GMAP.type\n  local color = customColors or GMAP.color\n  if show then\n    -- Show Glow\n    if glowType == 1 then\n      -- Default\n      LCG.ButtonGlow_Start(frame, color, GMAP.frequency)\n    elseif glowType == 2 then\n      -- Pixel\n      LCG.PixelGlow_Start(frame, color, GMAP.particles, GMAP.frequency, GMAP.length, GMAP.thickness, GMAP.xOffset, GMAP.yOffset, GMAP.border, glowKey)\n    elseif glowType == 3 then\n      -- Shine\n      LCG.AutoCastGlow_Start(frame, color, GMAP.particles, GMAP.frequency, GMAP.scale, GMAP.xOffset, GMAP.yOffset, glowKey)\n    end\n  else\n    -- Hide Glow\n    if glowType == 1 then\n      -- Default\n      LCG.ButtonGlow_Stop(frame)\n    elseif glowType == 2 then\n      -- Pixel\n      LCG.PixelGlow_Stop(frame, glowKey)\n    elseif glowType == 3 then\n      -- Shine\n      LCG.AutoCastGlow_Stop(frame, glowKey)\n    end\n  end\n\n\nend\n\nlocal lastSound = 0\nlocal function playSound()\n  local getTime = GetTime()\n  if (C.sound ~= 0 and getTime - lastSound > C.soundDeadzone) then\n    lastSound = getTime\n    PlaySoundFile(SOUNDS[C.sound] or \"\", C.soundChannel)\n  end\nend\n\nlocal availableMarks = {true,true,true,true,true,true,true,true}\n\n--[[\n  Get target marker that's not being used for different unit\n]]\nlocal function GetAvailableMark()\n    for markId,avail in ipairs(availableMarks) do\n        if avail then\n            availableMarks[markId] = false\n            return markId\n        end\n    end\nend\n\n--[[\n  Show markers on all available units\n]]\nlocal function showMarks()\n  if not C.enableMarks then return end\n  local indx = 1\n  while indx <= 8 do\n    if (aura_env.units[indx] and not aura_env.units[indx].marked) then\n      local markId = GetAvailableMark()\n      SetRaidTarget(aura_env.units[indx].unit,markId)\n      aura_env.units[indx].marked = markId\n    elseif not aura_env.units[indx] then\n      break\n    end\n    indx = indx + 1\n  end\nend\n\nlocal function addUnit(unit)\n  table.insert(aura_env.units, {unit = unit})\nend\n\nlocal function removeUnit(unit)\n  for indx,unitInfo in ipairs(aura_env.units) do\n        if unitInfo.unit == unit then\n            if unitInfo.marked then\n                availableMarks[unitInfo.marked] = true\n            end\n            table.remove(aura_env.units,indx)\n            break\n        end\n    end\nend\n\n--[[\n  RAINBOWS\n]]\n\nlocal function hsvToRgb(h, s, v)\n  local r, g, b\n\n  local i = math.floor(h * 6);\n  local f = h * 6 - i;\n  local p = v * (1 - s);\n  local q = v * (1 - f * s);\n  local t = v * (1 - (1 - f) * s);\n\n  i = i % 6\n\n  if i == 0 then r, g, b = v, t, p\n  elseif i == 1 then r, g, b = q, v, p\n  elseif i == 2 then r, g, b = p, v, t\n  elseif i == 3 then r, g, b = p, q, v\n  elseif i == 4 then r, g, b = t, p, v\n  elseif i == 5 then r, g, b = v, p, q\n  end\n  return r, g, b\nend\n\nlocal colorElapsed = 0;\nlocal colorDelay = C.rainbowFrequency\nlocal colorDuration = C.rainbowDuration\nlocal aura_env = aura_env\nlocal r, g, b, a = unpack(GMAP.color)\nlocal hue = 0\n\nlocal function RainbowFunc(self,elaps)\n  colorElapsed = colorElapsed + elaps;\n  if(colorElapsed > colorDelay) then\n      colorElapsed = colorElapsed - colorDelay;\n      hue = hue >= 1 and 0 or hue + 1 / (colorDuration / colorDelay)\n      r, g, b = hsvToRgb(hue,1,1)\n  end\n  for unit in pairs(self.frames) do\n    glow(unit, true, {r, g, b, a})\n  end\nend\n\nlocal r = aura_env.region\nif (C.rainbowMode and not r.rainbowMode) then\n  r.rainbowMode = true\n  r.rainbowFrame = CreateFrame(\"Frame\")\n  r.rainbowFrame.frames = {}\n  function r.rainbowFrame:RegisterNameplate(unit)\n    self.frames[unit] = unit\n  end\n  function r.rainbowFrame:UnregisterNameplate(unit)\n    self.frames[unit] = nil\n  end\n  function r.rainbowFrame:ClearNameplates()\n    for i in pairs(self.frames) do\n      self.frames[i] = nil\n    end\n  end\n  r.rainbowFrame:SetScript(\"OnUpdate\", RainbowFunc)\nelseif C.rainbowMode and r.rainbowMode then\n  r.rainbowFrame:SetScript(\"OnUpdate\", RainbowFunc)\nend\n\n--[[\n  Main execution function\n]]\nfunction aura_env.executeForUnit(unit, show)\n\n  if (not show) then\n    removeUnit(unit)\n    if (C.rainbowMode) then\n      r.rainbowFrame:UnregisterNameplate(unit)\n    end\n  else\n    addUnit(unit)\n    playSound()\n    showMarks()\n    if (C.rainbowMode) then\n      r.rainbowFrame:RegisterNameplate(unit)\n    end\n  end\n\n  glow(unit, show)\n\nend\n\nlocal u = {strsplit(\",\", C.unitID)}\nlocal unitIDs = {}\nfor _, unitID in ipairs(u) do\n  unitIDs[unitID] = true\nend\nfunction aura_env.validateUnit(unit)\n  local guid = UnitGUID(unit)\n  local _, _, _, _, _, npcId = strsplit(\"-\",guid)\n  if (unitIDs[npcId]) then\n    return true\n  end\n  return C.testMode\nend\n\n-- hide default glow on options open\nlocal aura_env = aura_env\nif (not aura_env.region.hooked) then\n  hooksecurefunc(WeakAuras, \"OpenOptions\", function()\n          for i=1,40 do\n              local unit = \"nameplate\"..i\n              glow(unit, false)\n          end\n          if aura_env.region.rainbowFrame then\n              aura_env.region.rainbowFrame:ClearNameplates()\n          end\n          aura_env.region.hooked = true\n  end)\nend",
					["do_custom"] = true,
				},
				["start"] = {
				},
			},
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["anchorPoint"] = "CENTER",
			["animation"] = {
				["finish"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["start"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
			},
			["authorOptions"] = {
				{
					["text"] = "Basic",
					["type"] = "header",
					["useName"] = true,
					["width"] = 1,
				}, -- [1]
				{
					["default"] = true,
					["desc"] = "Enables Glow on the nameplates",
					["key"] = "glowEnable",
					["name"] = "Enable Glow",
					["type"] = "toggle",
					["useDesc"] = true,
					["width"] = 2,
				}, -- [2]
				{
					["default"] = true,
					["desc"] = "Enables Icon to be shown on the screen with the count of the tracked units",
					["key"] = "iconEnable",
					["name"] = "Enable Icon",
					["type"] = "toggle",
					["useDesc"] = true,
					["width"] = 2,
				}, -- [3]
				{
					["default"] = false,
					["desc"] = "Marks the tracked units",
					["key"] = "enableMarks",
					["name"] = "Enable Marks",
					["type"] = "toggle",
					["useDesc"] = true,
					["width"] = 2,
				}, -- [4]
				{
					["default"] = 1,
					["desc"] = "Select what kind of sound should be played when unit shows up on screen",
					["key"] = "sound",
					["name"] = "Play sound",
					["type"] = "select",
					["useDesc"] = true,
					["values"] = {
						"None", -- [1]
						"Sonar", -- [2]
						"AirHorn", -- [3]
						"BikeHorn", -- [4]
						"Wilhelm", -- [5]
						"Phone", -- [6]
						"Bite", -- [7]
						"Bam", -- [8]
					},
					["width"] = 1,
				}, -- [5]
				{
					["default"] = 1,
					["desc"] = "Which channel should sound be played in",
					["key"] = "soundChannel",
					["name"] = "Sound Channel",
					["type"] = "select",
					["useDesc"] = true,
					["values"] = {
						"Master", -- [1]
						"Sound", -- [2]
						"Music", -- [3]
						"Ambience", -- [4]
						"Dialog", -- [5]
					},
					["width"] = 1,
				}, -- [6]
				{
					["text"] = "Glow",
					["type"] = "header",
					["useName"] = true,
					["width"] = 1,
				}, -- [7]
				{
					["default"] = 1,
					["desc"] = "Choose the type of the glow you want to be used",
					["key"] = "glowType",
					["name"] = "Glow Type",
					["type"] = "select",
					["useDesc"] = true,
					["values"] = {
						"Default", -- [1]
						"Pixel", -- [2]
						"Shine", -- [3]
					},
					["width"] = 2,
				}, -- [8]
				{
					["default"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["desc"] = "Choose the color of the glow",
					["key"] = "glowColor",
					["name"] = "Glow Color",
					["type"] = "color",
					["useDesc"] = true,
					["width"] = 1,
				}, -- [9]
				{
					["default"] = 0.2,
					["desc"] = "How fast glow particles are rotating around the frame",
					["key"] = "glowFrequency",
					["max"] = 5,
					["min"] = 0,
					["name"] = "Frequency",
					["step"] = 0.05,
					["type"] = "range",
					["useDesc"] = true,
					["width"] = 2,
				}, -- [10]
				{
					["fontSize"] = "small",
					["text"] = "\nSettings below only apply to pixel and shine glow types\n",
					["type"] = "description",
					["width"] = 2,
				}, -- [11]
				{
					["default"] = 8,
					["desc"] = "How many particles (Shine) should there be or number of lines (Pixel)",
					["key"] = "glowParticles",
					["max"] = 50,
					["min"] = 0,
					["name"] = "Particles",
					["step"] = 1,
					["type"] = "range",
					["useDesc"] = true,
					["width"] = 2,
				}, -- [12]
				{
					["default"] = 0,
					["desc"] = "X Offset relative to frame border",
					["key"] = "glowXOffset",
					["max"] = 50,
					["min"] = 0,
					["name"] = "X Offset",
					["step"] = 0.5,
					["type"] = "range",
					["useDesc"] = true,
					["width"] = 1,
				}, -- [13]
				{
					["default"] = 0,
					["desc"] = "Y Offset relative to frame border",
					["key"] = "glowYOffset",
					["max"] = 50,
					["min"] = 0,
					["name"] = "Y Offset",
					["step"] = 0.5,
					["type"] = "range",
					["useDesc"] = true,
					["width"] = 1,
				}, -- [14]
				{
					["default"] = 10,
					["desc"] = "Length of lines",
					["key"] = "glowLength",
					["max"] = 50,
					["min"] = 0,
					["name"] = "Length (Pixel Only)",
					["step"] = 0.1,
					["type"] = "range",
					["useDesc"] = true,
					["width"] = 1,
				}, -- [15]
				{
					["default"] = 2,
					["desc"] = "How thick lines should be",
					["key"] = "glowThickness",
					["max"] = 10,
					["min"] = 0,
					["name"] = "Thickness (Pixel Only)",
					["step"] = 0.1,
					["type"] = "range",
					["useDesc"] = true,
					["width"] = 1,
				}, -- [16]
				{
					["default"] = false,
					["desc"] = "Should glow have border under the lines",
					["key"] = "glowBorder",
					["name"] = "Border (Pixel Only)",
					["type"] = "toggle",
					["useDesc"] = true,
					["width"] = 2,
				}, -- [17]
				{
					["default"] = 1,
					["desc"] = "Scale of the particles",
					["key"] = "glowScale",
					["max"] = 10,
					["min"] = 0,
					["name"] = "Scale (Shine Only)",
					["step"] = 0.05,
					["type"] = "range",
					["useDesc"] = true,
					["width"] = 1,
				}, -- [18]
				{
					["text"] = "Advanced",
					["type"] = "header",
					["useName"] = true,
					["width"] = 1,
				}, -- [19]
				{
					["default"] = false,
					["desc"] = "RAINBOWS EVERYWHERE! |cffff0000Warning! This has a posibility to affect your fps as it's running on every frame.|r",
					["key"] = "rainbowMode",
					["name"] = "Rainbow Mode",
					["type"] = "toggle",
					["useDesc"] = true,
					["width"] = 1,
				}, -- [20]
				{
					["default"] = 0.02,
					["desc"] = "How quickly it is switching to next color",
					["key"] = "rainbowFrequency",
					["max"] = 2,
					["min"] = 0,
					["name"] = "Rainbow Frequency",
					["step"] = 0.01,
					["type"] = "range",
					["useDesc"] = true,
					["width"] = 1,
				}, -- [21]
				{
					["default"] = 1,
					["desc"] = "How long until has gone through all colors",
					["key"] = "rainbowDuration",
					["max"] = 5,
					["min"] = 0,
					["name"] = "Rainbow Full Sweep",
					["step"] = 0.1,
					["type"] = "range",
					["useDesc"] = true,
					["width"] = 1,
				}, -- [22]
				{
					["default"] = 1,
					["desc"] = "For how many seconds after sound has been played it's not triggered again. Helpful when multiple units are shown at the same time",
					["key"] = "soundDeadzone",
					["max"] = 3,
					["min"] = 0,
					["name"] = "Sound Deadzone",
					["step"] = 0.1,
					["type"] = "range",
					["useDesc"] = true,
					["width"] = 1,
				}, -- [23]
				{
					["default"] = "120651",
					["desc"] = "Select your own unitID, or add additional separated by comma (,) : 23213,21312,123123",
					["key"] = "unitID",
					["length"] = 10,
					["multiline"] = false,
					["name"] = "Unit ID",
					["type"] = "input",
					["useDesc"] = true,
					["useLength"] = false,
					["width"] = 1,
				}, -- [24]
				{
					["default"] = false,
					["desc"] = "Enables Weakaura to track all visible units and apply the settings on them",
					["key"] = "testMode",
					["name"] = "Test Mode",
					["type"] = "toggle",
					["useDesc"] = true,
					["width"] = 2,
				}, -- [25]
			},
			["auto"] = false,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["config"] = {
				["enableMarks"] = false,
				["glowBorder"] = true,
				["glowColor"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["glowEnable"] = false,
				["glowFrequency"] = 0.2,
				["glowLength"] = 6,
				["glowParticles"] = 10,
				["glowScale"] = 1,
				["glowThickness"] = 3,
				["glowType"] = 2,
				["glowXOffset"] = 3,
				["glowYOffset"] = 3,
				["iconEnable"] = true,
				["rainbowDuration"] = 3,
				["rainbowFrequency"] = 0.02,
				["rainbowMode"] = true,
				["sound"] = 2,
				["soundChannel"] = 1,
				["soundDeadzone"] = 1,
				["testMode"] = false,
				["unitID"] = "120651",
			},
			["cooldown"] = false,
			["cooldownEdge"] = false,
			["cooldownSwipe"] = true,
			["cooldownTextDisabled"] = false,
			["desaturate"] = false,
			["displayIcon"] = "2175503",
			["frameStrata"] = 1,
			["height"] = 50,
			["icon"] = true,
			["iconSource"] = 0,
			["id"] = "Explosive Orbs",
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["internalVersion"] = 45,
			["inverse"] = false,
			["keepAspectRatio"] = true,
			["load"] = {
				["affixes"] = {
					["single"] = 13,
				},
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["use_affixes"] = true,
				["zoneIds"] = "",
			},
			["parent"] = "Dungeons - Mythic+ Affixes ",
			["preferToUpdate"] = false,
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["semver"] = "1.0.3",
			["subRegions"] = {
				{
					["anchorXOffset"] = 0,
					["anchorYOffset"] = 0,
					["rotateText"] = "NONE",
					["text_anchorPoint"] = "CENTER",
					["text_automaticWidth"] = "Auto",
					["text_color"] = {
						1, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_fixedWidth"] = 64,
					["text_font"] = "Friz Quadrata TT",
					["text_fontSize"] = 24,
					["text_fontType"] = "OUTLINE",
					["text_justify"] = "CENTER",
					["text_selfPoint"] = "AUTO",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_shadowXOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["text_text"] = "%s",
					["text_text_format_s_format"] = "none",
					["text_visible"] = true,
					["text_wordWrap"] = "WordWrap",
					["type"] = "subtext",
				}, -- [1]
			},
			["tocversion"] = 90002,
			["triggers"] = {
				[1] = {
					["trigger"] = {
						["custom"] = "function(event,unit)\n    if not unit then return end\n    local guid = UnitGUID(unit)\n    if event == \"NAME_PLATE_UNIT_ADDED\" then\n        -- new nameplate\n        if aura_env.validateUnit(unit) then\n            -- got a match\n            aura_env.executeForUnit(unit, true)\n        end\n    elseif event == \"NAME_PLATE_UNIT_REMOVED\" then\n        -- removing nameplate\n        aura_env.executeForUnit(unit, false)\n    end\n    return aura_env.config.iconEnable and #aura_env.units > 0\nend",
						["customStacks"] = "function()\n    return #aura_env.units\n    end\n    \n    ",
						["custom_hide"] = "custom",
						["custom_type"] = "event",
						["debuffType"] = "HELPFUL",
						["event"] = "Health",
						["events"] = "NAME_PLATE_UNIT_ADDED NAME_PLATE_UNIT_REMOVED",
						["names"] = {
						},
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "custom",
						["unit"] = "player",
					},
					["untrigger"] = {
					},
				},
				["activeTriggerMode"] = -10,
			},
			["uid"] = "x9m26AG1HBa",
			["url"] = "https://wago.io/EE8ENuch7/4",
			["version"] = 4,
			["width"] = 50,
			["xOffset"] = 210,
			["yOffset"] = -340,
			["zoom"] = 0.3,
		},
		["Great Vault on Weekly Reward frame"] = {
			["actions"] = {
				["finish"] = {
				},
				["init"] = {
					["do_custom"] = false,
				},
				["start"] = {
				},
			},
			["anchorFrameType"] = "SCREEN",
			["anchorPoint"] = "CENTER",
			["animation"] = {
				["finish"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["start"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
			},
			["authorOptions"] = {
			},
			["automaticWidth"] = "Auto",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["config"] = {
			},
			["customTextUpdate"] = "event",
			["displayText"] = "",
			["displayText_format_p_format"] = "timed",
			["displayText_format_p_time_dynamic_threshold"] = 60,
			["displayText_format_p_time_format"] = 0,
			["displayText_format_p_time_precision"] = 1,
			["fixedWidth"] = 200,
			["font"] = "Friz Quadrata TT",
			["fontSize"] = 12,
			["frameStrata"] = 1,
			["id"] = "Great Vault on Weekly Reward frame",
			["information"] = {
			},
			["internalVersion"] = 45,
			["justify"] = "LEFT",
			["load"] = {
				["class"] = {
					["multi"] = {
					},
				},
				["level"] = "60",
				["level_operator"] = ">=",
				["size"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["use_level"] = true,
				["zoneIds"] = "",
			},
			["outline"] = "OUTLINE",
			["preferToUpdate"] = false,
			["regionType"] = "text",
			["selfPoint"] = "BOTTOM",
			["semver"] = "1.0.9",
			["shadowColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["shadowXOffset"] = 1,
			["shadowYOffset"] = -1,
			["subRegions"] = {
			},
			["tocversion"] = 90002,
			["triggers"] = {
				[1] = {
					["trigger"] = {
						["custom"] = "function(event)\n    if PVPQueueFrame then\n        aura_env.RatedPvP = PVPQueueFrame.HonorInset.RatedPanel.WeeklyChest\n        aura_env.CasualPvP = PVPQueueFrame.HonorInset.CasualPanel.WeeklyChest\n        end\n    if ChallengesFrame then\n        aura_env.ChallengeKey = ChallengesFrame.WeeklyInfo.Child.WeeklyChest\n    end\n    LoadAddOn('Blizzard_WeeklyRewards')\n    local GreatVaultFrame = \"WeeklyRewardsFrame\" -- frame name to reference when adding to UISpecialFrames\n    local RPvP = aura_env.RatedPvP\n    local CPvP = aura_env.CasualPvP\n    local CKey = aura_env.ChallengeKey\n    if event == \"GLOBAL_MOUSE_UP\" then\n        if not WeeklyRewardsFrame:IsVisible() and\n        ((RPvP and RPvP:IsVisible() and RPvP:IsMouseOver()) or\n            (CPvP and CPvP:IsVisible() and CPvP:IsMouseOver()) or\n            (CKey and CKey:IsVisible() and CKey:IsMouseOver())) then\n            WeeklyRewardsFrame:Show()\n            tinsert(UISpecialFrames, GreatVaultFrame) -- UISpecialFrames | see more at https://wow.gamepedia.com/Make_frames_closable_with_the_Escape_key\n        elseif WeeklyRewardsFrame:IsVisible() and\n        ((RPvP and RPvP:IsVisible() and RPvP:IsMouseOver()) or\n            (CPvP and CPvP:IsVisible() and CPvP:IsMouseOver()) or\n            (CKey and CKey:IsVisible() and CKey:IsMouseOver())) then\n            WeeklyRewardsFrame:Hide()\n        end\n    end\nend",
						["custom_hide"] = "timed",
						["custom_type"] = "event",
						["debuffType"] = "HELPFUL",
						["event"] = "Health",
						["events"] = "GLOBAL_MOUSE_UP",
						["names"] = {
						},
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "custom",
						["unit"] = "player",
					},
					["untrigger"] = {
					},
				},
				["activeTriggerMode"] = -10,
			},
			["uid"] = "eXtQuDwDOsa",
			["url"] = "https://wago.io/8VoPnmm5Z/10",
			["version"] = 10,
			["wordWrap"] = "WordWrap",
			["xOffset"] = 0,
			["yOffset"] = 0,
		},
		["Grevious"] = {
			["actions"] = {
				["finish"] = {
				},
				["init"] = {
				},
				["start"] = {
				},
			},
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["anchorPoint"] = "CENTER",
			["animation"] = {
				["finish"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["start"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
			},
			["authorOptions"] = {
			},
			["auto"] = true,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["config"] = {
			},
			["cooldown"] = true,
			["cooldownEdge"] = false,
			["cooldownSwipe"] = true,
			["cooldownTextDisabled"] = false,
			["cooldownTextEnabled"] = true,
			["customTextUpdate"] = "update",
			["desaturate"] = false,
			["frameStrata"] = 1,
			["height"] = 50,
			["icon"] = true,
			["iconSource"] = -1,
			["id"] = "Grevious",
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["internalVersion"] = 45,
			["inverse"] = true,
			["keepAspectRatio"] = false,
			["load"] = {
				["affixes"] = {
					["multi"] = {
					},
					["single"] = 12,
				},
				["class"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
						["challenge"] = true,
					},
					["single"] = "challenge",
				},
				["faction"] = {
					["multi"] = {
					},
				},
				["ingroup"] = {
					["multi"] = {
					},
				},
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["role"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
						["party"] = true,
					},
					["single"] = "party",
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["talent2"] = {
					["multi"] = {
					},
				},
				["talent3"] = {
					["multi"] = {
					},
				},
				["use_affixes"] = true,
				["use_difficulty"] = true,
				["use_never"] = false,
				["use_size"] = true,
				["zoneIds"] = "",
			},
			["parent"] = "Dungeons - Mythic+ Affixes ",
			["preferToUpdate"] = false,
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["semver"] = "1.0.3",
			["stickyDuration"] = false,
			["subRegions"] = {
				{
					["anchorXOffset"] = 0,
					["anchorYOffset"] = 0,
					["rotateText"] = "NONE",
					["text_anchorPoint"] = "INNER_BOTTOMRIGHT",
					["text_automaticWidth"] = "Auto",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_fixedWidth"] = 64,
					["text_font"] = "Friz Quadrata TT",
					["text_fontSize"] = 18,
					["text_fontType"] = "OUTLINE",
					["text_justify"] = "CENTER",
					["text_selfPoint"] = "AUTO",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_shadowXOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["text_text"] = "%s",
					["text_text_format_s_format"] = "none",
					["text_visible"] = true,
					["text_wordWrap"] = "WordWrap",
					["type"] = "subtext",
				}, -- [1]
			},
			["text1"] = "%s",
			["text1Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text1Containment"] = "INSIDE",
			["text1Enabled"] = true,
			["text1Font"] = "Friz Quadrata TT",
			["text1FontFlags"] = "OUTLINE",
			["text1FontSize"] = 12,
			["text1Point"] = "BOTTOMRIGHT",
			["text2"] = "%p",
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text2Containment"] = "INSIDE",
			["text2Enabled"] = false,
			["text2Font"] = "Friz Quadrata TT",
			["text2FontFlags"] = "OUTLINE",
			["text2FontSize"] = 24,
			["text2Point"] = "CENTER",
			["tocversion"] = 90002,
			["triggers"] = {
				[1] = {
					["trigger"] = {
						["auraspellids"] = {
							"240559", -- [1]
						},
						["buffShowOn"] = "showOnActive",
						["combineMatches"] = "showLowest",
						["debuffType"] = "HARMFUL",
						["event"] = "Health",
						["fullscan"] = true,
						["matchesShowOn"] = "showOnActive",
						["name"] = "Grievous Wound",
						["names"] = {
							"Grievous Wound", -- [1]
						},
						["spellId"] = "240559",
						["spellIds"] = {
							240559, -- [1]
						},
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "aura2",
						["unit"] = "player",
						["useExactSpellId"] = true,
						["useGroup_count"] = false,
						["use_debuffClass"] = false,
						["use_spellId"] = true,
						["use_tooltip"] = false,
					},
					["untrigger"] = {
					},
				},
				["activeTriggerMode"] = -10,
				["disjunctive"] = "all",
			},
			["uid"] = "zZs)i4tY6Dk",
			["url"] = "https://wago.io/EE8ENuch7/4",
			["version"] = 4,
			["width"] = 50,
			["xOffset"] = 210,
			["yOffset"] = -340,
			["zoom"] = 0,
		},
		["Inscrutable Quantum Device"] = {
			["actions"] = {
				["finish"] = {
				},
				["init"] = {
				},
				["start"] = {
				},
			},
			["anchorFrameType"] = "SCREEN",
			["anchorPoint"] = "CENTER",
			["animation"] = {
				["finish"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["start"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
			},
			["authorOptions"] = {
			},
			["backdropColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0.5, -- [4]
			},
			["border"] = false,
			["borderBackdrop"] = "Blizzard Tooltip",
			["borderColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["borderEdge"] = "Square Full White",
			["borderInset"] = 1,
			["borderOffset"] = 4,
			["borderSize"] = 2,
			["conditions"] = {
			},
			["config"] = {
			},
			["controlledChildren"] = {
				"Inscrutable Quantum Device Available", -- [1]
				"Inscrutable Quantum Device CD", -- [2]
				"Inscrutable Quantum Device CC Break", -- [3]
				"Inscrutable Quantum Device Heal", -- [4]
				"Inscrutable Quantum Device Mana", -- [5]
				"Inscrutable Quantum Device Execute", -- [6]
				"Inscrutable Quantum Device Crit", -- [7]
				"Inscrutable Quantum Device Haste", -- [8]
				"Inscrutable Quantum Device Mastery", -- [9]
				"Inscrutable Quantum Device Versa", -- [10]
			},
			["frameStrata"] = 1,
			["id"] = "Inscrutable Quantum Device",
			["information"] = {
				["groupOffset"] = true,
			},
			["internalVersion"] = 45,
			["load"] = {
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["zoneIds"] = "",
			},
			["preferToUpdate"] = false,
			["regionType"] = "group",
			["scale"] = 1,
			["selfPoint"] = "BOTTOMLEFT",
			["semver"] = "1.0.5",
			["subRegions"] = {
			},
			["tocversion"] = 90002,
			["triggers"] = {
				{
					["trigger"] = {
						["debuffType"] = "HELPFUL",
						["event"] = "Health",
						["names"] = {
						},
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "aura2",
						["unit"] = "player",
					},
					["untrigger"] = {
					},
				}, -- [1]
			},
			["uid"] = "i7it7)Ri4Ik",
			["url"] = "https://wago.io/G_ZnwseH-/6",
			["version"] = 6,
			["xOffset"] = 0,
			["yOffset"] = -75,
		},
		["Inscrutable Quantum Device Available"] = {
			["actions"] = {
				["finish"] = {
				},
				["init"] = {
				},
				["start"] = {
				},
			},
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["anchorPoint"] = "CENTER",
			["animation"] = {
				["finish"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["start"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
			},
			["authorOptions"] = {
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["config"] = {
			},
			["cooldown"] = false,
			["cooldownEdge"] = false,
			["cooldownSwipe"] = true,
			["cooldownTextDisabled"] = false,
			["desaturate"] = false,
			["frameStrata"] = 3,
			["height"] = 40,
			["icon"] = true,
			["iconSource"] = -1,
			["id"] = "Inscrutable Quantum Device Available",
			["information"] = {
			},
			["internalVersion"] = 45,
			["inverse"] = false,
			["keepAspectRatio"] = false,
			["load"] = {
				["class"] = {
					["multi"] = {
					},
				},
				["item_bonusid_equipped"] = "Inscrutable Quantum Device",
				["itemequiped"] = 179350,
				["itemtypeequipped"] = {
				},
				["size"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["use_item_bonusid_equipped"] = false,
				["use_itemequiped"] = true,
				["zoneIds"] = "",
			},
			["parent"] = "Inscrutable Quantum Device",
			["preferToUpdate"] = false,
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["semver"] = "1.0.5",
			["subRegions"] = {
				{
					["anchorXOffset"] = 0,
					["anchorYOffset"] = 0,
					["rotateText"] = "NONE",
					["text_anchorPoint"] = "CENTER",
					["text_automaticWidth"] = "Auto",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_fixedWidth"] = 64,
					["text_font"] = "Expressway",
					["text_fontSize"] = 30,
					["text_fontType"] = "OUTLINE",
					["text_justify"] = "CENTER",
					["text_selfPoint"] = "AUTO",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_shadowXOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["text_text"] = "%s",
					["text_text_format_s_format"] = "none",
					["text_visible"] = true,
					["text_wordWrap"] = "WordWrap",
					["type"] = "subtext",
				}, -- [1]
				{
					["glow"] = false,
					["glowBorder"] = false,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["glowFrequency"] = 0.25,
					["glowLength"] = 10,
					["glowLines"] = 8,
					["glowScale"] = 1,
					["glowThickness"] = 1,
					["glowType"] = "buttonOverlay",
					["glowXOffset"] = 0,
					["glowYOffset"] = 0,
					["type"] = "subglow",
					["useGlowColor"] = false,
				}, -- [2]
			},
			["tocversion"] = 90002,
			["triggers"] = {
				[1] = {
					["trigger"] = {
						["debuffType"] = "HELPFUL",
						["duration"] = "1",
						["event"] = "Cooldown Progress (Item)",
						["genericShowOn"] = "showOnReady",
						["itemName"] = 179350,
						["names"] = {
						},
						["realSpellName"] = 0,
						["spellIds"] = {
						},
						["spellName"] = 0,
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "item",
						["unevent"] = "auto",
						["unit"] = "player",
						["use_genericShowOn"] = true,
						["use_itemName"] = true,
						["use_spellName"] = true,
						["use_track"] = true,
					},
					["untrigger"] = {
						["genericShowOn"] = "showOnReady",
					},
				},
				["activeTriggerMode"] = -10,
			},
			["uid"] = "9oSo)oHa3wr",
			["url"] = "https://wago.io/G_ZnwseH-/6",
			["version"] = 6,
			["width"] = 40,
			["xOffset"] = 105,
			["yOffset"] = -25,
			["zoom"] = 0,
		},
		["Inscrutable Quantum Device CC Break"] = {
			["actions"] = {
				["finish"] = {
				},
				["init"] = {
				},
				["start"] = {
				},
			},
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["anchorPoint"] = "CENTER",
			["animation"] = {
				["finish"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["start"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
			},
			["authorOptions"] = {
			},
			["color"] = {
				0, -- [1]
				0.019607843137255, -- [2]
				0.96862745098039, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["config"] = {
			},
			["cooldown"] = false,
			["cooldownEdge"] = false,
			["cooldownSwipe"] = false,
			["cooldownTextDisabled"] = false,
			["desaturate"] = false,
			["displayIcon"] = 2000857,
			["frameStrata"] = 5,
			["height"] = 40,
			["icon"] = true,
			["iconSource"] = 0,
			["id"] = "Inscrutable Quantum Device CC Break",
			["information"] = {
			},
			["internalVersion"] = 45,
			["inverse"] = false,
			["keepAspectRatio"] = false,
			["load"] = {
				["class"] = {
					["multi"] = {
					},
				},
				["item_bonusid_equipped"] = "Inscrutable Quantum Device",
				["itemequiped"] = 179350,
				["itemtypeequipped"] = {
				},
				["size"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["use_item_bonusid_equipped"] = false,
				["use_itemequiped"] = true,
				["use_vehicle"] = false,
				["zoneIds"] = "",
			},
			["parent"] = "Inscrutable Quantum Device",
			["preferToUpdate"] = false,
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["semver"] = "1.0.5",
			["subRegions"] = {
				{
					["anchorXOffset"] = 0,
					["anchorYOffset"] = 0,
					["rotateText"] = "NONE",
					["text_anchorPoint"] = "CENTER",
					["text_anchorYOffset"] = 5,
					["text_automaticWidth"] = "Auto",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_fixedWidth"] = 64,
					["text_font"] = "Expressway",
					["text_fontSize"] = 14,
					["text_fontType"] = "OUTLINE",
					["text_justify"] = "CENTER",
					["text_selfPoint"] = "AUTO",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_shadowXOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["text_text"] = "BREAK",
					["text_text_format_p_abbreviate"] = false,
					["text_text_format_p_abbreviate_max"] = 8,
					["text_text_format_p_big_number_format"] = "AbbreviateNumbers",
					["text_text_format_p_decimal_precision"] = 1,
					["text_text_format_p_format"] = "timed",
					["text_text_format_p_gcd_cast"] = false,
					["text_text_format_p_gcd_channel"] = false,
					["text_text_format_p_gcd_gcd"] = true,
					["text_text_format_p_gcd_hide_zero"] = false,
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["text_text_format_p_time_format"] = 0,
					["text_text_format_p_time_precision"] = 1,
					["text_text_format_s_format"] = "none",
					["text_visible"] = true,
					["text_wordWrap"] = "WordWrap",
					["type"] = "subtext",
				}, -- [1]
				{
					["anchorXOffset"] = 0,
					["anchorYOffset"] = 0,
					["rotateText"] = "NONE",
					["text_anchorPoint"] = "CENTER",
					["text_anchorYOffset"] = -6,
					["text_automaticWidth"] = "Auto",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_fixedWidth"] = 64,
					["text_font"] = "Expressway",
					["text_fontSize"] = 14,
					["text_fontType"] = "OUTLINE",
					["text_justify"] = "CENTER",
					["text_selfPoint"] = "AUTO",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_shadowXOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["text_text"] = "CC",
					["text_text_format_p_abbreviate"] = false,
					["text_text_format_p_abbreviate_max"] = 8,
					["text_text_format_p_big_number_format"] = "AbbreviateNumbers",
					["text_text_format_p_decimal_precision"] = 1,
					["text_text_format_p_format"] = "timed",
					["text_text_format_p_gcd_cast"] = false,
					["text_text_format_p_gcd_channel"] = false,
					["text_text_format_p_gcd_gcd"] = true,
					["text_text_format_p_gcd_hide_zero"] = false,
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["text_text_format_p_time_format"] = 0,
					["text_text_format_p_time_precision"] = 1,
					["text_text_format_s_format"] = "none",
					["text_visible"] = true,
					["text_wordWrap"] = "WordWrap",
					["type"] = "subtext",
				}, -- [2]
				{
					["glow"] = true,
					["glowBorder"] = false,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["glowFrequency"] = 0.25,
					["glowLength"] = 10,
					["glowLines"] = 8,
					["glowScale"] = 1,
					["glowThickness"] = 1,
					["glowType"] = "ACShine",
					["glowXOffset"] = 0,
					["glowYOffset"] = 0,
					["type"] = "subglow",
					["useGlowColor"] = false,
				}, -- [3]
			},
			["tocversion"] = 90002,
			["triggers"] = {
				[1] = {
					["trigger"] = {
						["auraspellids"] = {
							"330366", -- [1]
						},
						["debuffType"] = "HELPFUL",
						["duration"] = "1",
						["event"] = "Crowd Controlled",
						["names"] = {
						},
						["percenthealth"] = "20",
						["percenthealth_operator"] = "<=",
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "unit",
						["unevent"] = "auto",
						["unit"] = "target",
						["useExactSpellId"] = true,
						["use_absorbMode"] = true,
						["use_controlled"] = true,
						["use_health"] = false,
						["use_percenthealth"] = true,
						["use_unit"] = true,
					},
					["untrigger"] = {
						["unit"] = "target",
					},
				},
				[2] = {
					["trigger"] = {
						["debuffType"] = "HELPFUL",
						["duration"] = "1",
						["event"] = "Cooldown Progress (Item)",
						["genericShowOn"] = "showOnReady",
						["itemName"] = 179350,
						["realSpellName"] = 0,
						["spellName"] = 0,
						["type"] = "item",
						["unevent"] = "auto",
						["unit"] = "player",
						["use_genericShowOn"] = true,
						["use_itemName"] = true,
						["use_spellName"] = true,
						["use_track"] = true,
					},
					["untrigger"] = {
						["genericShowOn"] = "showOnReady",
					},
				},
				["activeTriggerMode"] = -10,
			},
			["uid"] = "vkNzxU(fgF1",
			["url"] = "https://wago.io/G_ZnwseH-/6",
			["version"] = 6,
			["width"] = 40,
			["xOffset"] = 105,
			["yOffset"] = -25,
			["zoom"] = 0.32,
		},
		["Inscrutable Quantum Device CD"] = {
			["actions"] = {
				["finish"] = {
				},
				["init"] = {
				},
				["start"] = {
				},
			},
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["anchorPoint"] = "CENTER",
			["animation"] = {
				["finish"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["start"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
			},
			["authorOptions"] = {
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["conditions"] = {
				{
					["changes"] = {
						{
							["property"] = "sub.2.glow",
							["value"] = true,
						}, -- [1]
					},
					["check"] = {
						["op"] = "<=",
						["trigger"] = 1,
						["variable"] = "expirationTime",
					},
				}, -- [1]
			},
			["config"] = {
			},
			["cooldown"] = true,
			["cooldownEdge"] = false,
			["cooldownSwipe"] = false,
			["cooldownTextDisabled"] = false,
			["desaturate"] = true,
			["frameStrata"] = 5,
			["height"] = 40,
			["icon"] = true,
			["iconSource"] = -1,
			["id"] = "Inscrutable Quantum Device CD",
			["information"] = {
			},
			["internalVersion"] = 45,
			["inverse"] = false,
			["keepAspectRatio"] = false,
			["load"] = {
				["class"] = {
					["multi"] = {
					},
				},
				["item_bonusid_equipped"] = "Inscrutable Quantum Device",
				["itemequiped"] = 179350,
				["itemtypeequipped"] = {
				},
				["size"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["use_item_bonusid_equipped"] = false,
				["use_itemequiped"] = true,
				["zoneIds"] = "",
			},
			["parent"] = "Inscrutable Quantum Device",
			["preferToUpdate"] = false,
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["semver"] = "1.0.5",
			["subRegions"] = {
				{
					["anchorXOffset"] = 0,
					["anchorYOffset"] = 0,
					["rotateText"] = "NONE",
					["text_anchorPoint"] = "CENTER",
					["text_automaticWidth"] = "Auto",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_fixedWidth"] = 64,
					["text_font"] = "Expressway",
					["text_fontSize"] = 24,
					["text_fontType"] = "OUTLINE",
					["text_justify"] = "CENTER",
					["text_selfPoint"] = "AUTO",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_shadowXOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["text_text"] = "%p",
					["text_text_format_p_format"] = "timed",
					["text_text_format_p_time_dynamic_threshold"] = 60,
					["text_text_format_p_time_format"] = 0,
					["text_text_format_p_time_precision"] = 1,
					["text_text_format_s_format"] = "none",
					["text_text_format_t_format"] = "timed",
					["text_text_format_t_time_dynamic_threshold"] = 60,
					["text_text_format_t_time_format"] = 0,
					["text_text_format_t_time_precision"] = 1,
					["text_visible"] = true,
					["text_wordWrap"] = "WordWrap",
					["type"] = "subtext",
				}, -- [1]
				{
					["glow"] = false,
					["glowBorder"] = false,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["glowFrequency"] = 0.25,
					["glowLength"] = 10,
					["glowLines"] = 8,
					["glowScale"] = 1,
					["glowThickness"] = 1,
					["glowType"] = "buttonOverlay",
					["glowXOffset"] = 0,
					["glowYOffset"] = 0,
					["type"] = "subglow",
					["useGlowColor"] = false,
				}, -- [2]
			},
			["tocversion"] = 90002,
			["triggers"] = {
				[1] = {
					["trigger"] = {
						["debuffType"] = "HELPFUL",
						["duration"] = "1",
						["event"] = "Cooldown Progress (Item)",
						["genericShowOn"] = "showOnCooldown",
						["itemName"] = 179350,
						["names"] = {
						},
						["realSpellName"] = 0,
						["remaining"] = "20",
						["remaining_operator"] = "<=",
						["spellIds"] = {
						},
						["spellName"] = 0,
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "item",
						["unevent"] = "auto",
						["unit"] = "player",
						["use_genericShowOn"] = true,
						["use_itemName"] = true,
						["use_remaining"] = true,
						["use_spellName"] = true,
						["use_track"] = true,
					},
					["untrigger"] = {
					},
				},
				["activeTriggerMode"] = -10,
				["disjunctive"] = "any",
			},
			["uid"] = "N6jOWYWsXqi",
			["url"] = "https://wago.io/G_ZnwseH-/6",
			["version"] = 6,
			["width"] = 40,
			["xOffset"] = 105,
			["yOffset"] = -25,
			["zoom"] = 0,
		},
		["Inscrutable Quantum Device Crit"] = {
			["actions"] = {
				["finish"] = {
				},
				["init"] = {
				},
				["start"] = {
				},
			},
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["anchorPoint"] = "CENTER",
			["animation"] = {
				["finish"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["start"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
			},
			["authorOptions"] = {
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["config"] = {
			},
			["cooldown"] = true,
			["cooldownEdge"] = false,
			["cooldownSwipe"] = true,
			["cooldownTextDisabled"] = false,
			["desaturate"] = false,
			["frameStrata"] = 3,
			["height"] = 40,
			["icon"] = true,
			["iconSource"] = -1,
			["id"] = "Inscrutable Quantum Device Crit",
			["information"] = {
			},
			["internalVersion"] = 45,
			["inverse"] = false,
			["keepAspectRatio"] = false,
			["load"] = {
				["class"] = {
					["multi"] = {
					},
				},
				["item_bonusid_equipped"] = "Inscrutable Quantum Device",
				["itemequiped"] = 179350,
				["itemtypeequipped"] = {
				},
				["size"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["use_item_bonusid_equipped"] = false,
				["use_itemequiped"] = true,
				["zoneIds"] = "",
			},
			["parent"] = "Inscrutable Quantum Device",
			["preferToUpdate"] = false,
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["semver"] = "1.0.5",
			["subRegions"] = {
				{
					["anchorXOffset"] = 0,
					["anchorYOffset"] = 0,
					["rotateText"] = "NONE",
					["text_anchorPoint"] = "CENTER",
					["text_automaticWidth"] = "Auto",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_fixedWidth"] = 64,
					["text_font"] = "Expressway",
					["text_fontSize"] = 30,
					["text_fontType"] = "OUTLINE",
					["text_justify"] = "CENTER",
					["text_selfPoint"] = "AUTO",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_shadowXOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["text_text"] = "%p",
					["text_text_format_p_abbreviate"] = false,
					["text_text_format_p_abbreviate_max"] = 8,
					["text_text_format_p_big_number_format"] = "AbbreviateNumbers",
					["text_text_format_p_decimal_precision"] = 1,
					["text_text_format_p_format"] = "timed",
					["text_text_format_p_gcd_cast"] = false,
					["text_text_format_p_gcd_channel"] = false,
					["text_text_format_p_gcd_gcd"] = true,
					["text_text_format_p_gcd_hide_zero"] = false,
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["text_text_format_p_time_format"] = 0,
					["text_text_format_p_time_precision"] = 1,
					["text_text_format_s_format"] = "none",
					["text_visible"] = true,
					["text_wordWrap"] = "WordWrap",
					["type"] = "subtext",
				}, -- [1]
				{
					["anchorXOffset"] = 0,
					["anchorYOffset"] = 0,
					["rotateText"] = "NONE",
					["text_anchorPoint"] = "INNER_BOTTOM",
					["text_anchorYOffset"] = -5,
					["text_automaticWidth"] = "Auto",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_fixedWidth"] = 64,
					["text_font"] = "Expressway",
					["text_fontSize"] = 12,
					["text_fontType"] = "OUTLINE",
					["text_justify"] = "CENTER",
					["text_selfPoint"] = "AUTO",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_shadowXOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["text_text"] = "Crit",
					["text_text_format_p_abbreviate"] = false,
					["text_text_format_p_abbreviate_max"] = 8,
					["text_text_format_p_big_number_format"] = "AbbreviateNumbers",
					["text_text_format_p_decimal_precision"] = 1,
					["text_text_format_p_format"] = "timed",
					["text_text_format_p_gcd_cast"] = false,
					["text_text_format_p_gcd_channel"] = false,
					["text_text_format_p_gcd_gcd"] = true,
					["text_text_format_p_gcd_hide_zero"] = false,
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["text_text_format_p_time_format"] = 0,
					["text_text_format_p_time_precision"] = 1,
					["text_text_format_s_format"] = "none",
					["text_visible"] = true,
					["text_wordWrap"] = "WordWrap",
					["type"] = "subtext",
				}, -- [2]
				{
					["glow"] = true,
					["glowBorder"] = false,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["glowFrequency"] = 0.25,
					["glowLength"] = 10,
					["glowLines"] = 8,
					["glowScale"] = 1,
					["glowThickness"] = 1,
					["glowType"] = "ACShine",
					["glowXOffset"] = 0,
					["glowYOffset"] = 0,
					["type"] = "subglow",
					["useGlowColor"] = false,
				}, -- [3]
			},
			["tocversion"] = 90002,
			["triggers"] = {
				[1] = {
					["trigger"] = {
						["auraspellids"] = {
							"330366", -- [1]
						},
						["debuffType"] = "HELPFUL",
						["event"] = "Health",
						["names"] = {
						},
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "aura2",
						["unit"] = "player",
						["useExactSpellId"] = true,
					},
					["untrigger"] = {
					},
				},
				["activeTriggerMode"] = -10,
			},
			["uid"] = "g5)uq8GiBP(",
			["url"] = "https://wago.io/G_ZnwseH-/6",
			["version"] = 6,
			["width"] = 40,
			["xOffset"] = 105,
			["yOffset"] = -25,
			["zoom"] = 0.32,
		},
		["Inscrutable Quantum Device Execute"] = {
			["actions"] = {
				["finish"] = {
				},
				["init"] = {
				},
				["start"] = {
				},
			},
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["anchorPoint"] = "CENTER",
			["animation"] = {
				["finish"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["start"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
			},
			["authorOptions"] = {
			},
			["color"] = {
				0.8078431372549, -- [1]
				0.019607843137255, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["config"] = {
			},
			["cooldown"] = false,
			["cooldownEdge"] = false,
			["cooldownSwipe"] = false,
			["cooldownTextDisabled"] = false,
			["desaturate"] = false,
			["displayIcon"] = 2000857,
			["frameStrata"] = 4,
			["height"] = 40,
			["icon"] = true,
			["iconSource"] = 0,
			["id"] = "Inscrutable Quantum Device Execute",
			["information"] = {
			},
			["internalVersion"] = 45,
			["inverse"] = false,
			["keepAspectRatio"] = false,
			["load"] = {
				["class"] = {
					["multi"] = {
					},
				},
				["item_bonusid_equipped"] = "Inscrutable Quantum Device",
				["itemequiped"] = 179350,
				["itemtypeequipped"] = {
				},
				["size"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["use_item_bonusid_equipped"] = false,
				["use_itemequiped"] = true,
				["zoneIds"] = "",
			},
			["parent"] = "Inscrutable Quantum Device",
			["preferToUpdate"] = false,
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["semver"] = "1.0.5",
			["subRegions"] = {
				{
					["anchorXOffset"] = 0,
					["anchorYOffset"] = 0,
					["rotateText"] = "NONE",
					["text_anchorPoint"] = "CENTER",
					["text_anchorYOffset"] = 6,
					["text_automaticWidth"] = "Auto",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_fixedWidth"] = 64,
					["text_font"] = "Expressway",
					["text_fontSize"] = 15,
					["text_fontType"] = "OUTLINE",
					["text_justify"] = "CENTER",
					["text_selfPoint"] = "AUTO",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_shadowXOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["text_text"] = "EXE",
					["text_text_format_p_abbreviate"] = false,
					["text_text_format_p_abbreviate_max"] = 8,
					["text_text_format_p_big_number_format"] = "AbbreviateNumbers",
					["text_text_format_p_decimal_precision"] = 1,
					["text_text_format_p_format"] = "timed",
					["text_text_format_p_gcd_cast"] = false,
					["text_text_format_p_gcd_channel"] = false,
					["text_text_format_p_gcd_gcd"] = true,
					["text_text_format_p_gcd_hide_zero"] = false,
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["text_text_format_p_time_format"] = 0,
					["text_text_format_p_time_precision"] = 1,
					["text_text_format_s_format"] = "none",
					["text_visible"] = true,
					["text_wordWrap"] = "WordWrap",
					["type"] = "subtext",
				}, -- [1]
				{
					["anchorXOffset"] = 0,
					["anchorYOffset"] = 0,
					["rotateText"] = "NONE",
					["text_anchorPoint"] = "CENTER",
					["text_anchorYOffset"] = -5,
					["text_automaticWidth"] = "Auto",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_fixedWidth"] = 64,
					["text_font"] = "Expressway",
					["text_fontSize"] = 15,
					["text_fontType"] = "OUTLINE",
					["text_justify"] = "CENTER",
					["text_selfPoint"] = "AUTO",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_shadowXOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["text_text"] = "CUTE",
					["text_text_format_p_abbreviate"] = false,
					["text_text_format_p_abbreviate_max"] = 8,
					["text_text_format_p_big_number_format"] = "AbbreviateNumbers",
					["text_text_format_p_decimal_precision"] = 1,
					["text_text_format_p_format"] = "timed",
					["text_text_format_p_gcd_cast"] = false,
					["text_text_format_p_gcd_channel"] = false,
					["text_text_format_p_gcd_gcd"] = true,
					["text_text_format_p_gcd_hide_zero"] = false,
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["text_text_format_p_time_format"] = 0,
					["text_text_format_p_time_precision"] = 1,
					["text_text_format_s_format"] = "none",
					["text_visible"] = true,
					["text_wordWrap"] = "WordWrap",
					["type"] = "subtext",
				}, -- [2]
				{
					["glow"] = true,
					["glowBorder"] = false,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["glowFrequency"] = 0.25,
					["glowLength"] = 10,
					["glowLines"] = 8,
					["glowScale"] = 1,
					["glowThickness"] = 1,
					["glowType"] = "buttonOverlay",
					["glowXOffset"] = 0,
					["glowYOffset"] = 0,
					["type"] = "subglow",
					["useGlowColor"] = false,
				}, -- [3]
			},
			["tocversion"] = 90002,
			["triggers"] = {
				[1] = {
					["trigger"] = {
						["auraspellids"] = {
							"330366", -- [1]
						},
						["debuffType"] = "HELPFUL",
						["duration"] = "1",
						["event"] = "Health",
						["names"] = {
						},
						["percenthealth"] = "20",
						["percenthealth_operator"] = "<=",
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "unit",
						["unevent"] = "auto",
						["unit"] = "target",
						["useExactSpellId"] = true,
						["use_absorbMode"] = true,
						["use_health"] = false,
						["use_percenthealth"] = true,
						["use_unit"] = true,
					},
					["untrigger"] = {
						["unit"] = "target",
					},
				},
				[2] = {
					["trigger"] = {
						["debuffType"] = "HELPFUL",
						["duration"] = "1",
						["event"] = "Cooldown Progress (Item)",
						["genericShowOn"] = "showOnReady",
						["itemName"] = 179350,
						["realSpellName"] = 0,
						["spellName"] = 0,
						["type"] = "item",
						["unevent"] = "auto",
						["unit"] = "player",
						["use_genericShowOn"] = true,
						["use_itemName"] = true,
						["use_spellName"] = true,
						["use_track"] = true,
					},
					["untrigger"] = {
						["genericShowOn"] = "showOnReady",
					},
				},
				[3] = {
					["trigger"] = {
						["auraspellids"] = {
							"330366", -- [1]
						},
						["debuffType"] = "HELPFUL",
						["duration"] = "1",
						["event"] = "Health",
						["names"] = {
						},
						["percenthealth"] = "0",
						["percenthealth_operator"] = ">",
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "unit",
						["unevent"] = "auto",
						["unit"] = "target",
						["useExactSpellId"] = true,
						["use_absorbMode"] = true,
						["use_health"] = false,
						["use_percenthealth"] = true,
						["use_unit"] = true,
					},
					["untrigger"] = {
						["unit"] = "target",
					},
				},
				["activeTriggerMode"] = -10,
			},
			["uid"] = "W5N8vC)NpyX",
			["url"] = "https://wago.io/G_ZnwseH-/6",
			["version"] = 6,
			["width"] = 40,
			["xOffset"] = 105,
			["yOffset"] = -25,
			["zoom"] = 0.32,
		},
		["Inscrutable Quantum Device Haste"] = {
			["actions"] = {
				["finish"] = {
				},
				["init"] = {
				},
				["start"] = {
				},
			},
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["anchorPoint"] = "CENTER",
			["animation"] = {
				["finish"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["start"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
			},
			["authorOptions"] = {
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["config"] = {
			},
			["cooldown"] = true,
			["cooldownEdge"] = false,
			["cooldownSwipe"] = true,
			["cooldownTextDisabled"] = false,
			["desaturate"] = false,
			["frameStrata"] = 3,
			["height"] = 40,
			["icon"] = true,
			["iconSource"] = -1,
			["id"] = "Inscrutable Quantum Device Haste",
			["information"] = {
			},
			["internalVersion"] = 45,
			["inverse"] = false,
			["keepAspectRatio"] = false,
			["load"] = {
				["class"] = {
					["multi"] = {
					},
				},
				["item_bonusid_equipped"] = "Inscrutable Quantum Device",
				["itemequiped"] = 179350,
				["itemtypeequipped"] = {
				},
				["size"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["use_item_bonusid_equipped"] = false,
				["use_itemequiped"] = true,
				["zoneIds"] = "",
			},
			["parent"] = "Inscrutable Quantum Device",
			["preferToUpdate"] = false,
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["semver"] = "1.0.5",
			["subRegions"] = {
				{
					["anchorXOffset"] = 0,
					["anchorYOffset"] = 0,
					["rotateText"] = "NONE",
					["text_anchorPoint"] = "CENTER",
					["text_automaticWidth"] = "Auto",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_fixedWidth"] = 64,
					["text_font"] = "Expressway",
					["text_fontSize"] = 30,
					["text_fontType"] = "OUTLINE",
					["text_justify"] = "CENTER",
					["text_selfPoint"] = "AUTO",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_shadowXOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["text_text"] = "%p",
					["text_text_format_p_abbreviate"] = false,
					["text_text_format_p_abbreviate_max"] = 8,
					["text_text_format_p_big_number_format"] = "AbbreviateNumbers",
					["text_text_format_p_decimal_precision"] = 1,
					["text_text_format_p_format"] = "timed",
					["text_text_format_p_gcd_cast"] = false,
					["text_text_format_p_gcd_channel"] = false,
					["text_text_format_p_gcd_gcd"] = true,
					["text_text_format_p_gcd_hide_zero"] = false,
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["text_text_format_p_time_format"] = 0,
					["text_text_format_p_time_precision"] = 1,
					["text_text_format_s_format"] = "none",
					["text_visible"] = true,
					["text_wordWrap"] = "WordWrap",
					["type"] = "subtext",
				}, -- [1]
				{
					["anchorXOffset"] = 0,
					["anchorYOffset"] = 0,
					["rotateText"] = "NONE",
					["text_anchorPoint"] = "INNER_BOTTOM",
					["text_anchorYOffset"] = -5,
					["text_automaticWidth"] = "Auto",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_fixedWidth"] = 64,
					["text_font"] = "Expressway",
					["text_fontSize"] = 12,
					["text_fontType"] = "OUTLINE",
					["text_justify"] = "CENTER",
					["text_selfPoint"] = "AUTO",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_shadowXOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["text_text"] = "Haste",
					["text_text_format_p_abbreviate"] = false,
					["text_text_format_p_abbreviate_max"] = 8,
					["text_text_format_p_big_number_format"] = "AbbreviateNumbers",
					["text_text_format_p_decimal_precision"] = 1,
					["text_text_format_p_format"] = "timed",
					["text_text_format_p_gcd_cast"] = false,
					["text_text_format_p_gcd_channel"] = false,
					["text_text_format_p_gcd_gcd"] = true,
					["text_text_format_p_gcd_hide_zero"] = false,
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["text_text_format_p_time_format"] = 0,
					["text_text_format_p_time_precision"] = 1,
					["text_text_format_s_format"] = "none",
					["text_visible"] = true,
					["text_wordWrap"] = "WordWrap",
					["type"] = "subtext",
				}, -- [2]
				{
					["glow"] = true,
					["glowBorder"] = false,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["glowFrequency"] = 0.25,
					["glowLength"] = 10,
					["glowLines"] = 8,
					["glowScale"] = 1,
					["glowThickness"] = 1,
					["glowType"] = "ACShine",
					["glowXOffset"] = 0,
					["glowYOffset"] = 0,
					["type"] = "subglow",
					["useGlowColor"] = false,
				}, -- [3]
			},
			["tocversion"] = 90002,
			["triggers"] = {
				[1] = {
					["trigger"] = {
						["auraspellids"] = {
							"330368", -- [1]
						},
						["debuffType"] = "HELPFUL",
						["event"] = "Health",
						["names"] = {
						},
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "aura2",
						["unit"] = "player",
						["useExactSpellId"] = true,
					},
					["untrigger"] = {
					},
				},
				["activeTriggerMode"] = -10,
			},
			["uid"] = "IJyvTnXtusT",
			["url"] = "https://wago.io/G_ZnwseH-/6",
			["version"] = 6,
			["width"] = 40,
			["xOffset"] = 105,
			["yOffset"] = -25,
			["zoom"] = 0.32,
		},
		["Inscrutable Quantum Device Heal"] = {
			["actions"] = {
				["finish"] = {
				},
				["init"] = {
				},
				["start"] = {
				},
			},
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["anchorPoint"] = "CENTER",
			["animation"] = {
				["finish"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["start"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
			},
			["authorOptions"] = {
			},
			["color"] = {
				0.11764705882353, -- [1]
				0.96862745098039, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["config"] = {
			},
			["cooldown"] = false,
			["cooldownEdge"] = false,
			["cooldownSwipe"] = false,
			["cooldownTextDisabled"] = false,
			["desaturate"] = false,
			["displayIcon"] = 2000857,
			["frameStrata"] = 5,
			["height"] = 40,
			["icon"] = true,
			["iconSource"] = 0,
			["id"] = "Inscrutable Quantum Device Heal",
			["information"] = {
			},
			["internalVersion"] = 45,
			["inverse"] = false,
			["keepAspectRatio"] = false,
			["load"] = {
				["class"] = {
					["multi"] = {
					},
				},
				["item_bonusid_equipped"] = "Inscrutable Quantum Device",
				["itemequiped"] = 179350,
				["itemtypeequipped"] = {
				},
				["size"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["use_item_bonusid_equipped"] = false,
				["use_itemequiped"] = true,
				["zoneIds"] = "",
			},
			["parent"] = "Inscrutable Quantum Device",
			["preferToUpdate"] = false,
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["semver"] = "1.0.5",
			["subRegions"] = {
				{
					["anchorXOffset"] = 0,
					["anchorYOffset"] = 0,
					["rotateText"] = "NONE",
					["text_anchorPoint"] = "CENTER",
					["text_anchorYOffset"] = 0,
					["text_automaticWidth"] = "Auto",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_fixedWidth"] = 64,
					["text_font"] = "Expressway",
					["text_fontSize"] = 20,
					["text_fontType"] = "OUTLINE",
					["text_justify"] = "CENTER",
					["text_selfPoint"] = "AUTO",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_shadowXOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["text_text"] = "HEAL",
					["text_text_format_p_abbreviate"] = false,
					["text_text_format_p_abbreviate_max"] = 8,
					["text_text_format_p_big_number_format"] = "AbbreviateNumbers",
					["text_text_format_p_decimal_precision"] = 1,
					["text_text_format_p_format"] = "timed",
					["text_text_format_p_gcd_cast"] = false,
					["text_text_format_p_gcd_channel"] = false,
					["text_text_format_p_gcd_gcd"] = true,
					["text_text_format_p_gcd_hide_zero"] = false,
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["text_text_format_p_time_format"] = 0,
					["text_text_format_p_time_precision"] = 1,
					["text_text_format_s_format"] = "none",
					["text_visible"] = true,
					["text_wordWrap"] = "WordWrap",
					["type"] = "subtext",
				}, -- [1]
				{
					["glow"] = true,
					["glowBorder"] = false,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["glowFrequency"] = 0.25,
					["glowLength"] = 10,
					["glowLines"] = 8,
					["glowScale"] = 1,
					["glowThickness"] = 1,
					["glowType"] = "ACShine",
					["glowXOffset"] = 0,
					["glowYOffset"] = 0,
					["type"] = "subglow",
					["useGlowColor"] = false,
				}, -- [2]
			},
			["tocversion"] = 90002,
			["triggers"] = {
				[1] = {
					["trigger"] = {
						["auraspellids"] = {
							"330366", -- [1]
						},
						["debuffType"] = "HELPFUL",
						["duration"] = "1",
						["event"] = "Health",
						["names"] = {
						},
						["percenthealth"] = "30",
						["percenthealth_operator"] = "<=",
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "unit",
						["unevent"] = "auto",
						["unit"] = "party",
						["useExactSpellId"] = true,
						["use_absorbMode"] = true,
						["use_controlled"] = true,
						["use_health"] = false,
						["use_ignoreDead"] = true,
						["use_ignoreDisconnected"] = true,
						["use_percenthealth"] = true,
						["use_unit"] = true,
					},
					["untrigger"] = {
						["unit"] = "party",
					},
				},
				[2] = {
					["trigger"] = {
						["debuffType"] = "HELPFUL",
						["duration"] = "1",
						["event"] = "Cooldown Progress (Item)",
						["genericShowOn"] = "showOnReady",
						["itemName"] = 179350,
						["realSpellName"] = 0,
						["spellName"] = 0,
						["type"] = "item",
						["unevent"] = "auto",
						["unit"] = "player",
						["use_genericShowOn"] = true,
						["use_itemName"] = true,
						["use_spellName"] = true,
						["use_track"] = true,
					},
					["untrigger"] = {
						["genericShowOn"] = "showOnReady",
					},
				},
				["activeTriggerMode"] = -10,
			},
			["uid"] = "5cKHiMQzXJp",
			["url"] = "https://wago.io/G_ZnwseH-/6",
			["version"] = 6,
			["width"] = 40,
			["xOffset"] = 105,
			["yOffset"] = -25,
			["zoom"] = 0.32,
		},
		["Inscrutable Quantum Device Mana"] = {
			["actions"] = {
				["finish"] = {
				},
				["init"] = {
				},
				["start"] = {
				},
			},
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["anchorPoint"] = "CENTER",
			["animation"] = {
				["finish"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["start"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
			},
			["authorOptions"] = {
			},
			["color"] = {
				0, -- [1]
				0.019607843137255, -- [2]
				0.96862745098039, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["config"] = {
			},
			["cooldown"] = false,
			["cooldownEdge"] = false,
			["cooldownSwipe"] = false,
			["cooldownTextDisabled"] = false,
			["desaturate"] = false,
			["displayIcon"] = 2000857,
			["frameStrata"] = 4,
			["height"] = 40,
			["icon"] = true,
			["iconSource"] = 0,
			["id"] = "Inscrutable Quantum Device Mana",
			["information"] = {
			},
			["internalVersion"] = 45,
			["inverse"] = false,
			["keepAspectRatio"] = false,
			["load"] = {
				["class"] = {
					["multi"] = {
					},
				},
				["item_bonusid_equipped"] = "Inscrutable Quantum Device",
				["itemequiped"] = 179350,
				["itemtypeequipped"] = {
				},
				["size"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["use_item_bonusid_equipped"] = false,
				["use_itemequiped"] = true,
				["zoneIds"] = "",
			},
			["parent"] = "Inscrutable Quantum Device",
			["preferToUpdate"] = false,
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["semver"] = "1.0.5",
			["subRegions"] = {
				{
					["anchorXOffset"] = 0,
					["anchorYOffset"] = 0,
					["rotateText"] = "NONE",
					["text_anchorPoint"] = "CENTER",
					["text_anchorYOffset"] = 5,
					["text_automaticWidth"] = "Auto",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_fixedWidth"] = 64,
					["text_font"] = "Expressway",
					["text_fontSize"] = 14,
					["text_fontType"] = "OUTLINE",
					["text_justify"] = "CENTER",
					["text_selfPoint"] = "AUTO",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_shadowXOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["text_text"] = "GRANT",
					["text_text_format_p_abbreviate"] = false,
					["text_text_format_p_abbreviate_max"] = 8,
					["text_text_format_p_big_number_format"] = "AbbreviateNumbers",
					["text_text_format_p_decimal_precision"] = 1,
					["text_text_format_p_format"] = "timed",
					["text_text_format_p_gcd_cast"] = false,
					["text_text_format_p_gcd_channel"] = false,
					["text_text_format_p_gcd_gcd"] = true,
					["text_text_format_p_gcd_hide_zero"] = false,
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["text_text_format_p_time_format"] = 0,
					["text_text_format_p_time_precision"] = 1,
					["text_text_format_s_format"] = "none",
					["text_visible"] = true,
					["text_wordWrap"] = "WordWrap",
					["type"] = "subtext",
				}, -- [1]
				{
					["anchorXOffset"] = 0,
					["anchorYOffset"] = 0,
					["rotateText"] = "NONE",
					["text_anchorPoint"] = "CENTER",
					["text_anchorYOffset"] = -5,
					["text_automaticWidth"] = "Auto",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_fixedWidth"] = 64,
					["text_font"] = "Expressway",
					["text_fontSize"] = 14,
					["text_fontType"] = "OUTLINE",
					["text_justify"] = "CENTER",
					["text_selfPoint"] = "AUTO",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_shadowXOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["text_text"] = "MANA",
					["text_text_format_p_abbreviate"] = false,
					["text_text_format_p_abbreviate_max"] = 8,
					["text_text_format_p_big_number_format"] = "AbbreviateNumbers",
					["text_text_format_p_decimal_precision"] = 1,
					["text_text_format_p_format"] = "timed",
					["text_text_format_p_gcd_cast"] = false,
					["text_text_format_p_gcd_channel"] = false,
					["text_text_format_p_gcd_gcd"] = true,
					["text_text_format_p_gcd_hide_zero"] = false,
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["text_text_format_p_time_format"] = 0,
					["text_text_format_p_time_precision"] = 1,
					["text_text_format_s_format"] = "none",
					["text_visible"] = true,
					["text_wordWrap"] = "WordWrap",
					["type"] = "subtext",
				}, -- [2]
				{
					["glow"] = true,
					["glowBorder"] = false,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["glowFrequency"] = 0.25,
					["glowLength"] = 10,
					["glowLines"] = 8,
					["glowScale"] = 1,
					["glowThickness"] = 1,
					["glowType"] = "ACShine",
					["glowXOffset"] = 0,
					["glowYOffset"] = 0,
					["type"] = "subglow",
					["useGlowColor"] = false,
				}, -- [3]
			},
			["tocversion"] = 90002,
			["triggers"] = {
				[1] = {
					["trigger"] = {
						["auraspellids"] = {
							"330366", -- [1]
						},
						["debuffType"] = "HELPFUL",
						["duration"] = "1",
						["event"] = "Power",
						["names"] = {
						},
						["percenthealth"] = "20",
						["percenthealth_operator"] = "<=",
						["percentpower"] = "20",
						["percentpower_operator"] = "<",
						["power"] = "20",
						["power_operator"] = "<",
						["role"] = "HEALER",
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "unit",
						["unevent"] = "auto",
						["unit"] = "party",
						["useExactSpellId"] = true,
						["use_absorbMode"] = true,
						["use_controlled"] = true,
						["use_health"] = false,
						["use_ignoreDead"] = true,
						["use_ignoreDisconnected"] = true,
						["use_percenthealth"] = true,
						["use_percentpower"] = true,
						["use_power"] = false,
						["use_role"] = true,
						["use_unit"] = true,
					},
					["untrigger"] = {
						["unit"] = "party",
					},
				},
				[2] = {
					["trigger"] = {
						["debuffType"] = "HELPFUL",
						["duration"] = "1",
						["event"] = "Cooldown Progress (Item)",
						["genericShowOn"] = "showOnReady",
						["itemName"] = 179350,
						["realSpellName"] = 0,
						["spellName"] = 0,
						["type"] = "item",
						["unevent"] = "auto",
						["unit"] = "player",
						["use_genericShowOn"] = true,
						["use_itemName"] = true,
						["use_spellName"] = true,
						["use_track"] = true,
					},
					["untrigger"] = {
						["genericShowOn"] = "showOnReady",
					},
				},
				["activeTriggerMode"] = -10,
				["customTriggerLogic"] = "\n\n",
				["disjunctive"] = "all",
			},
			["uid"] = "9HqDmiFNMmk",
			["url"] = "https://wago.io/G_ZnwseH-/6",
			["version"] = 6,
			["width"] = 40,
			["xOffset"] = 105,
			["yOffset"] = -25,
			["zoom"] = 0.32,
		},
		["Inscrutable Quantum Device Mastery"] = {
			["actions"] = {
				["finish"] = {
				},
				["init"] = {
				},
				["start"] = {
				},
			},
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["anchorPoint"] = "CENTER",
			["animation"] = {
				["finish"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["start"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
			},
			["authorOptions"] = {
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["config"] = {
			},
			["cooldown"] = true,
			["cooldownEdge"] = false,
			["cooldownSwipe"] = true,
			["cooldownTextDisabled"] = false,
			["desaturate"] = false,
			["frameStrata"] = 3,
			["height"] = 40,
			["icon"] = true,
			["iconSource"] = -1,
			["id"] = "Inscrutable Quantum Device Mastery",
			["information"] = {
			},
			["internalVersion"] = 45,
			["inverse"] = false,
			["keepAspectRatio"] = false,
			["load"] = {
				["class"] = {
					["multi"] = {
					},
				},
				["item_bonusid_equipped"] = "Inscrutable Quantum Device",
				["itemequiped"] = 179350,
				["itemtypeequipped"] = {
				},
				["size"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["use_item_bonusid_equipped"] = false,
				["use_itemequiped"] = true,
				["zoneIds"] = "",
			},
			["parent"] = "Inscrutable Quantum Device",
			["preferToUpdate"] = false,
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["semver"] = "1.0.5",
			["subRegions"] = {
				{
					["anchorXOffset"] = 0,
					["anchorYOffset"] = 0,
					["rotateText"] = "NONE",
					["text_anchorPoint"] = "CENTER",
					["text_automaticWidth"] = "Auto",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_fixedWidth"] = 64,
					["text_font"] = "Expressway",
					["text_fontSize"] = 30,
					["text_fontType"] = "OUTLINE",
					["text_justify"] = "CENTER",
					["text_selfPoint"] = "AUTO",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_shadowXOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["text_text"] = "%p",
					["text_text_format_p_abbreviate"] = false,
					["text_text_format_p_abbreviate_max"] = 8,
					["text_text_format_p_big_number_format"] = "AbbreviateNumbers",
					["text_text_format_p_decimal_precision"] = 1,
					["text_text_format_p_format"] = "timed",
					["text_text_format_p_gcd_cast"] = false,
					["text_text_format_p_gcd_channel"] = false,
					["text_text_format_p_gcd_gcd"] = true,
					["text_text_format_p_gcd_hide_zero"] = false,
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["text_text_format_p_time_format"] = 0,
					["text_text_format_p_time_precision"] = 1,
					["text_text_format_s_format"] = "none",
					["text_visible"] = true,
					["text_wordWrap"] = "WordWrap",
					["type"] = "subtext",
				}, -- [1]
				{
					["anchorXOffset"] = 0,
					["anchorYOffset"] = 0,
					["rotateText"] = "NONE",
					["text_anchorPoint"] = "INNER_BOTTOM",
					["text_anchorYOffset"] = -5,
					["text_automaticWidth"] = "Auto",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_fixedWidth"] = 64,
					["text_font"] = "Expressway",
					["text_fontSize"] = 12,
					["text_fontType"] = "OUTLINE",
					["text_justify"] = "CENTER",
					["text_selfPoint"] = "AUTO",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_shadowXOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["text_text"] = "Mastery",
					["text_text_format_p_abbreviate"] = false,
					["text_text_format_p_abbreviate_max"] = 8,
					["text_text_format_p_big_number_format"] = "AbbreviateNumbers",
					["text_text_format_p_decimal_precision"] = 1,
					["text_text_format_p_format"] = "timed",
					["text_text_format_p_gcd_cast"] = false,
					["text_text_format_p_gcd_channel"] = false,
					["text_text_format_p_gcd_gcd"] = true,
					["text_text_format_p_gcd_hide_zero"] = false,
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["text_text_format_p_time_format"] = 0,
					["text_text_format_p_time_precision"] = 1,
					["text_text_format_s_format"] = "none",
					["text_visible"] = true,
					["text_wordWrap"] = "WordWrap",
					["type"] = "subtext",
				}, -- [2]
				{
					["glow"] = true,
					["glowBorder"] = false,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["glowFrequency"] = 0.25,
					["glowLength"] = 10,
					["glowLines"] = 8,
					["glowScale"] = 1,
					["glowThickness"] = 1,
					["glowType"] = "ACShine",
					["glowXOffset"] = 0,
					["glowYOffset"] = 0,
					["type"] = "subglow",
					["useGlowColor"] = false,
				}, -- [3]
			},
			["tocversion"] = 90002,
			["triggers"] = {
				[1] = {
					["trigger"] = {
						["auraspellids"] = {
							"330380", -- [1]
						},
						["debuffType"] = "HELPFUL",
						["event"] = "Health",
						["names"] = {
						},
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "aura2",
						["unit"] = "player",
						["useExactSpellId"] = true,
					},
					["untrigger"] = {
					},
				},
				["activeTriggerMode"] = -10,
			},
			["uid"] = "48WM0a(EnH9",
			["url"] = "https://wago.io/G_ZnwseH-/6",
			["version"] = 6,
			["width"] = 40,
			["xOffset"] = 105,
			["yOffset"] = -25,
			["zoom"] = 0.32,
		},
		["Inscrutable Quantum Device Versa"] = {
			["actions"] = {
				["finish"] = {
				},
				["init"] = {
				},
				["start"] = {
				},
			},
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["anchorPoint"] = "CENTER",
			["animation"] = {
				["finish"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["start"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
			},
			["authorOptions"] = {
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["config"] = {
			},
			["cooldown"] = true,
			["cooldownEdge"] = false,
			["cooldownSwipe"] = true,
			["cooldownTextDisabled"] = false,
			["desaturate"] = false,
			["frameStrata"] = 3,
			["height"] = 40,
			["icon"] = true,
			["iconSource"] = -1,
			["id"] = "Inscrutable Quantum Device Versa",
			["information"] = {
			},
			["internalVersion"] = 45,
			["inverse"] = false,
			["keepAspectRatio"] = false,
			["load"] = {
				["class"] = {
					["multi"] = {
					},
				},
				["item_bonusid_equipped"] = "Inscrutable Quantum Device",
				["itemequiped"] = 179350,
				["itemtypeequipped"] = {
				},
				["size"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["use_item_bonusid_equipped"] = false,
				["use_itemequiped"] = true,
				["zoneIds"] = "",
			},
			["parent"] = "Inscrutable Quantum Device",
			["preferToUpdate"] = false,
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["semver"] = "1.0.5",
			["subRegions"] = {
				{
					["anchorXOffset"] = 0,
					["anchorYOffset"] = 0,
					["rotateText"] = "NONE",
					["text_anchorPoint"] = "CENTER",
					["text_automaticWidth"] = "Auto",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_fixedWidth"] = 64,
					["text_font"] = "Expressway",
					["text_fontSize"] = 30,
					["text_fontType"] = "OUTLINE",
					["text_justify"] = "CENTER",
					["text_selfPoint"] = "AUTO",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_shadowXOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["text_text"] = "%p",
					["text_text_format_p_abbreviate"] = false,
					["text_text_format_p_abbreviate_max"] = 8,
					["text_text_format_p_big_number_format"] = "AbbreviateNumbers",
					["text_text_format_p_decimal_precision"] = 1,
					["text_text_format_p_format"] = "timed",
					["text_text_format_p_gcd_cast"] = false,
					["text_text_format_p_gcd_channel"] = false,
					["text_text_format_p_gcd_gcd"] = true,
					["text_text_format_p_gcd_hide_zero"] = false,
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["text_text_format_p_time_format"] = 0,
					["text_text_format_p_time_precision"] = 1,
					["text_text_format_s_format"] = "none",
					["text_visible"] = true,
					["text_wordWrap"] = "WordWrap",
					["type"] = "subtext",
				}, -- [1]
				{
					["anchorXOffset"] = 0,
					["anchorYOffset"] = 0,
					["rotateText"] = "NONE",
					["text_anchorPoint"] = "INNER_BOTTOM",
					["text_anchorYOffset"] = -5,
					["text_automaticWidth"] = "Auto",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_fixedWidth"] = 64,
					["text_font"] = "Expressway",
					["text_fontSize"] = 12,
					["text_fontType"] = "OUTLINE",
					["text_justify"] = "CENTER",
					["text_selfPoint"] = "AUTO",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_shadowXOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["text_text"] = "Versa",
					["text_text_format_p_abbreviate"] = false,
					["text_text_format_p_abbreviate_max"] = 8,
					["text_text_format_p_big_number_format"] = "AbbreviateNumbers",
					["text_text_format_p_decimal_precision"] = 1,
					["text_text_format_p_format"] = "timed",
					["text_text_format_p_gcd_cast"] = false,
					["text_text_format_p_gcd_channel"] = false,
					["text_text_format_p_gcd_gcd"] = true,
					["text_text_format_p_gcd_hide_zero"] = false,
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["text_text_format_p_time_format"] = 0,
					["text_text_format_p_time_precision"] = 1,
					["text_text_format_s_format"] = "none",
					["text_visible"] = true,
					["text_wordWrap"] = "WordWrap",
					["type"] = "subtext",
				}, -- [2]
				{
					["glow"] = true,
					["glowBorder"] = false,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["glowFrequency"] = 0.25,
					["glowLength"] = 10,
					["glowLines"] = 8,
					["glowScale"] = 1,
					["glowThickness"] = 1,
					["glowType"] = "ACShine",
					["glowXOffset"] = 0,
					["glowYOffset"] = 0,
					["type"] = "subglow",
					["useGlowColor"] = false,
				}, -- [3]
			},
			["tocversion"] = 90002,
			["triggers"] = {
				[1] = {
					["trigger"] = {
						["auraspellids"] = {
							"330367", -- [1]
						},
						["debuffType"] = "HELPFUL",
						["event"] = "Health",
						["names"] = {
						},
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "aura2",
						["unit"] = "player",
						["useExactSpellId"] = true,
					},
					["untrigger"] = {
					},
				},
				["activeTriggerMode"] = -10,
			},
			["uid"] = "Y18jHqsO7mA",
			["url"] = "https://wago.io/G_ZnwseH-/6",
			["version"] = 6,
			["width"] = 40,
			["xOffset"] = 105,
			["yOffset"] = -25,
			["zoom"] = 0.32,
		},
		["M+ Spiteful - Target on Nameplate"] = {
			["actions"] = {
				["finish"] = {
				},
				["init"] = {
					["custom"] = "aura_env.stored = {}",
					["do_custom"] = true,
				},
				["start"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
			},
			["anchorFrameParent"] = true,
			["anchorFrameType"] = "NAMEPLATE",
			["anchorPoint"] = "RIGHT",
			["animation"] = {
				["finish"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["start"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
			},
			["authorOptions"] = {
			},
			["automaticWidth"] = "Auto",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["config"] = {
			},
			["customTextUpdate"] = "event",
			["displayText"] = "%n",
			["displayText_format_n_format"] = "none",
			["displayText_format_p_format"] = "timed",
			["displayText_format_p_time_dynamic_threshold"] = 60,
			["displayText_format_p_time_format"] = 0,
			["displayText_format_p_time_precision"] = 1,
			["fixedWidth"] = 200,
			["font"] = "PT Sans Narrow",
			["fontSize"] = 9,
			["frameStrata"] = 1,
			["id"] = "M+ Spiteful - Target on Nameplate",
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["internalVersion"] = 45,
			["justify"] = "LEFT",
			["load"] = {
				["affixes"] = {
					["single"] = 123,
				},
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["use_affixes"] = true,
				["use_never"] = false,
				["zoneIds"] = "",
			},
			["outline"] = "OUTLINE",
			["preferToUpdate"] = false,
			["regionType"] = "text",
			["selfPoint"] = "LEFT",
			["semver"] = "1.0.2",
			["shadowColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["shadowXOffset"] = 1,
			["shadowYOffset"] = -1,
			["subRegions"] = {
			},
			["tocversion"] = 90005,
			["triggers"] = {
				[1] = {
					["trigger"] = {
						["check"] = "event",
						["custom"] = "function(states, event, unit, ...)\n    if event == \"WA_NAMEPLATE_CLOSED\" then\n        for i = 1, 40 do\n            local unit = \"nameplate\" .. i\n            if UnitExists(unit) and UnitCanAttack(\"player\", unit) then\n                C_Timer.After(0.1, function() WeakAuras.ScanEvents(\"NAME_PLATE_AURA_NAMES\", unit) end)\n            end\n        end\n    end\n    \n    if event == \"NAME_PLATE_UNIT_ADDED\" and unit and UnitCanAttack(\"player\", unit)\n    or event == \"NAME_PLATE_AURA_NAMES\" and unit\n    then\n        local GUID = UnitGUID(unit)\n        if GUID then\n            aura_env.stored[GUID] = unit\n            local target = unit..\"-target\"\n            if UnitExists(target) then\n                if aura_env.config.self and UnitIsUnit(\"player\", target) then return true end\n                local name = (\"[%s]\"):format(UnitName(target))\n                if UnitIsPlayer(target) then\n                    name = (\"[%s]\"):format(WA_ClassColorName(target))\n                end\n                \n                states[GUID] = {\n                    name = name,\n                    GUID = GUID,\n                    unit = unit,\n                    frame = C_NamePlate.GetNamePlateForUnit(unit),\n                    progressType = \"static\",\n                    autoHide = true,\n                    changed = true,\n                    show = true,\n                }\n            end\n        end\n    elseif event == \"NAME_PLATE_UNIT_REMOVED\" and unit then\n        local GUID = UnitGUID(unit)\n        local state = states[GUID]\n        if state then\n            state.show = false\n            state.changed = true\n        end\n        if aura_env.stored[GUID] then\n            aura_env.stored[GUID] = nil\n        end\n    end\n    if event == \"FRAME_UPDATE\" then\n        local theTime = GetTime()\n        if not aura_env.last or aura_env.last < theTime - aura_env.config.throttle then\n            for GUID, unit in pairs(aura_env.stored) do\n                if GUID then\n                    local state = states[GUID]\n                    local target = unit..\"-target\"\n                    if UnitExists(target) then\n                        if aura_env.config.self and UnitIsUnit(\"player\", target) then return true end\n                        local name = (\"%s\"):format(UnitName(target))\n                        if UnitIsPlayer(target) then\n                            name = (\"%s\"):format(WA_ClassColorName(target))\n                        end\n                        \n                        if state then\n                            state.name = name\n                            state.changed = true\n                        else\n                            states[GUID] = {\n                                name = name,\n                                GUID = GUID,\n                                unit = unit,\n                                frame = C_NamePlate.GetNamePlateForUnit(unit),\n                                progressType = \"static\",\n                                autoHide = true,\n                                changed = true,\n                                show = true,\n                            }\n                        end\n                    elseif state then\n                        state.show = false\n                        state.changed = true\n                    end\n                end\n            end\n        end\n    end\n    return true\nend",
						["custom_type"] = "stateupdate",
						["debuffType"] = "HELPFUL",
						["duration"] = "1",
						["event"] = "Health",
						["events"] = "WA_NAMEPLATE_CLOSED NAME_PLATE_UNIT_ADDED NAME_PLATE_UNIT_REMOVED NAME_PLATE_AURA_NAMES FRAME_UPDATE",
						["names"] = {
						},
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "custom",
						["unevent"] = "auto",
						["unit"] = "player",
						["use_absorbMode"] = true,
						["use_unit"] = true,
					},
					["untrigger"] = {
					},
				},
				[2] = {
					["trigger"] = {
						["auraspellids"] = {
							"343553", -- [1]
						},
						["combineMode"] = "showLowest",
						["combinePerUnit"] = false,
						["debuffType"] = "HELPFUL",
						["duration"] = "1",
						["event"] = "Unit Characteristics",
						["genericShowOn"] = "showOnCooldown",
						["nameplateType"] = "hostile",
						["npcId"] = "72934",
						["percenthealth"] = "0",
						["percenthealth_operator"] = ">=",
						["power"] = "0",
						["power_operator"] = ">=",
						["realSpellName"] = 0,
						["showClones"] = true,
						["spellName"] = 0,
						["type"] = "aura2",
						["unevent"] = "auto",
						["unit"] = "nameplate",
						["useExactSpellId"] = true,
						["useMatch_count"] = false,
						["use_absorbMode"] = true,
						["use_classification"] = true,
						["use_genericShowOn"] = true,
						["use_nameplateType"] = false,
						["use_npcId"] = true,
						["use_percenthealth"] = true,
						["use_power"] = false,
						["use_spellName"] = true,
						["use_track"] = true,
						["use_unit"] = true,
					},
					["untrigger"] = {
						["unit"] = "nameplate",
					},
				},
				["activeTriggerMode"] = 1,
				["disjunctive"] = "all",
			},
			["uid"] = "5SPUh(8DySA",
			["url"] = "https://wago.io/bvxv7PceG/3",
			["version"] = 3,
			["wordWrap"] = "WordWrap",
			["xOffset"] = 5,
			["yOffset"] = 0,
		},
		["MMN_Back_Button"] = {
			["actions"] = {
				["finish"] = {
				},
				["init"] = {
					["custom"] = "if(not aura_env.button) then\n    local b = CreateFrame(\"Button\", \"WA_SnowBoom4\", WeakAuras.regions[aura_env.id].region)\n    b:SetAllPoints(WeakAuras.regions[aura_env.id].region)\n    \n    local function createHighlightTexture(self)\n        local texture = self:CreateTexture(nil, \"OVERLAY\")\n        self.highlight = texture\n        texture:SetTexture([[Interface\\QuestFrame\\UI-QuestLogTitleHighlight]])\n        texture:SetBlendMode(\"ADD\")\n        texture:SetAllPoints(self)\n        texture:SetAlpha(1)\n        return texture\n    end\n    \n    local function onButtonEnter(self)\n        if not self.highlight then\n            createHighlightTexture(self)\n        end\n        self.highlight:Show()\n    end\n    \n    local function onButtonLeave(self)\n        if self.highlight then\n            self.highlight:Hide()\n        end\n    end\n    \n    b:RegisterForClicks(\"LeftButtonDown\")\n    \n    b:SetScript(\"OnClick\", function()\n            WeakAuras.ScanEvents(\"OmnyMazeV2\",\"Back\")\n    end)\n    \n    b:SetScript(\"OnEnter\", onButtonEnter)\n    b:SetScript(\"OnLeave\", onButtonLeave)\n    \n    aura_env.button = b\nend\n\n\n\n\n\n",
					["do_custom"] = true,
				},
				["start"] = {
				},
			},
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["anchorPoint"] = "CENTER",
			["animation"] = {
				["finish"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["start"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
			},
			["authorOptions"] = {
			},
			["auto"] = false,
			["color"] = {
				0.21960784313725, -- [1]
				0.21960784313725, -- [2]
				0.21960784313725, -- [3]
				0.48000001907349, -- [4]
			},
			["conditions"] = {
				{
					["changes"] = {
						{
							["property"] = "customcode",
							["value"] = {
								["custom"] = "aura_env.button:Enable()",
							},
						}, -- [1]
					},
					["check"] = {
						["trigger"] = 1,
						["value"] = 0,
						["variable"] = "show",
					},
				}, -- [1]
			},
			["config"] = {
			},
			["cooldown"] = false,
			["cooldownEdge"] = false,
			["cooldownSwipe"] = true,
			["cooldownTextDisabled"] = false,
			["customText"] = "\n",
			["desaturate"] = false,
			["displayIcon"] = "Interface\\Addons\\WeakAuras\\Media\\Textures\\Square_Smooth.tga",
			["frameStrata"] = 1,
			["height"] = 15,
			["icon"] = true,
			["iconSource"] = 0,
			["id"] = "MMN_Back_Button",
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["internalVersion"] = 45,
			["inverse"] = false,
			["keepAspectRatio"] = false,
			["load"] = {
				["class"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
				},
				["size"] = {
					["multi"] = {
						["party"] = true,
					},
					["single"] = "party",
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["use_never"] = false,
				["use_size"] = true,
				["use_zoneIds"] = true,
				["zoneIds"] = "1669",
			},
			["parent"] = "Mists Maze Navigator v2 by Omny",
			["preferToUpdate"] = false,
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["semver"] = "2.0.6",
			["subRegions"] = {
				{
					["anchorXOffset"] = 0,
					["anchorYOffset"] = 0,
					["rotateText"] = "NONE",
					["text_anchorPoint"] = "CENTER",
					["text_automaticWidth"] = "Auto",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_fixedWidth"] = 64,
					["text_font"] = "Expressway",
					["text_fontSize"] = 14,
					["text_fontType"] = "OUTLINE",
					["text_justify"] = "CENTER",
					["text_selfPoint"] = "AUTO",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_shadowXOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["text_text"] = "Back",
					["text_text_format_s_format"] = "none",
					["text_visible"] = true,
					["text_wordWrap"] = "WordWrap",
					["type"] = "subtext",
				}, -- [1]
				{
					["glow"] = false,
					["glowBorder"] = false,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["glowFrequency"] = 0.25,
					["glowLength"] = 10,
					["glowLines"] = 8,
					["glowScale"] = 1,
					["glowThickness"] = 1,
					["glowType"] = "buttonOverlay",
					["glowXOffset"] = 0,
					["glowYOffset"] = 0,
					["type"] = "subglow",
					["useGlowColor"] = false,
				}, -- [2]
				{
					["border_color"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["border_edge"] = "1 Pixel",
					["border_offset"] = 0,
					["border_size"] = 1,
					["border_visible"] = true,
					["type"] = "subborder",
				}, -- [3]
			},
			["tocversion"] = 90002,
			["triggers"] = {
				[1] = {
					["trigger"] = {
						["custom"] = "function(_,subEvent, ...)\n    \n    if(subEvent == \"Show\") then\n        return true \n    end\n    \n    return false\nend",
						["custom_hide"] = "custom",
						["custom_type"] = "event",
						["debuffType"] = "HELPFUL",
						["event"] = "Health",
						["events"] = "OmnyMazeV2",
						["names"] = {
						},
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "custom",
						["unit"] = "player",
					},
					["untrigger"] = {
						["custom"] = "function(_,subEvent, ...)\n    \n    if(subEvent==\"Reset\" or subEvent ==\"Hide\") then\n        \n        return true\n        \n    end\n    \n    return false\n    \nend",
					},
				},
				["activeTriggerMode"] = -10,
				["customTriggerLogic"] = "function(trigger)\n    return trigger[1]\nend",
				["disjunctive"] = "custom",
			},
			["uid"] = "DJQoF8ampL6",
			["url"] = "https://wago.io/XkZJuvlLH/17",
			["version"] = 17,
			["width"] = 73,
			["xOffset"] = -38.5,
			["yOffset"] = 100,
			["zoom"] = 0,
		},
		["MMN_Game_Button_Flower_Empty_Circle"] = {
			["actions"] = {
				["finish"] = {
				},
				["init"] = {
					["custom"] = "local types = {\"Flower\", \"Empty\", \"Circle\"}\naura_env.types = types\naura_env.selectGlow = false\naura_env.foundGlow = false\n\nif(not aura_env.button) then\n    local b = CreateFrame(\"Button\", \"WA_SnowBoom4\", WeakAuras.regions[aura_env.id].region)\n    b:SetAllPoints(WeakAuras.regions[aura_env.id].region)\n    \n    local function createHighlightTexture(self)\n        local texture = self:CreateTexture(nil, \"OVERLAY\")\n        self.highlight = texture\n        texture:SetTexture([[Interface\\QuestFrame\\UI-QuestLogTitleHighlight]])\n        texture:SetBlendMode(\"ADD\")\n        texture:SetAllPoints(self)\n        texture:SetAlpha(1)\n        return texture\n    end\n    \n    local function onButtonEnter(self)\n        if not self.highlight then\n            createHighlightTexture(self)\n        end\n        self.highlight:Show()\n    end\n    \n    local function onButtonLeave(self)\n        if self.highlight then\n            self.highlight:Hide()\n        end\n    end\n    \n    b:RegisterForClicks(\"LeftButtonDown\")\n    \n    b:SetScript(\"OnClick\", function()\n            WeakAuras.ScanEvents(\"OmnyMazeGame\",\"Clicked\", types)\n    end)\n    \n    b:SetScript(\"OnEnter\", onButtonEnter)\n    b:SetScript(\"OnLeave\", onButtonLeave)\n    \n    aura_env.button = b\nend\n\naura_env.checkTypes = function(types)\n    \n    local found = 0\n    \n    for _, myType in pairs(aura_env.types) do\n        for _, type in pairs(types) do\n            if(myType == type) then found = found +1 end \n        end\n    end\n    \n    return found == 3\nend\n\naura_env.found = function(found)\n    aura_env.foundGlow = found\nend\n\naura_env.select = function(select)\n    aura_env.selectGlow = select\nend\n\n\naura_env.update = function(color, active)\n    \n    aura_env.colorButton(color)\n    if(active)then\n        aura_env.button:Enable()\n    else\n        aura_env.button:Disable()\n    end\nend\n\naura_env.colorButton = function(color)\n    \n    local r,g,b,a = unpack(color)\n    \n    aura_env.region:SetAnimAlpha(a)\n    aura_env.region.Color(a, r, g, b)   \n    \nend",
					["do_custom"] = true,
				},
				["start"] = {
					["custom"] = "WeakAuras.ScanEvents(\"OmnyMazeGame\",\"showModel\", aura_env.types, aura_env.region)",
					["do_custom"] = true,
				},
			},
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["anchorPoint"] = "CENTER",
			["animation"] = {
				["finish"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["start"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
			},
			["authorOptions"] = {
			},
			["color"] = {
				0.22745098039216, -- [1]
				0.23529411764706, -- [2]
				0.23529411764706, -- [3]
				0.8500000089407, -- [4]
			},
			["conditions"] = {
				{
					["changes"] = {
						{
							["property"] = "sub.3.glow",
							["value"] = true,
						}, -- [1]
					},
					["check"] = {
						["trigger"] = -1,
						["value"] = "function(...)\n    if(aura_env and aura_env.foundGlow) then\n        return aura_env.foundGlow\n    end\n    return false\nend",
						["variable"] = "customcheck",
					},
					["linked"] = false,
				}, -- [1]
				{
					["changes"] = {
						{
							["property"] = "sub.2.glow",
							["value"] = true,
						}, -- [1]
					},
					["check"] = {
						["trigger"] = -1,
						["value"] = "function(...)\n    if(aura_env and aura_env.selectGlow) then\n        return aura_env.selectGlow\n    end\n    return false\nend",
						["variable"] = "customcheck",
					},
					["linked"] = false,
				}, -- [2]
			},
			["config"] = {
			},
			["cooldown"] = false,
			["cooldownEdge"] = false,
			["cooldownSwipe"] = true,
			["cooldownTextDisabled"] = false,
			["desaturate"] = false,
			["displayIcon"] = "Interface\\Addons\\WeakAuras\\Media\\Textures\\Square_Smooth.tga",
			["frameStrata"] = 1,
			["height"] = 50,
			["icon"] = true,
			["iconSource"] = 0,
			["id"] = "MMN_Game_Button_Flower_Empty_Circle",
			["information"] = {
			},
			["internalVersion"] = 45,
			["inverse"] = false,
			["keepAspectRatio"] = false,
			["load"] = {
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
						["party"] = true,
					},
					["single"] = "party",
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["use_never"] = false,
				["use_size"] = true,
				["use_zoneIds"] = true,
				["zoneIds"] = "1669",
			},
			["parent"] = "Mists Maze Navigator v2 by Omny",
			["preferToUpdate"] = false,
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["semver"] = "2.0.6",
			["subRegions"] = {
				{
					["anchorXOffset"] = 0,
					["anchorYOffset"] = 0,
					["rotateText"] = "NONE",
					["text_anchorPoint"] = "INNER_BOTTOMRIGHT",
					["text_automaticWidth"] = "Auto",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_fixedWidth"] = 64,
					["text_font"] = "Friz Quadrata TT",
					["text_fontSize"] = 12,
					["text_fontType"] = "OUTLINE",
					["text_justify"] = "CENTER",
					["text_selfPoint"] = "AUTO",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_shadowXOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["text_text"] = "",
					["text_text_format_s_format"] = "none",
					["text_visible"] = true,
					["text_wordWrap"] = "WordWrap",
					["type"] = "subtext",
				}, -- [1]
				{
					["glow"] = false,
					["glowBorder"] = true,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["glowFrequency"] = 0.2,
					["glowLength"] = 8,
					["glowLines"] = 8,
					["glowScale"] = 1,
					["glowThickness"] = 3,
					["glowType"] = "Pixel",
					["glowXOffset"] = -1,
					["glowYOffset"] = -1,
					["type"] = "subglow",
					["useGlowColor"] = true,
				}, -- [2]
				{
					["glow"] = false,
					["glowBorder"] = false,
					["glowColor"] = {
						0.2, -- [1]
						1, -- [2]
						0.15686274509804, -- [3]
						1, -- [4]
					},
					["glowFrequency"] = 0.25,
					["glowLength"] = 10,
					["glowLines"] = 8,
					["glowScale"] = 1,
					["glowThickness"] = 1,
					["glowType"] = "buttonOverlay",
					["glowXOffset"] = 0,
					["glowYOffset"] = 0,
					["type"] = "subglow",
					["useGlowColor"] = true,
				}, -- [3]
				{
					["border_color"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["border_edge"] = "1 Pixel",
					["border_offset"] = 0,
					["border_size"] = 2,
					["border_visible"] = true,
					["type"] = "subborder",
				}, -- [4]
			},
			["tocversion"] = 90002,
			["triggers"] = {
				[1] = {
					["trigger"] = {
						["check"] = "event",
						["custom"] = "function(event, subEvent, ...)\n    if(event ~= \"OmnyMazeV2\" and event ~=\"OmnyMazeGame\") then return end\n    if(subEvent == \"Start\" or subEvent == \"StartSymbol\") then\n        return true\n    end\n    \nend",
						["custom_hide"] = "custom",
						["custom_type"] = "event",
						["debuffType"] = "HELPFUL",
						["duration"] = "1",
						["event"] = "Conditions",
						["events"] = "OmnyMazeV2, OmnyMazeGame",
						["names"] = {
						},
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "custom",
						["unevent"] = "auto",
						["unit"] = "player",
						["use_absorbMode"] = true,
						["use_alwaystrue"] = true,
						["use_unit"] = true,
					},
					["untrigger"] = {
						["custom"] = "function(event, subEvent, ...)\n    if(subEvent==\"Reset\" or subEvent ==\"Hide\" or subEvent == \"HideSymbol\") then\n        \n        return true\n        \n    end\nend",
					},
				},
				[2] = {
					["trigger"] = {
						["check"] = "event",
						["custom"] = "function(event, subEvent, hit,types, ...)\n    if(event ~= \"OmnyMazeV2\"and event ~= \"OmnyMazeGame\") then return end\n    if(subEvent == \"GameButtonUpdate\")then\n        if(not types or not aura_env.checkTypes(types)==hit) then return end \n        local  color, active = ...\n        aura_env.update(color, active)\n    end\n    if(subEvent == \"Glow\")then\n        if(not types or not aura_env.checkTypes(types)==hit) then return end \n        local selectVal, foundVal = ...\n        aura_env.found(foundVal)\n        aura_env.select(selectVal)\n        return true\n    end\n    if(subEvent == \"Text\")then\n        if(not types or not aura_env.checkTypes(types)==hit)then return end\n        aura_env.region.subRegions[1].text:SetText(...)\n        return false\n    end\nend",
						["custom_hide"] = "timed",
						["custom_type"] = "event",
						["debuffType"] = "HELPFUL",
						["duration"] = "0",
						["dynamicDuration"] = false,
						["event"] = "Conditions",
						["events"] = "OmnyMazeV2, OmnyMazeGame",
						["names"] = {
						},
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "custom",
						["unevent"] = "auto",
						["unit"] = "player",
						["use_absorbMode"] = true,
						["use_alwaystrue"] = true,
						["use_unit"] = true,
					},
					["untrigger"] = {
						["custom"] = "function(event, subEvent, hit, types,...)\n    print(subEvent..\"killed\")\n    return false\nend",
					},
				},
				["activeTriggerMode"] = -10,
				["customTriggerLogic"] = "function(t)\n    return t[1]\nend",
				["disjunctive"] = "custom",
			},
			["uid"] = "HS)0NI(U2Bh",
			["url"] = "https://wago.io/XkZJuvlLH/17",
			["version"] = 17,
			["width"] = 50,
			["xOffset"] = -105,
			["yOffset"] = 83,
			["zoom"] = 0,
		},
		["MMN_Game_Button_Flower_Empty_NoCircle"] = {
			["actions"] = {
				["finish"] = {
				},
				["init"] = {
					["custom"] = "local types = {\"Flower\", \"Empty\", \"NoCircle\"}\naura_env.types = types\naura_env.selectGlow = false\naura_env.foundGlow = false\n\nif(not aura_env.button) then\n    local b = CreateFrame(\"Button\", \"WA_SnowBoom4\", WeakAuras.regions[aura_env.id].region)\n    b:SetAllPoints(WeakAuras.regions[aura_env.id].region)\n    \n    local function createHighlightTexture(self)\n        local texture = self:CreateTexture(nil, \"OVERLAY\")\n        self.highlight = texture\n        texture:SetTexture([[Interface\\QuestFrame\\UI-QuestLogTitleHighlight]])\n        texture:SetBlendMode(\"ADD\")\n        texture:SetAllPoints(self)\n        texture:SetAlpha(1)\n        return texture\n    end\n    \n    local function onButtonEnter(self)\n        if not self.highlight then\n            createHighlightTexture(self)\n        end\n        self.highlight:Show()\n    end\n    \n    local function onButtonLeave(self)\n        if self.highlight then\n            self.highlight:Hide()\n        end\n    end\n    \n    b:RegisterForClicks(\"LeftButtonDown\")\n    \n    b:SetScript(\"OnClick\", function()\n            WeakAuras.ScanEvents(\"OmnyMazeGame\",\"Clicked\", types)\n    end)\n    \n    b:SetScript(\"OnEnter\", onButtonEnter)\n    b:SetScript(\"OnLeave\", onButtonLeave)\n    \n    aura_env.button = b\nend\n\naura_env.checkTypes = function(types)\n    \n    local found = 0\n    \n    for _, myType in pairs(aura_env.types) do\n        for _, type in pairs(types) do\n            if(myType == type) then found = found +1 end \n        end\n    end\n    \n    return found == 3\nend\n\naura_env.found = function(found)\n    aura_env.foundGlow = found\nend\n\naura_env.select = function(select)\n    aura_env.selectGlow = select\nend\n\n\naura_env.update = function(color, active)\n    \n    aura_env.colorButton(color)\n    if(active)then\n        aura_env.button:Enable()\n    else\n        aura_env.button:Disable()\n    end\nend\n\naura_env.colorButton = function(color)\n    \n    local r,g,b,a = unpack(color)\n    \n    aura_env.region:SetAnimAlpha(a)\n    aura_env.region.Color(a, r, g, b)   \n    \nend",
					["do_custom"] = true,
				},
				["start"] = {
					["custom"] = "WeakAuras.ScanEvents(\"OmnyMazeGame\",\"showModel\", aura_env.types, aura_env.region)",
					["do_custom"] = true,
				},
			},
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["anchorPoint"] = "CENTER",
			["animation"] = {
				["finish"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["start"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
			},
			["authorOptions"] = {
			},
			["color"] = {
				0.22745098039216, -- [1]
				0.23529411764706, -- [2]
				0.23529411764706, -- [3]
				0.8500000089407, -- [4]
			},
			["conditions"] = {
				{
					["changes"] = {
						{
							["property"] = "sub.3.glow",
							["value"] = true,
						}, -- [1]
					},
					["check"] = {
						["trigger"] = -1,
						["value"] = "function(...)\n    if(aura_env and aura_env.foundGlow) then\n        return aura_env.foundGlow\n    end\n    return false\nend",
						["variable"] = "customcheck",
					},
					["linked"] = false,
				}, -- [1]
				{
					["changes"] = {
						{
							["property"] = "sub.2.glow",
							["value"] = true,
						}, -- [1]
					},
					["check"] = {
						["trigger"] = -1,
						["value"] = "function(...)\n    if(aura_env and aura_env.selectGlow) then\n        return aura_env.selectGlow\n    end\n    return false\nend",
						["variable"] = "customcheck",
					},
					["linked"] = false,
				}, -- [2]
			},
			["config"] = {
			},
			["cooldown"] = false,
			["cooldownEdge"] = false,
			["cooldownSwipe"] = true,
			["cooldownTextDisabled"] = false,
			["desaturate"] = false,
			["displayIcon"] = "Interface\\Addons\\WeakAuras\\Media\\Textures\\Square_Smooth.tga",
			["frameStrata"] = 1,
			["height"] = 50,
			["icon"] = true,
			["iconSource"] = 0,
			["id"] = "MMN_Game_Button_Flower_Empty_NoCircle",
			["information"] = {
			},
			["internalVersion"] = 45,
			["inverse"] = false,
			["keepAspectRatio"] = false,
			["load"] = {
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
						["party"] = true,
					},
					["single"] = "party",
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["use_never"] = false,
				["use_size"] = true,
				["use_zoneIds"] = true,
				["zoneIds"] = "1669",
			},
			["parent"] = "Mists Maze Navigator v2 by Omny",
			["preferToUpdate"] = false,
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["semver"] = "2.0.6",
			["subRegions"] = {
				{
					["anchorXOffset"] = 0,
					["anchorYOffset"] = 0,
					["rotateText"] = "NONE",
					["text_anchorPoint"] = "INNER_BOTTOMRIGHT",
					["text_automaticWidth"] = "Auto",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_fixedWidth"] = 64,
					["text_font"] = "Friz Quadrata TT",
					["text_fontSize"] = 12,
					["text_fontType"] = "OUTLINE",
					["text_justify"] = "CENTER",
					["text_selfPoint"] = "AUTO",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_shadowXOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["text_text"] = "",
					["text_text_format_s_format"] = "none",
					["text_visible"] = true,
					["text_wordWrap"] = "WordWrap",
					["type"] = "subtext",
				}, -- [1]
				{
					["glow"] = false,
					["glowBorder"] = true,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["glowFrequency"] = 0.2,
					["glowLength"] = 8,
					["glowLines"] = 8,
					["glowScale"] = 1,
					["glowThickness"] = 3,
					["glowType"] = "Pixel",
					["glowXOffset"] = -1,
					["glowYOffset"] = -1,
					["type"] = "subglow",
					["useGlowColor"] = true,
				}, -- [2]
				{
					["glow"] = false,
					["glowBorder"] = false,
					["glowColor"] = {
						0.2, -- [1]
						1, -- [2]
						0.15686274509804, -- [3]
						1, -- [4]
					},
					["glowFrequency"] = 0.25,
					["glowLength"] = 10,
					["glowLines"] = 8,
					["glowScale"] = 1,
					["glowThickness"] = 1,
					["glowType"] = "buttonOverlay",
					["glowXOffset"] = 0,
					["glowYOffset"] = 0,
					["type"] = "subglow",
					["useGlowColor"] = true,
				}, -- [3]
				{
					["border_color"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["border_edge"] = "1 Pixel",
					["border_offset"] = 0,
					["border_size"] = 2,
					["border_visible"] = true,
					["type"] = "subborder",
				}, -- [4]
			},
			["tocversion"] = 90002,
			["triggers"] = {
				[1] = {
					["trigger"] = {
						["check"] = "event",
						["custom"] = "function(event, subEvent, ...)\n    if(event ~= \"OmnyMazeV2\" and event ~=\"OmnyMazeGame\") then return end\n    if(subEvent == \"Start\" or subEvent == \"StartSymbol\") then\n        return true\n    end\n    \nend",
						["custom_hide"] = "custom",
						["custom_type"] = "event",
						["debuffType"] = "HELPFUL",
						["duration"] = "1",
						["event"] = "Conditions",
						["events"] = "OmnyMazeV2, OmnyMazeGame",
						["names"] = {
						},
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "custom",
						["unevent"] = "auto",
						["unit"] = "player",
						["use_absorbMode"] = true,
						["use_alwaystrue"] = true,
						["use_unit"] = true,
					},
					["untrigger"] = {
						["custom"] = "function(event, subEvent, ...)\n    if(subEvent==\"Reset\" or subEvent ==\"Hide\" or subEvent == \"HideSymbol\") then\n        \n        return true\n        \n    end\nend",
					},
				},
				[2] = {
					["trigger"] = {
						["check"] = "event",
						["custom"] = "function(event, subEvent, hit,types, ...)\n    if(event ~= \"OmnyMazeV2\"and event ~= \"OmnyMazeGame\") then return end\n    if(subEvent == \"GameButtonUpdate\")then\n        if(not types or not aura_env.checkTypes(types)==hit) then return end \n        local  color, active = ...\n        aura_env.update(color, active)\n    end\n    if(subEvent == \"Glow\")then\n        if(not types or not aura_env.checkTypes(types)==hit) then return end \n        local selectVal, foundVal = ...\n        aura_env.found(foundVal)\n        aura_env.select(selectVal)\n        return true\n    end\n    if(subEvent == \"Text\")then\n        if(not types or not aura_env.checkTypes(types)==hit)then return end\n        aura_env.region.subRegions[1].text:SetText(...)\n        return false\n    end\nend",
						["custom_hide"] = "timed",
						["custom_type"] = "event",
						["debuffType"] = "HELPFUL",
						["duration"] = "0",
						["dynamicDuration"] = false,
						["event"] = "Conditions",
						["events"] = "OmnyMazeV2, OmnyMazeGame",
						["names"] = {
						},
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "custom",
						["unevent"] = "auto",
						["unit"] = "player",
						["use_absorbMode"] = true,
						["use_alwaystrue"] = true,
						["use_unit"] = true,
					},
					["untrigger"] = {
						["custom"] = "function(event, subEvent, hit, types,...)\n    print(subEvent..\"killed\")\n    return false\nend",
					},
				},
				["activeTriggerMode"] = -10,
				["customTriggerLogic"] = "function(t)\n    return t[1]\nend",
				["disjunctive"] = "custom",
			},
			["uid"] = "SxiAychz71j",
			["url"] = "https://wago.io/XkZJuvlLH/17",
			["version"] = 17,
			["width"] = 50,
			["xOffset"] = -158,
			["yOffset"] = 83,
			["zoom"] = 0,
		},
		["MMN_Game_Button_Flower_Full_Circle"] = {
			["actions"] = {
				["finish"] = {
				},
				["init"] = {
					["custom"] = "local types = {\"Flower\", \"Full\", \"Circle\"}\naura_env.types = types\naura_env.selectGlow = false\naura_env.foundGlow = false\n\nif(not aura_env.button) then\n    local b = CreateFrame(\"Button\", \"WA_SnowBoom4\", WeakAuras.regions[aura_env.id].region)\n    b:SetAllPoints(WeakAuras.regions[aura_env.id].region)\n    \n    local function createHighlightTexture(self)\n        local texture = self:CreateTexture(nil, \"OVERLAY\")\n        self.highlight = texture\n        texture:SetTexture([[Interface\\QuestFrame\\UI-QuestLogTitleHighlight]])\n        texture:SetBlendMode(\"ADD\")\n        texture:SetAllPoints(self)\n        texture:SetAlpha(1)\n        return texture\n    end\n    \n    local function onButtonEnter(self)\n        if not self.highlight then\n            createHighlightTexture(self)\n        end\n        self.highlight:Show()\n    end\n    \n    local function onButtonLeave(self)\n        if self.highlight then\n            self.highlight:Hide()\n        end\n    end\n    \n    b:RegisterForClicks(\"LeftButtonDown\")\n    \n    b:SetScript(\"OnClick\", function()\n            WeakAuras.ScanEvents(\"OmnyMazeGame\",\"Clicked\", types)\n    end)\n    \n    b:SetScript(\"OnEnter\", onButtonEnter)\n    b:SetScript(\"OnLeave\", onButtonLeave)\n    \n    aura_env.button = b\nend\n\naura_env.checkTypes = function(types)\n    \n    local found = 0\n    \n    for _, myType in pairs(aura_env.types) do\n        for _, type in pairs(types) do\n            if(myType == type) then found = found +1 end \n        end\n    end\n    \n    return found == 3\nend\n\naura_env.found = function(found)\n    aura_env.foundGlow = found\nend\n\naura_env.select = function(select)\n    aura_env.selectGlow = select\nend\n\n\naura_env.update = function(color, active)\n    \n    aura_env.colorButton(color)\n    if(active)then\n        aura_env.button:Enable()\n    else\n        aura_env.button:Disable()\n    end\nend\n\naura_env.colorButton = function(color)\n    \n    local r,g,b,a = unpack(color)\n    \n    aura_env.region:SetAnimAlpha(a)\n    aura_env.region.Color(a, r, g, b)   \n    \nend",
					["do_custom"] = true,
				},
				["start"] = {
					["custom"] = "WeakAuras.ScanEvents(\"OmnyMazeGame\",\"showModel\", aura_env.types, aura_env.region)",
					["do_custom"] = true,
				},
			},
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["anchorPoint"] = "CENTER",
			["animation"] = {
				["finish"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["start"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
			},
			["authorOptions"] = {
			},
			["color"] = {
				0.22745098039216, -- [1]
				0.23529411764706, -- [2]
				0.23529411764706, -- [3]
				0.8500000089407, -- [4]
			},
			["conditions"] = {
				{
					["changes"] = {
						{
							["property"] = "sub.3.glow",
							["value"] = true,
						}, -- [1]
					},
					["check"] = {
						["trigger"] = -1,
						["value"] = "function(...)\n    if(aura_env and aura_env.foundGlow) then\n        return aura_env.foundGlow\n    end\n    return false\nend",
						["variable"] = "customcheck",
					},
					["linked"] = false,
				}, -- [1]
				{
					["changes"] = {
						{
							["property"] = "sub.2.glow",
							["value"] = true,
						}, -- [1]
					},
					["check"] = {
						["trigger"] = -1,
						["value"] = "function(...)\n    if(aura_env and aura_env.selectGlow) then\n        return aura_env.selectGlow\n    end\n    return false\nend",
						["variable"] = "customcheck",
					},
					["linked"] = false,
				}, -- [2]
			},
			["config"] = {
			},
			["cooldown"] = false,
			["cooldownEdge"] = false,
			["cooldownSwipe"] = true,
			["cooldownTextDisabled"] = false,
			["desaturate"] = false,
			["displayIcon"] = "Interface\\Addons\\WeakAuras\\Media\\Textures\\Square_Smooth.tga",
			["frameStrata"] = 1,
			["height"] = 50,
			["icon"] = true,
			["iconSource"] = 0,
			["id"] = "MMN_Game_Button_Flower_Full_Circle",
			["information"] = {
			},
			["internalVersion"] = 45,
			["inverse"] = false,
			["keepAspectRatio"] = false,
			["load"] = {
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
						["party"] = true,
					},
					["single"] = "party",
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["use_never"] = false,
				["use_size"] = true,
				["use_zoneIds"] = true,
				["zoneIds"] = "1669",
			},
			["parent"] = "Mists Maze Navigator v2 by Omny",
			["preferToUpdate"] = false,
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["semver"] = "2.0.6",
			["subRegions"] = {
				{
					["anchorXOffset"] = 0,
					["anchorYOffset"] = 0,
					["rotateText"] = "NONE",
					["text_anchorPoint"] = "INNER_BOTTOMRIGHT",
					["text_automaticWidth"] = "Auto",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_fixedWidth"] = 64,
					["text_font"] = "Friz Quadrata TT",
					["text_fontSize"] = 12,
					["text_fontType"] = "OUTLINE",
					["text_justify"] = "CENTER",
					["text_selfPoint"] = "AUTO",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_shadowXOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["text_text"] = "",
					["text_text_format_s_format"] = "none",
					["text_visible"] = true,
					["text_wordWrap"] = "WordWrap",
					["type"] = "subtext",
				}, -- [1]
				{
					["glow"] = false,
					["glowBorder"] = true,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["glowFrequency"] = 0.2,
					["glowLength"] = 8,
					["glowLines"] = 8,
					["glowScale"] = 1,
					["glowThickness"] = 3,
					["glowType"] = "Pixel",
					["glowXOffset"] = -1,
					["glowYOffset"] = -1,
					["type"] = "subglow",
					["useGlowColor"] = true,
				}, -- [2]
				{
					["glow"] = false,
					["glowBorder"] = false,
					["glowColor"] = {
						0.2, -- [1]
						1, -- [2]
						0.15686274509804, -- [3]
						1, -- [4]
					},
					["glowFrequency"] = 0.25,
					["glowLength"] = 10,
					["glowLines"] = 8,
					["glowScale"] = 1,
					["glowThickness"] = 1,
					["glowType"] = "buttonOverlay",
					["glowXOffset"] = 0,
					["glowYOffset"] = 0,
					["type"] = "subglow",
					["useGlowColor"] = true,
				}, -- [3]
				{
					["border_color"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["border_edge"] = "1 Pixel",
					["border_offset"] = 0,
					["border_size"] = 2,
					["border_visible"] = true,
					["type"] = "subborder",
				}, -- [4]
			},
			["tocversion"] = 90002,
			["triggers"] = {
				[1] = {
					["trigger"] = {
						["check"] = "event",
						["custom"] = "function(event, subEvent, ...)\n    if(event ~= \"OmnyMazeV2\" and event ~=\"OmnyMazeGame\") then return end\n    if(subEvent == \"Start\" or subEvent == \"StartSymbol\") then\n        return true\n    end\n    \nend",
						["custom_hide"] = "custom",
						["custom_type"] = "event",
						["debuffType"] = "HELPFUL",
						["duration"] = "1",
						["event"] = "Conditions",
						["events"] = "OmnyMazeV2, OmnyMazeGame",
						["names"] = {
						},
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "custom",
						["unevent"] = "auto",
						["unit"] = "player",
						["use_absorbMode"] = true,
						["use_alwaystrue"] = true,
						["use_unit"] = true,
					},
					["untrigger"] = {
						["custom"] = "function(event, subEvent, ...)\n    if(subEvent==\"Reset\" or subEvent ==\"Hide\" or subEvent == \"HideSymbol\") then\n        \n        return true\n        \n    end\nend",
					},
				},
				[2] = {
					["trigger"] = {
						["check"] = "event",
						["custom"] = "function(event, subEvent, hit,types, ...)\n    if(event ~= \"OmnyMazeV2\"and event ~= \"OmnyMazeGame\") then return end\n    if(subEvent == \"GameButtonUpdate\")then\n        if(not types or not aura_env.checkTypes(types)==hit) then return end \n        local  color, active = ...\n        aura_env.update(color, active)\n    end\n    if(subEvent == \"Glow\")then\n        if(not types or not aura_env.checkTypes(types)==hit) then return end \n        local selectVal, foundVal = ...\n        aura_env.found(foundVal)\n        aura_env.select(selectVal)\n        return true\n    end\n    if(subEvent == \"Text\")then\n        if(not types or not aura_env.checkTypes(types)==hit)then return end\n        aura_env.region.subRegions[1].text:SetText(...)\n        return false\n    end\nend",
						["custom_hide"] = "timed",
						["custom_type"] = "event",
						["debuffType"] = "HELPFUL",
						["duration"] = "0",
						["dynamicDuration"] = false,
						["event"] = "Conditions",
						["events"] = "OmnyMazeV2, OmnyMazeGame",
						["names"] = {
						},
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "custom",
						["unevent"] = "auto",
						["unit"] = "player",
						["use_absorbMode"] = true,
						["use_alwaystrue"] = true,
						["use_unit"] = true,
					},
					["untrigger"] = {
						["custom"] = "function(event, subEvent, hit, types,...)\n    print(subEvent..\"killed\")\n    return false\nend",
					},
				},
				["activeTriggerMode"] = -10,
				["customTriggerLogic"] = "function(t)\n    return t[1]\nend",
				["disjunctive"] = "custom",
			},
			["uid"] = "qHf4ZgQqx()",
			["url"] = "https://wago.io/XkZJuvlLH/17",
			["version"] = 17,
			["width"] = 50,
			["xOffset"] = -105,
			["yOffset"] = 32,
			["zoom"] = 0,
		},
		["MMN_Game_Button_Flower_Full_NoCircle"] = {
			["actions"] = {
				["finish"] = {
				},
				["init"] = {
					["custom"] = "local types = {\"Flower\", \"Full\", \"NoCircle\"}\naura_env.types = types\naura_env.selectGlow = false\naura_env.foundGlow = false\n\nif(not aura_env.button) then\n    local b = CreateFrame(\"Button\", \"WA_SnowBoom4\", WeakAuras.regions[aura_env.id].region)\n    b:SetAllPoints(WeakAuras.regions[aura_env.id].region)\n    \n    local function createHighlightTexture(self)\n        local texture = self:CreateTexture(nil, \"OVERLAY\")\n        self.highlight = texture\n        texture:SetTexture([[Interface\\QuestFrame\\UI-QuestLogTitleHighlight]])\n        texture:SetBlendMode(\"ADD\")\n        texture:SetAllPoints(self)\n        texture:SetAlpha(1)\n        return texture\n    end\n    \n    local function onButtonEnter(self)\n        if not self.highlight then\n            createHighlightTexture(self)\n        end\n        self.highlight:Show()\n    end\n    \n    local function onButtonLeave(self)\n        if self.highlight then\n            self.highlight:Hide()\n        end\n    end\n    \n    b:RegisterForClicks(\"LeftButtonDown\")\n    \n    b:SetScript(\"OnClick\", function()\n            WeakAuras.ScanEvents(\"OmnyMazeGame\",\"Clicked\", types)\n    end)\n    \n    b:SetScript(\"OnEnter\", onButtonEnter)\n    b:SetScript(\"OnLeave\", onButtonLeave)\n    \n    aura_env.button = b\nend\n\naura_env.checkTypes = function(types)\n    \n    local found = 0\n    \n    for _, myType in pairs(aura_env.types) do\n        for _, type in pairs(types) do\n            if(myType == type) then found = found +1 end \n        end\n    end\n    \n    return found == 3\nend\n\naura_env.found = function(found)\n    aura_env.foundGlow = found\nend\n\naura_env.select = function(select)\n    aura_env.selectGlow = select\nend\n\n\naura_env.update = function(color, active)\n    \n    aura_env.colorButton(color)\n    if(active)then\n        aura_env.button:Enable()\n    else\n        aura_env.button:Disable()\n    end\nend\n\naura_env.colorButton = function(color)\n    \n    local r,g,b,a = unpack(color)\n    \n    aura_env.region:SetAnimAlpha(a)\n    aura_env.region.Color(a, r, g, b)   \n    \nend",
					["do_custom"] = true,
				},
				["start"] = {
					["custom"] = "WeakAuras.ScanEvents(\"OmnyMazeGame\",\"showModel\", aura_env.types, aura_env.region)",
					["do_custom"] = true,
				},
			},
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["anchorPoint"] = "CENTER",
			["animation"] = {
				["finish"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["start"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
			},
			["authorOptions"] = {
			},
			["color"] = {
				0.22745098039216, -- [1]
				0.23529411764706, -- [2]
				0.23529411764706, -- [3]
				0.8500000089407, -- [4]
			},
			["conditions"] = {
				{
					["changes"] = {
						{
							["property"] = "sub.3.glow",
							["value"] = true,
						}, -- [1]
					},
					["check"] = {
						["trigger"] = -1,
						["value"] = "function(...)\n    if(aura_env and aura_env.foundGlow) then\n        return aura_env.foundGlow\n    end\n    return false\nend",
						["variable"] = "customcheck",
					},
					["linked"] = false,
				}, -- [1]
				{
					["changes"] = {
						{
							["property"] = "sub.2.glow",
							["value"] = true,
						}, -- [1]
					},
					["check"] = {
						["trigger"] = -1,
						["value"] = "function(...)\n    if(aura_env and aura_env.selectGlow) then\n        return aura_env.selectGlow\n    end\n    return false\nend",
						["variable"] = "customcheck",
					},
					["linked"] = false,
				}, -- [2]
			},
			["config"] = {
			},
			["cooldown"] = false,
			["cooldownEdge"] = false,
			["cooldownSwipe"] = true,
			["cooldownTextDisabled"] = false,
			["desaturate"] = false,
			["displayIcon"] = "Interface\\Addons\\WeakAuras\\Media\\Textures\\Square_Smooth.tga",
			["frameStrata"] = 1,
			["height"] = 50,
			["icon"] = true,
			["iconSource"] = 0,
			["id"] = "MMN_Game_Button_Flower_Full_NoCircle",
			["information"] = {
			},
			["internalVersion"] = 45,
			["inverse"] = false,
			["keepAspectRatio"] = false,
			["load"] = {
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
						["party"] = true,
					},
					["single"] = "party",
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["use_never"] = false,
				["use_size"] = true,
				["use_zoneIds"] = true,
				["zoneIds"] = "1669",
			},
			["parent"] = "Mists Maze Navigator v2 by Omny",
			["preferToUpdate"] = false,
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["semver"] = "2.0.6",
			["subRegions"] = {
				{
					["anchorXOffset"] = 0,
					["anchorYOffset"] = 0,
					["rotateText"] = "NONE",
					["text_anchorPoint"] = "INNER_BOTTOMRIGHT",
					["text_automaticWidth"] = "Auto",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_fixedWidth"] = 64,
					["text_font"] = "Friz Quadrata TT",
					["text_fontSize"] = 12,
					["text_fontType"] = "OUTLINE",
					["text_justify"] = "CENTER",
					["text_selfPoint"] = "AUTO",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_shadowXOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["text_text"] = "",
					["text_text_format_s_format"] = "none",
					["text_visible"] = true,
					["text_wordWrap"] = "WordWrap",
					["type"] = "subtext",
				}, -- [1]
				{
					["glow"] = false,
					["glowBorder"] = true,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["glowFrequency"] = 0.2,
					["glowLength"] = 8,
					["glowLines"] = 8,
					["glowScale"] = 1,
					["glowThickness"] = 3,
					["glowType"] = "Pixel",
					["glowXOffset"] = -1,
					["glowYOffset"] = -1,
					["type"] = "subglow",
					["useGlowColor"] = true,
				}, -- [2]
				{
					["glow"] = false,
					["glowBorder"] = false,
					["glowColor"] = {
						0.2, -- [1]
						1, -- [2]
						0.15686274509804, -- [3]
						1, -- [4]
					},
					["glowFrequency"] = 0.25,
					["glowLength"] = 10,
					["glowLines"] = 8,
					["glowScale"] = 1,
					["glowThickness"] = 1,
					["glowType"] = "buttonOverlay",
					["glowXOffset"] = 0,
					["glowYOffset"] = 0,
					["type"] = "subglow",
					["useGlowColor"] = true,
				}, -- [3]
				{
					["border_color"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["border_edge"] = "1 Pixel",
					["border_offset"] = 0,
					["border_size"] = 2,
					["border_visible"] = true,
					["type"] = "subborder",
				}, -- [4]
			},
			["tocversion"] = 90002,
			["triggers"] = {
				[1] = {
					["trigger"] = {
						["check"] = "event",
						["custom"] = "function(event, subEvent, ...)\n    if(event ~= \"OmnyMazeV2\" and event ~=\"OmnyMazeGame\") then return end\n    if(subEvent == \"Start\" or subEvent == \"StartSymbol\") then\n        return true\n    end\n    \nend",
						["custom_hide"] = "custom",
						["custom_type"] = "event",
						["debuffType"] = "HELPFUL",
						["duration"] = "1",
						["event"] = "Conditions",
						["events"] = "OmnyMazeV2, OmnyMazeGame",
						["names"] = {
						},
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "custom",
						["unevent"] = "auto",
						["unit"] = "player",
						["use_absorbMode"] = true,
						["use_alwaystrue"] = true,
						["use_unit"] = true,
					},
					["untrigger"] = {
						["custom"] = "function(event, subEvent, ...)\n    if(subEvent==\"Reset\" or subEvent ==\"Hide\" or subEvent == \"HideSymbol\") then\n        \n        return true\n        \n    end\nend",
					},
				},
				[2] = {
					["trigger"] = {
						["check"] = "event",
						["custom"] = "function(event, subEvent, hit,types, ...)\n    if(event ~= \"OmnyMazeV2\"and event ~= \"OmnyMazeGame\") then return end\n    if(subEvent == \"GameButtonUpdate\")then\n        if(not types or not aura_env.checkTypes(types)==hit) then return end \n        local  color, active = ...\n        aura_env.update(color, active)\n    end\n    if(subEvent == \"Glow\")then\n        if(not types or not aura_env.checkTypes(types)==hit) then return end \n        local selectVal, foundVal = ...\n        aura_env.found(foundVal)\n        aura_env.select(selectVal)\n        return true\n    end\n    if(subEvent == \"Text\")then\n        if(not types or not aura_env.checkTypes(types)==hit)then return end\n        aura_env.region.subRegions[1].text:SetText(...)\n        return false\n    end\nend",
						["custom_hide"] = "timed",
						["custom_type"] = "event",
						["debuffType"] = "HELPFUL",
						["duration"] = "0",
						["dynamicDuration"] = false,
						["event"] = "Conditions",
						["events"] = "OmnyMazeV2, OmnyMazeGame",
						["names"] = {
						},
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "custom",
						["unevent"] = "auto",
						["unit"] = "player",
						["use_absorbMode"] = true,
						["use_alwaystrue"] = true,
						["use_unit"] = true,
					},
					["untrigger"] = {
						["custom"] = "function(event, subEvent, hit, types,...)\n    print(subEvent..\"killed\")\n    return false\nend",
					},
				},
				["activeTriggerMode"] = -10,
				["customTriggerLogic"] = "function(t)\n    return t[1]\nend",
				["disjunctive"] = "custom",
			},
			["uid"] = "Lv)zozEtBEU",
			["url"] = "https://wago.io/XkZJuvlLH/17",
			["version"] = 17,
			["width"] = 50,
			["xOffset"] = -158,
			["yOffset"] = 32,
			["zoom"] = 0,
		},
		["MMN_Game_Button_Leaf_Empty_Circle"] = {
			["actions"] = {
				["finish"] = {
				},
				["init"] = {
					["custom"] = "local types = {\"Leaf\", \"Empty\", \"Circle\"}\naura_env.types = types\naura_env.selectGlow = false\naura_env.foundGlow = false\n\nif(not aura_env.button) then\n    local b = CreateFrame(\"Button\", \"WA_SnowBoom4\", WeakAuras.regions[aura_env.id].region)\n    b:SetAllPoints(WeakAuras.regions[aura_env.id].region)\n    \n    local function createHighlightTexture(self)\n        local texture = self:CreateTexture(nil, \"OVERLAY\")\n        self.highlight = texture\n        texture:SetTexture([[Interface\\QuestFrame\\UI-QuestLogTitleHighlight]])\n        texture:SetBlendMode(\"ADD\")\n        texture:SetAllPoints(self)\n        texture:SetAlpha(1)\n        return texture\n    end\n    \n    local function onButtonEnter(self)\n        if not self.highlight then\n            createHighlightTexture(self)\n        end\n        self.highlight:Show()\n    end\n    \n    local function onButtonLeave(self)\n        if self.highlight then\n            self.highlight:Hide()\n        end\n    end\n    \n    b:RegisterForClicks(\"LeftButtonDown\")\n    \n    b:SetScript(\"OnClick\", function()\n            WeakAuras.ScanEvents(\"OmnyMazeGame\",\"Clicked\", types)\n    end)\n    \n    b:SetScript(\"OnEnter\", onButtonEnter)\n    b:SetScript(\"OnLeave\", onButtonLeave)\n    \n    aura_env.button = b\nend\n\naura_env.checkTypes = function(types)\n    \n    local found = 0\n    \n    for _, myType in pairs(aura_env.types) do\n        for _, type in pairs(types) do\n            if(myType == type) then found = found +1 end \n        end\n    end\n    \n    return found == 3\nend\n\naura_env.found = function(found)\n    aura_env.foundGlow = found\nend\n\naura_env.select = function(select)\n    aura_env.selectGlow = select\nend\n\n\naura_env.update = function(color, active)\n    \n    aura_env.colorButton(color)\n    if(active)then\n        aura_env.button:Enable()\n    else\n        aura_env.button:Disable()\n    end\nend\n\naura_env.colorButton = function(color)\n    \n    local r,g,b,a = unpack(color)\n    \n    aura_env.region:SetAnimAlpha(a)\n    aura_env.region.Color(a, r, g, b)   \n    \nend",
					["do_custom"] = true,
				},
				["start"] = {
					["custom"] = "WeakAuras.ScanEvents(\"OmnyMazeGame\",\"showModel\", aura_env.types, aura_env.region)",
					["do_custom"] = true,
				},
			},
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["anchorPoint"] = "CENTER",
			["animation"] = {
				["finish"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["start"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
			},
			["authorOptions"] = {
			},
			["color"] = {
				0.22745098039216, -- [1]
				0.23529411764706, -- [2]
				0.23529411764706, -- [3]
				0.8500000089407, -- [4]
			},
			["conditions"] = {
				{
					["changes"] = {
						{
							["property"] = "sub.3.glow",
							["value"] = true,
						}, -- [1]
					},
					["check"] = {
						["trigger"] = -1,
						["value"] = "function(...)\n    if(aura_env and aura_env.foundGlow) then\n        return aura_env.foundGlow\n    end\n    return false\nend",
						["variable"] = "customcheck",
					},
					["linked"] = false,
				}, -- [1]
				{
					["changes"] = {
						{
							["property"] = "sub.2.glow",
							["value"] = true,
						}, -- [1]
					},
					["check"] = {
						["trigger"] = -1,
						["value"] = "function(...)\n    if(aura_env and aura_env.selectGlow) then\n        return aura_env.selectGlow\n    end\n    return false\nend",
						["variable"] = "customcheck",
					},
					["linked"] = false,
				}, -- [2]
			},
			["config"] = {
			},
			["cooldown"] = false,
			["cooldownEdge"] = false,
			["cooldownSwipe"] = true,
			["cooldownTextDisabled"] = false,
			["desaturate"] = false,
			["displayIcon"] = "Interface\\Addons\\WeakAuras\\Media\\Textures\\Square_Smooth.tga",
			["frameStrata"] = 1,
			["height"] = 50,
			["icon"] = true,
			["iconSource"] = 0,
			["id"] = "MMN_Game_Button_Leaf_Empty_Circle",
			["information"] = {
			},
			["internalVersion"] = 45,
			["inverse"] = false,
			["keepAspectRatio"] = false,
			["load"] = {
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
						["party"] = true,
					},
					["single"] = "party",
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["use_never"] = false,
				["use_size"] = true,
				["use_zoneIds"] = true,
				["zoneIds"] = "1669",
			},
			["parent"] = "Mists Maze Navigator v2 by Omny",
			["preferToUpdate"] = false,
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["semver"] = "2.0.6",
			["subRegions"] = {
				{
					["anchorXOffset"] = 0,
					["anchorYOffset"] = 0,
					["rotateText"] = "NONE",
					["text_anchorPoint"] = "INNER_BOTTOMRIGHT",
					["text_automaticWidth"] = "Auto",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_fixedWidth"] = 64,
					["text_font"] = "Friz Quadrata TT",
					["text_fontSize"] = 12,
					["text_fontType"] = "OUTLINE",
					["text_justify"] = "CENTER",
					["text_selfPoint"] = "AUTO",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_shadowXOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["text_text"] = "",
					["text_text_format_s_format"] = "none",
					["text_visible"] = true,
					["text_wordWrap"] = "WordWrap",
					["type"] = "subtext",
				}, -- [1]
				{
					["glow"] = false,
					["glowBorder"] = true,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["glowFrequency"] = 0.2,
					["glowLength"] = 8,
					["glowLines"] = 8,
					["glowScale"] = 1,
					["glowThickness"] = 3,
					["glowType"] = "Pixel",
					["glowXOffset"] = -1,
					["glowYOffset"] = -1,
					["type"] = "subglow",
					["useGlowColor"] = true,
				}, -- [2]
				{
					["glow"] = false,
					["glowBorder"] = false,
					["glowColor"] = {
						0.2, -- [1]
						1, -- [2]
						0.15686274509804, -- [3]
						1, -- [4]
					},
					["glowFrequency"] = 0.25,
					["glowLength"] = 10,
					["glowLines"] = 8,
					["glowScale"] = 1,
					["glowThickness"] = 1,
					["glowType"] = "buttonOverlay",
					["glowXOffset"] = 0,
					["glowYOffset"] = 0,
					["type"] = "subglow",
					["useGlowColor"] = true,
				}, -- [3]
				{
					["border_color"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["border_edge"] = "1 Pixel",
					["border_offset"] = 0,
					["border_size"] = 2,
					["border_visible"] = true,
					["type"] = "subborder",
				}, -- [4]
			},
			["tocversion"] = 90002,
			["triggers"] = {
				[1] = {
					["trigger"] = {
						["check"] = "event",
						["custom"] = "function(event, subEvent, ...)\n    if(event ~= \"OmnyMazeV2\" and event ~=\"OmnyMazeGame\") then return end\n    if(subEvent == \"Start\" or subEvent == \"StartSymbol\") then\n        return true\n    end\n    \nend",
						["custom_hide"] = "custom",
						["custom_type"] = "event",
						["debuffType"] = "HELPFUL",
						["duration"] = "1",
						["event"] = "Conditions",
						["events"] = "OmnyMazeV2, OmnyMazeGame",
						["names"] = {
						},
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "custom",
						["unevent"] = "auto",
						["unit"] = "player",
						["use_absorbMode"] = true,
						["use_alwaystrue"] = true,
						["use_unit"] = true,
					},
					["untrigger"] = {
						["custom"] = "function(event, subEvent, ...)\n    if(subEvent==\"Reset\" or subEvent ==\"Hide\" or subEvent == \"HideSymbol\") then\n        \n        return true\n        \n    end\nend",
					},
				},
				[2] = {
					["trigger"] = {
						["check"] = "event",
						["custom"] = "function(event, subEvent, hit,types, ...)\n    if(event ~= \"OmnyMazeV2\"and event ~= \"OmnyMazeGame\") then return end\n    if(subEvent == \"GameButtonUpdate\")then\n        if(not types or not aura_env.checkTypes(types)==hit) then return end \n        local  color, active = ...\n        aura_env.update(color, active)\n    end\n    if(subEvent == \"Glow\")then\n        if(not types or not aura_env.checkTypes(types)==hit) then return end \n        local selectVal, foundVal = ...\n        aura_env.found(foundVal)\n        aura_env.select(selectVal)\n        return true\n    end\n    if(subEvent == \"Text\")then\n        if(not types or not aura_env.checkTypes(types)==hit)then return end\n        aura_env.region.subRegions[1].text:SetText(...)\n        return false\n    end\nend",
						["custom_hide"] = "timed",
						["custom_type"] = "event",
						["debuffType"] = "HELPFUL",
						["duration"] = "0",
						["dynamicDuration"] = false,
						["event"] = "Conditions",
						["events"] = "OmnyMazeV2, OmnyMazeGame",
						["names"] = {
						},
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "custom",
						["unevent"] = "auto",
						["unit"] = "player",
						["use_absorbMode"] = true,
						["use_alwaystrue"] = true,
						["use_unit"] = true,
					},
					["untrigger"] = {
						["custom"] = "function(event, subEvent, hit, types,...)\n    print(subEvent..\"killed\")\n    return false\nend",
					},
				},
				["activeTriggerMode"] = -10,
				["customTriggerLogic"] = "function(t)\n    return t[1]\nend",
				["disjunctive"] = "custom",
			},
			["uid"] = "o7)3F6FCDZP",
			["url"] = "https://wago.io/XkZJuvlLH/17",
			["version"] = 17,
			["width"] = 50,
			["xOffset"] = -105,
			["yOffset"] = -20,
			["zoom"] = 0,
		},
		["MMN_Game_Button_Leaf_Empty_NoCircle"] = {
			["actions"] = {
				["finish"] = {
				},
				["init"] = {
					["custom"] = "local types = {\"Leaf\", \"Empty\", \"NoCircle\"}\naura_env.types = types\naura_env.selectGlow = false\naura_env.foundGlow = false\n\nif(not aura_env.button) then\n    local b = CreateFrame(\"Button\", \"WA_SnowBoom4\", WeakAuras.regions[aura_env.id].region)\n    b:SetAllPoints(WeakAuras.regions[aura_env.id].region)\n    \n    local function createHighlightTexture(self)\n        local texture = self:CreateTexture(nil, \"OVERLAY\")\n        self.highlight = texture\n        texture:SetTexture([[Interface\\QuestFrame\\UI-QuestLogTitleHighlight]])\n        texture:SetBlendMode(\"ADD\")\n        texture:SetAllPoints(self)\n        texture:SetAlpha(1)\n        return texture\n    end\n    \n    local function onButtonEnter(self)\n        if not self.highlight then\n            createHighlightTexture(self)\n        end\n        self.highlight:Show()\n    end\n    \n    local function onButtonLeave(self)\n        if self.highlight then\n            self.highlight:Hide()\n        end\n    end\n    \n    b:RegisterForClicks(\"LeftButtonDown\")\n    \n    b:SetScript(\"OnClick\", function()\n            WeakAuras.ScanEvents(\"OmnyMazeGame\",\"Clicked\", types)\n    end)\n    \n    b:SetScript(\"OnEnter\", onButtonEnter)\n    b:SetScript(\"OnLeave\", onButtonLeave)\n    \n    aura_env.button = b\nend\n\naura_env.checkTypes = function(types)\n    \n    local found = 0\n    \n    for _, myType in pairs(aura_env.types) do\n        for _, type in pairs(types) do\n            if(myType == type) then found = found +1 end \n        end\n    end\n    \n    return found == 3\nend\n\naura_env.found = function(found)\n    aura_env.foundGlow = found\nend\n\naura_env.select = function(select)\n    aura_env.selectGlow = select\nend\n\n\naura_env.update = function(color, active)\n    \n    aura_env.colorButton(color)\n    if(active)then\n        aura_env.button:Enable()\n    else\n        aura_env.button:Disable()\n    end\nend\n\naura_env.colorButton = function(color)\n    \n    local r,g,b,a = unpack(color)\n    \n    aura_env.region:SetAnimAlpha(a)\n    aura_env.region.Color(a, r, g, b)   \n    \nend",
					["do_custom"] = true,
				},
				["start"] = {
					["custom"] = "WeakAuras.ScanEvents(\"OmnyMazeGame\",\"showModel\", aura_env.types, aura_env.region)",
					["do_custom"] = true,
				},
			},
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["anchorPoint"] = "CENTER",
			["animation"] = {
				["finish"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["start"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
			},
			["authorOptions"] = {
			},
			["color"] = {
				0.22745098039216, -- [1]
				0.23529411764706, -- [2]
				0.23529411764706, -- [3]
				0.8500000089407, -- [4]
			},
			["conditions"] = {
				{
					["changes"] = {
						{
							["property"] = "sub.3.glow",
							["value"] = true,
						}, -- [1]
					},
					["check"] = {
						["trigger"] = -1,
						["value"] = "function(...)\n    if(aura_env and aura_env.foundGlow) then\n        return aura_env.foundGlow\n    end\n    return false\nend",
						["variable"] = "customcheck",
					},
					["linked"] = false,
				}, -- [1]
				{
					["changes"] = {
						{
							["property"] = "sub.2.glow",
							["value"] = true,
						}, -- [1]
					},
					["check"] = {
						["trigger"] = -1,
						["value"] = "function(...)\n    if(aura_env and aura_env.selectGlow) then\n        return aura_env.selectGlow\n    end\n    return false\nend",
						["variable"] = "customcheck",
					},
					["linked"] = false,
				}, -- [2]
			},
			["config"] = {
			},
			["cooldown"] = false,
			["cooldownEdge"] = false,
			["cooldownSwipe"] = true,
			["cooldownTextDisabled"] = false,
			["desaturate"] = false,
			["displayIcon"] = "Interface\\Addons\\WeakAuras\\Media\\Textures\\Square_Smooth.tga",
			["frameStrata"] = 1,
			["height"] = 50,
			["icon"] = true,
			["iconSource"] = 0,
			["id"] = "MMN_Game_Button_Leaf_Empty_NoCircle",
			["information"] = {
			},
			["internalVersion"] = 45,
			["inverse"] = false,
			["keepAspectRatio"] = false,
			["load"] = {
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
						["party"] = true,
					},
					["single"] = "party",
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["use_never"] = false,
				["use_size"] = true,
				["use_zoneIds"] = true,
				["zoneIds"] = "1669",
			},
			["parent"] = "Mists Maze Navigator v2 by Omny",
			["preferToUpdate"] = false,
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["semver"] = "2.0.6",
			["subRegions"] = {
				{
					["anchorXOffset"] = 0,
					["anchorYOffset"] = 0,
					["rotateText"] = "NONE",
					["text_anchorPoint"] = "INNER_BOTTOMRIGHT",
					["text_automaticWidth"] = "Auto",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_fixedWidth"] = 64,
					["text_font"] = "Friz Quadrata TT",
					["text_fontSize"] = 12,
					["text_fontType"] = "OUTLINE",
					["text_justify"] = "CENTER",
					["text_selfPoint"] = "AUTO",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_shadowXOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["text_text"] = "",
					["text_text_format_s_format"] = "none",
					["text_visible"] = true,
					["text_wordWrap"] = "WordWrap",
					["type"] = "subtext",
				}, -- [1]
				{
					["glow"] = false,
					["glowBorder"] = true,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["glowFrequency"] = 0.2,
					["glowLength"] = 8,
					["glowLines"] = 8,
					["glowScale"] = 1,
					["glowThickness"] = 3,
					["glowType"] = "Pixel",
					["glowXOffset"] = -1,
					["glowYOffset"] = -1,
					["type"] = "subglow",
					["useGlowColor"] = true,
				}, -- [2]
				{
					["glow"] = false,
					["glowBorder"] = false,
					["glowColor"] = {
						0.2, -- [1]
						1, -- [2]
						0.15686274509804, -- [3]
						1, -- [4]
					},
					["glowFrequency"] = 0.25,
					["glowLength"] = 10,
					["glowLines"] = 8,
					["glowScale"] = 1,
					["glowThickness"] = 1,
					["glowType"] = "buttonOverlay",
					["glowXOffset"] = 0,
					["glowYOffset"] = 0,
					["type"] = "subglow",
					["useGlowColor"] = true,
				}, -- [3]
				{
					["border_color"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["border_edge"] = "1 Pixel",
					["border_offset"] = 0,
					["border_size"] = 2,
					["border_visible"] = true,
					["type"] = "subborder",
				}, -- [4]
			},
			["tocversion"] = 90002,
			["triggers"] = {
				[1] = {
					["trigger"] = {
						["check"] = "event",
						["custom"] = "function(event, subEvent, ...)\n    if(event ~= \"OmnyMazeV2\" and event ~=\"OmnyMazeGame\") then return end\n    if(subEvent == \"Start\" or subEvent == \"StartSymbol\") then\n        return true\n    end\n    \nend",
						["custom_hide"] = "custom",
						["custom_type"] = "event",
						["debuffType"] = "HELPFUL",
						["duration"] = "1",
						["event"] = "Conditions",
						["events"] = "OmnyMazeV2, OmnyMazeGame",
						["names"] = {
						},
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "custom",
						["unevent"] = "auto",
						["unit"] = "player",
						["use_absorbMode"] = true,
						["use_alwaystrue"] = true,
						["use_unit"] = true,
					},
					["untrigger"] = {
						["custom"] = "function(event, subEvent, ...)\n    if(subEvent==\"Reset\" or subEvent ==\"Hide\" or subEvent == \"HideSymbol\") then\n        \n        return true\n        \n    end\nend",
					},
				},
				[2] = {
					["trigger"] = {
						["check"] = "event",
						["custom"] = "function(event, subEvent, hit,types, ...)\n    if(event ~= \"OmnyMazeV2\"and event ~= \"OmnyMazeGame\") then return end\n    if(subEvent == \"GameButtonUpdate\")then\n        if(not types or not aura_env.checkTypes(types)==hit) then return end \n        local  color, active = ...\n        aura_env.update(color, active)\n    end\n    if(subEvent == \"Glow\")then\n        if(not types or not aura_env.checkTypes(types)==hit) then return end \n        local selectVal, foundVal = ...\n        aura_env.found(foundVal)\n        aura_env.select(selectVal)\n        return true\n    end\n    if(subEvent == \"Text\")then\n        if(not types or not aura_env.checkTypes(types)==hit)then return end\n        aura_env.region.subRegions[1].text:SetText(...)\n        return false\n    end\nend",
						["custom_hide"] = "timed",
						["custom_type"] = "event",
						["debuffType"] = "HELPFUL",
						["duration"] = "0",
						["dynamicDuration"] = false,
						["event"] = "Conditions",
						["events"] = "OmnyMazeV2, OmnyMazeGame",
						["names"] = {
						},
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "custom",
						["unevent"] = "auto",
						["unit"] = "player",
						["use_absorbMode"] = true,
						["use_alwaystrue"] = true,
						["use_unit"] = true,
					},
					["untrigger"] = {
						["custom"] = "function(event, subEvent, hit, types,...)\n    print(subEvent..\"killed\")\n    return false\nend",
					},
				},
				["activeTriggerMode"] = -10,
				["customTriggerLogic"] = "function(t)\n    return t[1]\nend",
				["disjunctive"] = "custom",
			},
			["uid"] = "adxLuTgqU0u",
			["url"] = "https://wago.io/XkZJuvlLH/17",
			["version"] = 17,
			["width"] = 50,
			["xOffset"] = -158,
			["yOffset"] = -20,
			["zoom"] = 0,
		},
		["MMN_Game_Button_Leaf_Full_Circle"] = {
			["actions"] = {
				["finish"] = {
				},
				["init"] = {
					["custom"] = "local types = {\"Leaf\", \"Full\", \"Circle\"}\naura_env.types = types\naura_env.selectGlow = false\naura_env.foundGlow = false\n\nif(not aura_env.button) then\n    local b = CreateFrame(\"Button\", \"WA_SnowBoom4\", WeakAuras.regions[aura_env.id].region)\n    b:SetAllPoints(WeakAuras.regions[aura_env.id].region)\n    \n    local function createHighlightTexture(self)\n        local texture = self:CreateTexture(nil, \"OVERLAY\")\n        self.highlight = texture\n        texture:SetTexture([[Interface\\QuestFrame\\UI-QuestLogTitleHighlight]])\n        texture:SetBlendMode(\"ADD\")\n        texture:SetAllPoints(self)\n        texture:SetAlpha(1)\n        return texture\n    end\n    \n    local function onButtonEnter(self)\n        if not self.highlight then\n            createHighlightTexture(self)\n        end\n        self.highlight:Show()\n    end\n    \n    local function onButtonLeave(self)\n        if self.highlight then\n            self.highlight:Hide()\n        end\n    end\n    \n    b:RegisterForClicks(\"LeftButtonDown\")\n    \n    b:SetScript(\"OnClick\", function()\n            WeakAuras.ScanEvents(\"OmnyMazeGame\",\"Clicked\", types)\n    end)\n    \n    b:SetScript(\"OnEnter\", onButtonEnter)\n    b:SetScript(\"OnLeave\", onButtonLeave)\n    \n    aura_env.button = b\nend\n\naura_env.checkTypes = function(types)\n    \n    local found = 0\n    \n    for _, myType in pairs(aura_env.types) do\n        for _, type in pairs(types) do\n            if(myType == type) then found = found +1 end \n        end\n    end\n    \n    return found == 3\nend\n\naura_env.found = function(found)\n    aura_env.foundGlow = found\nend\n\naura_env.select = function(select)\n    aura_env.selectGlow = select\nend\n\n\naura_env.update = function(color, active)\n    \n    aura_env.colorButton(color)\n    if(active)then\n        aura_env.button:Enable()\n    else\n        aura_env.button:Disable()\n    end\nend\n\naura_env.colorButton = function(color)\n    \n    local r,g,b,a = unpack(color)\n    \n    aura_env.region:SetAnimAlpha(a)\n    aura_env.region.Color(a, r, g, b)   \n    \nend",
					["do_custom"] = true,
				},
				["start"] = {
					["custom"] = "WeakAuras.ScanEvents(\"OmnyMazeGame\",\"showModel\", aura_env.types, aura_env.region)",
					["do_custom"] = true,
				},
			},
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["anchorPoint"] = "CENTER",
			["animation"] = {
				["finish"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["start"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
			},
			["authorOptions"] = {
			},
			["color"] = {
				0.22745098039216, -- [1]
				0.23529411764706, -- [2]
				0.23529411764706, -- [3]
				0.8500000089407, -- [4]
			},
			["conditions"] = {
				{
					["changes"] = {
						{
							["property"] = "sub.3.glow",
							["value"] = true,
						}, -- [1]
					},
					["check"] = {
						["trigger"] = -1,
						["value"] = "function(...)\n    if(aura_env and aura_env.foundGlow) then\n        return aura_env.foundGlow\n    end\n    return false\nend",
						["variable"] = "customcheck",
					},
					["linked"] = false,
				}, -- [1]
				{
					["changes"] = {
						{
							["property"] = "sub.2.glow",
							["value"] = true,
						}, -- [1]
					},
					["check"] = {
						["trigger"] = -1,
						["value"] = "function(...)\n    if(aura_env and aura_env.selectGlow) then\n        return aura_env.selectGlow\n    end\n    return false\nend",
						["variable"] = "customcheck",
					},
					["linked"] = false,
				}, -- [2]
			},
			["config"] = {
			},
			["cooldown"] = false,
			["cooldownEdge"] = false,
			["cooldownSwipe"] = true,
			["cooldownTextDisabled"] = false,
			["desaturate"] = false,
			["displayIcon"] = "Interface\\Addons\\WeakAuras\\Media\\Textures\\Square_Smooth.tga",
			["frameStrata"] = 1,
			["height"] = 50,
			["icon"] = true,
			["iconSource"] = 0,
			["id"] = "MMN_Game_Button_Leaf_Full_Circle",
			["information"] = {
			},
			["internalVersion"] = 45,
			["inverse"] = false,
			["keepAspectRatio"] = false,
			["load"] = {
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
						["party"] = true,
					},
					["single"] = "party",
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["use_never"] = false,
				["use_size"] = true,
				["use_zoneIds"] = true,
				["zoneIds"] = "1669",
			},
			["parent"] = "Mists Maze Navigator v2 by Omny",
			["preferToUpdate"] = false,
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["semver"] = "2.0.6",
			["subRegions"] = {
				{
					["anchorXOffset"] = 0,
					["anchorYOffset"] = 0,
					["rotateText"] = "NONE",
					["text_anchorPoint"] = "INNER_BOTTOMRIGHT",
					["text_automaticWidth"] = "Auto",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_fixedWidth"] = 64,
					["text_font"] = "Friz Quadrata TT",
					["text_fontSize"] = 12,
					["text_fontType"] = "OUTLINE",
					["text_justify"] = "CENTER",
					["text_selfPoint"] = "AUTO",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_shadowXOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["text_text"] = "",
					["text_text_format_s_format"] = "none",
					["text_visible"] = true,
					["text_wordWrap"] = "WordWrap",
					["type"] = "subtext",
				}, -- [1]
				{
					["glow"] = false,
					["glowBorder"] = true,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["glowFrequency"] = 0.2,
					["glowLength"] = 8,
					["glowLines"] = 8,
					["glowScale"] = 1,
					["glowThickness"] = 3,
					["glowType"] = "Pixel",
					["glowXOffset"] = -1,
					["glowYOffset"] = -1,
					["type"] = "subglow",
					["useGlowColor"] = true,
				}, -- [2]
				{
					["glow"] = false,
					["glowBorder"] = false,
					["glowColor"] = {
						0.2, -- [1]
						1, -- [2]
						0.15686274509804, -- [3]
						1, -- [4]
					},
					["glowFrequency"] = 0.25,
					["glowLength"] = 10,
					["glowLines"] = 8,
					["glowScale"] = 1,
					["glowThickness"] = 1,
					["glowType"] = "buttonOverlay",
					["glowXOffset"] = 0,
					["glowYOffset"] = 0,
					["type"] = "subglow",
					["useGlowColor"] = true,
				}, -- [3]
				{
					["border_color"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["border_edge"] = "1 Pixel",
					["border_offset"] = 0,
					["border_size"] = 2,
					["border_visible"] = true,
					["type"] = "subborder",
				}, -- [4]
			},
			["tocversion"] = 90002,
			["triggers"] = {
				[1] = {
					["trigger"] = {
						["check"] = "event",
						["custom"] = "function(event, subEvent, ...)\n    if(event ~= \"OmnyMazeV2\" and event ~=\"OmnyMazeGame\") then return end\n    if(subEvent == \"Start\" or subEvent == \"StartSymbol\") then\n        return true\n    end\n    \nend",
						["custom_hide"] = "custom",
						["custom_type"] = "event",
						["debuffType"] = "HELPFUL",
						["duration"] = "1",
						["event"] = "Conditions",
						["events"] = "OmnyMazeV2, OmnyMazeGame",
						["names"] = {
						},
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "custom",
						["unevent"] = "auto",
						["unit"] = "player",
						["use_absorbMode"] = true,
						["use_alwaystrue"] = true,
						["use_unit"] = true,
					},
					["untrigger"] = {
						["custom"] = "function(event, subEvent, ...)\n    if(subEvent==\"Reset\" or subEvent ==\"Hide\" or subEvent == \"HideSymbol\") then\n        \n        return true\n        \n    end\nend",
					},
				},
				[2] = {
					["trigger"] = {
						["check"] = "event",
						["custom"] = "function(event, subEvent, hit,types, ...)\n    if(event ~= \"OmnyMazeV2\"and event ~= \"OmnyMazeGame\") then return end\n    if(subEvent == \"GameButtonUpdate\")then\n        if(not types or not aura_env.checkTypes(types)==hit) then return end \n        local  color, active = ...\n        aura_env.update(color, active)\n    end\n    if(subEvent == \"Glow\")then\n        if(not types or not aura_env.checkTypes(types)==hit) then return end \n        local selectVal, foundVal = ...\n        aura_env.found(foundVal)\n        aura_env.select(selectVal)\n        return true\n    end\n    if(subEvent == \"Text\")then\n        if(not types or not aura_env.checkTypes(types)==hit)then return end\n        aura_env.region.subRegions[1].text:SetText(...)\n        return false\n    end\nend",
						["custom_hide"] = "timed",
						["custom_type"] = "event",
						["debuffType"] = "HELPFUL",
						["duration"] = "0",
						["dynamicDuration"] = false,
						["event"] = "Conditions",
						["events"] = "OmnyMazeV2, OmnyMazeGame",
						["names"] = {
						},
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "custom",
						["unevent"] = "auto",
						["unit"] = "player",
						["use_absorbMode"] = true,
						["use_alwaystrue"] = true,
						["use_unit"] = true,
					},
					["untrigger"] = {
						["custom"] = "function(event, subEvent, hit, types,...)\n    print(subEvent..\"killed\")\n    return false\nend",
					},
				},
				["activeTriggerMode"] = -10,
				["customTriggerLogic"] = "function(t)\n    return t[1]\nend",
				["disjunctive"] = "custom",
			},
			["uid"] = "9BIUsL4mjbd",
			["url"] = "https://wago.io/XkZJuvlLH/17",
			["version"] = 17,
			["width"] = 50,
			["xOffset"] = -105,
			["yOffset"] = -71,
			["zoom"] = 0,
		},
		["MMN_Game_Button_Leaf_Full_NoCircle"] = {
			["actions"] = {
				["finish"] = {
				},
				["init"] = {
					["custom"] = "local types = {\"Leaf\", \"Full\", \"NoCircle\"}\naura_env.types = types\naura_env.selectGlow = false\naura_env.foundGlow = false\n\nif(not aura_env.button) then\n    local b = CreateFrame(\"Button\", \"WA_SnowBoom4\", WeakAuras.regions[aura_env.id].region)\n    b:SetAllPoints(WeakAuras.regions[aura_env.id].region)\n    \n    local function createHighlightTexture(self)\n        local texture = self:CreateTexture(nil, \"OVERLAY\")\n        self.highlight = texture\n        texture:SetTexture([[Interface\\QuestFrame\\UI-QuestLogTitleHighlight]])\n        texture:SetBlendMode(\"ADD\")\n        texture:SetAllPoints(self)\n        texture:SetAlpha(1)\n        return texture\n    end\n    \n    local function onButtonEnter(self)\n        if not self.highlight then\n            createHighlightTexture(self)\n        end\n        self.highlight:Show()\n    end\n    \n    local function onButtonLeave(self)\n        if self.highlight then\n            self.highlight:Hide()\n        end\n    end\n    \n    b:RegisterForClicks(\"LeftButtonDown\")\n    \n    b:SetScript(\"OnClick\", function()\n            WeakAuras.ScanEvents(\"OmnyMazeGame\",\"Clicked\", types)\n    end)\n    \n    b:SetScript(\"OnEnter\", onButtonEnter)\n    b:SetScript(\"OnLeave\", onButtonLeave)\n    \n    aura_env.button = b\nend\n\naura_env.checkTypes = function(types)\n    \n    local found = 0\n    \n    for _, myType in pairs(aura_env.types) do\n        for _, type in pairs(types) do\n            if(myType == type) then found = found +1 end \n        end\n    end\n    \n    return found == 3\nend\n\naura_env.found = function(found)\n    aura_env.foundGlow = found\nend\n\naura_env.select = function(select)\n    aura_env.selectGlow = select\nend\n\n\naura_env.update = function(color, active)\n    \n    aura_env.colorButton(color)\n    if(active)then\n        aura_env.button:Enable()\n    else\n        aura_env.button:Disable()\n    end\nend\n\naura_env.colorButton = function(color)\n    \n    local r,g,b,a = unpack(color)\n    \n    aura_env.region:SetAnimAlpha(a)\n    aura_env.region.Color(a, r, g, b)   \n    \nend",
					["do_custom"] = true,
				},
				["start"] = {
					["custom"] = "WeakAuras.ScanEvents(\"OmnyMazeGame\",\"showModel\", aura_env.types, aura_env.region)",
					["do_custom"] = true,
				},
			},
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["anchorPoint"] = "CENTER",
			["animation"] = {
				["finish"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["start"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
			},
			["authorOptions"] = {
			},
			["color"] = {
				0.22745098039216, -- [1]
				0.23529411764706, -- [2]
				0.23529411764706, -- [3]
				0.8500000089407, -- [4]
			},
			["conditions"] = {
				{
					["changes"] = {
						{
							["property"] = "sub.3.glow",
							["value"] = true,
						}, -- [1]
					},
					["check"] = {
						["trigger"] = -1,
						["value"] = "function(...)\n    if(aura_env and aura_env.foundGlow) then\n        return aura_env.foundGlow\n    end\n    return false\nend",
						["variable"] = "customcheck",
					},
					["linked"] = false,
				}, -- [1]
				{
					["changes"] = {
						{
							["property"] = "sub.2.glow",
							["value"] = true,
						}, -- [1]
					},
					["check"] = {
						["trigger"] = -1,
						["value"] = "function(...)\n    if(aura_env and aura_env.selectGlow) then\n        return aura_env.selectGlow\n    end\n    return false\nend",
						["variable"] = "customcheck",
					},
					["linked"] = false,
				}, -- [2]
			},
			["config"] = {
			},
			["cooldown"] = false,
			["cooldownEdge"] = false,
			["cooldownSwipe"] = true,
			["cooldownTextDisabled"] = false,
			["desaturate"] = false,
			["displayIcon"] = "Interface\\Addons\\WeakAuras\\Media\\Textures\\Square_Smooth.tga",
			["frameStrata"] = 1,
			["height"] = 50,
			["icon"] = true,
			["iconSource"] = 0,
			["id"] = "MMN_Game_Button_Leaf_Full_NoCircle",
			["information"] = {
			},
			["internalVersion"] = 45,
			["inverse"] = false,
			["keepAspectRatio"] = false,
			["load"] = {
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
						["party"] = true,
					},
					["single"] = "party",
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["use_never"] = false,
				["use_size"] = true,
				["use_zoneIds"] = true,
				["zoneIds"] = "1669",
			},
			["parent"] = "Mists Maze Navigator v2 by Omny",
			["preferToUpdate"] = false,
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["semver"] = "2.0.6",
			["subRegions"] = {
				{
					["anchorXOffset"] = 0,
					["anchorYOffset"] = 0,
					["rotateText"] = "NONE",
					["text_anchorPoint"] = "INNER_BOTTOMRIGHT",
					["text_automaticWidth"] = "Auto",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_fixedWidth"] = 64,
					["text_font"] = "Friz Quadrata TT",
					["text_fontSize"] = 12,
					["text_fontType"] = "OUTLINE",
					["text_justify"] = "CENTER",
					["text_selfPoint"] = "AUTO",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_shadowXOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["text_text"] = "",
					["text_text_format_s_format"] = "none",
					["text_visible"] = true,
					["text_wordWrap"] = "WordWrap",
					["type"] = "subtext",
				}, -- [1]
				{
					["glow"] = false,
					["glowBorder"] = true,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["glowFrequency"] = 0.2,
					["glowLength"] = 8,
					["glowLines"] = 8,
					["glowScale"] = 1,
					["glowThickness"] = 3,
					["glowType"] = "Pixel",
					["glowXOffset"] = -1,
					["glowYOffset"] = -1,
					["type"] = "subglow",
					["useGlowColor"] = true,
				}, -- [2]
				{
					["glow"] = false,
					["glowBorder"] = false,
					["glowColor"] = {
						0.2, -- [1]
						1, -- [2]
						0.15686274509804, -- [3]
						1, -- [4]
					},
					["glowFrequency"] = 0.25,
					["glowLength"] = 10,
					["glowLines"] = 8,
					["glowScale"] = 1,
					["glowThickness"] = 1,
					["glowType"] = "buttonOverlay",
					["glowXOffset"] = 0,
					["glowYOffset"] = 0,
					["type"] = "subglow",
					["useGlowColor"] = true,
				}, -- [3]
				{
					["border_color"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["border_edge"] = "1 Pixel",
					["border_offset"] = 0,
					["border_size"] = 2,
					["border_visible"] = true,
					["type"] = "subborder",
				}, -- [4]
			},
			["tocversion"] = 90002,
			["triggers"] = {
				[1] = {
					["trigger"] = {
						["check"] = "event",
						["custom"] = "function(event, subEvent, ...)\n    if(event ~= \"OmnyMazeV2\" and event ~=\"OmnyMazeGame\") then return end\n    if(subEvent == \"Start\" or subEvent == \"StartSymbol\") then\n        return true\n    end\n    \nend",
						["custom_hide"] = "custom",
						["custom_type"] = "event",
						["debuffType"] = "HELPFUL",
						["duration"] = "1",
						["event"] = "Conditions",
						["events"] = "OmnyMazeV2, OmnyMazeGame",
						["names"] = {
						},
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "custom",
						["unevent"] = "auto",
						["unit"] = "player",
						["use_absorbMode"] = true,
						["use_alwaystrue"] = true,
						["use_unit"] = true,
					},
					["untrigger"] = {
						["custom"] = "function(event, subEvent, ...)\n    if(subEvent==\"Reset\" or subEvent ==\"Hide\" or subEvent == \"HideSymbol\") then\n        \n        return true\n        \n    end\nend",
					},
				},
				[2] = {
					["trigger"] = {
						["check"] = "event",
						["custom"] = "function(event, subEvent, hit,types, ...)\n    if(event ~= \"OmnyMazeV2\"and event ~= \"OmnyMazeGame\") then return end\n    if(subEvent == \"GameButtonUpdate\")then\n        if(not types or not aura_env.checkTypes(types)==hit) then return end \n        local  color, active = ...\n        aura_env.update(color, active)\n    end\n    if(subEvent == \"Glow\")then\n        if(not types or not aura_env.checkTypes(types)==hit) then return end \n        local selectVal, foundVal = ...\n        aura_env.found(foundVal)\n        aura_env.select(selectVal)\n        return true\n    end\n    if(subEvent == \"Text\")then\n        if(not types or not aura_env.checkTypes(types)==hit)then return end\n        aura_env.region.subRegions[1].text:SetText(...)\n        return false\n    end\nend",
						["custom_hide"] = "timed",
						["custom_type"] = "event",
						["debuffType"] = "HELPFUL",
						["duration"] = "0",
						["dynamicDuration"] = false,
						["event"] = "Conditions",
						["events"] = "OmnyMazeV2, OmnyMazeGame",
						["names"] = {
						},
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "custom",
						["unevent"] = "auto",
						["unit"] = "player",
						["use_absorbMode"] = true,
						["use_alwaystrue"] = true,
						["use_unit"] = true,
					},
					["untrigger"] = {
						["custom"] = "function(event, subEvent, hit, types,...)\n    print(subEvent..\"killed\")\n    return false\nend",
					},
				},
				["activeTriggerMode"] = -10,
				["customTriggerLogic"] = "function(t)\n    return t[1]\nend",
				["disjunctive"] = "custom",
			},
			["uid"] = "x2NrkoJBrzP",
			["url"] = "https://wago.io/XkZJuvlLH/17",
			["version"] = 17,
			["width"] = 50,
			["xOffset"] = -158,
			["yOffset"] = -71,
			["zoom"] = 0,
		},
		["MMN_Game_Model_Circle"] = {
			["actions"] = {
				["finish"] = {
					["custom"] = "aura_env.region.model:SetPaused(true)",
					["do_custom"] = false,
					["do_message"] = false,
				},
				["init"] = {
					["custom"] = "aura_env.type = {\"Circle\"}\naura_env.checkType = function(type)\n    if(table.getn(aura_env.type)==1)then\n        return type[3] == aura_env.type[1] \n    else\n        return type[1] == aura_env.type[1] and type[2] == aura_env.type[2]\n    end\nend",
					["do_custom"] = true,
				},
				["start"] = {
					["custom"] = "aura_env.region.model:SetPaused(true)",
					["do_custom"] = true,
				},
			},
			["advance"] = false,
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["anchorPoint"] = "CENTER",
			["animation"] = {
				["finish"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["preset"] = "spiralandpulse",
					["type"] = "none",
				},
				["start"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["preset"] = "fade",
					["type"] = "none",
				},
			},
			["api"] = false,
			["authorOptions"] = {
			},
			["backdropColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["backgroundColor"] = {
				0.5, -- [1]
				0.5, -- [2]
				0.5, -- [3]
				0.5, -- [4]
			},
			["backgroundOffset"] = 2,
			["backgroundTexture"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Auras\\Aura3",
			["blendMode"] = "BLEND",
			["border"] = false,
			["borderBackdrop"] = "None",
			["borderColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["borderEdge"] = "SeerahScalloped",
			["borderInset"] = 32,
			["borderOffset"] = 16,
			["borderSize"] = 64,
			["compress"] = false,
			["conditions"] = {
			},
			["config"] = {
			},
			["crop_x"] = 0.41,
			["crop_y"] = 0.41,
			["desaturateBackground"] = false,
			["desaturateForeground"] = false,
			["endAngle"] = 360,
			["font"] = "Friz Quadrata TT",
			["fontSize"] = 12,
			["foregroundColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["foregroundTexture"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Auras\\Aura3",
			["frameStrata"] = 1,
			["height"] = 50,
			["id"] = "MMN_Game_Model_Circle",
			["information"] = {
			},
			["internalVersion"] = 45,
			["inverse"] = false,
			["load"] = {
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
						["party"] = true,
					},
					["single"] = "party",
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["use_never"] = false,
				["use_size"] = true,
				["use_zoneIds"] = true,
				["zoneIds"] = "1669",
			},
			["mirror"] = false,
			["modelDisplayInfo"] = false,
			["modelIsUnit"] = false,
			["model_fileId"] = "3515221",
			["model_path"] = "spells/arcanepower_state_chest.m2",
			["model_st_rx"] = 270,
			["model_st_ry"] = 0,
			["model_st_rz"] = 0,
			["model_st_tx"] = 55,
			["model_st_ty"] = 55,
			["model_st_tz"] = -135,
			["model_st_us"] = 40,
			["model_x"] = 0,
			["model_y"] = 0,
			["model_z"] = 0,
			["orientation"] = "VERTICAL",
			["parent"] = "Mists Maze Navigator v2 by Omny",
			["portraitZoom"] = true,
			["preferToUpdate"] = false,
			["regionType"] = "model",
			["rotation"] = 0,
			["sameTexture"] = true,
			["scale"] = 1,
			["selfPoint"] = "CENTER",
			["semver"] = "2.0.6",
			["sequence"] = 150,
			["slantMode"] = "INSIDE",
			["startAngle"] = 0,
			["subRegions"] = {
			},
			["textureWrapMode"] = "CLAMPTOBLACKADDITIVE",
			["tocversion"] = 90002,
			["triggers"] = {
				[1] = {
					["trigger"] = {
						["check"] = "event",
						["custom"] = "function(allstates, event, subEvent, type, ...)\n    if(event ~= \"OmnyMazeGame\"and event~=\"OmnyMazeV2\")then return end\n    \n    if(subEvent == \"showModel\")then\n        \n        if(not aura_env.checkType(type))then return end\n        \n        local region = ...\n        allstates[region.id] = {\n            show = true,\n            changed = true,\n            progressType = \"static\",\n            autoHide = false,\n        }\n        WeakAuras.GetRegion(aura_env.region.id, region.id):SetAnchor(\"CENTER\", region, \"CENTER\")\n        return true\n    end\n    if(subEvent==\"Reset\" or subEvent ==\"Hide\" or subEvent == \"HideSymbol\") then\n        for _, state in pairs(allstates) do\n            \n            state.show = false\n            state.changed=true\n        end\n        return true\n    end\nend",
						["custom_type"] = "stateupdate",
						["debuffType"] = "HELPFUL",
						["duration"] = "1",
						["event"] = "Combat Log",
						["events"] = "OmnyMazeGame, OmnyMazeV2",
						["names"] = {
						},
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "custom",
						["unevent"] = "timed",
						["unit"] = "player",
						["use_absorbMode"] = true,
						["use_alwaystrue"] = true,
						["use_unit"] = true,
					},
					["untrigger"] = {
					},
				},
				["activeTriggerMode"] = -10,
			},
			["uid"] = "OvD(x53ZtSu",
			["url"] = "https://wago.io/XkZJuvlLH/17",
			["useAdjustededMax"] = false,
			["useAdjustededMin"] = false,
			["user_x"] = 0,
			["user_y"] = 0,
			["version"] = 17,
			["width"] = 50,
			["xOffset"] = 0,
			["yOffset"] = 0,
		},
		["MMN_Game_Model_Flower_Empty"] = {
			["actions"] = {
				["finish"] = {
				},
				["init"] = {
					["custom"] = "aura_env.type = {\"Flower\", \"Empty\"}\naura_env.checkType = function(type)\n    if(table.getn(aura_env.type)==1)then\n       return type[3] == aura_env.type[1] \n    else\n        return type[1] == aura_env.type[1] and type[2] == aura_env.type[2]\n    end\nend",
					["do_custom"] = true,
				},
				["start"] = {
					["custom"] = "aura_env.region.model:SetPaused(true)\n",
					["do_custom"] = true,
				},
			},
			["advance"] = false,
			["anchorFrameType"] = "SCREEN",
			["anchorPoint"] = "CENTER",
			["animation"] = {
				["finish"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["preset"] = "spiralandpulse",
					["type"] = "none",
				},
				["start"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["preset"] = "fade",
					["type"] = "none",
				},
			},
			["api"] = false,
			["authorOptions"] = {
			},
			["backdropColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0.5, -- [4]
			},
			["border"] = false,
			["borderBackdrop"] = "Blizzard Tooltip",
			["borderColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0.5, -- [4]
			},
			["borderEdge"] = "None",
			["borderInset"] = 11,
			["borderOffset"] = 5,
			["borderSize"] = 16,
			["conditions"] = {
			},
			["config"] = {
			},
			["frameStrata"] = 1,
			["height"] = 50,
			["id"] = "MMN_Game_Model_Flower_Empty",
			["information"] = {
			},
			["internalVersion"] = 45,
			["load"] = {
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
						["party"] = true,
					},
					["single"] = "party",
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["use_never"] = false,
				["use_size"] = true,
				["use_zoneIds"] = true,
				["zoneIds"] = "1669",
			},
			["modelIsUnit"] = false,
			["model_fileId"] = "3515222",
			["model_path"] = "character/nightelf/male/nightelfmale_hd.m2",
			["model_st_rx"] = 270,
			["model_st_ry"] = 0,
			["model_st_rz"] = 0,
			["model_st_tx"] = 55,
			["model_st_ty"] = 55,
			["model_st_tz"] = -135,
			["model_st_us"] = 40,
			["model_x"] = 0,
			["model_y"] = 0,
			["model_z"] = 0,
			["parent"] = "Mists Maze Navigator v2 by Omny",
			["portraitZoom"] = true,
			["preferToUpdate"] = false,
			["regionType"] = "model",
			["rotation"] = 0,
			["scale"] = 1,
			["selfPoint"] = "CENTER",
			["semver"] = "2.0.6",
			["sequence"] = 150,
			["subRegions"] = {
			},
			["tocversion"] = 90002,
			["triggers"] = {
				[1] = {
					["trigger"] = {
						["check"] = "event",
						["custom"] = "function(allstates, event, subEvent, type, ...)\n    if(event ~= \"OmnyMazeGame\"and event~=\"OmnyMazeV2\")then return end\n    \n    if(subEvent == \"showModel\")then\n        \n        if(not aura_env.checkType(type))then return end\n        \n        local region = ...\n        allstates[region.id] = {\n            show = true,\n            changed = true,\n            progressType = \"static\",\n            autoHide = false,\n        }\n        WeakAuras.GetRegion(aura_env.region.id, region.id):SetAnchor(\"CENTER\", region, \"CENTER\")\n        return true\n    end\n    if(subEvent==\"Reset\" or subEvent ==\"Hide\" or subEvent == \"HideSymbol\") then\n        for _, state in pairs(allstates) do\n            \n            state.show = false\n            state.changed=true\n        end\n        return true\n    end\nend",
						["custom_type"] = "stateupdate",
						["debuffType"] = "HELPFUL",
						["duration"] = "1",
						["event"] = "Combat Log",
						["events"] = "OmnyMazeGame, OmnyMazeV2",
						["names"] = {
						},
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "custom",
						["unevent"] = "timed",
						["unit"] = "player",
						["use_absorbMode"] = true,
						["use_alwaystrue"] = true,
						["use_unit"] = true,
					},
					["untrigger"] = {
					},
				},
				["activeTriggerMode"] = -10,
			},
			["uid"] = "kefCZnhLGBY",
			["url"] = "https://wago.io/XkZJuvlLH/17",
			["version"] = 17,
			["width"] = 50,
			["xOffset"] = 0,
			["yOffset"] = 0,
		},
		["MMN_Game_Model_Flower_Full"] = {
			["actions"] = {
				["finish"] = {
				},
				["init"] = {
					["custom"] = "aura_env.type = {\"Flower\", \"Full\"}\naura_env.checkType = function(type)\n    if(table.getn(aura_env.type)==1)then\n       return type[3] == aura_env.type[1] \n    else\n        return type[1] == aura_env.type[1] and type[2] == aura_env.type[2]\n    end\nend",
					["do_custom"] = true,
				},
				["start"] = {
					["custom"] = "aura_env.region.model:SetPaused(true)",
					["do_custom"] = true,
				},
			},
			["advance"] = false,
			["anchorFrameType"] = "SCREEN",
			["anchorPoint"] = "CENTER",
			["animation"] = {
				["finish"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["preset"] = "spiralandpulse",
					["type"] = "none",
				},
				["start"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["preset"] = "fade",
					["type"] = "none",
				},
			},
			["api"] = false,
			["authorOptions"] = {
			},
			["backdropColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0.5, -- [4]
			},
			["border"] = false,
			["borderBackdrop"] = "Blizzard Tooltip",
			["borderColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0.5, -- [4]
			},
			["borderEdge"] = "None",
			["borderInset"] = 11,
			["borderOffset"] = 5,
			["borderSize"] = 16,
			["conditions"] = {
			},
			["config"] = {
			},
			["frameStrata"] = 1,
			["height"] = 50,
			["id"] = "MMN_Game_Model_Flower_Full",
			["information"] = {
			},
			["internalVersion"] = 45,
			["load"] = {
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
						["party"] = true,
					},
					["single"] = "party",
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["use_never"] = false,
				["use_size"] = true,
				["use_zoneIds"] = true,
				["zoneIds"] = "1669",
			},
			["modelIsUnit"] = false,
			["model_fileId"] = "3515223",
			["model_path"] = "character/nightelf/male/nightelfmale_hd.m2",
			["model_st_rx"] = 270,
			["model_st_ry"] = 0,
			["model_st_rz"] = 0,
			["model_st_tx"] = 55,
			["model_st_ty"] = 55,
			["model_st_tz"] = -135,
			["model_st_us"] = 40,
			["model_x"] = 0,
			["model_y"] = 0,
			["model_z"] = 0,
			["parent"] = "Mists Maze Navigator v2 by Omny",
			["portraitZoom"] = true,
			["preferToUpdate"] = false,
			["regionType"] = "model",
			["rotation"] = 0,
			["scale"] = 1,
			["selfPoint"] = "CENTER",
			["semver"] = "2.0.6",
			["sequence"] = 150,
			["subRegions"] = {
			},
			["tocversion"] = 90002,
			["triggers"] = {
				[1] = {
					["trigger"] = {
						["check"] = "event",
						["custom"] = "function(allstates, event, subEvent, type, ...)\n    if(event ~= \"OmnyMazeGame\"and event~=\"OmnyMazeV2\")then return end\n    \n    if(subEvent == \"showModel\")then\n        \n        if(not aura_env.checkType(type))then return end\n        \n        local region = ...\n        allstates[region.id] = {\n            show = true,\n            changed = true,\n            progressType = \"static\",\n            autoHide = false,\n        }\n        WeakAuras.GetRegion(aura_env.region.id, region.id):SetAnchor(\"CENTER\", region, \"CENTER\")\n        return true\n    end\n    if(subEvent==\"Reset\" or subEvent ==\"Hide\" or subEvent == \"HideSymbol\") then\n        for _, state in pairs(allstates) do\n            \n            state.show = false\n            state.changed=true\n        end\n        return true\n    end\nend",
						["custom_type"] = "stateupdate",
						["debuffType"] = "HELPFUL",
						["duration"] = "1",
						["event"] = "Combat Log",
						["events"] = "OmnyMazeGame, OmnyMazeV2",
						["names"] = {
						},
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "custom",
						["unevent"] = "timed",
						["unit"] = "player",
						["use_absorbMode"] = true,
						["use_alwaystrue"] = true,
						["use_unit"] = true,
					},
					["untrigger"] = {
					},
				},
				["activeTriggerMode"] = -10,
			},
			["uid"] = "DjK2HLwmTtl",
			["url"] = "https://wago.io/XkZJuvlLH/17",
			["version"] = 17,
			["width"] = 50,
			["xOffset"] = 0,
			["yOffset"] = 0,
		},
		["MMN_Game_Model_Leaf_Empty"] = {
			["actions"] = {
				["finish"] = {
				},
				["init"] = {
					["custom"] = "aura_env.type = {\"Leaf\", \"Empty\"}\naura_env.checkType = function(type)\n    if(table.getn(aura_env.type)==1)then\n       return type[3] == aura_env.type[1] \n    else\n        return type[1] == aura_env.type[1] and type[2] == aura_env.type[2]\n    end\nend",
					["do_custom"] = true,
				},
				["start"] = {
					["custom"] = "aura_env.region.model:SetPaused(true)",
					["do_custom"] = true,
				},
			},
			["advance"] = false,
			["anchorFrameType"] = "SCREEN",
			["anchorPoint"] = "CENTER",
			["animation"] = {
				["finish"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["preset"] = "spiralandpulse",
					["type"] = "none",
				},
				["start"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["preset"] = "fade",
					["type"] = "none",
				},
			},
			["api"] = false,
			["authorOptions"] = {
			},
			["backdropColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0.5, -- [4]
			},
			["border"] = false,
			["borderBackdrop"] = "Blizzard Tooltip",
			["borderColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0.5, -- [4]
			},
			["borderEdge"] = "None",
			["borderInset"] = 11,
			["borderOffset"] = 5,
			["borderSize"] = 16,
			["conditions"] = {
			},
			["config"] = {
			},
			["frameStrata"] = 1,
			["height"] = 50,
			["id"] = "MMN_Game_Model_Leaf_Empty",
			["information"] = {
			},
			["internalVersion"] = 45,
			["load"] = {
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
						["party"] = true,
					},
					["single"] = "party",
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["use_never"] = false,
				["use_size"] = true,
				["use_zoneIds"] = true,
				["zoneIds"] = "1669",
			},
			["modelIsUnit"] = false,
			["model_fileId"] = "3515224",
			["model_path"] = "character/nightelf/male/nightelfmale_hd.m2",
			["model_st_rx"] = 270,
			["model_st_ry"] = 0,
			["model_st_rz"] = 0,
			["model_st_tx"] = 55,
			["model_st_ty"] = 55,
			["model_st_tz"] = -135,
			["model_st_us"] = 40,
			["model_x"] = 0,
			["model_y"] = 0,
			["model_z"] = 0,
			["parent"] = "Mists Maze Navigator v2 by Omny",
			["portraitZoom"] = true,
			["preferToUpdate"] = false,
			["regionType"] = "model",
			["rotation"] = 0,
			["scale"] = 1,
			["selfPoint"] = "CENTER",
			["semver"] = "2.0.6",
			["sequence"] = 150,
			["subRegions"] = {
			},
			["tocversion"] = 90002,
			["triggers"] = {
				[1] = {
					["trigger"] = {
						["check"] = "event",
						["custom"] = "function(allstates, event, subEvent, type, ...)\n    if(event ~= \"OmnyMazeGame\"and event~=\"OmnyMazeV2\")then return end\n    \n    if(subEvent == \"showModel\")then\n        \n        if(not aura_env.checkType(type))then return end\n        \n        local region = ...\n        allstates[region.id] = {\n            show = true,\n            changed = true,\n            progressType = \"static\",\n            autoHide = false,\n        }\n        WeakAuras.GetRegion(aura_env.region.id, region.id):SetAnchor(\"CENTER\", region, \"CENTER\")\n        return true\n    end\n    if(subEvent==\"Reset\" or subEvent ==\"Hide\" or subEvent == \"HideSymbol\") then\n        for _, state in pairs(allstates) do\n            \n            state.show = false\n            state.changed=true\n        end\n        return true\n    end\nend",
						["custom_type"] = "stateupdate",
						["debuffType"] = "HELPFUL",
						["duration"] = "1",
						["event"] = "Combat Log",
						["events"] = "OmnyMazeGame, OmnyMazeV2",
						["names"] = {
						},
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "custom",
						["unevent"] = "timed",
						["unit"] = "player",
						["use_absorbMode"] = true,
						["use_alwaystrue"] = true,
						["use_unit"] = true,
					},
					["untrigger"] = {
					},
				},
				["activeTriggerMode"] = -10,
			},
			["uid"] = "os1Z6WDhwkZ",
			["url"] = "https://wago.io/XkZJuvlLH/17",
			["version"] = 17,
			["width"] = 50,
			["xOffset"] = 0,
			["yOffset"] = 0,
		},
		["MMN_Game_Model_Leaf_Full"] = {
			["actions"] = {
				["finish"] = {
				},
				["init"] = {
					["custom"] = "aura_env.type = {\"Leaf\",\"Full\"}\naura_env.checkType = function(type)\n    if(table.getn(aura_env.type)==1)then\n       return type[3] == aura_env.type[1] \n    else\n        return type[1] == aura_env.type[1] and type[2] == aura_env.type[2]\n    end\nend",
					["do_custom"] = true,
				},
				["start"] = {
					["custom"] = "aura_env.region.model:SetPaused(true)",
					["do_custom"] = true,
				},
			},
			["advance"] = false,
			["anchorFrameType"] = "SCREEN",
			["anchorPoint"] = "CENTER",
			["animation"] = {
				["finish"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["preset"] = "spiralandpulse",
					["type"] = "none",
				},
				["start"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["preset"] = "fade",
					["type"] = "none",
				},
			},
			["api"] = false,
			["authorOptions"] = {
			},
			["backdropColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0.5, -- [4]
			},
			["border"] = false,
			["borderBackdrop"] = "Blizzard Tooltip",
			["borderColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0.5, -- [4]
			},
			["borderEdge"] = "None",
			["borderInset"] = 11,
			["borderOffset"] = 5,
			["borderSize"] = 16,
			["conditions"] = {
			},
			["config"] = {
			},
			["frameStrata"] = 1,
			["height"] = 50,
			["id"] = "MMN_Game_Model_Leaf_Full",
			["information"] = {
			},
			["internalVersion"] = 45,
			["load"] = {
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
						["party"] = true,
					},
					["single"] = "party",
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["use_never"] = false,
				["use_size"] = true,
				["use_zoneIds"] = true,
				["zoneIds"] = "1669",
			},
			["modelIsUnit"] = false,
			["model_fileId"] = "3515225",
			["model_path"] = "character/nightelf/male/nightelfmale_hd.m2",
			["model_st_rx"] = 270,
			["model_st_ry"] = 0,
			["model_st_rz"] = 0,
			["model_st_tx"] = 55,
			["model_st_ty"] = 55,
			["model_st_tz"] = -135,
			["model_st_us"] = 40,
			["model_x"] = 0,
			["model_y"] = 0,
			["model_z"] = 0,
			["parent"] = "Mists Maze Navigator v2 by Omny",
			["portraitZoom"] = true,
			["preferToUpdate"] = false,
			["regionType"] = "model",
			["rotation"] = 0,
			["scale"] = 1,
			["selfPoint"] = "CENTER",
			["semver"] = "2.0.6",
			["sequence"] = 150,
			["subRegions"] = {
			},
			["tocversion"] = 90002,
			["triggers"] = {
				[1] = {
					["trigger"] = {
						["check"] = "event",
						["custom"] = "function(allstates, event, subEvent, type, ...)\n    if(event ~= \"OmnyMazeGame\"and event~=\"OmnyMazeV2\")then return end\n    \n    if(subEvent == \"showModel\")then\n        \n        if(not aura_env.checkType(type))then return end\n        \n        local region = ...\n        allstates[region.id] = {\n            show = true,\n            changed = true,\n            progressType = \"static\",\n            autoHide = false,\n        }\n        WeakAuras.GetRegion(aura_env.region.id, region.id):SetAnchor(\"CENTER\", region, \"CENTER\")\n        return true\n    end\n    if(subEvent==\"Reset\" or subEvent ==\"Hide\" or subEvent == \"HideSymbol\") then\n        for _, state in pairs(allstates) do\n            \n            state.show = false\n            state.changed=true\n        end\n        return true\n    end\nend",
						["custom_type"] = "stateupdate",
						["debuffType"] = "HELPFUL",
						["duration"] = "1",
						["event"] = "Combat Log",
						["events"] = "OmnyMazeGame, OmnyMazeV2",
						["names"] = {
						},
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "custom",
						["unevent"] = "timed",
						["unit"] = "player",
						["use_absorbMode"] = true,
						["use_alwaystrue"] = true,
						["use_unit"] = true,
					},
					["untrigger"] = {
					},
				},
				["activeTriggerMode"] = -10,
			},
			["uid"] = "W6Hda015YEz",
			["url"] = "https://wago.io/XkZJuvlLH/17",
			["version"] = 17,
			["width"] = 50,
			["xOffset"] = 0,
			["yOffset"] = 0,
		},
		["MMN_Hide_Button"] = {
			["actions"] = {
				["finish"] = {
				},
				["init"] = {
					["custom"] = "if(not aura_env.button) then\n    local b = CreateFrame(\"Button\", \"WA_SnowBoom4\", WeakAuras.regions[aura_env.id].region)\n    b:SetAllPoints(WeakAuras.regions[aura_env.id].region)\n    \n    local function createHighlightTexture(self)\n        local texture = self:CreateTexture(nil, \"OVERLAY\")\n        self.highlight = texture\n        texture:SetTexture([[Interface\\QuestFrame\\UI-QuestLogTitleHighlight]])\n        texture:SetBlendMode(\"ADD\")\n        texture:SetAllPoints(self)\n        texture:SetAlpha(1)\n        return texture\n    end\n    \n    local function onButtonEnter(self)\n        if not self.highlight then\n            createHighlightTexture(self)\n        end\n        self.highlight:Show()\n    end\n    \n    local function onButtonLeave(self)\n        if self.highlight then\n            self.highlight:Hide()\n        end\n    end\n    \n    b:RegisterForClicks(\"LeftButtonDown\")\n    \n    b:SetScript(\"OnClick\", function()\n            WeakAuras.ScanEvents(\"OmnyMazeV2\",\"Hide\")\n    end)\n    \n    b:SetScript(\"OnEnter\", onButtonEnter)\n    b:SetScript(\"OnLeave\", onButtonLeave)\n    \n    aura_env.button = b\nend\n\n\n\n",
					["do_custom"] = true,
				},
				["start"] = {
				},
			},
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["anchorPoint"] = "CENTER",
			["animation"] = {
				["finish"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["start"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
			},
			["authorOptions"] = {
			},
			["auto"] = false,
			["color"] = {
				0.21960784313725, -- [1]
				0.21960784313725, -- [2]
				0.21960784313725, -- [3]
				0.48000001907349, -- [4]
			},
			["conditions"] = {
				{
					["changes"] = {
						{
							["property"] = "customcode",
							["value"] = {
								["custom"] = "aura_env.button:Enable()",
							},
						}, -- [1]
					},
					["check"] = {
						["trigger"] = 1,
						["value"] = 0,
						["variable"] = "show",
					},
				}, -- [1]
			},
			["config"] = {
			},
			["cooldown"] = false,
			["cooldownEdge"] = false,
			["cooldownSwipe"] = true,
			["cooldownTextDisabled"] = false,
			["customText"] = "\n",
			["desaturate"] = false,
			["displayIcon"] = "Interface\\Addons\\WeakAuras\\Media\\Textures\\Square_Smooth.tga",
			["frameStrata"] = 1,
			["height"] = 15,
			["icon"] = true,
			["iconSource"] = 0,
			["id"] = "MMN_Hide_Button",
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["internalVersion"] = 45,
			["inverse"] = false,
			["keepAspectRatio"] = false,
			["load"] = {
				["class"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
				},
				["size"] = {
					["multi"] = {
						["party"] = true,
					},
					["single"] = "party",
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["use_never"] = false,
				["use_size"] = true,
				["use_zoneIds"] = true,
				["zoneIds"] = "1669",
			},
			["parent"] = "Mists Maze Navigator v2 by Omny",
			["preferToUpdate"] = false,
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["semver"] = "2.0.6",
			["subRegions"] = {
				{
					["anchorXOffset"] = 0,
					["anchorYOffset"] = 0,
					["rotateText"] = "NONE",
					["text_anchorPoint"] = "CENTER",
					["text_automaticWidth"] = "Auto",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_fixedWidth"] = 64,
					["text_font"] = "Expressway",
					["text_fontSize"] = 14,
					["text_fontType"] = "OUTLINE",
					["text_justify"] = "CENTER",
					["text_selfPoint"] = "AUTO",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_shadowXOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["text_text"] = "Hide",
					["text_text_format_s_format"] = "none",
					["text_visible"] = true,
					["text_wordWrap"] = "WordWrap",
					["type"] = "subtext",
				}, -- [1]
				{
					["glow"] = false,
					["glowBorder"] = false,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["glowFrequency"] = 0.25,
					["glowLength"] = 10,
					["glowLines"] = 8,
					["glowScale"] = 1,
					["glowThickness"] = 1,
					["glowType"] = "buttonOverlay",
					["glowXOffset"] = 0,
					["glowYOffset"] = 0,
					["type"] = "subglow",
					["useGlowColor"] = false,
				}, -- [2]
				{
					["border_color"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["border_edge"] = "1 Pixel",
					["border_offset"] = 0,
					["border_size"] = 1,
					["border_visible"] = true,
					["type"] = "subborder",
				}, -- [3]
			},
			["tocversion"] = 90002,
			["triggers"] = {
				[1] = {
					["trigger"] = {
						["custom"] = "function(_,subEvent, ...)\n    \n    if(subEvent == \"Show\") then\n        return true \n    end\n    \n    return false\nend",
						["custom_hide"] = "custom",
						["custom_type"] = "event",
						["debuffType"] = "HELPFUL",
						["event"] = "Health",
						["events"] = "OmnyMazeV2",
						["names"] = {
						},
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "custom",
						["unit"] = "player",
					},
					["untrigger"] = {
						["custom"] = "function(_,subEvent, ...)\n    \n    if(subEvent==\"Reset\" or subEvent ==\"Hide\") then\n        \n        return true\n        \n    end\n    \n    return false\n    \nend",
					},
				},
				["activeTriggerMode"] = -10,
				["customTriggerLogic"] = "function(trigger)\n    return trigger[1]\nend",
				["disjunctive"] = "custom",
			},
			["uid"] = "kQYS0lUh7YB",
			["url"] = "https://wago.io/XkZJuvlLH/17",
			["version"] = 17,
			["width"] = 73,
			["xOffset"] = 38.5,
			["yOffset"] = 100,
			["zoom"] = 0,
		},
		["MMN_MazeController"] = {
			["actions"] = {
				["finish"] = {
				},
				["init"] = {
					["custom"] = "aura_env.started = false\naura_env.numRooms = 0\naura_env.currRoom = 0\naura_env.comingPath = {}\naura_env.pathWent = {}\naura_env.text = \"\"\n\naura_env.sTypes = {\n    [\"Flower\"]=0,\n    [\"Leaf\"]=0,\n    [\"Full\"]=0,\n    [\"Empty\"]=0,\n    [\"Circle\"]=0,\n    [\"NoCircle\"]=0\n}\n\naura_env.clickedSymbols ={}\n\naura_env.foundButton = nil\n\naura_env.buttonTable = {}\n\naura_env.getSymbolCount = function()\n    local count = 0\n    for _ in pairs(aura_env.clickedSymbols) do count = count + 1 end\n    return count \nend\n\naura_env.resetSymbols = function()\n    \n    for type, _ in pairs(aura_env.sTypes) do\n        aura_env.sTypes[type] = 0 \n    end\n    aura_env.clickedSymbols = {}\n    aura_env.foundButton = nil\n    WeakAuras.ScanEvents(\"OmnyMazeGame\", \"GameButtonUpdate\", false, {}, aura_env.config.symbolPossible, true)\n    WeakAuras.ScanEvents(\"OmnyMazeGame\",\"Glow\", false, {}, false, false)\n    WeakAuras.ScanEvents(\"OmnyMazeGame\", \"Text\", false, {}, \"\")\nend\n\naura_env.resetSymbolText = function(types, i)\n    WeakAuras.ScanEvents(\"OmnyMazeGame\", \"Text\", true, types, \"\")\n    for symbol, j in pairs(aura_env.clickedSymbols) do\n        if(j~=i)then\n            local a = j\n            if(j>i)then \n                a = a-1                \n                aura_env.clickedSymbols[symbol]=a\n            end\n            local t = aura_env.getSymbolTypes(symbol)\n            WeakAuras.ScanEvents(\"OmnyMazeGame\", \"Text\", true, t, a)\n        end\n    end\nend\n\naura_env.clickSymbol = function(types)\n    local name = aura_env.symbolName(types)\n    local add = 0\n    if(not aura_env.clickedSymbols[name])then\n        local a = aura_env.getSymbolCount()+1\n        aura_env.clickedSymbols[name] = a\n        add=1\n        WeakAuras.ScanEvents(\"OmnyMazeGame\", \"Text\", true, types, a)\n    else\n        aura_env.resetSymbolText(types, aura_env.clickedSymbols[name])\n        aura_env.clickedSymbols[name] = nil\n        add=-1\n        WeakAuras.ScanEvents(\"OmnyMazeGame\",\"Glow\", true, types, false, false)\n        if(name == aura_env.foundButton) then aura_env.foundButton = nil end\n    end\n    for _, type in pairs(types) do\n        aura_env.sTypes[type] = aura_env.sTypes[type]+add \n    end\n    aura_env.checkSymbols()\nend\n\naura_env.checkSymbols = function()\n    local possible = 0\n    local pType = nil\n    local notPossible ={}\n    for type, count in pairs(aura_env.sTypes) do \n        if(count <=1) then possible, pType = possible +1, type else\n            table.insert(notPossible, type)    \n        end\n    end\n    WeakAuras.ScanEvents(\"OmnyMazeGame\", \"GameButtonUpdate\", true, notPossible, aura_env.config.symbolNotPossible, true)\n    WeakAuras.ScanEvents(\"OmnyMazeGame\", \"GameButtonUpdate\", false, notPossible, aura_env.config.symbolPossible, true)\n    if(possible == 1) then\n        --found right type --> check clicked symbols -> if only one mark glow if more mark color\n        local found = 0\n        local glowTypes = nil\n        for symbol, _ in pairs(aura_env.clickedSymbols) do\n            local types = aura_env.getSymbolTypes(symbol)\n            for _, type in pairs(types) do\n                if(type == pType)then\n                    found = found +1\n                    glowTypes = types\n                    aura_env.foundButton = symbol\n                end\n            end\n        end\n        if(found == 1) then\n            WeakAuras.ScanEvents(\"OmnyMazeGame\",\"Glow\", true, glowTypes, false, true)\n        else\n            aura_env.foundButton = nil\n            WeakAuras.ScanEvents(\"OmnyMazeGame\", \"GameButtonUpdate\", false, notPossible, aura_env.config.symbolHighlight, true)\n        end\n        aura_env.announceSymbol(pType, aura_env.foundButton)\n    else\n        aura_env.foundButton = nil\n    end\n    \n    if(possible == 0) then \n        if(aura_env.config.wrongInput)then\n            print(\"|T3601531:0|t |cFFC41F3BMists Maze Navigator|r - |cFFC41F3BInvalid Input|r |T3601531:0|t\")\n        end\n    end\n    \n    for symbol, _ in pairs(aura_env.clickedSymbols) do\n        if(symbol ~= aura_env.foundButton) then\n            WeakAuras.ScanEvents(\"OmnyMazeGame\",\"Glow\", true, aura_env.getSymbolTypes(symbol), true, false)\n        end\n    end\n    \n    \nend\n\naura_env.announceSymbol = function(type, symbol)\n    if(not aura_env.config.announce)then return end\n    \n    local msg = \"\"\n    if(symbol and aura_env.config.fullAnnounce)then\n        msg = symbol  \n    else\n        msg = type\n    end\n    local channel = \"PARTY\"\n    \n    local c = aura_env.config.channel \n    if(c == 1) then channel = \"SAY\"\n    elseif(c == 2) then channel = \"YELL\"\n    elseif(c == 3) then channel = \"PARTY\"\n    end\n    \n    --fix no circle\n    msg = msg:gsub(\"%NoCircle\", aura_env.config.translation.NoCircle)\n    for raw, translation in pairs(aura_env.config.translation)do \n        msg = msg:gsub(\"%\"..raw, translation)        \n    end\n    \n    \n    local output = aura_env.config.text\n    \n    output = output:gsub(\"%%n\", msg)\n    \n    \n    \n    SendChatMessage(output, channel)\n    \nend\n\naura_env.getSymbolTypes = function(types)\n    local result = {}\n    for match in (types..\"_\"):gmatch(\"(.-)\"..\"_\") do\n        table.insert(result, match);\n    end\n    return result\nend\n\naura_env.symbolName = function(types)\n    local res = \"\"\n    for _, type in pairs(types) do\n        if(res == \"\") then res = type \n        else res = res..\"_\"..type end\n    end\n    return res\nend\n\naura_env.start = function()\n    \n    aura_env.started = true\n    aura_env.comingPath = aura_env.pathData\n    \n    aura_env.clickRoom(1)\n    \nend\n\naura_env.reset = function()\n    aura_env.started = false\n    aura_env.numRooms = 0\n    aura_env.currRoom = 0\n    aura_env.comingPath = {}\n    aura_env.pathWent = {}\n    aura_env.text = \"\"\n    aura_env.buttonTable = {}\n    \n    WeakAuras.ScanEvents(\"OmnyMazeV2\", \"Reset\")\n    \nend\n\naura_env.back = function()\n    if(aura_env.numRooms == 1)then\n        aura_env.reset()\n        return\n    end\n    if(aura_env.config.symbolHide)then WeakAuras.ScanEvents(\"OmnyMazeGame\",\"StartSymbol\") end\n    aura_env.pathWent[aura_env.numRooms] = nil\n    aura_env.numRooms = aura_env.numRooms - 1\n    aura_env.currRoom = aura_env.pathWent[aura_env.numRooms]\n    \n    \n    aura_env.comingPath = aura_env.pathData\n    for i = 1, aura_env.numRooms do\n        aura_env.comingPath = aura_env.comingPath[aura_env.pathWent[i]] \n    end\n    \n    aura_env.createText()\n    aura_env.updateAll()\n    \nend\n\n\naura_env.clickRoomButton = function(id)\n    \n    return aura_env.clickRoom(aura_env.buttonTable[id])\n    \nend\n\naura_env.clickRoom = function(id)\n    if(aura_env.canTravel(id, aura_env.currRoom, aura_env.comingPath)) then\n        aura_env.visitRoom(id)\n        return true\n    end\n    return false\nend\n\n\naura_env.visitRoom = function(id)\n    aura_env.resetSymbols()\n    \n    if(id == \"Boss\" and aura_env.comingPath[id])then\n        \n        aura_env.reset()\n        \n        return\n    end\n    \n    aura_env.numRooms = aura_env.numRooms + 1\n    aura_env.pathWent[aura_env.numRooms] = id\n    aura_env.currRoom = id\n    aura_env.comingPath = aura_env.comingPath[id]\n    aura_env.updateAll()\n    \n    aura_env.createText()\nend\n\naura_env.createText = function()\n    \n    local text = \"\"\n    \n    for i = 1, aura_env.numRooms do\n        local node = aura_env.pathWent[i]\n        if(text == \"\")then\n            text = aura_env.getRoomText(node)\n        else\n            text = text .. \" - \"..aura_env.getRoomText(node)   \n        end\n    end\n    \n    local prediction = \"\"\n    \n    local path = aura_env.comingPath\n    local pRoom = aura_env.currRoom\n    \n    local predicting = true\n    local i = 0\n    \n    while(predicting and i < 10) do \n        i = i+1\n        local found = false\n        for _, roomId in pairs(aura_env.roomData[pRoom][\"r\"]) do\n            if(not found)then\n                local roomType,travelType = aura_env.getType(roomId, pRoom, path)\n                if(travelType == \"Alone\")then\n                    if(prediction == \"\") then\n                        prediction = \" |T450908:0|t \"..aura_env.getRoomText(roomId)\n                        \n                    else\n                        prediction = prediction..\" - \"..aura_env.getRoomText(roomId)\n                    end\n                    found = true\n                    path = path[roomId]\n                    pRoom = roomId\n                    if(pRoom == \"Boss\") then\n                        predicting = false\n                    end\n                    \n                end\n                if(travelType == \"Others\")then\n                    predicting = false\n                    prediction = \"\"\n                end\n                \n            end\n        end\n        \n    end\n    if(aura_env.config.symbolHide and prediction ~= \"\")then WeakAuras.ScanEvents(\"OmnyMazeGame\",\"HideSymbol\") end\n    aura_env.text = text..prediction\n    aura_env.region:Update()    \nend\n\naura_env.getRoomText = function(id)\n    \n    local type = aura_env.roomData[id][\"t\"]\n    \n    local prefix = \"\"\n    local suffix = \"|r\"\n    \n    if(type == \"T\")then\n        prefix = \"|cffffffff\"\n    elseif(type == \"B\")then\n        prefix = \"|cffdd00ff\"\n    elseif(type == \"MBC\")then\n        prefix = \"|cffff7b00\"\n    elseif(type == \"MB\")then\n        prefix = \"|cffff2b00\"\n    else\n        return \"\"\n        \n    end\n    return prefix..id..suffix\nend\n\n\naura_env.updateAll = function()\n    \n    local roomData = aura_env.roomData[aura_env.currRoom]\n    \n    for i= 1,5 do \n        \n        \n        local buttonNum = roomData[\"r\"][i]\n        local type, travelType = aura_env.getType(buttonNum, aura_env.currRoom, aura_env.comingPath)\n        local color, textColor = aura_env.getColorType(type, travelType)\n        \n        local shouldGlow = travelType == \"Alone\" and aura_env.config.glowOn\n        local active = travelType ~= \"NO\" and travelType ~= nil\n        \n        aura_env.buttonTable[i] = buttonNum\n        \n        WeakAuras.ScanEvents(\"OmnyMazeV2\", \"ButtonUpdate\", i, buttonNum, color, textColor, shouldGlow, active)\n        \n    end\n    \n    WeakAuras.ScanEvents(\"OmnyMazeV2\", \"VisitRoom\", aura_env.currRoom)\n    \nend\n\naura_env.getColorType = function(type, travelType)\n    \n    \n    local config = aura_env.config\n    \n    local color\n    local textColor\n    \n    if(type == \"T\")then\n        textColor = config.trashTextColor\n    elseif(type == \"B\")then\n        textColor = config.bossTextColor\n    elseif(type == \"MBC\")then\n        textColor = config.mbcTextColor\n    elseif(type == \"MB\")then\n        textColor = config.mbTextColor\n    else\n        textColor = config.hiddenTextColor\n    end\n    \n    if(travelType == \"NO\") then\n        color = config.noColor\n    elseif(travelType == \"Others\") then\n        color = config.othersColor\n    elseif(travelType == \"Alone\") then\n        color = config.aloneColor\n    else\n        color = config.hiddenColor\n    end\n    \n    return color, textColor\n    \nend\n\naura_env.getType = function(id, previous, comingPath)\n    \n    if(id == nil)then return nil, nil end\n    \n    local canTravel = false\n    local others = false\n    \n    for _, ids in pairs(aura_env.roomData[previous][\"r\"]) do\n        if(aura_env.canTravel(ids, previous, comingPath))then\n            if(id == ids) then\n                canTravel = true  \n            else\n                others = true\n            end\n        end\n    end\n    \n    local travelType\n    \n    if(not canTravel)then\n        \n        travelType = \"NO\"\n        \n    elseif(others) then\n        \n        travelType = \"Others\"\n        \n    else\n        \n        travelType = \"Alone\"\n        \n    end\n    \n    \n    return aura_env.roomData[id][\"t\"], travelType\n    \nend\n\naura_env.canTravel = function(id, previous, comingPath)\n    if(previous == 0 and id == 1) then return true end\n    return comingPath[id] ~= nil\nend\n\n--[[\n[\"r\"] rooms able to reach\n[\"t\"] type: \"T\"rash \"MB\" Miniboss \"B\"oss \"MBC\" Minibosschance\n\n\n]]\naura_env.roomData = {\n    \n    [0] = {[\"r\"] = {1}},\n    [1] = {[\"r\"]={2,3,6}, [\"t\"] = \"T\"},\n    [2] = {[\"r\"]={1,4,5}, [\"t\"] = \"T\"},\n    [3] = {[\"r\"]={1,7,8}, [\"t\"] = \"T\"},\n    [4] = {[\"r\"]={2,9}, [\"t\"] = \"T\"},\n    [5] = {[\"r\"]={2,9,10}, [\"t\"] = \"T\"},\n    [6] = {[\"r\"]={1,7,10,11}, [\"t\"] = \"T\"},\n    [7] = {[\"r\"]={3,6,12}, [\"t\"] = \"T\"},\n    [8] = {[\"r\"]={3,12,13}, [\"t\"] = \"T\"},\n    [9] = {[\"r\"]={4,5,16}, [\"t\"] = \"MB\"},\n    [10] = {[\"r\"]={5,6,17,18}, [\"t\"] = \"MBC\"},\n    [11] = {[\"r\"]={6,12,14,18,19}, [\"t\"] = \"MBC\"},\n    [12] = {[\"r\"]={7,8,11,14}, [\"t\"] = \"T\"},\n    [13] = {[\"r\"]={8,15}, [\"t\"] = \"T\"},\n    [14] = {[\"r\"]={11,12,20}, [\"t\"] = \"MBC\"},\n    [15] = {[\"r\"]={13,20}, [\"t\"] = \"MB\"},\n    [16] = {[\"r\"]={9,17}, [\"t\"] = \"T\"},\n    [17] = {[\"r\"]={10,16,18,\"Boss\"}, [\"t\"] = \"T\"},\n    [18] = {[\"r\"]={10,11,17,19,\"Boss\"}, [\"t\"] = \"T\"},\n    [19] = {[\"r\"]={11,18,20,\"Boss\"}, [\"t\"] = \"T\"},\n    [20] = {[\"r\"]={14,15,19,\"Boss\"}, [\"t\"] = \"T\"},\n    [\"Boss\"] = {[\"t\"] = \"B\"},\n}\n\n\n\n\naura_env.pathData = {\n    \n    [1] = {\n        \n        [3] = {\n            [7] = {\n                [12] = {\n                    [11] = {\n                        [18] = {[\"Boss\"] = true}\n                    },\n                    [14] = {\n                        [20] = {\n                            [19] = {[\"Boss\"] = true}\n                        }\n                    }\n                },\n                [6] = {\n                    [10] = {\n                        [17] = {[\"Boss\"] = true}\n                    }\n                }\n            },\n            [8] = {\n                [12] = {\n                    [11] = {\n                        [19] = {[\"Boss\"] = true}\n                    }\n                },\n                [13] = {\n                    [15] = {\n                        [20] = {[\"Boss\"] = true}\n                    }\n                }\n            }\n        },\n        \n        [2] = {\n            [5] = {\n                [9] = {\n                    [16] = {\n                        [17] = {\n                            [18] = {[\"Boss\"] = true}\n                        }\n                    }\n                },\n                [10] = {\n                    [6] = {\n                        [11] = {\n                            [18] = {[\"Boss\"] = true}\n                        }\n                    },\n                    [18] = {\n                        [17] = {[\"Boss\"] = true}\n                    }\n                }\n            },\n            [4] = {\n                [9] = {\n                    [16] = {\n                        [17] = {[\"Boss\"] = true}\n                    }\n                }\n            }\n        },\n        \n        [6] = {\n            [10] = {\n                [18]={\n                    [19] = {\n                        [20] = {[\"Boss\"] = true}\n                    }\n                }\n            },\n            [7] = {\n                [12] = {\n                    [14] = {\n                        [20] = {\n                            [19] = {[\"Boss\"] = true}\n                        }\n                    }\n                }\n            },\n            [11] = {\n                [12] = {\n                    [14] = {\n                        [20] = {[\"Boss\"] = true}\n                    }\n                }\n            }\n        }\n        \n    }\n    \n}\n\n\n",
					["do_custom"] = true,
				},
				["start"] = {
				},
			},
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["anchorPoint"] = "CENTER",
			["animation"] = {
				["finish"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["start"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
			},
			["authorOptions"] = {
				{
					["noMerge"] = false,
					["text"] = "Buttons",
					["type"] = "header",
					["useName"] = true,
					["width"] = 1,
				}, -- [1]
				{
					["default"] = {
						0.12549019607843, -- [1]
						1, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["key"] = "aloneColor",
					["name"] = "Only Option",
					["type"] = "color",
					["useDesc"] = false,
					["width"] = 1,
				}, -- [2]
				{
					["default"] = {
						1, -- [1]
						0.97647058823529, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["key"] = "othersColor",
					["name"] = "Multiple Options",
					["type"] = "color",
					["useDesc"] = false,
					["width"] = 1,
				}, -- [3]
				{
					["default"] = {
						0.21960784313725, -- [1]
						0.21960784313725, -- [2]
						0.21960784313725, -- [3]
						0.48319041728973, -- [4]
					},
					["key"] = "noColor",
					["name"] = "Not a Valid Path",
					["type"] = "color",
					["useDesc"] = false,
					["width"] = 1,
				}, -- [4]
				{
					["default"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						0, -- [4]
					},
					["key"] = "hiddenColor",
					["name"] = "Hidden",
					["type"] = "color",
					["useDesc"] = false,
					["width"] = 1,
				}, -- [5]
				{
					["default"] = true,
					["key"] = "glowOn",
					["name"] = "Glow when only Option",
					["type"] = "toggle",
					["useDesc"] = false,
					["width"] = 1,
				}, -- [6]
				{
					["noMerge"] = false,
					["text"] = "Texts",
					["type"] = "header",
					["useName"] = true,
					["width"] = 1,
				}, -- [7]
				{
					["default"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["key"] = "trashTextColor",
					["name"] = "Trash Text",
					["type"] = "color",
					["useDesc"] = false,
					["width"] = 1,
				}, -- [8]
				{
					["default"] = {
						1, -- [1]
						0.16862745098039, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["key"] = "mbTextColor",
					["name"] = "Miniboss Text",
					["type"] = "color",
					["useDesc"] = false,
					["width"] = 1,
				}, -- [9]
				{
					["default"] = {
						1, -- [1]
						0.48235294117647, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["key"] = "mbcTextColor",
					["name"] = "Miniboss Chance Text",
					["type"] = "color",
					["useDesc"] = false,
					["width"] = 1,
				}, -- [10]
				{
					["default"] = {
						0.86666666666667, -- [1]
						0, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["key"] = "bossTextColor",
					["name"] = "Boss Text",
					["type"] = "color",
					["useDesc"] = false,
					["width"] = 1,
				}, -- [11]
				{
					["default"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						0, -- [4]
					},
					["key"] = "hiddenTextColor",
					["name"] = "Hidden Text",
					["type"] = "color",
					["useDesc"] = false,
					["width"] = 1,
				}, -- [12]
				{
					["noMerge"] = false,
					["text"] = "Symbol Buttons",
					["type"] = "header",
					["useName"] = true,
					["width"] = 1,
				}, -- [13]
				{
					["default"] = {
						1, -- [1]
						0.17254901960784, -- [2]
						0.098039215686275, -- [3]
						0.5702143907547, -- [4]
					},
					["key"] = "symbolNotPossible",
					["name"] = "Symbol not possible",
					["type"] = "color",
					["useDesc"] = false,
					["width"] = 1,
				}, -- [14]
				{
					["default"] = {
						0.22745098039216, -- [1]
						0.23529411764706, -- [2]
						0.23529411764706, -- [3]
						0.8500000089407, -- [4]
					},
					["key"] = "symbolPossible",
					["name"] = "Symbol possible",
					["type"] = "color",
					["useDesc"] = false,
					["width"] = 1,
				}, -- [15]
				{
					["default"] = {
						0.058823529411765, -- [1]
						1, -- [2]
						0.17254901960784, -- [3]
						0.66675889492035, -- [4]
					},
					["key"] = "symbolHighlight",
					["name"] = "Symbol Highlight",
					["type"] = "color",
					["useDesc"] = false,
					["width"] = 1,
				}, -- [16]
				{
					["default"] = true,
					["key"] = "announce",
					["name"] = "Announce Right Option in Chat",
					["type"] = "toggle",
					["useDesc"] = false,
					["width"] = 2,
				}, -- [17]
				{
					["default"] = 1,
					["key"] = "channel",
					["name"] = "Channel",
					["type"] = "select",
					["useDesc"] = false,
					["values"] = {
						"SAY", -- [1]
						"YELL", -- [2]
						"PARTY", -- [3]
					},
					["width"] = 1,
				}, -- [18]
				{
					["default"] = true,
					["key"] = "fullAnnounce",
					["name"] = "Announce Full Symbol",
					["type"] = "toggle",
					["useDesc"] = false,
					["width"] = 2,
				}, -- [19]
				{
					["default"] = "%n",
					["desc"] = "%n will be replaced by the symbol text",
					["key"] = "text",
					["length"] = 10,
					["multiline"] = false,
					["name"] = "Output text (%n will be replaced)",
					["type"] = "input",
					["useDesc"] = true,
					["useLength"] = false,
					["width"] = 2,
				}, -- [20]
				{
					["default"] = true,
					["key"] = "wrongInput",
					["name"] = "Warning in chat, if wrong input",
					["type"] = "toggle",
					["useDesc"] = false,
					["width"] = 2,
				}, -- [21]
				{
					["default"] = true,
					["key"] = "symbolHide",
					["name"] = "Hide Symbols when Path is known",
					["type"] = "toggle",
					["useDesc"] = false,
					["width"] = 2,
				}, -- [22]
				{
					["collapse"] = false,
					["groupType"] = "simple",
					["hideReorder"] = true,
					["key"] = "translation",
					["limitType"] = "none",
					["name"] = "Translation",
					["nameSource"] = 0,
					["size"] = 10,
					["subOptions"] = {
						{
							["default"] = "Flower",
							["key"] = "Flower",
							["length"] = 10,
							["multiline"] = false,
							["name"] = "Flower",
							["type"] = "input",
							["useDesc"] = false,
							["useLength"] = false,
							["width"] = 1,
						}, -- [1]
						{
							["default"] = "Leaf",
							["key"] = "Leaf",
							["length"] = 10,
							["multiline"] = false,
							["name"] = "Leaf",
							["type"] = "input",
							["useDesc"] = false,
							["useLength"] = false,
							["width"] = 1,
						}, -- [2]
						{
							["default"] = "Full",
							["key"] = "Full",
							["length"] = 10,
							["multiline"] = false,
							["name"] = "Full",
							["type"] = "input",
							["useDesc"] = false,
							["useLength"] = false,
							["width"] = 1,
						}, -- [3]
						{
							["default"] = "Empty",
							["key"] = "Empty",
							["length"] = 10,
							["multiline"] = false,
							["name"] = "Empty",
							["type"] = "input",
							["useDesc"] = false,
							["useLength"] = false,
							["width"] = 1,
						}, -- [4]
						{
							["default"] = "Circle",
							["key"] = "Circle",
							["length"] = 10,
							["multiline"] = false,
							["name"] = "Circle",
							["type"] = "input",
							["useDesc"] = false,
							["useLength"] = false,
							["width"] = 1,
						}, -- [5]
						{
							["default"] = "NoCircle",
							["key"] = "NoCircle",
							["length"] = 10,
							["multiline"] = false,
							["name"] = "No Circle",
							["type"] = "input",
							["useDesc"] = false,
							["useLength"] = false,
							["width"] = 1,
						}, -- [6]
						{
							["default"] = "_",
							["key"] = "_",
							["length"] = 10,
							["multiline"] = false,
							["name"] = "Seperator Symbol",
							["type"] = "input",
							["useDesc"] = false,
							["useLength"] = false,
							["width"] = 1,
						}, -- [7]
					},
					["type"] = "group",
					["useCollapse"] = true,
					["width"] = 1,
				}, -- [23]
			},
			["auto"] = true,
			["automaticWidth"] = "Auto",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["config"] = {
				["aloneColor"] = {
					0.12549019607843, -- [1]
					1, -- [2]
					0, -- [3]
					1, -- [4]
				},
				["announce"] = true,
				["bossTextColor"] = {
					0.86666666666667, -- [1]
					0, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["channel"] = 1,
				["fullAnnounce"] = true,
				["glowOn"] = true,
				["hiddenColor"] = {
					0, -- [1]
					0, -- [2]
					0, -- [3]
					0, -- [4]
				},
				["hiddenTextColor"] = {
					0, -- [1]
					0, -- [2]
					0, -- [3]
					0, -- [4]
				},
				["mbTextColor"] = {
					1, -- [1]
					0.16862745098039, -- [2]
					0, -- [3]
					1, -- [4]
				},
				["mbcTextColor"] = {
					1, -- [1]
					0.48235294117647, -- [2]
					0, -- [3]
					1, -- [4]
				},
				["noColor"] = {
					0.21960784313725, -- [1]
					0.21960784313725, -- [2]
					0.21960784313725, -- [3]
					0.48319041728973, -- [4]
				},
				["othersColor"] = {
					1, -- [1]
					0.97647058823529, -- [2]
					0, -- [3]
					1, -- [4]
				},
				["symbolHide"] = true,
				["symbolHighlight"] = {
					0.058823529411765, -- [1]
					1, -- [2]
					0.17254901960784, -- [3]
					0.66675889492035, -- [4]
				},
				["symbolNotPossible"] = {
					1, -- [1]
					0.17254901960784, -- [2]
					0.098039215686275, -- [3]
					0.5702143907547, -- [4]
				},
				["symbolPossible"] = {
					0.22745098039216, -- [1]
					0.23529411764706, -- [2]
					0.23529411764706, -- [3]
					0.8500000089407, -- [4]
				},
				["text"] = "%n",
				["translation"] = {
					["Circle"] = "Circle",
					["Empty"] = "Empty",
					["Flower"] = "Flower",
					["Full"] = "Full",
					["Leaf"] = "Leaf",
					["NoCircle"] = "NoCircle",
					["_"] = "_",
				},
				["trashTextColor"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["wrongInput"] = true,
			},
			["cooldown"] = false,
			["cooldownEdge"] = false,
			["cooldownSwipe"] = true,
			["cooldownTextDisabled"] = false,
			["customText"] = "function()\n    return aura_env.text\nend",
			["customTextUpdate"] = "event",
			["desaturate"] = false,
			["displayText"] = "%c\n",
			["displayText_format_p_format"] = "timed",
			["displayText_format_p_time_dynamic_threshold"] = 60,
			["displayText_format_p_time_format"] = 0,
			["displayText_format_p_time_precision"] = 1,
			["fixedWidth"] = 200,
			["font"] = "Expressway",
			["fontSize"] = 12,
			["frameStrata"] = 1,
			["height"] = 64,
			["icon"] = true,
			["id"] = "MMN_MazeController",
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["internalVersion"] = 45,
			["inverse"] = false,
			["justify"] = "LEFT",
			["keepAspectRatio"] = false,
			["load"] = {
				["class"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
				},
				["size"] = {
					["multi"] = {
						["party"] = true,
					},
					["single"] = "party",
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["use_never"] = false,
				["use_size"] = true,
				["use_zoneIds"] = true,
				["zoneIds"] = "1669",
			},
			["outline"] = "OUTLINE",
			["parent"] = "Mists Maze Navigator v2 by Omny",
			["preferToUpdate"] = false,
			["regionType"] = "text",
			["selfPoint"] = "LEFT",
			["semver"] = "2.0.6",
			["shadowColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["shadowXOffset"] = 1,
			["shadowYOffset"] = -1,
			["subRegions"] = {
			},
			["tocversion"] = 90002,
			["triggers"] = {
				[1] = {
					["trigger"] = {
						["custom"] = "function(e, subEvent,...) \n    if(subEvent == \"Start\") then\n        \n        if(not aura_env.started) then\n            \n            aura_env.start()\n        end\n        aura_env.updateAll()\n        WeakAuras.ScanEvents(\"OmnyMazeV2\", \"Show\")\n        \n    end\n    \n    if(subEvent == \"RoomButton\") then\n        \n        return aura_env.clickRoomButton(...)\n        \n    end \n    \n    if( subEvent == \"Back\") then\n        \n        aura_env.back()\n        \n        return true\n        \n    end\n    \n    if(subEvent==\"Reset\" or subEvent ==\"Hide\") then\n        return false\n    end\n    \n    if(subEvent==\"Clicked\")then\n        aura_env.clickSymbol(...)\n        return true \n    end\n    \n    return true\nend",
						["custom_hide"] = "timed",
						["custom_type"] = "event",
						["debuffType"] = "HELPFUL",
						["duration"] = "0",
						["event"] = "Health",
						["events"] = "OmnyMazeV2, OmnyMazeGame",
						["names"] = {
						},
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "custom",
						["unevent"] = "auto",
						["unit"] = "player",
						["use_absorbMode"] = true,
						["use_unit"] = true,
					},
					["untrigger"] = {
					},
				},
				[2] = {
					["trigger"] = {
						["debuffType"] = "HELPFUL",
						["duration"] = "1",
						["event"] = "Conditions",
						["genericShowOn"] = "showOnCooldown",
						["realSpellName"] = 0,
						["spellName"] = 0,
						["type"] = "unit",
						["unevent"] = "auto",
						["unit"] = "player",
						["use_alwaystrue"] = true,
						["use_genericShowOn"] = true,
						["use_spellName"] = true,
						["use_track"] = true,
					},
					["untrigger"] = {
					},
				},
				["activeTriggerMode"] = -10,
				["disjunctive"] = "any",
			},
			["uid"] = "5qvH6JbzOpZ",
			["url"] = "https://wago.io/XkZJuvlLH/17",
			["version"] = 17,
			["width"] = 64,
			["wordWrap"] = "WordWrap",
			["xOffset"] = -75,
			["yOffset"] = 82,
			["zoom"] = 0,
		},
		["MMN_Maze_Button1"] = {
			["actions"] = {
				["finish"] = {
				},
				["init"] = {
					["custom"] = "local id = 1\nif(not aura_env.button) then\n    local b = CreateFrame(\"Button\", \"WA_SnowBoom4\", WeakAuras.regions[aura_env.id].region)\n    b:SetAllPoints(WeakAuras.regions[aura_env.id].region)\n    \n    local function createHighlightTexture(self)\n        local texture = self:CreateTexture(nil, \"OVERLAY\")\n        self.highlight = texture\n        texture:SetTexture([[Interface\\QuestFrame\\UI-QuestLogTitleHighlight]])\n        texture:SetBlendMode(\"ADD\")\n        texture:SetAllPoints(self)\n        texture:SetAlpha(1)\n        return texture\n    end\n    \n    local function onButtonEnter(self)\n        if not self.highlight then\n            createHighlightTexture(self)\n        end\n        self.highlight:Show()\n    end\n    \n    local function onButtonLeave(self)\n        if self.highlight then\n            self.highlight:Hide()\n        end\n    end\n    \n    b:RegisterForClicks(\"LeftButtonDown\")\n    \n    b:SetScript(\"OnClick\", function()\n            WeakAuras.ScanEvents(\"OmnyMazeV2\",\"RoomButton\",id)\n    end)\n    \n    b:SetScript(\"OnEnter\", onButtonEnter)\n    b:SetScript(\"OnLeave\", onButtonLeave)\n    \n    aura_env.button = b\nend\n\naura_env.text = \"\"\naura_env.bId = id\naura_env.shouldGlow = false\n\naura_env.update = function(displayId, color, textColor, shouldGlow, active)\n    \n    aura_env.region.subRegions[1].text:SetText(displayId)\n    aura_env.colorButton(color, textColor)\n    aura_env.shouldGlow = shouldGlow\n    if(active)then\n        aura_env.button:Enable()\n    else\n        aura_env.button:Disable()\n    end \nend\n\naura_env.colorButton = function(color, textColor)\n    \n    local r,g,b,a = unpack(color)\n    local tr,tg,tb,ta = unpack(textColor)\n    \n    aura_env.region:SetAnimAlpha(a)\n    aura_env.region.Color(a, r, g, b)\n    \n    aura_env.region.subRegions[1].Color(ta, tr, tg, tb)\n    \n    \nend\n\n\n",
					["do_custom"] = true,
				},
				["start"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
			},
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["anchorPoint"] = "CENTER",
			["animation"] = {
				["finish"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["start"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
			},
			["authorOptions"] = {
			},
			["auto"] = false,
			["color"] = {
				0, -- [1]
				1, -- [2]
				0.13333333333333, -- [3]
				1, -- [4]
			},
			["conditions"] = {
				{
					["changes"] = {
						{
							["property"] = "customcode",
							["value"] = {
								["custom"] = "aura_env.button:Enable()",
							},
						}, -- [1]
					},
					["check"] = {
						["trigger"] = 1,
						["value"] = 0,
						["variable"] = "show",
					},
				}, -- [1]
				{
					["changes"] = {
						{
							["property"] = "sub.2.glow",
							["value"] = true,
						}, -- [1]
					},
					["check"] = {
						["trigger"] = -1,
						["value"] = "function(...)\n    if(aura_env and aura_env.shouldGlow) then\n        return aura_env.shouldGlow\n    end\n    return false\nend",
						["variable"] = "customcheck",
					},
				}, -- [2]
			},
			["config"] = {
			},
			["cooldown"] = false,
			["cooldownEdge"] = false,
			["cooldownSwipe"] = true,
			["cooldownTextDisabled"] = false,
			["customText"] = "\n",
			["desaturate"] = false,
			["displayIcon"] = "Interface\\Addons\\WeakAuras\\Media\\Textures\\Square_Smooth.tga",
			["frameStrata"] = 1,
			["height"] = 20,
			["icon"] = true,
			["iconSource"] = 0,
			["id"] = "MMN_Maze_Button1",
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["internalVersion"] = 45,
			["inverse"] = false,
			["keepAspectRatio"] = false,
			["load"] = {
				["class"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
				},
				["size"] = {
					["multi"] = {
						["party"] = true,
					},
					["single"] = "party",
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["use_never"] = false,
				["use_size"] = true,
				["use_zoneIds"] = true,
				["zoneIds"] = "1669",
			},
			["parent"] = "Mists Maze Navigator v2 by Omny",
			["preferToUpdate"] = false,
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["semver"] = "2.0.6",
			["subRegions"] = {
				{
					["anchorXOffset"] = 0,
					["anchorYOffset"] = 0,
					["rotateText"] = "NONE",
					["text_anchorPoint"] = "CENTER",
					["text_automaticWidth"] = "Auto",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_fixedWidth"] = 64,
					["text_font"] = "Expressway",
					["text_fontSize"] = 14,
					["text_fontType"] = "OUTLINE",
					["text_justify"] = "CENTER",
					["text_selfPoint"] = "AUTO",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_shadowXOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["text_text"] = "",
					["text_text_format_s_format"] = "none",
					["text_visible"] = true,
					["text_wordWrap"] = "WordWrap",
					["type"] = "subtext",
				}, -- [1]
				{
					["glow"] = false,
					["glowBorder"] = false,
					["glowColor"] = {
						0, -- [1]
						1, -- [2]
						0.090196078431373, -- [3]
						1, -- [4]
					},
					["glowFrequency"] = 0.25,
					["glowLength"] = 10,
					["glowLines"] = 8,
					["glowScale"] = 1,
					["glowThickness"] = 1,
					["glowType"] = "buttonOverlay",
					["glowXOffset"] = 0,
					["glowYOffset"] = 0,
					["type"] = "subglow",
					["useGlowColor"] = true,
				}, -- [2]
				{
					["border_color"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["border_edge"] = "1 Pixel",
					["border_offset"] = 0,
					["border_size"] = 1,
					["border_visible"] = true,
					["type"] = "subborder",
				}, -- [3]
			},
			["tocversion"] = 90002,
			["triggers"] = {
				[1] = {
					["trigger"] = {
						["custom"] = "function(_,subEvent, ...)\n    if(subEvent == \"Show\") then\n        return true \n    end\n    \n    return \nend",
						["custom_hide"] = "custom",
						["custom_type"] = "event",
						["debuffType"] = "HELPFUL",
						["event"] = "Health",
						["events"] = "OmnyMazeV2",
						["names"] = {
						},
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "custom",
						["unit"] = "player",
					},
					["untrigger"] = {
						["custom"] = "function(_,subEvent, ...)\n    \n    if(subEvent==\"Reset\" or subEvent ==\"Hide\") then\n        \n        return true\n        \n    end\n    \n    return false\n    \nend",
					},
				},
				[2] = {
					["trigger"] = {
						["custom"] = "function(_,subEvent, ...)\n    if(subEvent == \"ButtonUpdate\") then\n        local id, displayId ,color, textColor, shouldGlow, active = ...\n        \n        if(id == aura_env.bId)then\n            aura_env.update(displayId, color, textColor, shouldGlow, active)\n            return true\n        end        \n    end\nend",
						["custom_hide"] = "timed",
						["custom_type"] = "event",
						["debuffType"] = "HELPFUL",
						["duration"] = "0",
						["events"] = "OmnyMazeV2",
						["type"] = "custom",
						["unit"] = "player",
					},
					["untrigger"] = {
						["custom"] = "function(_,subEvent, ...)\n    if(subEvent == \"ButtonUpdate\")then\n        local id, _ ,_, _, _, active = ...\n        return id == aura_env.bId and not active\n    end\nend",
					},
				},
				["activeTriggerMode"] = -10,
				["customTriggerLogic"] = "function(trigger)\n    return trigger[1]\nend",
				["disjunctive"] = "custom",
			},
			["uid"] = "jiOkeI1Ufjn",
			["url"] = "https://wago.io/XkZJuvlLH/17",
			["version"] = 17,
			["width"] = 48,
			["xOffset"] = -52,
			["yOffset"] = -86,
			["zoom"] = 0,
		},
		["MMN_Maze_Button2"] = {
			["actions"] = {
				["finish"] = {
				},
				["init"] = {
					["custom"] = "local id = 2\nif(not aura_env.button) then\n    local b = CreateFrame(\"Button\", \"WA_SnowBoom4\", WeakAuras.regions[aura_env.id].region)\n    b:SetAllPoints(WeakAuras.regions[aura_env.id].region)\n    \n    local function createHighlightTexture(self)\n        local texture = self:CreateTexture(nil, \"OVERLAY\")\n        self.highlight = texture\n        texture:SetTexture([[Interface\\QuestFrame\\UI-QuestLogTitleHighlight]])\n        texture:SetBlendMode(\"ADD\")\n        texture:SetAllPoints(self)\n        texture:SetAlpha(1)\n        return texture\n    end\n    \n    local function onButtonEnter(self)\n        if not self.highlight then\n            createHighlightTexture(self)\n        end\n        self.highlight:Show()\n    end\n    \n    local function onButtonLeave(self)\n        if self.highlight then\n            self.highlight:Hide()\n        end\n    end\n    \n    b:RegisterForClicks(\"LeftButtonDown\")\n    \n    b:SetScript(\"OnClick\", function()\n            WeakAuras.ScanEvents(\"OmnyMazeV2\",\"RoomButton\",id)\n    end)\n    \n    b:SetScript(\"OnEnter\", onButtonEnter)\n    b:SetScript(\"OnLeave\", onButtonLeave)\n    \n    aura_env.button = b\nend\n\naura_env.text = \"\"\naura_env.bId = id\naura_env.shouldGlow = false\n\naura_env.update = function(displayId, color, textColor, shouldGlow, active)\n    \n    aura_env.region.subRegions[1].text:SetText(displayId)\n    aura_env.colorButton(color, textColor)\n    aura_env.shouldGlow = shouldGlow\n    if(active)then\n        aura_env.button:Enable()\n    else\n        aura_env.button:Disable()\n    end\nend\n\naura_env.colorButton = function(color, textColor)\n    \n    local r,g,b,a = unpack(color)\n    local tr,tg,tb,ta = unpack(textColor)\n    \n    aura_env.region:SetAnimAlpha(a)\n    aura_env.region.Color(a, r, g, b)\n    \n    aura_env.region.subRegions[1].Color(ta, tr, tg, tb)\n    \n    \nend\n\n\n",
					["do_custom"] = true,
				},
				["start"] = {
				},
			},
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["anchorPoint"] = "CENTER",
			["animation"] = {
				["finish"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["start"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
			},
			["authorOptions"] = {
			},
			["auto"] = false,
			["color"] = {
				0, -- [1]
				1, -- [2]
				0.13333333333333, -- [3]
				1, -- [4]
			},
			["conditions"] = {
				{
					["changes"] = {
						{
							["property"] = "customcode",
							["value"] = {
								["custom"] = "aura_env.button:Enable()",
							},
						}, -- [1]
					},
					["check"] = {
						["trigger"] = 1,
						["value"] = 0,
						["variable"] = "show",
					},
				}, -- [1]
				{
					["changes"] = {
						{
							["property"] = "sub.2.glow",
							["value"] = true,
						}, -- [1]
					},
					["check"] = {
						["trigger"] = -1,
						["value"] = "function(...)\n    if(aura_env and aura_env.shouldGlow) then\n        return aura_env.shouldGlow\n    end\n    return false\nend",
						["variable"] = "customcheck",
					},
				}, -- [2]
			},
			["config"] = {
			},
			["cooldown"] = false,
			["cooldownEdge"] = false,
			["cooldownSwipe"] = true,
			["cooldownTextDisabled"] = false,
			["customText"] = "\n",
			["desaturate"] = false,
			["displayIcon"] = "Interface\\Addons\\WeakAuras\\Media\\Textures\\Square_Smooth.tga",
			["frameStrata"] = 1,
			["height"] = 20,
			["icon"] = true,
			["iconSource"] = 0,
			["id"] = "MMN_Maze_Button2",
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["internalVersion"] = 45,
			["inverse"] = false,
			["keepAspectRatio"] = false,
			["load"] = {
				["class"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
				},
				["size"] = {
					["multi"] = {
						["party"] = true,
					},
					["single"] = "party",
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["use_never"] = false,
				["use_size"] = true,
				["use_zoneIds"] = true,
				["zoneIds"] = "1669",
			},
			["parent"] = "Mists Maze Navigator v2 by Omny",
			["preferToUpdate"] = false,
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["semver"] = "2.0.6",
			["subRegions"] = {
				{
					["anchorXOffset"] = 0,
					["anchorYOffset"] = 0,
					["rotateText"] = "NONE",
					["text_anchorPoint"] = "CENTER",
					["text_automaticWidth"] = "Auto",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_fixedWidth"] = 64,
					["text_font"] = "Expressway",
					["text_fontSize"] = 14,
					["text_fontType"] = "OUTLINE",
					["text_justify"] = "CENTER",
					["text_selfPoint"] = "AUTO",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_shadowXOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["text_text"] = "",
					["text_text_format_s_format"] = "none",
					["text_visible"] = true,
					["text_wordWrap"] = "WordWrap",
					["type"] = "subtext",
				}, -- [1]
				{
					["glow"] = false,
					["glowBorder"] = false,
					["glowColor"] = {
						0, -- [1]
						1, -- [2]
						0.090196078431373, -- [3]
						1, -- [4]
					},
					["glowFrequency"] = 0.25,
					["glowLength"] = 10,
					["glowLines"] = 8,
					["glowScale"] = 1,
					["glowThickness"] = 1,
					["glowType"] = "buttonOverlay",
					["glowXOffset"] = 0,
					["glowYOffset"] = 0,
					["type"] = "subglow",
					["useGlowColor"] = true,
				}, -- [2]
				{
					["border_color"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["border_edge"] = "1 Pixel",
					["border_offset"] = 0,
					["border_size"] = 1,
					["border_visible"] = true,
					["type"] = "subborder",
				}, -- [3]
			},
			["tocversion"] = 90002,
			["triggers"] = {
				[1] = {
					["trigger"] = {
						["custom"] = "function(_,subEvent, ...)\n    if(subEvent == \"Show\") then\n        return true \n    end\n    \n    return \nend",
						["custom_hide"] = "custom",
						["custom_type"] = "event",
						["debuffType"] = "HELPFUL",
						["event"] = "Health",
						["events"] = "OmnyMazeV2",
						["names"] = {
						},
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "custom",
						["unit"] = "player",
					},
					["untrigger"] = {
						["custom"] = "function(_,subEvent, ...)\n    \n    if(subEvent==\"Reset\" or subEvent ==\"Hide\") then\n        \n        return true\n        \n    end\n    \n    return false\n    \nend",
					},
				},
				[2] = {
					["trigger"] = {
						["custom"] = "function(_,subEvent, ...)\n    if(subEvent == \"ButtonUpdate\") then\n        local id, displayId ,color, textColor, shouldGlow, active = ...\n        \n        if(id == aura_env.bId)then\n            aura_env.update(displayId, color, textColor, shouldGlow, active)\n            return true\n        end        \n    end\nend",
						["custom_hide"] = "timed",
						["custom_type"] = "event",
						["debuffType"] = "HELPFUL",
						["duration"] = "0",
						["events"] = "OmnyMazeV2",
						["type"] = "custom",
						["unit"] = "player",
					},
					["untrigger"] = {
						["custom"] = "function(_,subEvent, ...)\n    if(subEvent == \"ButtonUpdate\")then\n        local id, _ ,_, _, _, active = ...\n        return id == aura_env.bId and not active\n    end\nend",
					},
				},
				["activeTriggerMode"] = -10,
				["customTriggerLogic"] = "function(trigger)\n    return trigger[1]\nend",
				["disjunctive"] = "custom",
			},
			["uid"] = "7PefAoBVM9I",
			["url"] = "https://wago.io/XkZJuvlLH/17",
			["version"] = 17,
			["width"] = 48,
			["xOffset"] = 0,
			["yOffset"] = -86,
			["zoom"] = 0,
		},
		["MMN_Maze_Button3"] = {
			["actions"] = {
				["finish"] = {
				},
				["init"] = {
					["custom"] = "local id = 3\nif(not aura_env.button) then\n    local b = CreateFrame(\"Button\", \"WA_SnowBoom4\", WeakAuras.regions[aura_env.id].region)\n    b:SetAllPoints(WeakAuras.regions[aura_env.id].region)\n    \n    local function createHighlightTexture(self)\n        local texture = self:CreateTexture(nil, \"OVERLAY\")\n        self.highlight = texture\n        texture:SetTexture([[Interface\\QuestFrame\\UI-QuestLogTitleHighlight]])\n        texture:SetBlendMode(\"ADD\")\n        texture:SetAllPoints(self)\n        texture:SetAlpha(1)\n        return texture\n    end\n    \n    local function onButtonEnter(self)\n        if not self.highlight then\n            createHighlightTexture(self)\n        end\n        self.highlight:Show()\n    end\n    \n    local function onButtonLeave(self)\n        if self.highlight then\n            self.highlight:Hide()\n        end\n    end\n    \n    b:RegisterForClicks(\"LeftButtonDown\")\n    \n    b:SetScript(\"OnClick\", function()\n            WeakAuras.ScanEvents(\"OmnyMazeV2\",\"RoomButton\",id)\n    end)\n    \n    b:SetScript(\"OnEnter\", onButtonEnter)\n    b:SetScript(\"OnLeave\", onButtonLeave)\n    \n    aura_env.button = b\nend\n\naura_env.text = \"\"\naura_env.bId = id\naura_env.shouldGlow = false\n\naura_env.update = function(displayId, color, textColor, shouldGlow, active)\n    \n    aura_env.region.subRegions[1].text:SetText(displayId)\n    aura_env.colorButton(color, textColor)\n    aura_env.shouldGlow = shouldGlow\n    if(active)then\n        aura_env.button:Enable()\n    else\n        aura_env.button:Disable()\n    end\nend\n\naura_env.colorButton = function(color, textColor)\n    \n    local r,g,b,a = unpack(color)\n    local tr,tg,tb,ta = unpack(textColor)\n    \n    aura_env.region:SetAnimAlpha(a)\n    aura_env.region.Color(a, r, g, b)\n    \n    aura_env.region.subRegions[1].Color(ta, tr, tg, tb)\n    \n    \nend\n\n\n",
					["do_custom"] = true,
				},
				["start"] = {
				},
			},
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["anchorPoint"] = "CENTER",
			["animation"] = {
				["finish"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["start"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
			},
			["authorOptions"] = {
			},
			["auto"] = false,
			["color"] = {
				0, -- [1]
				1, -- [2]
				0.13333333333333, -- [3]
				1, -- [4]
			},
			["conditions"] = {
				{
					["changes"] = {
						{
							["property"] = "customcode",
							["value"] = {
								["custom"] = "aura_env.button:Enable()",
							},
						}, -- [1]
					},
					["check"] = {
						["trigger"] = 1,
						["value"] = 0,
						["variable"] = "show",
					},
				}, -- [1]
				{
					["changes"] = {
						{
							["property"] = "sub.2.glow",
							["value"] = true,
						}, -- [1]
					},
					["check"] = {
						["trigger"] = -1,
						["value"] = "function(...)\n    if(aura_env and aura_env.shouldGlow) then\n        return aura_env.shouldGlow\n    end\n    return false\nend",
						["variable"] = "customcheck",
					},
				}, -- [2]
			},
			["config"] = {
			},
			["cooldown"] = false,
			["cooldownEdge"] = false,
			["cooldownSwipe"] = true,
			["cooldownTextDisabled"] = false,
			["customText"] = "\n",
			["desaturate"] = false,
			["displayIcon"] = "Interface\\Addons\\WeakAuras\\Media\\Textures\\Square_Smooth.tga",
			["frameStrata"] = 1,
			["height"] = 20,
			["icon"] = true,
			["iconSource"] = 0,
			["id"] = "MMN_Maze_Button3",
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["internalVersion"] = 45,
			["inverse"] = false,
			["keepAspectRatio"] = false,
			["load"] = {
				["class"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
				},
				["size"] = {
					["multi"] = {
						["party"] = true,
					},
					["single"] = "party",
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["use_never"] = false,
				["use_size"] = true,
				["use_zoneIds"] = true,
				["zoneIds"] = "1669",
			},
			["parent"] = "Mists Maze Navigator v2 by Omny",
			["preferToUpdate"] = false,
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["semver"] = "2.0.6",
			["subRegions"] = {
				{
					["anchorXOffset"] = 0,
					["anchorYOffset"] = 0,
					["rotateText"] = "NONE",
					["text_anchorPoint"] = "CENTER",
					["text_automaticWidth"] = "Auto",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_fixedWidth"] = 64,
					["text_font"] = "Expressway",
					["text_fontSize"] = 14,
					["text_fontType"] = "OUTLINE",
					["text_justify"] = "CENTER",
					["text_selfPoint"] = "AUTO",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_shadowXOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["text_text"] = "",
					["text_text_format_s_format"] = "none",
					["text_visible"] = true,
					["text_wordWrap"] = "WordWrap",
					["type"] = "subtext",
				}, -- [1]
				{
					["glow"] = false,
					["glowBorder"] = false,
					["glowColor"] = {
						0, -- [1]
						1, -- [2]
						0.090196078431373, -- [3]
						1, -- [4]
					},
					["glowFrequency"] = 0.25,
					["glowLength"] = 10,
					["glowLines"] = 8,
					["glowScale"] = 1,
					["glowThickness"] = 1,
					["glowType"] = "buttonOverlay",
					["glowXOffset"] = 0,
					["glowYOffset"] = 0,
					["type"] = "subglow",
					["useGlowColor"] = true,
				}, -- [2]
				{
					["border_color"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["border_edge"] = "1 Pixel",
					["border_offset"] = 0,
					["border_size"] = 1,
					["border_visible"] = true,
					["type"] = "subborder",
				}, -- [3]
			},
			["tocversion"] = 90002,
			["triggers"] = {
				[1] = {
					["trigger"] = {
						["custom"] = "function(_,subEvent, ...)\n    if(subEvent == \"Show\") then\n        return true \n    end\n    \n    return \nend",
						["custom_hide"] = "custom",
						["custom_type"] = "event",
						["debuffType"] = "HELPFUL",
						["event"] = "Health",
						["events"] = "OmnyMazeV2",
						["names"] = {
						},
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "custom",
						["unit"] = "player",
					},
					["untrigger"] = {
						["custom"] = "function(_,subEvent, ...)\n    \n    if(subEvent==\"Reset\" or subEvent ==\"Hide\") then\n        \n        return true\n        \n    end\n    \n    return false\n    \nend",
					},
				},
				[2] = {
					["trigger"] = {
						["custom"] = "function(_,subEvent, ...)\n    if(subEvent == \"ButtonUpdate\") then\n        local id, displayId ,color, textColor, shouldGlow, active = ...\n        \n        if(id == aura_env.bId)then\n            aura_env.update(displayId, color, textColor, shouldGlow, active)\n            return true\n        end        \n    end\nend",
						["custom_hide"] = "timed",
						["custom_type"] = "event",
						["debuffType"] = "HELPFUL",
						["duration"] = "0",
						["events"] = "OmnyMazeV2",
						["type"] = "custom",
						["unit"] = "player",
					},
					["untrigger"] = {
						["custom"] = "function(_,subEvent, ...)\n    if(subEvent == \"ButtonUpdate\")then\n        local id, _ ,_, _, _, active = ...\n        return id == aura_env.bId and not active\n    end\nend",
					},
				},
				["activeTriggerMode"] = -10,
				["customTriggerLogic"] = "function(trigger)\n    return trigger[1]\nend",
				["disjunctive"] = "custom",
			},
			["uid"] = "tBCMPULBosW",
			["url"] = "https://wago.io/XkZJuvlLH/17",
			["version"] = 17,
			["width"] = 48,
			["xOffset"] = 52,
			["yOffset"] = -86,
			["zoom"] = 0,
		},
		["MMN_Maze_Button4"] = {
			["actions"] = {
				["finish"] = {
					["custom"] = "",
					["do_custom"] = false,
					["do_message"] = false,
				},
				["init"] = {
					["custom"] = "local id = 4\nif(not aura_env.button) then\n    local b = CreateFrame(\"Button\", \"WA_SnowBoom4\", WeakAuras.regions[aura_env.id].region)\n    b:SetAllPoints(WeakAuras.regions[aura_env.id].region)\n    \n    local function createHighlightTexture(self)\n        local texture = self:CreateTexture(nil, \"OVERLAY\")\n        self.highlight = texture\n        texture:SetTexture([[Interface\\QuestFrame\\UI-QuestLogTitleHighlight]])\n        texture:SetBlendMode(\"ADD\")\n        texture:SetAllPoints(self)\n        texture:SetAlpha(1)\n        return texture\n    end\n    \n    local function onButtonEnter(self)\n        if not self.highlight then\n            createHighlightTexture(self)\n        end\n        self.highlight:Show()\n    end\n    \n    local function onButtonLeave(self)\n        if self.highlight then\n            self.highlight:Hide()\n        end\n    end\n    \n    b:RegisterForClicks(\"LeftButtonDown\")\n    \n    b:SetScript(\"OnClick\", function()\n            WeakAuras.ScanEvents(\"OmnyMazeV2\",\"RoomButton\",id)\n    end)\n    \n    b:SetScript(\"OnEnter\", onButtonEnter)\n    b:SetScript(\"OnLeave\", onButtonLeave)\n    \n    aura_env.button = b\nend\n\naura_env.text = \"\"\naura_env.bId = id\naura_env.shouldGlow = false\n\naura_env.update = function(displayId, color, textColor, shouldGlow, active)\n    \n    aura_env.region.subRegions[1].text:SetText(displayId)\n    aura_env.colorButton(color, textColor)\n    aura_env.shouldGlow = shouldGlow\n    if(active)then\n        aura_env.button:Enable()\n    else\n        aura_env.button:Disable()\n    end\nend\n\naura_env.colorButton = function(color, textColor)\n    \n    local r,g,b,a = unpack(color)\n    local tr,tg,tb,ta = unpack(textColor)\n    \n    aura_env.region:SetAnimAlpha(a)\n    aura_env.region.Color(a, r, g, b)\n    \n    aura_env.region.subRegions[1].Color(ta, tr, tg, tb)\n    \n    \nend\n\n\n",
					["do_custom"] = true,
				},
				["start"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
			},
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["anchorPoint"] = "CENTER",
			["animation"] = {
				["finish"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["start"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
			},
			["authorOptions"] = {
			},
			["auto"] = false,
			["color"] = {
				0, -- [1]
				1, -- [2]
				0.13333333333333, -- [3]
				1, -- [4]
			},
			["conditions"] = {
				{
					["changes"] = {
						{
							["property"] = "customcode",
							["value"] = {
								["custom"] = "aura_env.button:Enable()",
							},
						}, -- [1]
					},
					["check"] = {
						["trigger"] = 1,
						["value"] = 0,
						["variable"] = "show",
					},
				}, -- [1]
				{
					["changes"] = {
						{
							["property"] = "sub.2.glow",
							["value"] = true,
						}, -- [1]
					},
					["check"] = {
						["trigger"] = -1,
						["value"] = "function(...)\n    if(aura_env and aura_env.shouldGlow) then\n        return aura_env.shouldGlow\n    end\n    return false\nend",
						["variable"] = "customcheck",
					},
				}, -- [2]
			},
			["config"] = {
			},
			["cooldown"] = false,
			["cooldownEdge"] = false,
			["cooldownSwipe"] = true,
			["cooldownTextDisabled"] = false,
			["customText"] = "\n",
			["desaturate"] = false,
			["displayIcon"] = "Interface\\Addons\\WeakAuras\\Media\\Textures\\Square_Smooth.tga",
			["frameStrata"] = 1,
			["height"] = 20,
			["icon"] = true,
			["iconSource"] = 0,
			["id"] = "MMN_Maze_Button4",
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["internalVersion"] = 45,
			["inverse"] = false,
			["keepAspectRatio"] = false,
			["load"] = {
				["class"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
				},
				["size"] = {
					["multi"] = {
						["party"] = true,
					},
					["single"] = "party",
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["use_never"] = false,
				["use_size"] = true,
				["use_zoneIds"] = true,
				["zoneIds"] = "1669",
			},
			["parent"] = "Mists Maze Navigator v2 by Omny",
			["preferToUpdate"] = false,
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["semver"] = "2.0.6",
			["subRegions"] = {
				{
					["anchorXOffset"] = 0,
					["anchorYOffset"] = 0,
					["rotateText"] = "NONE",
					["text_anchorPoint"] = "CENTER",
					["text_automaticWidth"] = "Auto",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_fixedWidth"] = 64,
					["text_font"] = "Expressway",
					["text_fontSize"] = 14,
					["text_fontType"] = "OUTLINE",
					["text_justify"] = "CENTER",
					["text_selfPoint"] = "AUTO",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_shadowXOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["text_text"] = "",
					["text_text_format_s_format"] = "none",
					["text_visible"] = true,
					["text_wordWrap"] = "WordWrap",
					["type"] = "subtext",
				}, -- [1]
				{
					["glow"] = false,
					["glowBorder"] = false,
					["glowColor"] = {
						0, -- [1]
						1, -- [2]
						0.090196078431373, -- [3]
						1, -- [4]
					},
					["glowFrequency"] = 0.25,
					["glowLength"] = 10,
					["glowLines"] = 8,
					["glowScale"] = 1,
					["glowThickness"] = 1,
					["glowType"] = "buttonOverlay",
					["glowXOffset"] = 0,
					["glowYOffset"] = 0,
					["type"] = "subglow",
					["useGlowColor"] = true,
				}, -- [2]
				{
					["border_color"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["border_edge"] = "1 Pixel",
					["border_offset"] = 0,
					["border_size"] = 1,
					["border_visible"] = true,
					["type"] = "subborder",
				}, -- [3]
			},
			["tocversion"] = 90002,
			["triggers"] = {
				[1] = {
					["trigger"] = {
						["custom"] = "function(_,subEvent, ...)\n    if(subEvent == \"Show\") then\n        return true \n    end\n    \n    return \nend",
						["custom_hide"] = "custom",
						["custom_type"] = "event",
						["debuffType"] = "HELPFUL",
						["event"] = "Health",
						["events"] = "OmnyMazeV2",
						["names"] = {
						},
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "custom",
						["unit"] = "player",
					},
					["untrigger"] = {
						["custom"] = "function(_,subEvent, ...)\n    \n    if(subEvent==\"Reset\" or subEvent ==\"Hide\") then\n        \n        return true\n        \n    end\n    \n    return false\n    \nend",
					},
				},
				[2] = {
					["trigger"] = {
						["custom"] = "function(_,subEvent, ...)\n    if(subEvent == \"ButtonUpdate\") then\n        local id, displayId ,color, textColor, shouldGlow, active = ...\n        \n        if(id == aura_env.bId)then\n            aura_env.update(displayId, color, textColor, shouldGlow, active)\n            return true\n        end        \n    end\nend",
						["custom_hide"] = "timed",
						["custom_type"] = "event",
						["debuffType"] = "HELPFUL",
						["duration"] = "0",
						["events"] = "OmnyMazeV2",
						["type"] = "custom",
						["unit"] = "player",
					},
					["untrigger"] = {
						["custom"] = "function(_,subEvent, ...)\n    if(subEvent == \"ButtonUpdate\")then\n        local id, _ ,_, _, _, active = ...\n        return id == aura_env.bId and not active\n    end\nend",
					},
				},
				["activeTriggerMode"] = -10,
				["customTriggerLogic"] = "function(trigger)\n    return trigger[1]\nend",
				["disjunctive"] = "custom",
			},
			["uid"] = "92dDH1Xxrwf",
			["url"] = "https://wago.io/XkZJuvlLH/17",
			["version"] = 17,
			["width"] = 48,
			["xOffset"] = -26,
			["yOffset"] = -108,
			["zoom"] = 0,
		},
		["MMN_Maze_Button5"] = {
			["actions"] = {
				["finish"] = {
				},
				["init"] = {
					["custom"] = "local id = 5\nif(not aura_env.button) then\n    local b = CreateFrame(\"Button\", \"WA_SnowBoom4\", WeakAuras.regions[aura_env.id].region)\n    b:SetAllPoints(WeakAuras.regions[aura_env.id].region)\n    \n    local function createHighlightTexture(self)\n        local texture = self:CreateTexture(nil, \"OVERLAY\")\n        self.highlight = texture\n        texture:SetTexture([[Interface\\QuestFrame\\UI-QuestLogTitleHighlight]])\n        texture:SetBlendMode(\"ADD\")\n        texture:SetAllPoints(self)\n        texture:SetAlpha(1)\n        return texture\n    end\n    \n    local function onButtonEnter(self)\n        if not self.highlight then\n            createHighlightTexture(self)\n        end\n        self.highlight:Show()\n    end\n    \n    local function onButtonLeave(self)\n        if self.highlight then\n            self.highlight:Hide()\n        end\n    end\n    \n    b:RegisterForClicks(\"LeftButtonDown\")\n    \n    b:SetScript(\"OnClick\", function()\n            WeakAuras.ScanEvents(\"OmnyMazeV2\",\"RoomButton\",id)\n    end)\n    \n    b:SetScript(\"OnEnter\", onButtonEnter)\n    b:SetScript(\"OnLeave\", onButtonLeave)\n    \n    aura_env.button = b\nend\n\naura_env.text = \"\"\naura_env.bId = id\naura_env.shouldGlow = false\n\naura_env.update = function(displayId, color, textColor, shouldGlow, active)\n    \n    aura_env.region.subRegions[1].text:SetText(displayId)\n    aura_env.colorButton(color, textColor)\n    aura_env.shouldGlow = shouldGlow\n    if(active)then\n        aura_env.button:Enable()\n    else\n        aura_env.button:Disable()\n    end\nend\n\naura_env.colorButton = function(color, textColor)\n    \n    local r,g,b,a = unpack(color)\n    local tr,tg,tb,ta = unpack(textColor)\n    \n    aura_env.region:SetAnimAlpha(a)\n    aura_env.region.Color(a, r, g, b)\n    \n    aura_env.region.subRegions[1].Color(ta, tr, tg, tb)\n    \n    \nend\n\n\n",
					["do_custom"] = true,
				},
				["start"] = {
				},
			},
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["anchorPoint"] = "CENTER",
			["animation"] = {
				["finish"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["start"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
			},
			["authorOptions"] = {
			},
			["auto"] = false,
			["color"] = {
				0, -- [1]
				1, -- [2]
				0.13333333333333, -- [3]
				1, -- [4]
			},
			["conditions"] = {
				{
					["changes"] = {
						{
							["property"] = "customcode",
							["value"] = {
								["custom"] = "aura_env.button:Enable()",
							},
						}, -- [1]
					},
					["check"] = {
						["trigger"] = 1,
						["value"] = 0,
						["variable"] = "show",
					},
				}, -- [1]
				{
					["changes"] = {
						{
							["property"] = "sub.2.glow",
							["value"] = true,
						}, -- [1]
					},
					["check"] = {
						["trigger"] = -1,
						["value"] = "function(...)\n    if(aura_env and aura_env.shouldGlow) then\n        return aura_env.shouldGlow\n    end\n    return false\nend",
						["variable"] = "customcheck",
					},
				}, -- [2]
			},
			["config"] = {
			},
			["cooldown"] = false,
			["cooldownEdge"] = false,
			["cooldownSwipe"] = true,
			["cooldownTextDisabled"] = false,
			["customText"] = "\n",
			["desaturate"] = false,
			["displayIcon"] = "Interface\\Addons\\WeakAuras\\Media\\Textures\\Square_Smooth.tga",
			["frameStrata"] = 1,
			["height"] = 20,
			["icon"] = true,
			["iconSource"] = 0,
			["id"] = "MMN_Maze_Button5",
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["internalVersion"] = 45,
			["inverse"] = false,
			["keepAspectRatio"] = false,
			["load"] = {
				["class"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
				},
				["size"] = {
					["multi"] = {
						["party"] = true,
					},
					["single"] = "party",
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["use_never"] = false,
				["use_size"] = true,
				["use_zoneIds"] = true,
				["zoneIds"] = "1669",
			},
			["parent"] = "Mists Maze Navigator v2 by Omny",
			["preferToUpdate"] = false,
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["semver"] = "2.0.6",
			["subRegions"] = {
				{
					["anchorXOffset"] = 0,
					["anchorYOffset"] = 0,
					["rotateText"] = "NONE",
					["text_anchorPoint"] = "CENTER",
					["text_automaticWidth"] = "Auto",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_fixedWidth"] = 64,
					["text_font"] = "Expressway",
					["text_fontSize"] = 14,
					["text_fontType"] = "OUTLINE",
					["text_justify"] = "CENTER",
					["text_selfPoint"] = "AUTO",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_shadowXOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["text_text"] = "",
					["text_text_format_s_format"] = "none",
					["text_visible"] = true,
					["text_wordWrap"] = "WordWrap",
					["type"] = "subtext",
				}, -- [1]
				{
					["glow"] = false,
					["glowBorder"] = false,
					["glowColor"] = {
						0, -- [1]
						1, -- [2]
						0.090196078431373, -- [3]
						1, -- [4]
					},
					["glowFrequency"] = 0.25,
					["glowLength"] = 10,
					["glowLines"] = 8,
					["glowScale"] = 1,
					["glowThickness"] = 1,
					["glowType"] = "buttonOverlay",
					["glowXOffset"] = 0,
					["glowYOffset"] = 0,
					["type"] = "subglow",
					["useGlowColor"] = true,
				}, -- [2]
				{
					["border_color"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["border_edge"] = "1 Pixel",
					["border_offset"] = 0,
					["border_size"] = 1,
					["border_visible"] = true,
					["type"] = "subborder",
				}, -- [3]
			},
			["tocversion"] = 90002,
			["triggers"] = {
				[1] = {
					["trigger"] = {
						["custom"] = "function(_,subEvent, ...)\n    if(subEvent == \"Show\") then\n        return true \n    end\n    \n    return \nend",
						["custom_hide"] = "custom",
						["custom_type"] = "event",
						["debuffType"] = "HELPFUL",
						["event"] = "Health",
						["events"] = "OmnyMazeV2",
						["names"] = {
						},
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "custom",
						["unit"] = "player",
					},
					["untrigger"] = {
						["custom"] = "function(_,subEvent, ...)\n    \n    if(subEvent==\"Reset\" or subEvent ==\"Hide\") then\n        \n        return true\n        \n    end\n    \n    return false\n    \nend",
					},
				},
				[2] = {
					["trigger"] = {
						["custom"] = "function(_,subEvent, ...)\n    if(subEvent == \"ButtonUpdate\") then\n        local id, displayId ,color, textColor, shouldGlow, active = ...\n        \n        if(id == aura_env.bId)then\n            aura_env.update(displayId, color, textColor, shouldGlow, active)\n            return true\n        end        \n    end\nend",
						["custom_hide"] = "timed",
						["custom_type"] = "event",
						["debuffType"] = "HELPFUL",
						["duration"] = "0",
						["events"] = "OmnyMazeV2",
						["type"] = "custom",
						["unit"] = "player",
					},
					["untrigger"] = {
						["custom"] = "function(_,subEvent, ...)\n    if(subEvent == \"ButtonUpdate\")then\n        local id, _ ,_, _, _, active = ...\n        return id == aura_env.bId and not active\n    end\nend",
					},
				},
				["activeTriggerMode"] = -10,
				["customTriggerLogic"] = "function(trigger)\n    return trigger[1]\nend",
				["disjunctive"] = "custom",
			},
			["uid"] = "KMcF(7MPIKV",
			["url"] = "https://wago.io/XkZJuvlLH/17",
			["version"] = 17,
			["width"] = 48,
			["xOffset"] = 26,
			["yOffset"] = -108,
			["zoom"] = 0,
		},
		["MMN_RoomIcon"] = {
			["actions"] = {
				["finish"] = {
				},
				["init"] = {
					["custom"] = "aura_env.path = \"Interface/MazeIcon/Room\"\naura_env.room = 1\n\naura_env.getIcon = function(i)   \n    return aura_env.path..i\nend\n\naura_env.show = function()\n    \n    aura_env.region:SetIcon(aura_env.getIcon(aura_env.room))\n    \nend\n\naura_env.moveRoom = function(id)\n    aura_env.room = id\n    aura_env.show()\nend",
					["do_custom"] = true,
				},
				["start"] = {
				},
			},
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["anchorPoint"] = "CENTER",
			["animation"] = {
				["finish"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["start"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
			},
			["authorOptions"] = {
			},
			["auto"] = true,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["conditions"] = {
				{
					["changes"] = {
						{
							["property"] = "customcode",
							["value"] = {
								["custom"] = "aura_env.show()",
							},
						}, -- [1]
					},
					["check"] = {
						["trigger"] = 1,
						["value"] = 1,
						["variable"] = "show",
					},
				}, -- [1]
			},
			["config"] = {
			},
			["cooldown"] = false,
			["cooldownEdge"] = false,
			["cooldownSwipe"] = true,
			["cooldownTextDisabled"] = false,
			["desaturate"] = false,
			["frameStrata"] = 1,
			["height"] = 150,
			["icon"] = true,
			["iconSource"] = 0,
			["id"] = "MMN_RoomIcon",
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["internalVersion"] = 45,
			["inverse"] = false,
			["keepAspectRatio"] = false,
			["load"] = {
				["class"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
				},
				["size"] = {
					["multi"] = {
						["party"] = true,
					},
					["single"] = "party",
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["use_never"] = false,
				["use_size"] = true,
				["use_zoneIds"] = true,
				["zoneIds"] = "1669",
			},
			["parent"] = "Mists Maze Navigator v2 by Omny",
			["preferToUpdate"] = false,
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["semver"] = "2.0.6",
			["subRegions"] = {
				{
					["anchorXOffset"] = 0,
					["anchorYOffset"] = 0,
					["rotateText"] = "NONE",
					["text_anchorPoint"] = "INNER_BOTTOMRIGHT",
					["text_automaticWidth"] = "Auto",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_fixedWidth"] = 64,
					["text_font"] = "Expressway",
					["text_fontSize"] = 12,
					["text_fontType"] = "OUTLINE",
					["text_justify"] = "CENTER",
					["text_selfPoint"] = "AUTO",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_shadowXOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["text_text"] = "%s",
					["text_text_format_s_format"] = "none",
					["text_visible"] = true,
					["text_wordWrap"] = "WordWrap",
					["type"] = "subtext",
				}, -- [1]
				{
					["glow"] = false,
					["glowBorder"] = false,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["glowFrequency"] = 0.25,
					["glowLength"] = 10,
					["glowLines"] = 8,
					["glowScale"] = 1,
					["glowThickness"] = 1,
					["glowType"] = "buttonOverlay",
					["glowXOffset"] = 0,
					["glowYOffset"] = 0,
					["type"] = "subglow",
					["useGlowColor"] = false,
				}, -- [2]
			},
			["tocversion"] = 90002,
			["triggers"] = {
				[1] = {
					["trigger"] = {
						["custom"] = "function(_,subEvent, ...)\n    \n    if(subEvent == \"Show\") then\n        return true \n    end\n    \n    if(subEvent == \"VisitRoom\")then\n        local id = ...\n        aura_env.moveRoom(id)\n        return true\n    end\n    \n    return false\nend",
						["custom_hide"] = "custom",
						["custom_type"] = "event",
						["debuffType"] = "HELPFUL",
						["event"] = "Health",
						["events"] = "OmnyMazeV2",
						["names"] = {
						},
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "custom",
						["unit"] = "player",
					},
					["untrigger"] = {
						["custom"] = "function(_,subEvent, ...)\n    \n    if(subEvent==\"Reset\" or subEvent ==\"Hide\") then\n        \n        return true\n        \n    end\n    \n    return false\n    \nend",
					},
				},
				["activeTriggerMode"] = -10,
				["customTriggerLogic"] = "function(trigger)\n    return trigger[1]\nend",
				["disjunctive"] = "custom",
			},
			["uid"] = "2wC0LFPPCv)",
			["url"] = "https://wago.io/XkZJuvlLH/17",
			["version"] = 17,
			["width"] = 150.00010681152,
			["xOffset"] = 0,
			["yOffset"] = 0,
			["zoom"] = 0,
		},
		["MMN_Start_Button"] = {
			["actions"] = {
				["finish"] = {
				},
				["init"] = {
					["custom"] = "if(not aura_env.button) then\n    local b = CreateFrame(\"Button\", \"WA_SnowBoom4\", WeakAuras.regions[aura_env.id].region)\n    b:SetAllPoints(WeakAuras.regions[aura_env.id].region)\n    \n    local function createHighlightTexture(self)\n        local texture = self:CreateTexture(nil, \"OVERLAY\")\n        self.highlight = texture\n        texture:SetTexture([[Interface\\QuestFrame\\UI-QuestLogTitleHighlight]])\n        texture:SetBlendMode(\"ADD\")\n        texture:SetAllPoints(self)\n        texture:SetAlpha(1)\n        return texture\n    end\n    \n    local function onButtonEnter(self)\n        if not self.highlight then\n            createHighlightTexture(self)\n        end\n        self.highlight:Show()\n    end\n    \n    local function onButtonLeave(self)\n        if self.highlight then\n            self.highlight:Hide()\n        end\n    end\n    \n    b:RegisterForClicks(\"LeftButtonDown\")\n    \n    b:SetScript(\"OnClick\", function()\n            WeakAuras.ScanEvents(\"OmnyMazeV2\",\"Start\")\n    end)\n    \n    b:SetScript(\"OnEnter\", onButtonEnter)\n    b:SetScript(\"OnLeave\", onButtonLeave)\n    \n    aura_env.button = b\nend\n\naura_env.started = false\naura_env.text = \"Start\"\n\naura_env.start= function()\n    \n    aura_env.started = true\n    aura_env.button:Disable()\n    \n    aura_env.text = \"Show\"\nend\n\naura_env.hide = function()\n    \n    aura_env.button:Disable()\n    \nend\n\naura_env.reset = function()\n    \n    aura_env.started = false\n    aura_env.button:Enable()\n    aura_env.text = \"Start\"\n    \nend",
					["do_custom"] = true,
				},
				["start"] = {
				},
			},
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["anchorPoint"] = "CENTER",
			["animation"] = {
				["finish"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["start"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
			},
			["authorOptions"] = {
			},
			["auto"] = true,
			["color"] = {
				0, -- [1]
				1, -- [2]
				0.13333333333333, -- [3]
				1, -- [4]
			},
			["conditions"] = {
				{
					["changes"] = {
						{
							["property"] = "customcode",
							["value"] = {
								["custom"] = "aura_env.button:Enable()",
							},
						}, -- [1]
					},
					["check"] = {
						["trigger"] = 1,
						["value"] = 0,
						["variable"] = "show",
					},
				}, -- [1]
			},
			["config"] = {
			},
			["cooldown"] = false,
			["cooldownEdge"] = false,
			["cooldownSwipe"] = true,
			["cooldownTextDisabled"] = false,
			["customText"] = "function()\n    return aura_env.text\nend",
			["desaturate"] = false,
			["displayIcon"] = "Interface\\Addons\\WeakAuras\\Media\\Textures\\Square_Smooth.tga",
			["frameStrata"] = 1,
			["height"] = 20,
			["icon"] = true,
			["iconSource"] = -1,
			["id"] = "MMN_Start_Button",
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["internalVersion"] = 45,
			["inverse"] = false,
			["keepAspectRatio"] = false,
			["load"] = {
				["class"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
				},
				["size"] = {
					["multi"] = {
						["party"] = true,
					},
					["single"] = "party",
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["use_never"] = false,
				["use_size"] = true,
				["use_zoneIds"] = true,
				["zoneIds"] = "1669",
			},
			["parent"] = "Mists Maze Navigator v2 by Omny",
			["preferToUpdate"] = false,
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["semver"] = "2.0.6",
			["subRegions"] = {
				{
					["anchorXOffset"] = 0,
					["anchorYOffset"] = 0,
					["rotateText"] = "NONE",
					["text_anchorPoint"] = "CENTER",
					["text_automaticWidth"] = "Auto",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_fixedWidth"] = 64,
					["text_font"] = "Expressway",
					["text_fontSize"] = 12,
					["text_fontType"] = "OUTLINE",
					["text_justify"] = "CENTER",
					["text_selfPoint"] = "AUTO",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_shadowXOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["text_text"] = "%c",
					["text_text_format_s_format"] = "none",
					["text_visible"] = true,
					["text_wordWrap"] = "WordWrap",
					["type"] = "subtext",
				}, -- [1]
				{
					["glow"] = false,
					["glowBorder"] = false,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["glowFrequency"] = 0.25,
					["glowLength"] = 10,
					["glowLines"] = 8,
					["glowScale"] = 1,
					["glowThickness"] = 1,
					["glowType"] = "buttonOverlay",
					["glowXOffset"] = 0,
					["glowYOffset"] = 0,
					["type"] = "subglow",
					["useGlowColor"] = false,
				}, -- [2]
				{
					["border_color"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["border_edge"] = "1 Pixel",
					["border_offset"] = 0,
					["border_size"] = 1,
					["border_visible"] = true,
					["type"] = "subborder",
				}, -- [3]
			},
			["tocversion"] = 90002,
			["triggers"] = {
				[1] = {
					["trigger"] = {
						["custom"] = "function(_,subEvent, ...)\n    \n    if(WeakAuras.IsOptionsOpen() and aura_env.button)then aura_env.button:Enable() end\n    \n    if(not aura_env.started and subEvent == \"Start\") then\n        \n        aura_env.start()\n        \n        return true\n    end\n    \n    if(subEvent == \"Show\") then\n        \n        aura_env.hide()\n        \n        return true        \n    end\n    \n    \n    if(subEvent == \"Reset\") then\n        \n        aura_env.reset()\n        \n        return false\n    end\nend\n\n\n",
						["custom_hide"] = "custom",
						["custom_type"] = "event",
						["debuffType"] = "HELPFUL",
						["duration"] = "0",
						["event"] = "Health",
						["events"] = "OmnyMazeV2",
						["names"] = {
						},
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "custom",
						["unit"] = "player",
					},
					["untrigger"] = {
						["custom"] = "\n\nfunction(_,subEvent, ...)\n    \n    \n    if(subEvent==\"Reset\" or subEvent ==\"Hide\") then\n        \n        return true\n    end\nend\n\n\n",
					},
				},
				[2] = {
					["trigger"] = {
						["debuffType"] = "HELPFUL",
						["duration"] = "1",
						["event"] = "Conditions",
						["genericShowOn"] = "showOnCooldown",
						["realSpellName"] = 0,
						["spellName"] = 0,
						["type"] = "unit",
						["unevent"] = "auto",
						["unit"] = "player",
						["use_alwaystrue"] = true,
						["use_genericShowOn"] = true,
						["use_spellName"] = true,
						["use_track"] = true,
					},
					["untrigger"] = {
					},
				},
				["activeTriggerMode"] = -10,
				["customTriggerLogic"] = "function(trigger)\n    return (not trigger[1])\nend",
				["disjunctive"] = "custom",
			},
			["uid"] = "l)yQdn(LO5r",
			["url"] = "https://wago.io/XkZJuvlLH/17",
			["version"] = 17,
			["width"] = 150,
			["xOffset"] = 0,
			["yOffset"] = 62,
			["zoom"] = 0,
		},
		["Mists Maze Navigator v2 by Omny"] = {
			["actions"] = {
				["finish"] = {
				},
				["init"] = {
				},
				["start"] = {
				},
			},
			["anchorFrameType"] = "SCREEN",
			["anchorPoint"] = "CENTER",
			["animation"] = {
				["finish"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["start"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
			},
			["authorOptions"] = {
			},
			["backdropColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0.5, -- [4]
			},
			["border"] = false,
			["borderBackdrop"] = "Blizzard Tooltip",
			["borderColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["borderEdge"] = "Square Full White",
			["borderInset"] = 1,
			["borderOffset"] = 4,
			["borderSize"] = 2,
			["conditions"] = {
			},
			["config"] = {
			},
			["controlledChildren"] = {
				"MMN_MazeController", -- [1]
				"MMN_Start_Button", -- [2]
				"MMN_Back_Button", -- [3]
				"MMN_Hide_Button", -- [4]
				"MMN_RoomIcon", -- [5]
				"MMN_Maze_Button1", -- [6]
				"MMN_Maze_Button2", -- [7]
				"MMN_Maze_Button3", -- [8]
				"MMN_Maze_Button4", -- [9]
				"MMN_Maze_Button5", -- [10]
				"MMN_Game_Button_Flower_Empty_NoCircle", -- [11]
				"MMN_Game_Button_Flower_Empty_Circle", -- [12]
				"MMN_Game_Button_Flower_Full_NoCircle", -- [13]
				"MMN_Game_Button_Flower_Full_Circle", -- [14]
				"MMN_Game_Button_Leaf_Empty_NoCircle", -- [15]
				"MMN_Game_Button_Leaf_Empty_Circle", -- [16]
				"MMN_Game_Button_Leaf_Full_NoCircle", -- [17]
				"MMN_Game_Button_Leaf_Full_Circle", -- [18]
				"MMN_Game_Model_Circle", -- [19]
				"MMN_Game_Model_Flower_Empty", -- [20]
				"MMN_Game_Model_Flower_Full", -- [21]
				"MMN_Game_Model_Leaf_Empty", -- [22]
				"MMN_Game_Model_Leaf_Full", -- [23]
			},
			["desc"] = "Navigates you through the 2nd Boss Maze in Mists of Tirna Scithe. There are 12 different Routes programmed into this WA using minimap pictures",
			["frameStrata"] = 1,
			["groupIcon"] = 3601531,
			["id"] = "Mists Maze Navigator v2 by Omny",
			["information"] = {
				["groupOffset"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["internalVersion"] = 45,
			["load"] = {
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["zoneIds"] = "",
			},
			["preferToUpdate"] = false,
			["regionType"] = "group",
			["scale"] = 1,
			["selfPoint"] = "BOTTOMLEFT",
			["semver"] = "2.0.6",
			["subRegions"] = {
			},
			["tocversion"] = 90002,
			["triggers"] = {
				{
					["trigger"] = {
						["debuffType"] = "HELPFUL",
						["event"] = "Health",
						["names"] = {
						},
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "aura2",
						["unit"] = "player",
					},
					["untrigger"] = {
					},
				}, -- [1]
			},
			["uid"] = "B)LNjFREQcF",
			["url"] = "https://wago.io/XkZJuvlLH/17",
			["version"] = 17,
			["xOffset"] = 413.33,
			["yOffset"] = 422.22,
		},
		["Nameplate Enemy Auras"] = {
			["actions"] = {
				["finish"] = {
					["custom"] = "if aura_env.state then\n    local region = WeakAuras.GetRegion(aura_env.id, aura_env.cloneId)\n    region.Backdrop:Hide()\n    --region:Hide()\n    --region:SetScale(1) \n    --region:SetParent(WeakAuras.frames[\"WeakAuras Main Frame\"])\nend",
					["do_custom"] = true,
				},
				["init"] = {
					["custom"] = "--- CONFIG IN \"CUSTOM OPTIONS\" TAB - DO NOT TOUCH THIS ---\naura_env.frameStratas = {\n    [1] = \"BACKGROUND\",\n    [2] = \"LOW\",\n    [3] = \"MEDIUM\",\n    [4] = \"HIGH\",\n    [5] = \"DIALOG\",\n    [6] = \"FULLSCREEN\",\n    [7] = \"FULLSCREEN_DIALOG\",\n    [8] = \"TOOLTIP\",\n}\n\naura_env.anchorConfValues = {\n    [1] = \"TOP\",\n    [2] = \"BOTTOM\",\n    [3] = \"LEFT\",\n    [4] = \"RIGHT\",\n    [5] = \"CENTER\",\n    [6] = \"TOPLEFT\",\n    [7] = \"TOPRIGHT\",\n    [8] = \"BOTTOMLEFT\",\n    [9] = \"BOTTOMRIGHT\",\n}\n\naura_env.growthDirectionValues = {\n    [1] = {xDir =  0, yDir =  1}, -- UP\n    [2] = {xDir =  0, yDir = -1}, -- DOWN\n    [3] = {xDir = -1, yDir =  0}, -- LEFT\n    [4] = {xDir =  1, yDir =  0}, -- RIGHT\n}\n\n-- border color for enrage buffs\naura_env.color_enrage = {\n    red = 0.85,\n    green = 0.2,\n    blue = 0.1,\n}\n\n-- CUSTOM BUFFS/DEBUFFS\naura_env.spellId = {}\naura_env.spellIdDungeon = {}\naura_env.missingDebuffs = {}\n\n-- Test Spells:\n-- Renewing Mist\n-- aura_env.spellIdDungeon[\"\"..119611] = true\n-- Holy Fire\n-- aura_env.spellIdDungeon[\"\"..14914] = true\n-- Chastized\n-- aura_env.spellIdDungeon[\"\"..200196] = true\n-- Schism\n-- aura_env.spellIdDungeon[\"\"..214621] = true\n-- SW: Pain\n-- aura_env.spellIdDungeon[\"\"..589] = true\n-- Chaos Brand\n--aura_env.spellIdDungeon[\"\"..1490] = true\n-- Trail of Ruin\n--aura_env.spellIdDungeon[\"\"..258883] = true\n-- Azerite Globule\n--aura_env.spellIdDungeon[\"\"..279956] = true\n\n-- Mythic+:\n-- Sanguine Ichor\naura_env.spellIdDungeon[\"\"..226510] = true\n-- Insipiring\naura_env.spellIdDungeon[\"\"..343502] = true \n-- Inspired\n--aura_env.spellIdDungeon[\"\"..343503] = true\n-- Challenger's Might\n-- aura_env.spellIdDungeon[\"\"..206150] = true\n\n\n\n-- hadle additional custom spells:\naura_env.NEAhandleAdditionalCustom = function()\n    -- dungeon\n    if aura_env.config[\"showDungeon\"] then\n        for spell, bool in pairs(aura_env.spellIdDungeon) do\n            local spellId = select(7,GetSpellInfo(spell))\n            if spellId then\n                aura_env.spellId[\"\"..spellId] = bool\n            end\n        end\n    end\n    \n    -- whitelist\n    if aura_env.config[\"showCustom\"] then\n        local additionalCustom = WeakAuras.split(aura_env.config[\"additionalCustom\"]);\n        for index, spell in pairs(additionalCustom) do\n            local spellId = select(7,GetSpellInfo(spell))\n            if spellId then\n                aura_env.spellId[\"\"..spellId] = true\n                aura_env.hasCustom = true\n            end\n        end\n    end\n    \n    -- blacklist\n    local blacklistCustom = WeakAuras.split(aura_env.config[\"blacklistCustom\"]);\n    for index, spell in pairs(blacklistCustom) do\n        local spellId = select(7,GetSpellInfo(spell))\n        if spellId then\n            aura_env.spellId[\"\"..spellId] = false\n        end\n    end\n    \n    -- missing debuffs\n    local missingDebuffs = WeakAuras.split(aura_env.config[\"missingDebuffs\"]);\n    for index, spell in pairs(missingDebuffs) do\n        local spellId = select(7,GetSpellInfo(spell))\n        if spellId then\n            aura_env.missingDebuffs[\"\"..spellId] = true\n        end\n    end\nend\n\n\n-- for positioning of more than one aura\naura_env.width = aura_env.region:GetWidth() + (aura_env.config[\"borderSize\"] * 2)\naura_env.height = aura_env.region:GetHeight() + (aura_env.config[\"borderSize\"] * 2)\n\n-- check if ElvUI is used and the nameplates module is enabled\naura_env.useElvUINameplates = ElvUI and ElvUI[1].NamePlates and ElvUI[1].NamePlates.Initialized\n-- check if KuiNameplates are used\naura_env.useKuiNameplates = KuiNameplates ~= nil\n-- check if Tidy Plates are used\naura_env.useTidyPlates = TidyPlates ~= nil\naura_env.usePlater = Plater ~= nil\n\n\n\n-- custom functions\naura_env.NEAupdateRegionGraphics = function(nameplate, region, state)\n    local unitIsMyTarget = UnitIsUnit(state.unit, \"target\") \n    local unitIsMouseover = UnitIsUnit(state.unit, \"mouseover\")\n    \n    local alpha = 1;\n    if unitIsMyTarget then\n        if aura_env.config[\"useAlphaTarget\"] then\n            if aura_env.useElvUINameplates and nameplate.unitFrame then\n                alpha = nameplate.unitFrame:GetAlpha()\n            elseif aura_env.useTidyPlates then\n                alpha = nameplate.extended.requestedAlpha\n            elseif aura_env.useKuiNameplates then\n                alpha = nameplate.kui:GetAlpha()\n            elseif aura_env.usePlater then\n                alpha = nameplate.unitFrame.healthBar:GetAlpha()\n            else\n                alpha = nameplate:GetAlpha()\n            end\n        else\n            alpha = aura_env.config[\"targetAlpha\"]\n        end\n    elseif unitIsMouseover then\n        if aura_env.config[\"useAlphaMouseover\"] then\n            if aura_env.useElvUINameplates and nameplate.unitFrame then\n                alpha = nameplate.unitFrame:GetAlpha()\n            elseif aura_env.useTidyPlates then\n                alpha = nameplate.extended.requestedAlpha\n            elseif aura_env.useKuiNameplates then\n                alpha = nameplate.kui:GetAlpha()\n            elseif aura_env.usePlater then\n                alpha = nameplate.unitFrame.healthBar:GetAlpha()\n            else\n                alpha = nameplate:GetAlpha()\n            end\n        else\n            alpha = aura_env.config[\"mouseoverAlpha\"]\n        end\n    else\n        if aura_env.config[\"useAlpha\"] then\n            if aura_env.useElvUINameplates and nameplate.unitFrame then\n                alpha = nameplate.unitFrame:GetAlpha()\n            elseif aura_env.useTidyPlates then\n                alpha = nameplate.extended.requestedAlpha\n            elseif aura_env.useKuiNameplates then\n                alpha = nameplate.kui:GetAlpha()\n            elseif aura_env.usePlater then\n                alpha = nameplate.unitFrame.healthBar:GetAlpha()\n            else\n                alpha = nameplate:GetAlpha()\n            end\n        else\n            alpha = aura_env.config[\"nonTargetAlpha\"]\n        end\n    end\n    \n    if unitIsMyTarget then\n        region:SetFrameStrata(aura_env.frameStratas[aura_env.config[\"targetFrameStrata\"]])\n    elseif unitIsMouseover then\n        region:SetFrameStrata(aura_env.frameStratas[aura_env.config[\"mouseoverFrameStrata\"]])\n    else\n        region:SetFrameStrata(aura_env.frameStratas[aura_env.config[\"frameStrata\"]])\n    end\n    \n    region.icon:SetAlpha(alpha);\n    region.Backdrop:SetAlpha(alpha*aura_env.config[\"borderAlpha\"]);\n    \n    --scaling tests\n    --[[\n    if aura_env.useElvUINameplates then\n        region:SetScale(state.nameplate.unitFrame.HealthBar.currentScale) \n    end\n    --]]\nend\n\naura_env.NEAupdateRegion = function(state, aura_number, num_auras)\n    local region = WeakAuras.GetRegion(aura_env.id, state.cloneId)\n    if not state.unit then\n        region:Hide()\n        return\n    end\n    \n    state.nameplate = state.nameplate or C_NamePlate.GetNamePlateForUnit(state.unit)\n    \n    if not state.nameplate or not state.show then\n        if region.Backdrop then region.Backdrop:Hide() end\n        region:Hide()\n        return\n    end\n    \n    region:SetFrameStrata(aura_env.frameStratas[aura_env.config[\"frameStrata\"]])\n    region:SetFrameLevel(1)\n    \n    if aura_env.config[\"borderSize\"] == 0 then\n        if region.Backdrop then\n            region.Backdrop:Hide()\n        end\n    else\n        if not region.Backdrop then\n            region.Backdrop = CreateFrame(\"frame\", nil, region, \"BackdropTemplate\");\n        end\n        \n        local backdrop = {\n            edgeFile = \"Interface\\\\AddOns\\\\WeakAuras\\\\Media\\\\Textures\\\\Square_FullWhite.tga\",\n            edgeSize = aura_env.config[\"borderSize\"],\n            insets = {\n                left = 0,\n                right = 0,\n                top = 0,\n                bottom = 0,\n            }\n        }\n        region.Backdrop:SetBackdrop(backdrop)\n        \n        \n        local red = DebuffTypeColor[\"none\"].r\n        local green = DebuffTypeColor[\"none\"].g\n        local blue = DebuffTypeColor[\"none\"].b\n        local type = state.aura_type\n        \n        if type == \"\" then\n            red = aura_env.color_enrage.red\n            green = aura_env.color_enrage.green\n            blue = aura_env.color_enrage.blue\n        elseif type == \"MISSING\" then\n            red = aura_env.config[\"missingBorderColor\"][1]\n            green = aura_env.config[\"missingBorderColor\"][2]\n            blue = aura_env.config[\"missingBorderColor\"][3]\n        elseif type then\n            red = DebuffTypeColor[type].r\n            green = DebuffTypeColor[type].g\n            blue = DebuffTypeColor[type].b\n        end\n        \n        region.Backdrop:SetBackdropColor(0,0,0,0)\n        region.Backdrop:SetBackdropBorderColor(red,green,blue,aura_env.config[\"borderAlpha\"])\n        \n        region.Backdrop:SetParent(region)\n        region.Backdrop:SetFrameLevel(0)\n        \n        region.Backdrop:ClearAllPoints()\n        region.Backdrop:SetPoint(\"BOTTOMLEFT\", region, \"BOTTOMLEFT\", -aura_env.config[\"borderSize\"], -aura_env.config[\"borderSize\"])\n        region.Backdrop:SetPoint(\"TOPRIGHT\", region, \"TOPRIGHT\", aura_env.config[\"borderSize\"], aura_env.config[\"borderSize\"])\n        \n        region.Backdrop:Show()\n    end\n    \n    \n    local xOffset = aura_env.config[\"xOffset\"]+aura_env.width*(aura_number-1)*aura_env.growthDirectionValues[aura_env.config[\"growthDirection\"]].xDir\n    local yOffset = aura_env.config[\"yOffset\"]+aura_env.height*(aura_number-1)*aura_env.growthDirectionValues[aura_env.config[\"growthDirection\"]].yDir\n    \n    if aura_env.config[\"growEvenly\"] then \n        xOffset = xOffset-aura_env.width*((num_auras or 1)-1)/2*aura_env.growthDirectionValues[aura_env.config[\"growthDirection\"]].xDir\n        yOffset = yOffset-aura_env.height*((num_auras or 1)-1)/2*aura_env.growthDirectionValues[aura_env.config[\"growthDirection\"]].yDir\n    end\n    if aura_env.useElvUINameplates and state.nameplate.unitFrame then\n        region:SetAnchor(aura_env.anchorConfValues[aura_env.config[\"anchorPoint\"]], state.nameplate.unitFrame.Health, aura_env.anchorConfValues[aura_env.config[\"relativeAnchor\"]])\n    elseif aura_env.useTidyPlates then\n        region:SetAnchor(aura_env.anchorConfValues[aura_env.config[\"anchorPoint\"]], state.nameplate.extended.bars.healthbar, aura_env.anchorConfValues[aura_env.config[\"relativeAnchor\"]])\n    elseif aura_env.useKuiNameplates then\n        region:SetAnchor(aura_env.anchorConfValues[aura_env.config[\"anchorPoint\"]], state.nameplate.kui.HealthBar, aura_env.anchorConfValues[aura_env.config[\"relativeAnchor\"]])\n    elseif aura_env.usePlater then\n        region:SetAnchor(aura_env.anchorConfValues[aura_env.config[\"anchorPoint\"]], state.nameplate.unitFrame, aura_env.anchorConfValues[aura_env.config[\"relativeAnchor\"]])\n        --region:SetAnchor(aura_env.anchorConfValues[aura_env.config[\"anchorPoint\"]], state.nameplate.unitFrame.healthBar, aura_env.anchorConfValues[aura_env.config[\"relativeAnchor\"]])\n    else\n        region:SetAnchor(aura_env.anchorConfValues[aura_env.config[\"anchorPoint\"]], state.nameplate, aura_env.anchorConfValues[aura_env.config[\"relativeAnchor\"]])\n    end\n    region:SetOffset(xOffset, yOffset)\n    \n    aura_env.NEAupdateRegionGraphics(state.nameplate, region, state)\n    \n    region:Show()\nend\n\naura_env.NEAisShowBuff = function(state)\n    if not state.show then return end\n    \n    local isPlayer = UnitIsPlayer(state.unit)\n    --local isFriend = UnitIsFriend(\"player\", state.unit)\n    local canAttack = UnitCanAttack(\"player\", state.unit);\n    local inInstance, instanceType = IsInInstance()\n    \n    local spellId = state.spellId\n    local NEAtype = state.buffType\n    \n    if (isPlayer and not aura_env.config[\"showPlayers\"]) then\n        return false\n    end\n    \n    local showAura = (aura_env.config.showOpenWorld or (inInstance and canAttack and instanceType == \"party\")) or (state.caster == \"player\" and aura_env.config[\"showPlayersDebuffs\"] and NEAtype == 1) or (state.caster == \"player\" and aura_env.config[\"showPlayersBuffs\"] and NEAtype == 2) or aura_env.hasCustom\n    \n    -- NEAtype: 1=debuff, 2=buff\n    if NEAtype == 1 then\n        local type = state.type --select(4,UnitDebuff(state.unit, state.index))\n        if showAura and (aura_env.config[\"showAllDebuffs\"]\n            or (aura_env.spellId[\"\"..spellId])\n            or (state.caster == \"player\" and aura_env.config[\"showPlayersDebuffs\"])\n            and (aura_env.spellId[\"\"..spellId] == nil or aura_env.spellId[\"\"..spellId])) -- m/r and not blacklisted\n        then\n            state.aura_type = type\n            return true\n        end\n    end\n    \n    \n    if NEAtype == 2 then\n        local type = state.type --select(4,UnitBuff(state.unit, state.index))\n        if showAura and ((aura_env.config[\"showAllBuffs\"]\n                or (aura_env.spellId[\"\"..spellId]) -- is custom or whitelist\n                or (type == \"Magic\" and aura_env.config[\"showMagic\"] -- magic\n                    or type == \"\" and aura_env.config[\"showEnrage\"] -- or enrage\n                    or (state.caster == \"player\" and aura_env.config[\"showPlayersBuffs\"]))  -- or players\n                and (aura_env.spellId[\"\"..spellId] == nil or aura_env.spellId[\"\"..spellId]))) -- m/r and not blacklisted\n        then\n            state.aura_type = type\n            return true    \n        end\n    end\n    \n    return false\nend\n\n-- initialize\naura_env.NEAhandleAdditionalCustom()\nprint(\"Loaded WA: \\\"\"..aura_env.id..\"\\\" - Version: \"..WeakAuras.GetData(aura_env.id).semver)",
					["do_custom"] = true,
				},
				["start"] = {
					["custom"] = "\n\n",
					["do_custom"] = false,
					["do_sound"] = false,
					["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\KittenMeow.ogg",
				},
			},
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["anchorPoint"] = "CENTER",
			["animation"] = {
				["finish"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["start"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
			},
			["authorOptions"] = {
				{
					["text"] = "Buff / Debuff Settings",
					["type"] = "header",
					["useName"] = true,
					["width"] = 2,
				}, -- [1]
				{
					["default"] = true,
					["key"] = "showMagic",
					["name"] = "Show Magic",
					["type"] = "toggle",
					["width"] = 1,
				}, -- [2]
				{
					["default"] = true,
					["key"] = "showEnrage",
					["name"] = "Show Enrage",
					["type"] = "toggle",
					["width"] = 1,
				}, -- [3]
				{
					["default"] = true,
					["desc"] = "Show pre-configured Dungeon Buffs/Debuffs, M+ Affixes, etc.",
					["key"] = "showDungeon",
					["name"] = "Show Dungeon/M+ Buffs/Debuffs",
					["type"] = "toggle",
					["useDesc"] = true,
					["width"] = 1,
				}, -- [4]
				{
					["default"] = true,
					["desc"] = "M+ Affix \"Bolstering\" Stacks",
					["key"] = "showBolster",
					["name"] = "Show Bolstering",
					["type"] = "toggle",
					["useDesc"] = true,
					["width"] = 1,
				}, -- [5]
				{
					["default"] = true,
					["desc"] = "Show custom Buffs/Debuffs (Dungeon/M+ and \"Additional custom\")",
					["key"] = "showCustom",
					["name"] = "Show Custom",
					["type"] = "toggle",
					["useDesc"] = true,
					["width"] = 1,
				}, -- [6]
				{
					["default"] = false,
					["key"] = "showAllBuffs",
					["name"] = "Show all Buffs",
					["type"] = "toggle",
					["width"] = 1,
				}, -- [7]
				{
					["default"] = false,
					["key"] = "showAllDebuffs",
					["name"] = "Show all Debuffs",
					["type"] = "toggle",
					["width"] = 1,
				}, -- [8]
				{
					["default"] = false,
					["key"] = "showPlayersBuffs",
					["name"] = "Show Players Buffs",
					["type"] = "toggle",
					["width"] = 1,
				}, -- [9]
				{
					["default"] = false,
					["key"] = "showPlayersDebuffs",
					["name"] = "Show Players Debuffs",
					["type"] = "toggle",
					["width"] = 1,
				}, -- [10]
				{
					["default"] = false,
					["key"] = "showMissing",
					["name"] = "Show missing debuffs",
					["type"] = "toggle",
					["width"] = 1,
				}, -- [11]
				{
					["default"] = true,
					["key"] = "showOwnMissing",
					["name"] = "Show own missing only",
					["type"] = "toggle",
					["width"] = 1,
				}, -- [12]
				{
					["default"] = true,
					["key"] = "showPurgeGlow",
					["name"] = "Show glow on purgeable/stealable",
					["type"] = "toggle",
					["width"] = 1,
				}, -- [13]
				{
					["default"] = false,
					["key"] = "showPlayers",
					["name"] = "Show on Players",
					["type"] = "toggle",
					["width"] = 1,
				}, -- [14]
				{
					["default"] = false,
					["key"] = "showOpenWorld",
					["name"] = "Show in Open World",
					["type"] = "toggle",
					["width"] = 1,
				}, -- [15]
				{
					["default"] = 3,
					["key"] = "showOnUnitTypes",
					["name"] = "Show on Unit Types",
					["type"] = "select",
					["values"] = {
						"Friendly", -- [1]
						"Enemy", -- [2]
						"Both", -- [3]
					},
					["width"] = 1,
				}, -- [16]
				{
					["default"] = "",
					["desc"] = "List of comma or space separated spell-IDs",
					["key"] = "additionalCustom",
					["length"] = 10,
					["name"] = "Additional custom Buffs/Debuffs - spell-IDs",
					["type"] = "input",
					["useDesc"] = true,
					["useLength"] = false,
					["width"] = 2,
				}, -- [17]
				{
					["default"] = "",
					["desc"] = "List of comma or space separated spell-IDs",
					["key"] = "blacklistCustom",
					["length"] = 10,
					["name"] = "Blacklist custom Buffs/Debuffs - spell-IDs",
					["type"] = "input",
					["useDesc"] = true,
					["useLength"] = false,
					["width"] = 2,
				}, -- [18]
				{
					["default"] = "",
					["desc"] = "List of comma or space separated spell-IDs",
					["key"] = "missingDebuffs",
					["length"] = 10,
					["name"] = "Missing Debuffs to track - spell-IDs",
					["type"] = "input",
					["useDesc"] = true,
					["useLength"] = false,
					["width"] = 2,
				}, -- [19]
				{
					["text"] = "Positioning",
					["type"] = "header",
					["useName"] = true,
					["width"] = 2,
				}, -- [20]
				{
					["default"] = 2,
					["key"] = "anchorPoint",
					["name"] = "Aura Anchor Point",
					["type"] = "select",
					["values"] = {
						"TOP", -- [1]
						"BOTTOM", -- [2]
						"LEFT", -- [3]
						"RIGHT", -- [4]
						"CENTER", -- [5]
						"TOPLEFT", -- [6]
						"TOPRIGHT", -- [7]
						"BOTTOMLEFT", -- [8]
						"BOTTOMRIGHT", -- [9]
					},
					["width"] = 1,
				}, -- [21]
				{
					["default"] = 1,
					["key"] = "relativeAnchor",
					["name"] = "Nameplate Anchor Point",
					["type"] = "select",
					["values"] = {
						"TOP", -- [1]
						"BOTTOM", -- [2]
						"LEFT", -- [3]
						"RIGHT", -- [4]
						"CENTER", -- [5]
						"TOPLEFT", -- [6]
						"TOPRIGHT", -- [7]
						"BOTTOMLEFT", -- [8]
						"BOTTOMRIGHT", -- [9]
					},
					["width"] = 1,
				}, -- [22]
				{
					["bigStep"] = 1,
					["default"] = 0,
					["key"] = "xOffset",
					["max"] = 150,
					["min"] = -150,
					["name"] = "X Offset",
					["softMax"] = 150,
					["softMin"] = -150,
					["step"] = 1,
					["type"] = "range",
					["width"] = 1,
				}, -- [23]
				{
					["bigStep"] = 1,
					["default"] = 30,
					["key"] = "yOffset",
					["max"] = 150,
					["min"] = -150,
					["name"] = "Y Offset",
					["softMax"] = 150,
					["softMin"] = -150,
					["step"] = 1,
					["type"] = "range",
					["width"] = 1,
				}, -- [24]
				{
					["default"] = 4,
					["key"] = "growthDirection",
					["name"] = "Growth Direction",
					["type"] = "select",
					["values"] = {
						"Up", -- [1]
						"Down", -- [2]
						"Left", -- [3]
						"Right", -- [4]
					},
					["width"] = 1,
				}, -- [25]
				{
					["default"] = true,
					["key"] = "growEvenly",
					["name"] = "Grow Evenly",
					["type"] = "toggle",
					["width"] = 1,
				}, -- [26]
				{
					["text"] = "Strata",
					["type"] = "header",
					["useName"] = true,
					["width"] = 2,
				}, -- [27]
				{
					["default"] = 1,
					["key"] = "frameStrata",
					["name"] = "Default Frame Strata",
					["type"] = "select",
					["values"] = {
						"BACKGROUND", -- [1]
						"LOW", -- [2]
						"MEDIUM", -- [3]
						"HIGH", -- [4]
						"DIALOG", -- [5]
						"FULLSCREEN", -- [6]
						"FULLSCREEN_DIALOG", -- [7]
						"TOOLTIP", -- [8]
					},
					["width"] = 1,
				}, -- [28]
				{
					["default"] = 2,
					["key"] = "targetFrameStrata",
					["name"] = "Target Frame Strata",
					["type"] = "select",
					["values"] = {
						"BACKGROUND", -- [1]
						"LOW", -- [2]
						"MEDIUM", -- [3]
						"HIGH", -- [4]
						"DIALOG", -- [5]
						"FULLSCREEN", -- [6]
						"FULLSCREEN_DIALOG", -- [7]
						"TOOLTIP", -- [8]
					},
					["width"] = 1,
				}, -- [29]
				{
					["default"] = 3,
					["key"] = "mouseoverFrameStrata",
					["name"] = "Mouseover Frame Strata",
					["type"] = "select",
					["values"] = {
						"BACKGROUND", -- [1]
						"LOW", -- [2]
						"MEDIUM", -- [3]
						"HIGH", -- [4]
						"DIALOG", -- [5]
						"FULLSCREEN", -- [6]
						"FULLSCREEN_DIALOG", -- [7]
						"TOOLTIP", -- [8]
					},
					["width"] = 1,
				}, -- [30]
				{
					["text"] = "Alpha",
					["type"] = "header",
					["useName"] = true,
					["width"] = 2,
				}, -- [31]
				{
					["bigStep"] = 0.05,
					["default"] = 1,
					["key"] = "targetAlpha",
					["max"] = 1,
					["min"] = 0,
					["name"] = "Target Alpha",
					["softMax"] = 1,
					["softMin"] = 0,
					["step"] = 0.05,
					["type"] = "range",
					["width"] = 1,
				}, -- [32]
				{
					["default"] = true,
					["key"] = "useAlphaTarget",
					["name"] = "Use Nameplate Alpha for Targets",
					["type"] = "toggle",
					["width"] = 1,
				}, -- [33]
				{
					["bigStep"] = 0.05,
					["default"] = 1,
					["key"] = "mouseoverAlpha",
					["max"] = 1,
					["min"] = 0,
					["name"] = "Mouseover Alpha",
					["softMax"] = 1,
					["softMin"] = 0,
					["step"] = 0.05,
					["type"] = "range",
					["width"] = 1,
				}, -- [34]
				{
					["default"] = false,
					["key"] = "useAlphaMouseover",
					["name"] = "Use Nameplate Alpha for Mouseover",
					["type"] = "toggle",
					["width"] = 1,
				}, -- [35]
				{
					["bigStep"] = 0.05,
					["default"] = 0.75,
					["key"] = "nonTargetAlpha",
					["max"] = 1,
					["min"] = 0,
					["name"] = "Non-Target Alpha",
					["softMax"] = 1,
					["softMin"] = 0,
					["step"] = 0.05,
					["type"] = "range",
					["width"] = 1,
				}, -- [36]
				{
					["default"] = true,
					["key"] = "useAlpha",
					["name"] = "Use Nameplate Alpha for non-targets",
					["type"] = "toggle",
					["width"] = 1,
				}, -- [37]
				{
					["text"] = "Border",
					["type"] = "header",
					["useName"] = true,
					["width"] = 2,
				}, -- [38]
				{
					["bigStep"] = 1,
					["default"] = 1,
					["key"] = "borderSize",
					["max"] = 5,
					["min"] = 0,
					["name"] = "Border Size",
					["softMax"] = 5,
					["softMin"] = 0,
					["step"] = 1,
					["type"] = "range",
					["width"] = 1,
				}, -- [39]
				{
					["bigStep"] = 0.05,
					["default"] = 0.9,
					["key"] = "borderAlpha",
					["max"] = 1,
					["min"] = 0,
					["name"] = "Border Alpha",
					["softMax"] = 1,
					["softMin"] = 0,
					["step"] = 0.05,
					["type"] = "range",
					["width"] = 1,
				}, -- [40]
				{
					["default"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["key"] = "missingBorderColor",
					["name"] = "Missing Debuff border color",
					["type"] = "color",
					["width"] = 1,
				}, -- [41]
				{
					["text"] = "Performance",
					["type"] = "header",
					["useName"] = true,
					["width"] = 1,
				}, -- [42]
				{
					["bigStep"] = 1,
					["default"] = 100,
					["key"] = "updateThrottle",
					["max"] = 1000,
					["min"] = 0,
					["name"] = "Update Throttle [ms]",
					["softMax"] = 1000,
					["softMin"] = 0,
					["step"] = 1,
					["type"] = "range",
					["useDesc"] = false,
					["width"] = 2,
				}, -- [43]
			},
			["auto"] = true,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["conditions"] = {
				{
					["changes"] = {
						{
							["property"] = "desaturate",
							["value"] = true,
						}, -- [1]
						{
							["property"] = "height",
							["value"] = 20,
						}, -- [2]
						{
							["property"] = "width",
							["value"] = 20,
						}, -- [3]
					},
					["check"] = {
						["trigger"] = 1,
						["value"] = 1,
						["variable"] = "missingAura",
					},
				}, -- [1]
				{
					["changes"] = {
						{
							["property"] = "sub.3.glow",
							["value"] = true,
						}, -- [1]
						{
							["property"] = "sub.3.glowType",
							["value"] = "Pixel",
						}, -- [2]
						{
							["property"] = "sub.3.glowColor",
							["value"] = {
								1, -- [1]
								0, -- [2]
								0.94509803921569, -- [3]
								1, -- [4]
							},
						}, -- [3]
						{
							["property"] = "sub.3.useGlowColor",
							["value"] = false,
						}, -- [4]
						{
							["property"] = "sub.3.glowThickness",
							["value"] = 2,
						}, -- [5]
					},
					["check"] = {
						["trigger"] = 1,
						["value"] = 1,
						["variable"] = "isStealable",
					},
				}, -- [2]
			},
			["config"] = {
				["additionalCustom"] = "",
				["anchorPoint"] = 3,
				["blacklistCustom"] = "",
				["borderAlpha"] = 0.9,
				["borderSize"] = 1,
				["frameStrata"] = 1,
				["growEvenly"] = false,
				["growthDirection"] = 4,
				["missingBorderColor"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["missingDebuffs"] = "",
				["mouseoverAlpha"] = 1,
				["mouseoverFrameStrata"] = 3,
				["nonTargetAlpha"] = 0.75,
				["relativeAnchor"] = 4,
				["showAllBuffs"] = false,
				["showAllDebuffs"] = false,
				["showBolster"] = true,
				["showCustom"] = false,
				["showDungeon"] = true,
				["showEnrage"] = true,
				["showMagic"] = true,
				["showMissing"] = false,
				["showOnUnitTypes"] = 2,
				["showOpenWorld"] = true,
				["showOwnMissing"] = false,
				["showPlayers"] = false,
				["showPlayersBuffs"] = false,
				["showPlayersDebuffs"] = false,
				["showPurgeGlow"] = true,
				["targetAlpha"] = 1,
				["targetFrameStrata"] = 2,
				["updateThrottle"] = 100,
				["useAlpha"] = true,
				["useAlphaMouseover"] = true,
				["useAlphaTarget"] = true,
				["xOffset"] = -10,
				["yOffset"] = 0,
			},
			["cooldown"] = true,
			["cooldownEdge"] = false,
			["cooldownSwipe"] = true,
			["cooldownTextDisabled"] = false,
			["cooldownTextEnabled"] = true,
			["customText"] = "function()\n    if aura_env.state then\n        aura_env.NEAupdateRegion(aura_env.state, aura_env.state.aura_num, aura_env.state.num_auras)\n    end\nend\n\n\n\n",
			["customTextUpdate"] = "event",
			["desaturate"] = false,
			["frameStrata"] = 2,
			["height"] = 30,
			["icon"] = true,
			["iconSource"] = -1,
			["id"] = "Nameplate Enemy Auras",
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["internalVersion"] = 45,
			["inverse"] = false,
			["keepAspectRatio"] = false,
			["load"] = {
				["class"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
						["challenge"] = true,
					},
					["single"] = "challenge",
				},
				["faction"] = {
					["multi"] = {
					},
				},
				["ingroup"] = {
					["multi"] = {
					},
				},
				["level"] = "110",
				["level_operator"] = ">",
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["role"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
						["party"] = true,
					},
					["single"] = "party",
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["talent2"] = {
					["multi"] = {
					},
				},
				["use_encounterid"] = false,
				["use_level"] = false,
				["use_never"] = false,
				["zoneIds"] = "",
			},
			["preferToUpdate"] = true,
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["semver"] = "4.3.15",
			["stickyDuration"] = false,
			["subRegions"] = {
				{
					["anchorXOffset"] = 0,
					["anchorYOffset"] = 0,
					["rotateText"] = "NONE",
					["text_anchorPoint"] = "OUTER_BOTTOM",
					["text_automaticWidth"] = "Auto",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_fixedWidth"] = 64,
					["text_font"] = "2002",
					["text_fontSize"] = 24,
					["text_fontType"] = "OUTLINE",
					["text_justify"] = "CENTER",
					["text_selfPoint"] = "AUTO",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_shadowXOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["text_text"] = "%c",
					["text_visible"] = true,
					["text_wordWrap"] = "WordWrap",
					["type"] = "subtext",
				}, -- [1]
				{
					["anchorXOffset"] = 0,
					["anchorYOffset"] = 0,
					["rotateText"] = "NONE",
					["text_anchorPoint"] = "INNER_BOTTOMRIGHT",
					["text_automaticWidth"] = "Auto",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_fixedWidth"] = 64,
					["text_font"] = "2002",
					["text_fontSize"] = 12,
					["text_fontType"] = "OUTLINE",
					["text_justify"] = "CENTER",
					["text_selfPoint"] = "AUTO",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_shadowXOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["text_text"] = "%s",
					["text_text_format_s_format"] = "none",
					["text_visible"] = true,
					["text_wordWrap"] = "WordWrap",
					["type"] = "subtext",
				}, -- [2]
				{
					["glow"] = false,
					["glowBorder"] = false,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["glowFrequency"] = 0.25,
					["glowLength"] = 10,
					["glowLines"] = 8,
					["glowScale"] = 1,
					["glowThickness"] = 4,
					["glowType"] = "buttonOverlay",
					["glowXOffset"] = 0,
					["glowYOffset"] = 0,
					["type"] = "subglow",
					["useGlowColor"] = false,
				}, -- [3]
			},
			["tocversion"] = 90005,
			["triggers"] = {
				[1] = {
					["trigger"] = {
						["check"] = "event",
						["custom"] = "function(states, event, unit, ...)\n    if not states then return end\n    if event == \"NEA_AURAS_INIT\" then\n        for i = 1, 80 do\n            local unit = \"nameplate\"..i\n            if UnitExists(unit) then\n                WeakAuras.ScanEvents(\"NEA_AURAS_INIT_UNIT\", unit)\n            end\n        end\n    end\n    \n    if not unit or not string.match(unit, \"nameplate\") then\n        return true\n    end\n    \n    aura_env.throttleTimes = aura_env.throttleTimes or {}\n    \n    if not UnitExists(unit) then\n        for _, state in pairs(states) do\n            if state.unit == unit then\n                state.show = false\n                state.changed = true\n            end\n        end\n        aura_env.throttleTimes[unit] = nil\n        return true\n    end\n    \n    \n    local time = GetTime() * 1000\n    if time >= (aura_env.throttleTimes[unit] or 0) + aura_env.config[\"updateThrottle\"] then\n        aura_env.throttleTimes[unit] = time\n    else\n        if event ~= \"NAME_PLATE_UNIT_REMOVED\" then\n            return true            \n        end\n    end\n    \n    \n    local unitReaction = UnitReaction(unit, \"player\") or 3 -- assume enemy by default\n    if unitReaction <= 3 and aura_env.config[\"showOnUnitTypes\"] == 1 then\n        return true\n    end\n    if unitReaction >= 5 and aura_env.config[\"showOnUnitTypes\"] == 2 then\n        return true\n    end\n    \n    \n    if event == \"NAME_PLATE_UNIT_ADDED\" or event == \"UNIT_AURA\" or event == \"NEA_AURAS_INIT_UNIT\" then\n        for _, state in pairs(states) do\n            if state.unit == unit then\n                state.show = false;\n                state.changed = true;\n            end\n        end\n        \n        local nameplate = C_NamePlate.GetNamePlateForUnit(unit, issecure())\n        if not nameplate then\n            return true\n        end\n        \n        local locstates = {}\n        \n        local missingDebuffs = {}\n        if aura_env.config[\"showMissing\"] then\n            missingDebuffs = CopyTable(aura_env.missingDebuffs)\n        end\n        \n        -- handle debuffs on the target\n        for i = 1, 255 do\n            local name, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable, nameplateShowPersonal, spellId = UnitDebuff(unit, i)\n            if not name then break end\n            local state = {\n                buffType = 1,\n                show = true,\n                changed = true,\n                spellId = spellId,\n                unit = unit,\n                progressType = \"timed\",\n                duration = duration,\n                expirationTime = expirationTime,\n                name = name,\n                icon = icon,\n                stacks = (count == 0 and nil or count),\n                debuffType = debuffType,\n                autoHide = true,\n                resort = true,\n                type = debuffType,\n                cloneId = unit..\"-\"..spellId,\n                missingAura = false,\n                caster = unitCaster,\n                nameplate = nameplate,\n            }\n            if aura_env.NEAisShowBuff(state) then\n                table.insert(locstates, state)\n            end\n            \n            if aura_env.config[\"showMissing\"] then\n                if (unitCaster == \"player\" and aura_env.config[\"showOwnMissing\"]) or not aura_env.config[\"showOwnMissing\"] then \n                    missingDebuffs[\"\"..spellId] = false\n                end\n            end\n        end\n        \n        -- handle buffs on the target\n        local num_bolster = 0\n        for i = 1, 255 do\n            local name, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable, nameplateShowPersonal, spellId = UnitBuff(unit, i)\n            if not name then break end\n            local state = {\n                buffType = 2,\n                show = true,\n                changed = true,\n                spellId = spellId,\n                unit = unit,\n                progressType = \"timed\",\n                duration = duration,\n                expirationTime = expirationTime,\n                name = name,\n                icon = icon,\n                stacks = (count == 0 and nil or count),\n                debuffType = debuffType,\n                autoHide = true,\n                resort = true,\n                type = debuffType,\n                cloneId = unit..\"-\"..spellId,\n                missingAura = false,\n                isStealable = isStealable and aura_env.config[\"showPurgeGlow\"],\n                caster = unitCaster,\n                nameplate = nameplate,\n            }\n            if aura_env.config[\"showBolster\"] and state.spellId == 209859 then -- handle bolstering separately to show stacks\n                if num_bolster == 0 then\n                    table.insert(locstates, state)\n                end\n                num_bolster = num_bolster + 1\n            elseif aura_env.NEAisShowBuff(state) then\n                table.insert(locstates, state)\n            end\n        end\n        \n        -- handle missing debuffs if enabled\n        if aura_env.config[\"missingDebuffs\"] then\n            --if UnitAffectingCombat(unit) and InCombatLockdown() then\n            for id, miss in pairs(missingDebuffs) do\n                if miss then\n                    local name, _, icon, _, _, _, spellId = GetSpellInfo(id)\n                    local state = {\n                        buffType = 1,\n                        show = true,\n                        changed = true,\n                        spellId = spellId,\n                        unit = unit,\n                        progressType = \"static\",\n                        name = name,\n                        icon = icon,\n                        aura_type = \"MISSING\",\n                        resort = true,\n                        cloneId = unit..\"-\"..spellId..\"-MISSING\",\n                        missingAura = true,\n                    }\n                    table.insert(locstates, state)\n                end\n            end\n            --end\n        end\n        \n        -- sort the auras (for consistency)\n        table.sort(locstates, function(t1, t2)\n                if not t2 then\n                    return true\n                end\n                \n                if t1.missingAura and not t2.missingAura then\n                    return true\n                end\n                if t2.missingAura and not t1.missingAura then\n                    return false\n                end\n                \n                if t1.buffType < t2.buffType then \n                    return true \n                end\n                if t1.buffType > t2.buffType then \n                    return false\n                end\n                return t1.spellId < t2.spellId\n        end)\n        \n        -- update states for WA\n        for aura_num, state in ipairs(locstates) do\n            --aura_env.NEAupdateRegion(state, aura_num, num_auras)\n            state.num_auras = #locstates\n            state.aura_num = aura_num\n            --state.lastUpdate = GetTime()\n            if state.spellId == 209859 then\n                state.stacks = num_bolster\n            end\n            states[state.cloneId] = state\n        end\n        \n    end\n    \n    if event == \"NAME_PLATE_UNIT_REMOVED\" then\n        for _, state in pairs(states) do\n            if state.unit == unit then\n                state.show = false\n                state.changed = true\n            end\n        end\n        aura_env.throttleTimes[unit] = nil\n    end\n    \n    \n    \n    return true\nend",
						["customVariables"] = "{\n    missingAura = \"bool\",\n    isStealable = \"bool\",\n}",
						["custom_type"] = "stateupdate",
						["debuffType"] = "HELPFUL",
						["event"] = "Health",
						["events"] = "NAME_PLATE_UNIT_ADDED, NAME_PLATE_UNIT_REMOVED, UNIT_AURA, NEA_AURAS_DELAYED, NEA_AURAS_INIT, NEA_AURAS_INIT_UNIT",
						["names"] = {
						},
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "custom",
						["unit"] = "nameplate",
					},
					["untrigger"] = {
					},
				},
				[2] = {
					["trigger"] = {
						["custom"] = "-- update frame alpha and strata for mouseover\nfunction(event, ...)\n    local states = {}    \n    for cloneId, clone in pairs(WeakAuras.clones[aura_env.id]) do\n        local state = clone.state\n        if state.show then\n            state.cloneId = cloneId\n            table.insert(states, state)\n        end\n    end\n    \n    table.sort(states, function(t1, t2)\n            if not t2 then\n                return true\n            end\n            \n            if t1.buffType < t2.buffType then \n                return true \n            end\n            if t1.buffType > t2.buffType then \n                return false\n            end\n            return t1.spellId < t2.spellId\n    end)\n    \n    for aura_num, state in ipairs(states) do\n        local unit = state.unit\n        if unit then\n            state.nameplate = state.nameplate or C_NamePlate.GetNamePlateForUnit(state.unit)\n            local region = WeakAuras.GetRegion(aura_env.id, state.cloneId)\n            if state.nameplate then\n                aura_env.NEAupdateRegionGraphics(state.nameplate, region, state)\n            end\n        end\n    end\n    \n    if event ~= \"NEA_CURSOR_DELAYED\" and not aura_env.NEA_CURSOR_DELAYED then\n        C_Timer.After(0.1, function() WeakAuras.ScanEvents(\"NEA_CURSOR_DELAYED\") end)\n        aura_env.NEA_CURSOR_DELAYED = true\n    elseif aura_env.NEA_CURSOR_DELAYED then\n        aura_env.NEA_CURSOR_DELAYED = false\n    end\nend\n\n\n\n\n\n",
						["custom_hide"] = "custom",
						["custom_type"] = "event",
						["duration"] = "1",
						["event"] = "Chat Message",
						["events"] = "UPDATE_MOUSEOVER_UNIT CURSOR_UPDATE NEA_CURSOR_DELAYED UNIT_TARGET UNIT_AURA",
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "custom",
						["unevent"] = "timed",
					},
					["untrigger"] = {
					},
				},
				["activeTriggerMode"] = 1,
				["customTriggerLogic"] = "function(triggers)\n    if triggers then\n        return triggers[1]\n    else\n        return false\n    end\nend",
				["disjunctive"] = "custom",
			},
			["uid"] = "UYHcKKm(x3i",
			["url"] = "https://wago.io/SyNLm-ACX/46",
			["version"] = 46,
			["width"] = 30,
			["xOffset"] = 0,
			["yOffset"] = 0,
			["zoom"] = 0,
		},
		["Nameplate HP%"] = {
			["actions"] = {
				["finish"] = {
				},
				["init"] = {
				},
				["start"] = {
				},
			},
			["anchorFrameType"] = "NAMEPLATE",
			["anchorPoint"] = "RIGHT",
			["animation"] = {
				["finish"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["start"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
			},
			["authorOptions"] = {
			},
			["automaticWidth"] = "Auto",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["conditions"] = {
				{
					["changes"] = {
						{
							["property"] = "color",
							["value"] = {
								1, -- [1]
								0, -- [2]
								0.031372549019608, -- [3]
								1, -- [4]
							},
						}, -- [1]
					},
					["check"] = {
						["op"] = "<",
						["trigger"] = 1,
						["value"] = "20",
						["variable"] = "percenthealth",
					},
				}, -- [1]
			},
			["config"] = {
			},
			["customText"] = "function()\n    if aura_env.states[1].percenthealth then\n        return Round(aura_env.states[1].percenthealth)..\"%\"\n    end\nend",
			["customTextUpdate"] = "event",
			["desc"] = "Displays the current HP percentage on enemy nameplates",
			["displayText"] = "%c",
			["fixedWidth"] = 200,
			["font"] = "2002",
			["fontSize"] = 11,
			["frameStrata"] = 5,
			["id"] = "Nameplate HP%",
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["internalVersion"] = 45,
			["justify"] = "CENTER",
			["load"] = {
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["zoneIds"] = "",
			},
			["outline"] = "OUTLINE",
			["preferToUpdate"] = false,
			["regionType"] = "text",
			["selfPoint"] = "CENTER",
			["semver"] = "1.0.0",
			["shadowColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["shadowXOffset"] = 1,
			["shadowYOffset"] = -1,
			["subRegions"] = {
			},
			["tocversion"] = 90002,
			["triggers"] = {
				[1] = {
					["trigger"] = {
						["debuffType"] = "HELPFUL",
						["duration"] = "1",
						["event"] = "Health",
						["nameplateType"] = "hostile",
						["names"] = {
						},
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "unit",
						["unevent"] = "auto",
						["unit"] = "nameplate",
						["use_absorbMode"] = true,
						["use_nameplateType"] = true,
						["use_unit"] = true,
					},
					["untrigger"] = {
						["unit"] = "nameplate",
					},
				},
				["activeTriggerMode"] = -10,
			},
			["uid"] = "xkkxcYwmH4g",
			["url"] = "https://wago.io/vVSx1tdvj/1",
			["version"] = 1,
			["wordWrap"] = "WordWrap",
			["xOffset"] = 0,
			["yOffset"] = 0,
		},
		["Nameplate cast target"] = {
			["actions"] = {
				["finish"] = {
				},
				["init"] = {
				},
				["start"] = {
				},
			},
			["anchorFrameType"] = "NAMEPLATE",
			["anchorPoint"] = "CENTER",
			["animation"] = {
				["finish"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["start"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
			},
			["authorOptions"] = {
			},
			["automaticWidth"] = "Auto",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["config"] = {
			},
			["customTextUpdate"] = "event",
			["displayText"] = "%destUnit",
			["displayText_format_destUnit_abbreviate"] = false,
			["displayText_format_destUnit_abbreviate_max"] = 8,
			["displayText_format_destUnit_color"] = "class",
			["displayText_format_destUnit_format"] = "Unit",
			["displayText_format_destUnit_realm_name"] = "never",
			["displayText_format_p_format"] = "timed",
			["displayText_format_p_time_dynamic_threshold"] = 60,
			["displayText_format_p_time_format"] = 0,
			["displayText_format_p_time_precision"] = 1,
			["fixedWidth"] = 200,
			["font"] = "Friz Quadrata TT",
			["fontSize"] = 9,
			["frameStrata"] = 9,
			["id"] = "Nameplate cast target",
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["internalVersion"] = 45,
			["justify"] = "CENTER",
			["load"] = {
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["zoneIds"] = "",
			},
			["outline"] = "OUTLINE",
			["preferToUpdate"] = false,
			["regionType"] = "text",
			["selfPoint"] = "CENTER",
			["semver"] = "1.0.1",
			["shadowColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["shadowXOffset"] = 1,
			["shadowYOffset"] = -1,
			["subRegions"] = {
			},
			["tocversion"] = 90005,
			["triggers"] = {
				[1] = {
					["trigger"] = {
						["debuffType"] = "HELPFUL",
						["duration"] = "1",
						["event"] = "Cast",
						["names"] = {
						},
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "unit",
						["unevent"] = "auto",
						["unit"] = "nameplate",
						["use_absorbMode"] = true,
						["use_unit"] = true,
					},
					["untrigger"] = {
						["unit"] = "nameplate",
					},
				},
				["activeTriggerMode"] = -10,
			},
			["uid"] = "tS9ctGcgvKP",
			["url"] = "https://wago.io/NameplateCastTarget/2",
			["version"] = 2,
			["wordWrap"] = "WordWrap",
			["xOffset"] = 0,
			["yOffset"] = -15,
		},
		["Necrotic Wound"] = {
			["actions"] = {
				["finish"] = {
				},
				["init"] = {
				},
				["start"] = {
				},
			},
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["anchorPoint"] = "CENTER",
			["animation"] = {
				["finish"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["start"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
			},
			["authorOptions"] = {
			},
			["auto"] = true,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["config"] = {
			},
			["cooldown"] = true,
			["cooldownEdge"] = false,
			["cooldownSwipe"] = true,
			["cooldownTextDisabled"] = false,
			["cooldownTextEnabled"] = true,
			["customText"] = "function()\n    local tank = \"Player\";\n    for i=1, 5, 1 do\n        local unit = \"party\" .. i;\n        if(UnitGroupRolesAssigned(unit) == \"TANK\") then\n            tank = unit;\n            break\n        end        \n    end  \n    \n    --local _,_,_,count = UnitDebuff(tank, \"Necrotic Rot\");\n    --local _,_,_,count = UnitDebuff(tank, GetSpellInfo(209858));\n    local _,_,count = AuraUtil.FindAuraByName(GetSpellInfo(209858), tank, \"HARMFUL\")\n    local percentage = 0;\n    if(count ~= nil) then \n        percentage = count * 2;          \n    end\n    \n    return percentage;\nend\n\n\n\n\n\n\n\n\n\n\n\n",
			["customTextUpdate"] = "update",
			["desaturate"] = false,
			["displayIcon"] = 458736,
			["frameStrata"] = 1,
			["height"] = 50,
			["icon"] = true,
			["iconSource"] = -1,
			["id"] = "Necrotic Wound",
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["internalVersion"] = 45,
			["inverse"] = false,
			["keepAspectRatio"] = false,
			["load"] = {
				["affixes"] = {
					["single"] = 4,
				},
				["class"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
					["single"] = "challenge",
				},
				["faction"] = {
					["multi"] = {
					},
				},
				["ingroup"] = {
					["multi"] = {
					},
				},
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["role"] = {
					["multi"] = {
						["HEALER"] = true,
						["TANK"] = true,
					},
				},
				["size"] = {
					["multi"] = {
					},
					["single"] = "party",
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["talent2"] = {
					["multi"] = {
					},
				},
				["use_affixes"] = true,
				["use_difficulty"] = true,
				["use_never"] = false,
				["use_role"] = false,
				["use_size"] = true,
				["zoneIds"] = "",
			},
			["parent"] = "Dungeons - Mythic+ Affixes ",
			["preferToUpdate"] = false,
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["semver"] = "1.0.3",
			["stickyDuration"] = false,
			["subRegions"] = {
				{
					["anchorXOffset"] = 0,
					["anchorYOffset"] = 0,
					["rotateText"] = "NONE",
					["text_anchorPoint"] = "OUTER_TOP",
					["text_automaticWidth"] = "Auto",
					["text_color"] = {
						0, -- [1]
						1, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_fixedWidth"] = 64,
					["text_font"] = "Friz Quadrata TT",
					["text_fontSize"] = 14,
					["text_fontType"] = "OUTLINE",
					["text_justify"] = "CENTER",
					["text_selfPoint"] = "AUTO",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_shadowXOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["text_text"] = "%c%",
					["text_visible"] = true,
					["text_wordWrap"] = "WordWrap",
					["type"] = "subtext",
				}, -- [1]
				{
					["anchorXOffset"] = 0,
					["anchorYOffset"] = 0,
					["rotateText"] = "NONE",
					["text_anchorPoint"] = "INNER_BOTTOMRIGHT",
					["text_automaticWidth"] = "Auto",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_fixedWidth"] = 64,
					["text_font"] = "Friz Quadrata TT",
					["text_fontSize"] = 18,
					["text_fontType"] = "OUTLINE",
					["text_justify"] = "CENTER",
					["text_selfPoint"] = "AUTO",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_shadowXOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["text_text"] = "%s",
					["text_text_format_s_format"] = "none",
					["text_visible"] = true,
					["text_wordWrap"] = "WordWrap",
					["type"] = "subtext",
				}, -- [2]
			},
			["tocversion"] = 90002,
			["triggers"] = {
				[1] = {
					["trigger"] = {
						["auranames"] = {
							"Necrotic Wound", -- [1]
						},
						["buffShowOn"] = "showOnActive",
						["combineMatches"] = "showLowest",
						["custom_hide"] = "timed",
						["debuffType"] = "HARMFUL",
						["event"] = "Health",
						["groupclone"] = false,
						["name_info"] = "aura",
						["names"] = {
							"Necrotic Wound", -- [1]
						},
						["showClones"] = false,
						["specificUnit"] = "party1",
						["spellIds"] = {
						},
						["stack_info"] = "stack",
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "aura2",
						["unit"] = "member",
						["useGroup_count"] = false,
						["useName"] = true,
						["use_debuffClass"] = false,
						["use_specific_unit"] = false,
						["use_tooltip"] = false,
					},
					["untrigger"] = {
					},
				},
				["activeTriggerMode"] = -10,
				["disjunctive"] = "all",
			},
			["uid"] = "apsIVjB3LGu",
			["url"] = "https://wago.io/EE8ENuch7/4",
			["version"] = 4,
			["width"] = 50,
			["xOffset"] = 210,
			["yOffset"] = -340,
			["zoom"] = 0,
		},
		["Prideful Buff"] = {
			["actions"] = {
				["finish"] = {
				},
				["init"] = {
				},
				["start"] = {
				},
			},
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["anchorPoint"] = "CENTER",
			["animation"] = {
				["finish"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["start"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
			},
			["authorOptions"] = {
			},
			["auto"] = true,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["config"] = {
			},
			["cooldown"] = true,
			["cooldownEdge"] = false,
			["cooldownSwipe"] = true,
			["cooldownTextDisabled"] = false,
			["desaturate"] = false,
			["frameStrata"] = 1,
			["height"] = 50,
			["icon"] = true,
			["iconSource"] = -1,
			["id"] = "Prideful Buff",
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["internalVersion"] = 45,
			["inverse"] = false,
			["keepAspectRatio"] = false,
			["load"] = {
				["affixes"] = {
					["multi"] = {
						[121] = true,
					},
					["single"] = 121,
				},
				["class"] = {
					["multi"] = {
					},
				},
				["ingroup"] = {
					["single"] = "group",
				},
				["size"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["use_affixes"] = true,
				["use_ingroup"] = true,
				["zoneIds"] = "",
			},
			["parent"] = "Dungeons - Mythic+ Affixes ",
			["preferToUpdate"] = false,
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["semver"] = "1.0.3",
			["subRegions"] = {
				{
					["glow"] = false,
					["glowBorder"] = false,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["glowFrequency"] = 0.25,
					["glowLength"] = 10,
					["glowLines"] = 8,
					["glowScale"] = 1,
					["glowThickness"] = 1,
					["glowType"] = "buttonOverlay",
					["glowXOffset"] = 0,
					["glowYOffset"] = 0,
					["type"] = "subglow",
					["useGlowColor"] = false,
				}, -- [1]
				{
					["anchorXOffset"] = 0,
					["anchorYOffset"] = 0,
					["rotateText"] = "NONE",
					["text_anchorPoint"] = "OUTER_BOTTOM",
					["text_automaticWidth"] = "Auto",
					["text_color"] = {
						1, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_fixedWidth"] = 64,
					["text_font"] = "Friz Quadrata TT",
					["text_fontSize"] = 12,
					["text_fontType"] = "OUTLINE",
					["text_justify"] = "CENTER",
					["text_selfPoint"] = "AUTO",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_shadowXOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["text_text"] = "Buffed",
					["text_text_format_p_format"] = "timed",
					["text_text_format_p_time_dynamic_threshold"] = 60,
					["text_text_format_p_time_format"] = 0,
					["text_text_format_p_time_precision"] = 1,
					["text_visible"] = true,
					["text_wordWrap"] = "WordWrap",
					["type"] = "subtext",
				}, -- [2]
				{
					["glow"] = true,
					["glowBorder"] = false,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["glowFrequency"] = 0.25,
					["glowLength"] = 10,
					["glowLines"] = 8,
					["glowScale"] = 1,
					["glowThickness"] = 1,
					["glowType"] = "ACShine",
					["glowXOffset"] = 0,
					["glowYOffset"] = 0,
					["type"] = "subglow",
					["useGlowColor"] = false,
				}, -- [3]
			},
			["tocversion"] = 90002,
			["triggers"] = {
				[1] = {
					["trigger"] = {
						["auranames"] = {
							"340880", -- [1]
						},
						["debuffType"] = "HARMFUL",
						["event"] = "Health",
						["names"] = {
						},
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "aura2",
						["unit"] = "player",
						["useName"] = true,
					},
					["untrigger"] = {
					},
				},
				["activeTriggerMode"] = -10,
			},
			["uid"] = "9FIarFHZLcj",
			["url"] = "https://wago.io/EE8ENuch7/4",
			["version"] = 4,
			["width"] = 50,
			["xOffset"] = 210,
			["yOffset"] = -340,
			["zoom"] = 0.3,
		},
		["Quaking"] = {
			["actions"] = {
				["finish"] = {
				},
				["init"] = {
					["do_custom"] = false,
				},
				["start"] = {
					["do_message"] = false,
					["do_sound"] = true,
					["sound"] = "Interface\\AddOns\\BigWigs\\Media\\Sounds\\Alert.ogg",
				},
			},
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["anchorPoint"] = "CENTER",
			["animation"] = {
				["finish"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["preset"] = "bounce",
					["type"] = "preset",
				},
				["start"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["preset"] = "bounceDecay",
					["type"] = "none",
				},
			},
			["authorOptions"] = {
			},
			["auto"] = true,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["config"] = {
			},
			["cooldown"] = true,
			["cooldownEdge"] = false,
			["cooldownSwipe"] = true,
			["cooldownTextDisabled"] = false,
			["cooldownTextEnabled"] = true,
			["customTextUpdate"] = "update",
			["desaturate"] = false,
			["frameStrata"] = 1,
			["height"] = 50,
			["icon"] = true,
			["iconSource"] = -1,
			["id"] = "Quaking",
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["internalVersion"] = 45,
			["inverse"] = true,
			["keepAspectRatio"] = false,
			["load"] = {
				["affixes"] = {
					["multi"] = {
					},
					["single"] = 14,
				},
				["class"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
						["challenge"] = true,
					},
					["single"] = "challenge",
				},
				["faction"] = {
					["multi"] = {
					},
				},
				["ingroup"] = {
					["multi"] = {
					},
				},
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["role"] = {
					["multi"] = {
						["DAMAGER"] = true,
						["HEALER"] = true,
						["TANK"] = true,
					},
				},
				["size"] = {
					["multi"] = {
						["party"] = true,
					},
					["single"] = "party",
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["talent2"] = {
					["multi"] = {
					},
				},
				["talent3"] = {
					["multi"] = {
					},
				},
				["use_affixes"] = true,
				["use_difficulty"] = true,
				["use_never"] = false,
				["use_size"] = true,
				["zoneIds"] = "",
			},
			["parent"] = "Dungeons - Mythic+ Affixes ",
			["preferToUpdate"] = false,
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["semver"] = "1.0.3",
			["stickyDuration"] = false,
			["subRegions"] = {
				{
					["anchorXOffset"] = 0,
					["anchorYOffset"] = 0,
					["rotateText"] = "NONE",
					["text_anchorPoint"] = "OUTER_BOTTOM",
					["text_automaticWidth"] = "Auto",
					["text_color"] = {
						1, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_fixedWidth"] = 64,
					["text_font"] = "Friz Quadrata TT",
					["text_fontSize"] = 12,
					["text_fontType"] = "OUTLINE",
					["text_justify"] = "CENTER",
					["text_selfPoint"] = "AUTO",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_shadowXOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["text_text"] = "Move",
					["text_visible"] = true,
					["text_wordWrap"] = "WordWrap",
					["type"] = "subtext",
				}, -- [1]
			},
			["tocversion"] = 90002,
			["triggers"] = {
				[1] = {
					["trigger"] = {
						["auraspellids"] = {
							"240447", -- [1]
						},
						["buffShowOn"] = "showOnActive",
						["combineMatches"] = "showLowest",
						["debuffClass"] = {
							["none"] = true,
						},
						["debuffType"] = "HARMFUL",
						["event"] = "Health",
						["fullscan"] = true,
						["matchesShowOn"] = "showOnActive",
						["name"] = "Quake",
						["names"] = {
							"Quake", -- [1]
						},
						["spellId"] = "240447",
						["spellIds"] = {
							240447, -- [1]
						},
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "aura2",
						["unit"] = "player",
						["useExactSpellId"] = true,
						["useGroup_count"] = false,
						["use_debuffClass"] = false,
						["use_spellId"] = true,
						["use_tooltip"] = false,
					},
					["untrigger"] = {
					},
				},
				["activeTriggerMode"] = -10,
				["disjunctive"] = "all",
			},
			["uid"] = "OaCTgb(mjV8",
			["url"] = "https://wago.io/EE8ENuch7/4",
			["version"] = 4,
			["width"] = 50,
			["xOffset"] = 210,
			["yOffset"] = -340,
			["zoom"] = 0,
		},
		["Sanguine DOT"] = {
			["actions"] = {
				["finish"] = {
				},
				["init"] = {
				},
				["start"] = {
					["do_sound"] = false,
					["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\Idiot.ogg",
				},
			},
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["anchorPoint"] = "CENTER",
			["animation"] = {
				["finish"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["preset"] = "bounce",
					["type"] = "preset",
				},
				["start"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["preset"] = "bounceDecay",
					["type"] = "none",
				},
			},
			["authorOptions"] = {
			},
			["auto"] = true,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["config"] = {
			},
			["cooldown"] = false,
			["cooldownEdge"] = false,
			["cooldownSwipe"] = true,
			["cooldownTextDisabled"] = false,
			["cooldownTextEnabled"] = true,
			["customTextUpdate"] = "update",
			["desaturate"] = false,
			["frameStrata"] = 1,
			["height"] = 50,
			["icon"] = true,
			["iconSource"] = -1,
			["id"] = "Sanguine DOT",
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["internalVersion"] = 45,
			["inverse"] = false,
			["keepAspectRatio"] = false,
			["load"] = {
				["affixes"] = {
					["multi"] = {
					},
					["single"] = 8,
				},
				["class"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
						["challenge"] = true,
					},
					["single"] = "challenge",
				},
				["faction"] = {
					["multi"] = {
					},
				},
				["ingroup"] = {
					["multi"] = {
					},
				},
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["role"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
						["party"] = true,
					},
					["single"] = "party",
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["talent2"] = {
					["multi"] = {
					},
				},
				["talent3"] = {
					["multi"] = {
					},
				},
				["use_affixes"] = true,
				["use_difficulty"] = true,
				["use_never"] = false,
				["use_size"] = true,
				["zoneIds"] = "",
			},
			["parent"] = "Dungeons - Mythic+ Affixes ",
			["preferToUpdate"] = false,
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["semver"] = "1.0.3",
			["stickyDuration"] = false,
			["subRegions"] = {
				{
					["anchorXOffset"] = 0,
					["anchorYOffset"] = 0,
					["rotateText"] = "NONE",
					["text_anchorPoint"] = "OUTER_BOTTOM",
					["text_automaticWidth"] = "Auto",
					["text_color"] = {
						1, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_fixedWidth"] = 64,
					["text_font"] = "Friz Quadrata TT",
					["text_fontSize"] = 12,
					["text_fontType"] = "OUTLINE",
					["text_justify"] = "CENTER",
					["text_selfPoint"] = "AUTO",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_shadowXOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["text_text"] = "Move",
					["text_visible"] = true,
					["text_wordWrap"] = "WordWrap",
					["type"] = "subtext",
				}, -- [1]
			},
			["tocversion"] = 90002,
			["triggers"] = {
				[1] = {
					["trigger"] = {
						["auranames"] = {
							"226512", -- [1]
						},
						["buffShowOn"] = "showOnActive",
						["combineMatches"] = "showLowest",
						["debuffType"] = "HARMFUL",
						["event"] = "Health",
						["matchesShowOn"] = "showOnActive",
						["name"] = "Sanguine Ichor",
						["names"] = {
							"Sanguine Ichor", -- [1]
						},
						["spellId"] = "226512",
						["spellIds"] = {
							226512, -- [1]
						},
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "aura2",
						["unit"] = "player",
						["useGroup_count"] = false,
						["useName"] = true,
						["use_debuffClass"] = false,
						["use_name"] = true,
						["use_spellId"] = true,
						["use_tooltip"] = false,
					},
					["untrigger"] = {
					},
				},
				["activeTriggerMode"] = -10,
				["disjunctive"] = "all",
			},
			["uid"] = "Xe1V6RUokaC",
			["url"] = "https://wago.io/EE8ENuch7/4",
			["version"] = 4,
			["width"] = 50,
			["xOffset"] = 210,
			["yOffset"] = -340,
			["zoom"] = 0,
		},
		["Sanguine Heal"] = {
			["actions"] = {
				["finish"] = {
				},
				["init"] = {
				},
				["start"] = {
					["do_sound"] = false,
					["sound"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Sounds\\wilhelm.ogg",
				},
			},
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["anchorPoint"] = "CENTER",
			["animation"] = {
				["finish"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["preset"] = "alphaPulse",
					["type"] = "preset",
				},
				["start"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
			},
			["authorOptions"] = {
			},
			["auto"] = true,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["config"] = {
			},
			["cooldown"] = false,
			["cooldownEdge"] = false,
			["cooldownSwipe"] = true,
			["cooldownTextDisabled"] = false,
			["cooldownTextEnabled"] = true,
			["customTextUpdate"] = "update",
			["desaturate"] = false,
			["displayIcon"] = 1029738,
			["frameStrata"] = 1,
			["height"] = 50,
			["icon"] = true,
			["iconSource"] = 0,
			["id"] = "Sanguine Heal",
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["internalVersion"] = 45,
			["inverse"] = false,
			["keepAspectRatio"] = false,
			["load"] = {
				["affixes"] = {
					["multi"] = {
					},
					["single"] = 8,
				},
				["class"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
						["challenge"] = true,
					},
					["single"] = "challenge",
				},
				["faction"] = {
					["multi"] = {
					},
				},
				["ingroup"] = {
					["multi"] = {
					},
				},
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["role"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
						["party"] = true,
					},
					["single"] = "party",
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["talent2"] = {
					["multi"] = {
					},
				},
				["talent3"] = {
					["multi"] = {
					},
				},
				["use_affixes"] = true,
				["use_difficulty"] = true,
				["use_never"] = false,
				["use_size"] = true,
				["zoneIds"] = "",
			},
			["parent"] = "Dungeons - Mythic+ Affixes ",
			["preferToUpdate"] = false,
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["semver"] = "1.0.3",
			["stickyDuration"] = false,
			["subRegions"] = {
				{
					["anchorXOffset"] = 0,
					["anchorYOffset"] = 0,
					["rotateText"] = "NONE",
					["text_anchorPoint"] = "OUTER_BOTTOM",
					["text_automaticWidth"] = "Auto",
					["text_color"] = {
						1, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_fixedWidth"] = 64,
					["text_font"] = "Friz Quadrata TT",
					["text_fontSize"] = 12,
					["text_fontType"] = "OUTLINE",
					["text_justify"] = "CENTER",
					["text_selfPoint"] = "AUTO",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_shadowXOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["text_text"] = "Pull Out",
					["text_visible"] = true,
					["text_wordWrap"] = "WordWrap",
					["type"] = "subtext",
				}, -- [1]
			},
			["tocversion"] = 90002,
			["triggers"] = {
				[1] = {
					["trigger"] = {
						["auranames"] = {
							"Sanguine Ichor", -- [1]
						},
						["buffShowOn"] = "showOnActive",
						["combineMatches"] = "showLowest",
						["debuffType"] = "HELPFUL",
						["event"] = "Health",
						["matchesShowOn"] = "showOnActive",
						["name"] = "Sanguine Ichor",
						["names"] = {
							"Sanguine Ichor", -- [1]
						},
						["spellId"] = "226510",
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "aura2",
						["unit"] = "target",
						["useGroup_count"] = false,
						["useName"] = true,
						["use_debuffClass"] = false,
						["use_name"] = true,
						["use_specific_unit"] = false,
						["use_spellId"] = true,
						["use_tooltip"] = false,
					},
					["untrigger"] = {
					},
				},
				["activeTriggerMode"] = -10,
				["disjunctive"] = "all",
			},
			["uid"] = "GG)ABrH0IEp",
			["url"] = "https://wago.io/EE8ENuch7/4",
			["version"] = 4,
			["width"] = 50,
			["xOffset"] = 210,
			["yOffset"] = -340,
			["zoom"] = 0,
		},
		["Spiteful Focus"] = {
			["actions"] = {
				["finish"] = {
				},
				["init"] = {
					["custom"] = "aura_env.units = {}\nlocal C = aura_env.config\nlocal glowKey = \"explosiveOrbs20\"\nlocal tidyplatesHeight = 8\nlocal GMAP = {\n  color = C.glowColor,\n  type = C.glowType,\n  particles = C.glowParticles,\n  frequency = C.glowFrequency,\n  xOffset = C.glowXOffset,\n  yOffset = C.glowYOffset,\n  length = C.glowLength,\n  thickness = C.glowThickness,\n  border = C.glowBorder,\n  scale = C.glowScale\n}\nlocal SOUNDS = {\n  '',\n  [[Interface\\AddOns\\WeakAuras\\PowerAurasMedia\\Sounds\\Sonar.ogg]],\n  [[Interface\\AddOns\\WeakAuras\\Media\\Sounds\\AirHorn.ogg]],\n  [[Interface\\AddOns\\WeakAuras\\Media\\Sounds\\BikeHorn.ogg]],\n  [[Interface\\AddOns\\WeakAuras\\PowerAurasMedia\\Sounds\\wilhelm.ogg]],\n  [[Interface\\AddOns\\WeakAuras\\PowerAurasMedia\\Sounds\\phone.ogg]],\n  [[Interface\\AddOns\\WeakAuras\\PowerAurasMedia\\Sounds\\BITE.ogg]],\n  [[Interface\\AddOns\\WeakAuras\\PowerAurasMedia\\Sounds\\bam.ogg]],\n}\n\nlocal function getFrame(unit)\n  local nameplate = C_NamePlate.GetNamePlateForUnit(unit)\n    if not nameplate then return end\n    if nameplate.unitFrame and nameplate.unitFrame.HealthBar then\n        -- elvui\n        return nameplate.unitFrame.HealthBar\n    elseif nameplate.unitFramePlater then\n        -- plater\n        return nameplate.unitFramePlater.healthBar\n    elseif nameplate.kui then\n        -- kui\n        return nameplate.kui.HealthBar\n    elseif nameplate.extended then\n        -- tidyplates\n        nameplate.extended.visual.healthbar:SetHeight(tidyplatesHeight)\n        return nameplate.extended.visual.healthbar\n    elseif nameplate.TPFrame then\n        -- tidyplates: threat plates\n        return nameplate.TPFrame.visual.healthbar\n    elseif nameplate.ouf then\n        -- bdNameplates\n        return nameplate.ouf.Health\n    elseif nameplate.UnitFrame then\n        -- default\n        return nameplate.UnitFrame.healthBar\n    else\n        return nameplate\n    end\nend\n\n\nlocal LCG = LibStub(\"LibCustomGlow-1.0\")\n\n--[[\n@param unit string unitID\n@param show bool Show Glow\n@param customColors table Color table to use for flow\n]]\nlocal function glow(unit, show, customColors)\n  if not C.glowEnable or not unit then return end\n  local frame = getFrame(unit)\n  if not frame then return end\n\n  local glowType = GMAP.type\n  local color = customColors or GMAP.color\n  if show then\n    -- Show Glow\n    if glowType == 1 then\n      -- Default\n      LCG.ButtonGlow_Start(frame, color, GMAP.frequency)\n    elseif glowType == 2 then\n      -- Pixel\n      LCG.PixelGlow_Start(frame, color, GMAP.particles, GMAP.frequency, GMAP.length, GMAP.thickness, GMAP.xOffset, GMAP.yOffset, GMAP.border, glowKey)\n    elseif glowType == 3 then\n      -- Shine\n      LCG.AutoCastGlow_Start(frame, color, GMAP.particles, GMAP.frequency, GMAP.scale, GMAP.xOffset, GMAP.yOffset, glowKey)\n    end\n  else\n    -- Hide Glow\n    if glowType == 1 then\n      -- Default\n      LCG.ButtonGlow_Stop(frame)\n    elseif glowType == 2 then\n      -- Pixel\n      LCG.PixelGlow_Stop(frame, glowKey)\n    elseif glowType == 3 then\n      -- Shine\n      LCG.AutoCastGlow_Stop(frame, glowKey)\n    end\n  end\n\n\nend\n\nlocal lastSound = 0\nlocal function playSound()\n  local getTime = GetTime()\n  if (C.sound ~= 0 and getTime - lastSound > C.soundDeadzone) then\n    lastSound = getTime\n    PlaySoundFile(SOUNDS[C.sound] or \"\", C.soundChannel)\n  end\nend\n\nlocal availableMarks = {true,true,true,true,true,true,true,true}\n\n--[[\n  Get target marker that's not being used for different unit\n]]\nlocal function GetAvailableMark()\n    for markId,avail in ipairs(availableMarks) do\n        if avail then\n            availableMarks[markId] = false\n            return markId\n        end\n    end\nend\n\n--[[\n  Show markers on all available units\n]]\nlocal function showMarks()\n  if not C.enableMarks then return end\n  local indx = 1\n  while indx <= 8 do\n    if (aura_env.units[indx] and not aura_env.units[indx].marked) then\n      local markId = GetAvailableMark()\n      SetRaidTarget(aura_env.units[indx].unit,markId)\n      aura_env.units[indx].marked = markId\n    elseif not aura_env.units[indx] then\n      break\n    end\n    indx = indx + 1\n  end\nend\n\nlocal function addUnit(unit)\n  table.insert(aura_env.units, {unit = unit})\nend\n\nlocal function removeUnit(unit)\n  for indx,unitInfo in ipairs(aura_env.units) do\n        if unitInfo.unit == unit then\n            if unitInfo.marked then\n                availableMarks[unitInfo.marked] = true\n            end\n            table.remove(aura_env.units,indx)\n            break\n        end\n    end\nend\n\n--[[\n  RAINBOWS\n]]\n\nlocal function hsvToRgb(h, s, v)\n  local r, g, b\n\n  local i = math.floor(h * 6);\n  local f = h * 6 - i;\n  local p = v * (1 - s);\n  local q = v * (1 - f * s);\n  local t = v * (1 - (1 - f) * s);\n\n  i = i % 6\n\n  if i == 0 then r, g, b = v, t, p\n  elseif i == 1 then r, g, b = q, v, p\n  elseif i == 2 then r, g, b = p, v, t\n  elseif i == 3 then r, g, b = p, q, v\n  elseif i == 4 then r, g, b = t, p, v\n  elseif i == 5 then r, g, b = v, p, q\n  end\n  return r, g, b\nend\n\nlocal colorElapsed = 0;\nlocal colorDelay = C.rainbowFrequency\nlocal colorDuration = C.rainbowDuration\nlocal aura_env = aura_env\nlocal r, g, b, a = unpack(GMAP.color)\nlocal hue = 0\n\nlocal function RainbowFunc(self,elaps)\n  colorElapsed = colorElapsed + elaps;\n  if(colorElapsed > colorDelay) then\n      colorElapsed = colorElapsed - colorDelay;\n      hue = hue >= 1 and 0 or hue + 1 / (colorDuration / colorDelay)\n      r, g, b = hsvToRgb(hue,1,1)\n  end\n  for unit in pairs(self.frames) do\n    glow(unit, true, {r, g, b, a})\n  end\nend\n\nlocal r = aura_env.region\nif (C.rainbowMode and not r.rainbowMode) then\n  r.rainbowMode = true\n  r.rainbowFrame = CreateFrame(\"Frame\")\n  r.rainbowFrame.frames = {}\n  function r.rainbowFrame:RegisterNameplate(unit)\n    self.frames[unit] = unit\n  end\n  function r.rainbowFrame:UnregisterNameplate(unit)\n    self.frames[unit] = nil\n  end\n  function r.rainbowFrame:ClearNameplates()\n    for i in pairs(self.frames) do\n      self.frames[i] = nil\n    end\n  end\n  r.rainbowFrame:SetScript(\"OnUpdate\", RainbowFunc)\nelseif C.rainbowMode and r.rainbowMode then\n  r.rainbowFrame:SetScript(\"OnUpdate\", RainbowFunc)\nend\n\n--[[\n  Main execution function\n]]\nfunction aura_env.executeForUnit(unit, show)\n\n  if (not show) then\n    removeUnit(unit)\n    if (C.rainbowMode) then\n      r.rainbowFrame:UnregisterNameplate(unit)\n    end\n  else\n    addUnit(unit)\n    playSound()\n    showMarks()\n    if (C.rainbowMode) then\n      r.rainbowFrame:RegisterNameplate(unit)\n    end\n  end\n\n  glow(unit, show)\n\nend\n\nlocal u = {strsplit(\",\", C.unitID)}\nlocal unitIDs = {}\nfor _, unitID in ipairs(u) do\n  unitIDs[unitID] = true\nend\nfunction aura_env.validateUnit(unit)\n  local guid = UnitGUID(unit)\n  local _, _, _, _, _, npcId = strsplit(\"-\",guid)\n  if (unitIDs[npcId]) then\n    return true\n  end\n  return C.testMode\nend\n\n-- hide default glow on options open\nlocal aura_env = aura_env\nif (not aura_env.region.hooked) then\n  hooksecurefunc(WeakAuras, \"OpenOptions\", function()\n          for i=1,40 do\n              local unit = \"nameplate\"..i\n              glow(unit, false)\n          end\n          if aura_env.region.rainbowFrame then\n              aura_env.region.rainbowFrame:ClearNameplates()\n          end\n          aura_env.region.hooked = true\n  end)\nend",
					["do_custom"] = true,
				},
				["start"] = {
					["do_sound"] = true,
					["sound"] = "Interface\\AddOns\\BigWigs\\Media\\Sounds\\Alert.ogg",
				},
			},
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["anchorPoint"] = "CENTER",
			["animation"] = {
				["finish"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["start"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
			},
			["authorOptions"] = {
				{
					["text"] = "Basic",
					["type"] = "header",
					["useName"] = true,
					["width"] = 1,
				}, -- [1]
				{
					["default"] = true,
					["desc"] = "Enables Glow on the nameplates",
					["key"] = "glowEnable",
					["name"] = "Enable Glow",
					["type"] = "toggle",
					["useDesc"] = true,
					["width"] = 2,
				}, -- [2]
				{
					["default"] = true,
					["desc"] = "Enables Icon to be shown on the screen with the count of the tracked units",
					["key"] = "iconEnable",
					["name"] = "Enable Icon",
					["type"] = "toggle",
					["useDesc"] = true,
					["width"] = 2,
				}, -- [3]
				{
					["default"] = false,
					["desc"] = "Marks the tracked units",
					["key"] = "enableMarks",
					["name"] = "Enable Marks",
					["type"] = "toggle",
					["useDesc"] = true,
					["width"] = 2,
				}, -- [4]
				{
					["default"] = 1,
					["desc"] = "Select what kind of sound should be played when unit shows up on screen",
					["key"] = "sound",
					["name"] = "Play sound",
					["type"] = "select",
					["useDesc"] = true,
					["values"] = {
						"None", -- [1]
						"Sonar", -- [2]
						"AirHorn", -- [3]
						"BikeHorn", -- [4]
						"Wilhelm", -- [5]
						"Phone", -- [6]
						"Bite", -- [7]
						"Bam", -- [8]
					},
					["width"] = 1,
				}, -- [5]
				{
					["default"] = 1,
					["desc"] = "Which channel should sound be played in",
					["key"] = "soundChannel",
					["name"] = "Sound Channel",
					["type"] = "select",
					["useDesc"] = true,
					["values"] = {
						"Master", -- [1]
						"Sound", -- [2]
						"Music", -- [3]
						"Ambience", -- [4]
						"Dialog", -- [5]
					},
					["width"] = 1,
				}, -- [6]
				{
					["text"] = "Glow",
					["type"] = "header",
					["useName"] = true,
					["width"] = 1,
				}, -- [7]
				{
					["default"] = 1,
					["desc"] = "Choose the type of the glow you want to be used",
					["key"] = "glowType",
					["name"] = "Glow Type",
					["type"] = "select",
					["useDesc"] = true,
					["values"] = {
						"Default", -- [1]
						"Pixel", -- [2]
						"Shine", -- [3]
					},
					["width"] = 2,
				}, -- [8]
				{
					["default"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["desc"] = "Choose the color of the glow",
					["key"] = "glowColor",
					["name"] = "Glow Color",
					["type"] = "color",
					["useDesc"] = true,
					["width"] = 1,
				}, -- [9]
				{
					["default"] = 0.2,
					["desc"] = "How fast glow particles are rotating around the frame",
					["key"] = "glowFrequency",
					["max"] = 5,
					["min"] = 0,
					["name"] = "Frequency",
					["step"] = 0.05,
					["type"] = "range",
					["useDesc"] = true,
					["width"] = 2,
				}, -- [10]
				{
					["fontSize"] = "small",
					["text"] = "\nSettings below only apply to pixel and shine glow types\n",
					["type"] = "description",
					["width"] = 2,
				}, -- [11]
				{
					["default"] = 8,
					["desc"] = "How many particles (Shine) should there be or number of lines (Pixel)",
					["key"] = "glowParticles",
					["max"] = 50,
					["min"] = 0,
					["name"] = "Particles",
					["step"] = 1,
					["type"] = "range",
					["useDesc"] = true,
					["width"] = 2,
				}, -- [12]
				{
					["default"] = 0,
					["desc"] = "X Offset relative to frame border",
					["key"] = "glowXOffset",
					["max"] = 50,
					["min"] = 0,
					["name"] = "X Offset",
					["step"] = 0.5,
					["type"] = "range",
					["useDesc"] = true,
					["width"] = 1,
				}, -- [13]
				{
					["default"] = 0,
					["desc"] = "Y Offset relative to frame border",
					["key"] = "glowYOffset",
					["max"] = 50,
					["min"] = 0,
					["name"] = "Y Offset",
					["step"] = 0.5,
					["type"] = "range",
					["useDesc"] = true,
					["width"] = 1,
				}, -- [14]
				{
					["default"] = 10,
					["desc"] = "Length of lines",
					["key"] = "glowLength",
					["max"] = 50,
					["min"] = 0,
					["name"] = "Length (Pixel Only)",
					["step"] = 0.1,
					["type"] = "range",
					["useDesc"] = true,
					["width"] = 1,
				}, -- [15]
				{
					["default"] = 2,
					["desc"] = "How thick lines should be",
					["key"] = "glowThickness",
					["max"] = 10,
					["min"] = 0,
					["name"] = "Thickness (Pixel Only)",
					["step"] = 0.1,
					["type"] = "range",
					["useDesc"] = true,
					["width"] = 1,
				}, -- [16]
				{
					["default"] = false,
					["desc"] = "Should glow have border under the lines",
					["key"] = "glowBorder",
					["name"] = "Border (Pixel Only)",
					["type"] = "toggle",
					["useDesc"] = true,
					["width"] = 2,
				}, -- [17]
				{
					["default"] = 1,
					["desc"] = "Scale of the particles",
					["key"] = "glowScale",
					["max"] = 10,
					["min"] = 0,
					["name"] = "Scale (Shine Only)",
					["step"] = 0.05,
					["type"] = "range",
					["useDesc"] = true,
					["width"] = 1,
				}, -- [18]
				{
					["text"] = "Advanced",
					["type"] = "header",
					["useName"] = true,
					["width"] = 1,
				}, -- [19]
				{
					["default"] = false,
					["desc"] = "RAINBOWS EVERYWHERE! |cffff0000Warning! This has a posibility to affect your fps as it's running on every frame.|r",
					["key"] = "rainbowMode",
					["name"] = "Rainbow Mode",
					["type"] = "toggle",
					["useDesc"] = true,
					["width"] = 1,
				}, -- [20]
				{
					["default"] = 0.02,
					["desc"] = "How quickly it is switching to next color",
					["key"] = "rainbowFrequency",
					["max"] = 2,
					["min"] = 0,
					["name"] = "Rainbow Frequency",
					["step"] = 0.01,
					["type"] = "range",
					["useDesc"] = true,
					["width"] = 1,
				}, -- [21]
				{
					["default"] = 1,
					["desc"] = "How long until has gone through all colors",
					["key"] = "rainbowDuration",
					["max"] = 5,
					["min"] = 0,
					["name"] = "Rainbow Full Sweep",
					["step"] = 0.1,
					["type"] = "range",
					["useDesc"] = true,
					["width"] = 1,
				}, -- [22]
				{
					["default"] = 1,
					["desc"] = "For how many seconds after sound has been played it's not triggered again. Helpful when multiple units are shown at the same time",
					["key"] = "soundDeadzone",
					["max"] = 3,
					["min"] = 0,
					["name"] = "Sound Deadzone",
					["step"] = 0.1,
					["type"] = "range",
					["useDesc"] = true,
					["width"] = 1,
				}, -- [23]
				{
					["default"] = "120651",
					["desc"] = "Select your own unitID, or add additional separated by comma (,) : 23213,21312,123123",
					["key"] = "unitID",
					["length"] = 10,
					["multiline"] = false,
					["name"] = "Unit ID",
					["type"] = "input",
					["useDesc"] = true,
					["useLength"] = false,
					["width"] = 1,
				}, -- [24]
				{
					["default"] = false,
					["desc"] = "Enables Weakaura to track all visible units and apply the settings on them",
					["key"] = "testMode",
					["name"] = "Test Mode",
					["type"] = "toggle",
					["useDesc"] = true,
					["width"] = 2,
				}, -- [25]
			},
			["auto"] = false,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["config"] = {
				["enableMarks"] = false,
				["glowBorder"] = true,
				["glowColor"] = {
					0.86666666666667, -- [1]
					0.6, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["glowEnable"] = false,
				["glowFrequency"] = 0.2,
				["glowLength"] = 6,
				["glowParticles"] = 10,
				["glowScale"] = 1,
				["glowThickness"] = 3,
				["glowType"] = 2,
				["glowXOffset"] = 2,
				["glowYOffset"] = 2,
				["iconEnable"] = true,
				["rainbowDuration"] = 3,
				["rainbowFrequency"] = 0.02,
				["rainbowMode"] = false,
				["sound"] = 1,
				["soundChannel"] = 1,
				["soundDeadzone"] = 1,
				["testMode"] = false,
				["unitID"] = "174773",
			},
			["cooldown"] = false,
			["cooldownEdge"] = false,
			["cooldownSwipe"] = true,
			["cooldownTextDisabled"] = false,
			["desaturate"] = false,
			["desc"] = "",
			["displayIcon"] = 135945,
			["frameStrata"] = 1,
			["height"] = 50,
			["icon"] = true,
			["iconSource"] = 0,
			["id"] = "Spiteful Focus",
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["internalVersion"] = 45,
			["inverse"] = false,
			["keepAspectRatio"] = true,
			["load"] = {
				["affixes"] = {
					["single"] = 123,
				},
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["use_affixes"] = true,
				["use_never"] = false,
				["zoneIds"] = "",
			},
			["parent"] = "Dungeons - Mythic+ Affixes ",
			["preferToUpdate"] = false,
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["semver"] = "1.0.3",
			["subRegions"] = {
				{
					["anchorXOffset"] = 0,
					["anchorYOffset"] = 0,
					["rotateText"] = "NONE",
					["text_anchorPoint"] = "CENTER",
					["text_automaticWidth"] = "Auto",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_fixedWidth"] = 64,
					["text_font"] = "Friz Quadrata TT",
					["text_fontSize"] = 18,
					["text_fontType"] = "OUTLINE",
					["text_justify"] = "CENTER",
					["text_selfPoint"] = "AUTO",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_shadowXOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["text_text"] = "%s",
					["text_text_format_s_format"] = "none",
					["text_visible"] = true,
					["text_wordWrap"] = "WordWrap",
					["type"] = "subtext",
				}, -- [1]
				{
					["glow"] = true,
					["glowBorder"] = false,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["glowFrequency"] = 0.25,
					["glowLength"] = 10,
					["glowLines"] = 8,
					["glowScale"] = 1,
					["glowThickness"] = 1,
					["glowType"] = "ACShine",
					["glowXOffset"] = 0,
					["glowYOffset"] = 0,
					["type"] = "subglow",
					["useGlowColor"] = false,
				}, -- [2]
			},
			["tocversion"] = 90002,
			["triggers"] = {
				[1] = {
					["trigger"] = {
						["custom"] = "function(event,unit)\n    if not unit then return end\n    local guid = UnitGUID(unit)\n    if event == \"NAME_PLATE_UNIT_ADDED\" then\n        -- new nameplate\n        if aura_env.validateUnit(unit) then\n            -- got a match\n            aura_env.executeForUnit(unit, true)\n        end\n    elseif event == \"NAME_PLATE_UNIT_REMOVED\" then\n        -- removing nameplate\n        aura_env.executeForUnit(unit, false)\n    end\n    return aura_env.config.iconEnable and #aura_env.units > 0\nend",
						["customStacks"] = "function()\n    return #aura_env.units\n    end\n    \n    ",
						["custom_hide"] = "custom",
						["custom_type"] = "event",
						["debuffType"] = "HELPFUL",
						["event"] = "Health",
						["events"] = "NAME_PLATE_UNIT_ADDED NAME_PLATE_UNIT_REMOVED",
						["names"] = {
						},
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "custom",
						["unit"] = "player",
					},
					["untrigger"] = {
					},
				},
				["activeTriggerMode"] = -10,
			},
			["uid"] = "MvbthUnp3R1",
			["url"] = "https://wago.io/EE8ENuch7/4",
			["version"] = 4,
			["width"] = 50,
			["xOffset"] = 210,
			["yOffset"] = -340,
			["zoom"] = 0.3,
		},
		["Weekly M+ Tracker"] = {
			["actions"] = {
				["finish"] = {
				},
				["init"] = {
					["custom"] = "WeeklyRewards_LoadUI();",
					["do_custom"] = true,
				},
				["start"] = {
				},
			},
			["anchorFrameFrame"] = "PVEFrame",
			["anchorFrameType"] = "SELECTFRAME",
			["anchorPoint"] = "CENTER",
			["animation"] = {
				["finish"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["preset"] = "alphaPulse",
					["type"] = "none",
				},
				["start"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["preset"] = "fade",
					["type"] = "none",
				},
			},
			["authorOptions"] = {
			},
			["automaticWidth"] = "Auto",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["config"] = {
			},
			["customText"] = "function()\n    return aura_env.runText\nend",
			["customTextUpdate"] = "update",
			["displayText"] = "%n",
			["displayText_format_n_format"] = "none",
			["displayText_format_p_format"] = "timed",
			["displayText_format_p_time_dynamic_threshold"] = 60,
			["displayText_format_p_time_format"] = 0,
			["displayText_format_p_time_precision"] = 1,
			["fixedWidth"] = 200,
			["font"] = "Cabin",
			["fontSize"] = 12,
			["frameStrata"] = 1,
			["id"] = "Weekly M+ Tracker",
			["information"] = {
			},
			["internalVersion"] = 45,
			["justify"] = "LEFT",
			["load"] = {
				["class"] = {
					["multi"] = {
					},
				},
				["ingroup"] = {
					["multi"] = {
						["solo"] = true,
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["use_never"] = false,
				["zoneIds"] = "",
			},
			["outline"] = "OUTLINE",
			["preferToUpdate"] = false,
			["regionType"] = "text",
			["selfPoint"] = "TOPLEFT",
			["semver"] = "1.0.5",
			["shadowColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["shadowXOffset"] = 0,
			["shadowYOffset"] = 0,
			["subRegions"] = {
			},
			["tocversion"] = 90002,
			["triggers"] = {
				[1] = {
					["trigger"] = {
						["check"] = "event",
						["custom"] = "function()\n    local vaultILvl = {0,200,203,207,210,210,213,216,216,220,220,223,223,226,226};\n    local colorByCompleted = function(level, completed)\n        return (completed and \"|cff00ff00\" or \"|cffff0000\") .. \"+\" .. level .. \"|r\"\n    end\n    \n    local runHistory = C_MythicPlus.GetRunHistory(false, true);\n    local totalRuns = #runHistory;\n    \n    local result = \"이번 주에 쐐기를 아직 완료하지 못했습니다...가즈아~!\"\n    \n    if totalRuns > 0 then\n        local runsByDungeon = {}\n        local vaultRuns = \"Top runs (주간보상 최고템랩):\\n\"\n        local dungeonRuns = \"쐐기 완료 횟수 (\" .. totalRuns .. \" total):\\n\"\n        \n        table.sort(runHistory, WeakAuras.ComposeSorts(\n                WeakAuras.SortDescending({\"level\"}),\n                WeakAuras.SortAscending({\"mapChallengeModeID\"})\n        ));\n        \n        for index=1, totalRuns do\n            local run = runHistory[index];\n            local name = C_ChallengeMode.GetMapUIInfo(run.mapChallengeModeID);\n            local completed = run.completed\n            local level = run.level\n            local vaultRewardLevel = math.min(level,15)\n            \n            -- Populate vault rewards text section\n            if index <= 10 then\n                vaultRuns = vaultRuns .. colorByCompleted(level, completed) .. \" \" .. name;\n                \n                if index == 1 or index == 4 or index == 10 then\n                    vaultRuns = vaultRuns .. \" |cffa335ee(\" .. vaultILvl[vaultRewardLevel] .. \" ilvl option)|r\"\n                end\n                \n                vaultRuns = vaultRuns .. \"\\n\"\n            end\n            \n            -- Populate runs by dungeon table\n            if runsByDungeon[name] == nil then\n                runsByDungeon[name] = {run}\n            else\n                tinsert(runsByDungeon[name], run)\n            end\n        end\n        \n        -- Populate runs by dungeon text section\n        for name, _ in pairs(runsByDungeon) do\n            dungeonRuns = dungeonRuns .. name .. \": [\"\n            for index, run in ipairs(runsByDungeon[name]) do\n                dungeonRuns = dungeonRuns .. colorByCompleted(run.level, run.completed)\n                if index ~= #runsByDungeon[name] then\n                    dungeonRuns = dungeonRuns .. \", \"\n                end\n            end\n            dungeonRuns = dungeonRuns .. \"]\\n\"\n        end\n        \n        result = vaultRuns .. \"\\n\" .. dungeonRuns\n    end                \n    \n    aura_env.runText = result;\n    return true\nend",
						["customName"] = "function()\n    return aura_env.runText\nend",
						["custom_hide"] = "custom",
						["custom_type"] = "status",
						["debuffType"] = "HELPFUL",
						["duration"] = "1",
						["event"] = "Cooldown Progress (Spell)",
						["events"] = "PLAYER_ENTERING_WORLD, CHALLENGE_MODE_COMPLETED, ADDON_LOADED",
						["genericShowOn"] = "showOnCooldown",
						["names"] = {
						},
						["realSpellName"] = 0,
						["spellIds"] = {
						},
						["spellName"] = 0,
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "custom",
						["unevent"] = "auto",
						["unit"] = "player",
						["use_genericShowOn"] = true,
						["use_spellName"] = true,
						["use_track"] = true,
					},
					["untrigger"] = {
						["custom"] = "",
					},
				},
				["activeTriggerMode"] = -10,
			},
			["uid"] = "QCp0CpvHzR0",
			["url"] = "https://wago.io/hlG6zttb9/6",
			["version"] = 6,
			["wordWrap"] = "WordWrap",
			["xOffset"] = 19.38470458984375,
			["yOffset"] = -221.846923828125,
		},
		["threat nameplates"] = {
			["actions"] = {
				["finish"] = {
				},
				["init"] = {
					["custom"] = "threatWAcolors = {\n    {1, 0, 0}, -- no aggro\n    {0.8666666666666667, 0.5450980392156862, 0.2235294117647059}, -- gaining aggro\n    {0.615686274509804, 0.4627450980392157, 0.8588235294117647}, -- losing aggro\n    {0.07450980392156863, 0.8352941176470589, 0.9686274509803922} --aggro'd\n}",
					["do_custom"] = true,
				},
				["start"] = {
				},
			},
			["anchorFrameType"] = "SCREEN",
			["anchorPoint"] = "CENTER",
			["animation"] = {
				["finish"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["start"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
			},
			["authorOptions"] = {
			},
			["automaticWidth"] = "Auto",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["config"] = {
			},
			["customTextUpdate"] = "event",
			["displayText"] = "%p",
			["displayText_format_p_format"] = "timed",
			["displayText_format_p_time_dynamic_threshold"] = 60,
			["displayText_format_p_time_format"] = 0,
			["displayText_format_p_time_precision"] = 1,
			["fixedWidth"] = 200,
			["font"] = "Friz Quadrata TT",
			["fontSize"] = 12,
			["frameStrata"] = 1,
			["height"] = 11.999991416931,
			["id"] = "threat nameplates",
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["internalVersion"] = 45,
			["justify"] = "LEFT",
			["load"] = {
				["affixes"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["faction"] = {
					["multi"] = {
					},
				},
				["ingroup"] = {
					["multi"] = {
					},
				},
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["role"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["talent2"] = {
					["multi"] = {
					},
				},
				["zoneIds"] = "",
			},
			["outline"] = "OUTLINE",
			["preferToUpdate"] = false,
			["regionType"] = "text",
			["selfPoint"] = "BOTTOM",
			["semver"] = "1.0.0",
			["shadowColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["shadowXOffset"] = 1,
			["shadowYOffset"] = -1,
			["triggers"] = {
				[1] = {
					["trigger"] = {
						["custom"] = "function(_ ,unitid)\n    \n    local threat_level = UnitThreatSituation(\"player\", unitid)\n    if not unitid or not threat_level or UnitIsPlayer(unitid) then return end\n    unitplate = C_NamePlate.GetNamePlateForUnit(unitid)\n    if unitplate ~= nil then\n        unitplate:GetChildren()[\"healthBar\"][\"barTexture\"]:SetVertexColor(unpack(threatWAcolors[threat_level+1]))\n    end\nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
						["custom_hide"] = "timed",
						["custom_type"] = "event",
						["debuffType"] = "HELPFUL",
						["event"] = "Health",
						["events"] = "UNIT_THREAT_LIST_UPDATE NAME_PLATE_UNIT_ADDED NAME_PLATE_UNIT_REMOVED UNIT_COMBAT",
						["names"] = {
						},
						["showOn"] = "showOnActive",
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "custom",
						["unevent"] = "auto",
						["unit"] = "player",
						["use_absorbMode"] = true,
						["use_unit"] = true,
					},
					["untrigger"] = {
					},
				},
				["activeTriggerMode"] = -10,
				["disjunctive"] = "all",
			},
			["uid"] = "Q25ZHeWYlFz",
			["url"] = "https://wago.io/B1irNyCr7/1",
			["version"] = 1,
			["width"] = 21.999967575073,
			["wordWrap"] = "WordWrap",
			["xOffset"] = 0,
			["yOffset"] = 0,
		},
		["쐐기 : 강화"] = {
			["actions"] = {
				["finish"] = {
				},
				["init"] = {
					["do_custom"] = false,
				},
				["start"] = {
					["custom"] = "",
					["do_custom"] = false,
					["do_glow"] = false,
				},
			},
			["alpha"] = 1,
			["anchorFrameType"] = "NAMEPLATE",
			["anchorPoint"] = "LEFT",
			["animation"] = {
				["finish"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["start"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
			},
			["authorOptions"] = {
			},
			["auto"] = true,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["config"] = {
			},
			["cooldown"] = false,
			["cooldownEdge"] = false,
			["cooldownSwipe"] = true,
			["cooldownTextDisabled"] = true,
			["customTextUpdate"] = "update",
			["desaturate"] = false,
			["displayIcon"] = 1041231,
			["frameStrata"] = 3,
			["height"] = 18,
			["icon"] = true,
			["iconSource"] = -1,
			["id"] = "쐐기 : 강화",
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["internalVersion"] = 45,
			["inverse"] = false,
			["keepAspectRatio"] = false,
			["load"] = {
				["affixes"] = {
					["multi"] = {
						[16] = true,
					},
					["single"] = 7,
				},
				["class"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
					["single"] = "challenge",
				},
				["effectiveLevel"] = "60",
				["effectiveLevel_operator"] = "==",
				["faction"] = {
					["multi"] = {
					},
				},
				["ingroup"] = {
					["multi"] = {
					},
				},
				["level"] = "60",
				["level_operator"] = "==",
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["role"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
					["single"] = "party",
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["talent2"] = {
					["multi"] = {
					},
				},
				["use_affixes"] = true,
				["use_difficulty"] = true,
				["use_effectiveLevel"] = false,
				["use_level"] = true,
				["use_never"] = false,
				["use_size"] = true,
				["zoneIds"] = "",
			},
			["parent"] = "쐐기 : 기타 0403",
			["preferToUpdate"] = false,
			["regionType"] = "icon",
			["selfPoint"] = "RIGHT",
			["semver"] = "1.0.247",
			["stickyDuration"] = false,
			["subRegions"] = {
				{
					["border_color"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["border_edge"] = "Square Full White",
					["border_offset"] = 1,
					["border_size"] = 1,
					["border_visible"] = true,
					["text_color"] = {
					},
					["type"] = "subborder",
				}, -- [1]
				{
					["border_color"] = {
					},
					["glow"] = true,
					["glowBorder"] = false,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["glowFrequency"] = 0.25,
					["glowLength"] = 10,
					["glowLines"] = 4,
					["glowScale"] = 0.7,
					["glowThickness"] = 4,
					["glowType"] = "ACShine",
					["glowXOffset"] = 0,
					["glowYOffset"] = 0,
					["text_color"] = {
					},
					["type"] = "subglow",
					["useGlowColor"] = true,
				}, -- [2]
				{
					["anchorXOffset"] = 0,
					["anchorYOffset"] = 0,
					["border_color"] = {
					},
					["rotateText"] = "NONE",
					["text_anchorPoint"] = "CENTER",
					["text_automaticWidth"] = "Auto",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_fixedWidth"] = 64,
					["text_font"] = "Friz Quadrata TT",
					["text_fontSize"] = 15,
					["text_fontType"] = "OUTLINE",
					["text_justify"] = "CENTER",
					["text_selfPoint"] = "AUTO",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_shadowXOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["text_text"] = "%s",
					["text_text_format_s_format"] = "none",
					["text_visible"] = true,
					["text_wordWrap"] = "WordWrap",
					["type"] = "subtext",
				}, -- [3]
			},
			["tocversion"] = 90005,
			["triggers"] = {
				[1] = {
					["trigger"] = {
						["check"] = "event",
						["custom"] = "function(allstates, event, ...)\n    local unitId = ...\n    local subEv = select(2, ...)\n    local destGUID = select(8, ...)\n    local spellId = select(12, ...)\n    \n    if event == \"NAME_PLATE_UNIT_ADDED\" and unitId then\n        local _, icon = WA_GetUnitBuff(unitId, 209859)\n        local n = 1\n        local stack = 0\n        local BuffID = select(10, UnitBuff(unitId, n))\n        \n        while BuffID do\n            if BuffID == 209859 then \n                stack = stack + 1\n            end\n            n = n + 1\n            BuffID = select(10, UnitBuff(unitId, n))\n        end\n        \n        \n        if icon then\n            local state = {\n                show = true,\n                changed = true,\n                icon = icon,\n                stacks = stack,\n                guid = UnitGUID(unitId),\n                unit = unitId\n            }\n            \n            allstates[UnitGUID(unitId)] = state\n            \n            return true\n        end\n        \n    elseif event == \"NAME_PLATE_UNIT_REMOVED\" and unitId then\n        local state = allstates[UnitGUID(unitId)]\n        if state then\n            state.show = false\n            state.changed = true\n            return true\n        end\n        \n    elseif event == \"COMBAT_LOG_EVENT_UNFILTERED\" then\n        if subEv == \"SPELL_AURA_APPLIED\" and spellId == 209859 then\n            local guid = destGUID\n            \n            for _, plate in pairs(C_NamePlate.GetNamePlates()) do\n                unitId = plate.namePlateUnitToken\n                if UnitGUID(unitId) == guid then\n                    local n = 1\n                    local stack = 0\n                    local BuffID = select(10, UnitBuff(unitId, n))\n                    \n                    while BuffID do\n                        if BuffID == 209859 then \n                            stack = stack + 1\n                        end\n                        n = n + 1\n                        BuffID = select(10, UnitBuff(unitId, n))\n                    end\n                    \n                    local state = {\n                        show = true,\n                        changed = true,\n                        icon = select(3, GetSpellInfo(209859)),\n                        stacks = stack,\n                        guid = guid,\n                        unit = unitId\n                    }                \n                    allstates[guid] = state\n                    return true\n                end\n            end\n            \n        elseif subEv == \"SPELL_AURA_REMOVED\" and spellId == 209859 then\n            local state = allstates[destGUID]\n            if state then\n                state.show = false\n                state.changed = true\n                return true\n            end\n        end\n    end\n    \nend",
						["custom_type"] = "stateupdate",
						["debuffType"] = "HELPFUL",
						["event"] = "Health",
						["events"] = "CLEU:SPELL_AURA_APPLIED:SPELL_AURA_REMOVED, NAME_PLATE_UNIT_ADDED, NAME_PLATE_UNIT_REMOVED",
						["genericShowOn"] = "showOnActive",
						["names"] = {
						},
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "custom",
						["unit"] = "player",
					},
					["untrigger"] = {
					},
				},
				["activeTriggerMode"] = -10,
				["disjunctive"] = "all",
			},
			["uid"] = "zZjlxreu6mF",
			["url"] = "https://wago.io/fCabQ-hF8/248",
			["version"] = 248,
			["width"] = 18,
			["xOffset"] = -2,
			["yOffset"] = 0,
			["zoom"] = 0,
		},
		["쐐기 : 고취"] = {
			["actions"] = {
				["finish"] = {
					["do_glow"] = false,
					["hide_all_glows"] = true,
				},
				["init"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
				["start"] = {
					["do_glow"] = false,
					["glow_XOffset"] = 3,
					["glow_YOffset"] = 3,
					["glow_action"] = "show",
					["glow_border"] = false,
					["glow_color"] = {
						1, -- [1]
						1, -- [2]
						0.75294117647059, -- [3]
						1, -- [4]
					},
					["glow_frame_type"] = "NAMEPLATE",
					["glow_frequency"] = 0.4,
					["glow_length"] = 12,
					["glow_lines"] = 9,
					["glow_thickness"] = 3,
					["glow_type"] = "Pixel",
					["use_glow_color"] = false,
				},
			},
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["anchorPoint"] = "CENTER",
			["animation"] = {
				["finish"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["start"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
			},
			["authorOptions"] = {
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0, -- [4]
			},
			["conditions"] = {
				{
					["changes"] = {
						{
							["property"] = "glowexternal",
							["value"] = {
								["glow_XOffset"] = 3,
								["glow_YOffset"] = 3,
								["glow_action"] = "show",
								["glow_border"] = true,
								["glow_color"] = {
									1, -- [1]
									1, -- [2]
									0.57254901960784, -- [3]
									1, -- [4]
								},
								["glow_frame_type"] = "NAMEPLATE",
								["glow_frequency"] = 0.4,
								["glow_length"] = 12,
								["glow_lines"] = 8,
								["glow_thickness"] = 3,
								["glow_type"] = "Pixel",
								["use_glow_color"] = true,
							},
						}, -- [1]
					},
					["check"] = {
						["op"] = "==",
						["trigger"] = 1,
						["value"] = "343502",
						["variable"] = "spellId",
					},
				}, -- [1]
				{
					["changes"] = {
						{
							["property"] = "glowexternal",
							["value"] = {
								["glow_XOffset"] = 0,
								["glow_YOffset"] = 0,
								["glow_action"] = "show",
								["glow_border"] = true,
								["glow_color"] = {
									1, -- [1]
									1, -- [2]
									0.75294117647059, -- [3]
									1, -- [4]
								},
								["glow_frame_type"] = "NAMEPLATE",
								["glow_frequency"] = 0.25,
								["glow_length"] = 14,
								["glow_lines"] = 3,
								["glow_thickness"] = 3,
								["glow_type"] = "ACShine",
								["use_glow_color"] = true,
							},
						}, -- [1]
					},
					["check"] = {
						["op"] = "==",
						["trigger"] = 1,
						["value"] = "343503",
						["variable"] = "spellId",
					},
					["linked"] = true,
				}, -- [2]
				{
					["changes"] = {
						{
							["property"] = "glowexternal",
							["value"] = {
								["glow_action"] = "hide",
								["glow_frame_type"] = "NAMEPLATE",
							},
						}, -- [1]
					},
					["check"] = {
						["trigger"] = 1,
						["value"] = 0,
						["variable"] = "show",
					},
					["linked"] = true,
				}, -- [3]
			},
			["config"] = {
			},
			["cooldown"] = false,
			["cooldownEdge"] = false,
			["cooldownSwipe"] = true,
			["cooldownTextDisabled"] = false,
			["desaturate"] = false,
			["displayIcon"] = 135946,
			["frameStrata"] = 1,
			["height"] = 1,
			["icon"] = true,
			["iconSource"] = -1,
			["id"] = "쐐기 : 고취",
			["information"] = {
			},
			["internalVersion"] = 45,
			["inverse"] = false,
			["keepAspectRatio"] = false,
			["load"] = {
				["affixes"] = {
					["multi"] = {
						[123] = true,
					},
					["single"] = 122,
				},
				["class"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
						["challenge"] = true,
					},
					["single"] = "challenge",
				},
				["instance_type"] = {
				},
				["size"] = {
					["multi"] = {
						["party"] = true,
					},
					["single"] = "party",
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["use_affixes"] = true,
				["use_difficulty"] = true,
				["use_never"] = false,
				["use_size"] = true,
				["zoneIds"] = "",
			},
			["parent"] = "쐐기 : 기타 0403",
			["preferToUpdate"] = false,
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["semver"] = "1.0.247",
			["subRegions"] = {
			},
			["tocversion"] = 90005,
			["triggers"] = {
				[1] = {
					["trigger"] = {
						["auranames"] = {
							"고통", -- [1]
						},
						["auraspellids"] = {
							"343502", -- [1]
							"343503", -- [2]
						},
						["combinePerUnit"] = true,
						["debuffType"] = "HELPFUL",
						["event"] = "Health",
						["hostility"] = "hostile",
						["names"] = {
						},
						["showClones"] = true,
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "aura2",
						["unit"] = "nameplate",
						["useExactSpellId"] = true,
						["useHostility"] = true,
						["useMatch_count"] = false,
						["useName"] = false,
					},
					["untrigger"] = {
					},
				},
				["activeTriggerMode"] = -10,
				["customTriggerLogic"] = "",
				["disjunctive"] = "any",
			},
			["uid"] = "BPfAY8TWIc0",
			["url"] = "https://wago.io/fCabQ-hF8/248",
			["version"] = 248,
			["width"] = 1,
			["xOffset"] = 0,
			["yOffset"] = 0,
			["zoom"] = 0,
		},
		["쐐기 : 기타 0403"] = {
			["actions"] = {
				["finish"] = {
				},
				["init"] = {
				},
				["start"] = {
				},
			},
			["anchorFrameType"] = "SCREEN",
			["anchorPoint"] = "CENTER",
			["animation"] = {
				["finish"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["start"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
			},
			["authorOptions"] = {
			},
			["backdropColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0.5, -- [4]
			},
			["border"] = false,
			["borderBackdrop"] = "Blizzard Tooltip",
			["borderColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0.5, -- [4]
			},
			["borderEdge"] = "None",
			["borderInset"] = 11,
			["borderOffset"] = 5,
			["borderSize"] = 16,
			["conditions"] = {
			},
			["config"] = {
			},
			["controlledChildren"] = {
				"쐐기 : 상태 이상", -- [1]
				"쐐기 : 최대 사거리", -- [2]
				"쐐기 : 스턴 점감", -- [3]
				"쐐기 : 전율", -- [4]
				"쐐기 : 전율 예상", -- [5]
				"쐐기 : 강화", -- [6]
				"쐐기 : 고취", -- [7]
			},
			["desc"] = "HOBUL - AZSHARA",
			["frameStrata"] = 1,
			["groupIcon"] = "525134",
			["id"] = "쐐기 : 기타 0403",
			["information"] = {
				["groupOffset"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["internalVersion"] = 45,
			["load"] = {
				["class"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["faction"] = {
					["multi"] = {
					},
				},
				["ingroup"] = {
					["multi"] = {
					},
				},
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["role"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["talent2"] = {
					["multi"] = {
					},
				},
				["use_class"] = false,
				["zoneIds"] = "",
			},
			["preferToUpdate"] = false,
			["regionType"] = "group",
			["scale"] = 1,
			["selfPoint"] = "BOTTOMLEFT",
			["semver"] = "1.0.247",
			["tocversion"] = 90005,
			["triggers"] = {
				[1] = {
					["trigger"] = {
						["buffShowOn"] = "showOnActive",
						["debuffType"] = "HELPFUL",
						["event"] = "Health",
						["names"] = {
						},
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "aura",
						["unit"] = "player",
					},
					["untrigger"] = {
					},
				},
				["activeTriggerMode"] = -10,
				["disjunctive"] = "all",
			},
			["uid"] = "b1CvyYBVQdW",
			["url"] = "https://wago.io/fCabQ-hF8/248",
			["version"] = 248,
			["xOffset"] = 0,
			["yOffset"] = 420,
		},
		["쐐기 : 나에게 시전"] = {
			["actions"] = {
				["finish"] = {
				},
				["init"] = {
					["custom"] = "aura_env.Target = {}\naura_env.TbN = {}\n\naura_env.LocalT = {   \n    [\"??\"] = {\n    }, \n    [\"고통의 투기장\"] = {\n        [\"기회 포착\"] = true, -- 비열한 자 시라\n        [\"죽음풍\"] = true,\n        [\"뼈 창\"] = true,\n        [\"베기\"] = true,\n        [\"시체 삼키기\"] = true,\n        [\"사격\"] = true,\n        [\"날카로운 불화\"] = true,\n        [\"영혼 결속\"] = true,\n        [\"튕기는 칼날\"] = true,\n        [\"영혼의 손길\"] = true,\n        [\"괴저 화살\"] = true,\n        [\"죽음의 화살\"] = true,\n    },\n    [\"속죄의 전당\"] = {\n        [\"사격\"] = true, \n        [\"바위 분쇄의 도약\"] = true,\n        [\"생명력 착취\"] = true,\n        [\"절멸의 저주\"] = true,\n    },\n    [\"승천의 첨탑\"] = {\n        [\"충전된 창\"] = true,\n        [\"어둠 채찍\"] = true,\n        [\"지식의 무게\"] = true,\n        [\"던지기\"] = true,\n    },\n    [\"역병 몰락지\"] = {\n        [\"사격\"] = true, \n        [\"분쇄의 포옹\"] = true,\n        [\"흉측한 타액\"] = true,\n        [\"옭아매는 감염\"] = true,\n        [\"옭아매는 오물\"] = true,\n    },\n    [\"저편\"] = {\n        [\"사술\"] = true,\n        [\"흡수의 아지랑이\"] = true,\n        [\"최면성 반짝먼지\"] = true,\n        [\"번개 방출\"] = true,\n        [\"컹-컹\"] = true,\n        [\"방향유\"] = true,\n        [\"비전 번개\"] = true, -- 자이엑사\n    },\n    [\"죽음의 상흔\"] = {\n        [\"얼음 화살\"] = true, \n        [\"사격\"] = true, \n        [\"들썩이는 구토\"] = true, -- 역병뼈닥이\n        [\"병독의 집착\"] = true, -- 의사 스티치\n        [\"고기 갈고리\"] = true, \n        [\"식칼 투척\"] = true, \n        [\"질병 분출\"] = true, \n        [\"살점 던지기\"] = true, \n        [\"방부 수액\"] = true, \n        [\"체액 흡수\"] = true, \n        [\"들붙는 어둠\"] = true, \n        [\"얼어붙은 구속\"] = true, \n        [\"어둠의 추방\"] = true, \n    },\n    [\"티르너 사이드의 안개\"] = {\n        [\"과성장\"] = true,\n        [\"영혼의 화살\"] = true, \n        [\"안개장막 이빨\"] = true, \n        [\"얼음땡\"] = true, -- 미스트콜러\n        [\"얼음땡 시선 집중\"] = true, -- 환영 여우\n        [\"휘발성 산\"] = true, -- \n        [\"정신의 연결\"] = true, -- 트레도바\n        [\"사냥감의 징표\"] = true, \n        [\"기생성 평정화\"] = true, \n        [\"기생성 무력화\"] = true, \n        [\"신경 지배\"] = true,\n    },  \n    [\"핏빛 심연\"] = {\n        [\"공포의 사격\"] = true,\n        [\"육중한 돌격\"] = true, -- 크릭시스\n        [\"포식\"] = true,\n        [\"어두운 화살\"] = true,\n        [\"암울한 폭발\"] = true,\n        [\"날카로운 족쇄\"] = true,\n        [\"연구물 던지기\"] = true,\n        [\"폭발성 양피지\"] = true,\n        [\"폭발적인 분노\"] = true,\n        [\"억제의 저주\"] = true,\n        [\"영혼 파멸\"] = true,\n        [\"탐식\"] = true,\n        [\"혹독\"] = true,-- 타르볼드\n    },\n    \n}\n\naura_env.LocalN = {   \n    [\"??\"] = {\n    }, \n    [\"고통의 투기장\"] = {\n        [\"원한의 망령\"] = true, --원한\n    },\n    [\"속죄의 전당\"] = {\n        [\"원한의 망령\"] = true, --원한\n        [\"시기의 현신\"] = true, \n        [\"섬뜩한 교구민\"] = true, --알리즈\n    },\n    [\"승천의 첨탑\"] = {\n        [\"원한의 망령\"] = true, --원한\n    },\n    [\"역병 몰락지\"] = {\n        [\"원한의 망령\"] = true, --원한\n    },\n    [\"저편\"] = {\n        [\"원한의 망령\"] = true, --원한\n        [\"학카르의 자손\"] = true, -- 학카르\n    },\n    [\"죽음의 상흔\"] = {\n        [\"원한의 망령\"] = true, --원한\n        [\"오물 구더기\"] = true, --역병뼈닥이\n    },\n    [\"티르너 사이드의 안개\"] = {\n        [\"원한의 망령\"] = true, --원한\n        [\"환영 여우\"] = true, --미스트콜러\n        [\"게걸충 애벌레\"] = true, \n    },  \n    [\"핏빛 심연\"] = {\n        [\"원한의 망령\"] = true, --원한\n    },\n}\n\n\naura_env.anchorFunc = function()\n    for _, region in pairs(WeakAuras.clones[aura_env.id]) do\n        if region.state and region.state.show then\n            if region.state.cast then\n                region:ClearAllPoints()\n                region:SetPoint(\"RIGHT\", region.state.frame, \"LEFT\", aura_env.config.cx, aura_env.config.cy)\n                region:SetScale(aura_env.config.cscale)\n            else\n                region:ClearAllPoints()\n                region:SetPoint(\"RIGHT\", region.state.frame, \"LEFT\", aura_env.config.x, aura_env.config.y)\n                region:SetScale(1)\n            end\n        end\n    end\nend",
					["do_custom"] = true,
				},
				["start"] = {
					["custom"] = "aura_env.anchorFunc()",
					["do_custom"] = true,
					["do_message"] = false,
					["do_sound"] = true,
					["message"] = "",
					["message_custom"] = "function()\n    return state.name\nend",
					["message_type"] = "SAY",
					["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\BananaPeelSlip.ogg",
				},
			},
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["anchorPoint"] = "TOP",
			["animation"] = {
				["finish"] = {
					["alpha"] = 0,
					["alphaFunc"] = "function(progress, start, delta)\n    return start + (progress * delta)\nend\n",
					["alphaType"] = "straight",
					["colorA"] = 1,
					["colorB"] = 1,
					["colorG"] = 1,
					["colorR"] = 1,
					["duration"] = "0.1",
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["rotate"] = 0,
					["scaleFunc"] = "function(progress, startX, startY, scaleX, scaleY)\n    return startX + (progress * (scaleX - startX)), startY + (progress * (scaleY - startY))\nend\n",
					["scaleType"] = "straightScale",
					["scalex"] = 0,
					["scaley"] = 0,
					["type"] = "custom",
					["use_alpha"] = true,
					["use_scale"] = true,
					["x"] = 0,
					["y"] = 0,
				},
				["main"] = {
					["alpha"] = 0.6,
					["alphaFunc"] = "    function(progress, start, delta)\n      local angle = (progress * 2 * math.pi) - (math.pi / 2)\n      return start + (((math.sin(angle) + 1)/2) * delta)\n    end\n  ",
					["alphaType"] = "alphaPulse",
					["colorA"] = 1,
					["colorB"] = 0,
					["colorFunc"] = "function(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n    local angle = (progress * 2 * math.pi) - (math.pi / 2)\n    local newProgress = ((math.sin(angle) + 1)/2);\n    return r1 + (newProgress * (r2 - r1)),\n         g1 + (newProgress * (g2 - g1)),\n         b1 + (newProgress * (b2 - b1)),\n         a1 + (newProgress * (a2 - a1))\nend\n",
					["colorG"] = 0.61176470588235,
					["colorR"] = 1,
					["colorType"] = "pulseColor",
					["duration"] = "0.4",
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["rotate"] = 0,
					["scaleFunc"] = "function(progress, startX, startY, scaleX, scaleY)\n    local angle = (progress * 2 * math.pi) - (math.pi / 2)\n    return startX + (((math.sin(angle) + 1)/2) * (scaleX - 1)), startY + (((math.sin(angle) + 1)/2) * (scaleY - 1))\nend\n",
					["scaleType"] = "pulse",
					["scalex"] = 1.05,
					["scaley"] = 1.05,
					["type"] = "custom",
					["use_alpha"] = false,
					["use_color"] = true,
					["use_scale"] = true,
					["x"] = 0,
					["y"] = 0,
				},
				["start"] = {
					["alpha"] = 0,
					["alphaFunc"] = "function(progress, start, delta)\n    return start + (progress * delta)\nend\n",
					["alphaType"] = "straight",
					["colorA"] = 1,
					["colorB"] = 1,
					["colorG"] = 1,
					["colorR"] = 1,
					["duration"] = "0.1",
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["rotate"] = 0,
					["scaleFunc"] = "function(progress, startX, startY, scaleX, scaleY)\n    return startX + (progress * (scaleX - startX)), startY + (progress * (scaleY - startY))\nend\n",
					["scaleType"] = "straightScale",
					["scalex"] = 3,
					["scaley"] = 3,
					["type"] = "custom",
					["use_alpha"] = true,
					["use_scale"] = true,
					["x"] = 0,
					["y"] = 0,
				},
			},
			["authorOptions"] = {
				{
					["fontSize"] = "medium",
					["text"] = "기본 좌표",
					["type"] = "description",
					["width"] = 2,
				}, -- [1]
				{
					["default"] = 8,
					["key"] = "x",
					["max"] = 100,
					["min"] = -100,
					["name"] = "좌우",
					["step"] = 1,
					["type"] = "range",
					["width"] = 1,
				}, -- [2]
				{
					["default"] = 0,
					["key"] = "y",
					["max"] = 100,
					["min"] = -100,
					["name"] = "상하",
					["step"] = 1,
					["type"] = "range",
					["width"] = 1,
				}, -- [3]
				{
					["height"] = 1,
					["type"] = "space",
					["useHeight"] = false,
					["variableWidth"] = true,
					["width"] = 2,
				}, -- [4]
				{
					["fontSize"] = "medium",
					["text"] = "시전 시 좌표 / 크기",
					["type"] = "description",
					["width"] = 2,
				}, -- [5]
				{
					["default"] = -21,
					["key"] = "cx",
					["max"] = 100,
					["min"] = -100,
					["name"] = "좌우",
					["step"] = 1,
					["type"] = "range",
					["width"] = 1,
				}, -- [6]
				{
					["default"] = -4,
					["key"] = "cy",
					["max"] = 100,
					["min"] = -100,
					["name"] = "상하",
					["step"] = 1,
					["type"] = "range",
					["width"] = 1,
				}, -- [7]
				{
					["default"] = 1.2,
					["key"] = "cscale",
					["max"] = 3,
					["min"] = 1,
					["name"] = "크기",
					["step"] = 0.01,
					["type"] = "range",
					["width"] = 2,
				}, -- [8]
			},
			["auto"] = true,
			["blendMode"] = "BLEND",
			["color"] = {
				1, -- [1]
				0.031372549019608, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["config"] = {
				["cscale"] = 1.2,
				["cx"] = -6,
				["cy"] = -4,
				["x"] = 20,
				["y"] = 0,
			},
			["cooldown"] = false,
			["cooldownTextDisabled"] = false,
			["customTextUpdate"] = "update",
			["desaturate"] = false,
			["discrete_rotation"] = 0,
			["displayIcon"] = 1391535,
			["frameStrata"] = 5,
			["glow"] = false,
			["height"] = 57,
			["icon"] = true,
			["id"] = "쐐기 : 나에게 시전",
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["internalVersion"] = 45,
			["inverse"] = false,
			["keepAspectRatio"] = false,
			["load"] = {
				["class"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
						["challenge"] = true,
					},
					["single"] = "challenge",
				},
				["effectiveLevel"] = "50",
				["effectiveLevel_operator"] = ">",
				["encounterid"] = "2092",
				["faction"] = {
					["multi"] = {
					},
				},
				["ingroup"] = {
					["multi"] = {
					},
				},
				["level"] = "60",
				["level_operator"] = "==",
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["role"] = {
					["multi"] = {
						["DAMAGER"] = true,
						["HEALER"] = true,
					},
					["single"] = "DAMAGER",
				},
				["size"] = {
					["multi"] = {
						["party"] = true,
					},
					["single"] = "party",
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["talent2"] = {
					["multi"] = {
					},
				},
				["use_effectiveLevel"] = false,
				["use_encounterid"] = false,
				["use_level"] = true,
				["use_never"] = false,
				["use_role"] = false,
				["use_size"] = true,
				["zoneIds"] = "",
			},
			["mirror"] = false,
			["parent"] = "쐐기 : 시전 대상 0216",
			["preferToUpdate"] = true,
			["regionType"] = "texture",
			["rotate"] = false,
			["rotation"] = 0,
			["selfPoint"] = "CENTER",
			["semver"] = "1.0.110",
			["stickyDuration"] = false,
			["text1"] = "%n",
			["text1Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text1Containment"] = "OUTSIDE",
			["text1Enabled"] = true,
			["text1Font"] = "Friz Quadrata TT",
			["text1FontFlags"] = "OUTLINE",
			["text1FontSize"] = 18,
			["text1Point"] = "BOTTOM",
			["text2"] = "%p",
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text2Containment"] = "INSIDE",
			["text2Enabled"] = false,
			["text2Font"] = "Friz Quadrata TT",
			["text2FontFlags"] = "OUTLINE",
			["text2FontSize"] = 24,
			["text2Point"] = "CENTER",
			["texture"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Auras\\Aura53",
			["textureWrapMode"] = "CLAMP",
			["tocversion"] = 90005,
			["triggers"] = {
				[1] = {
					["trigger"] = {
						["check"] = "event",
						["custom"] = "function(states)\n    for _, v in pairs(states) do\n        v.show = false;\n        v.changed = true;\n    end\n    \n    for _, plate in pairs(C_NamePlate.GetNamePlates()) do\n        local unit = plate.namePlateUnitToken\n        if unit and UnitIsUnit(unit..\"target\", \"player\") then\n            local name = UnitName(unit)\n            local cast = UnitCastingInfo(unit)\n            local channel = UnitChannelInfo(unit)\n            if aura_env.Target[cast] or aura_env.Target[channel] then\n                states[unit] = states[unit] or {}\n                local state = states[unit]\n                state.frame = C_NamePlate.GetNamePlateForUnit(unit)\n                state.changed = true\n                state.show = true\n                state.cast = true\n            elseif aura_env.TbN[name] then\n                states[unit] = states[unit] or {}\n                local state = states[unit]\n                state.frame = C_NamePlate.GetNamePlateForUnit(unit)\n                state.changed = true\n                state.show = true\n                state.cast = false\n            end\n        end\n    end\n    return true\nend",
						["custom_type"] = "stateupdate",
						["debuffType"] = "HELPFUL",
						["event"] = "Chat Message",
						["events"] = "NAME_PLATE_UNIT_ADDED NAME_PLATE_UNIT_REMOVED UNIT_SPELLCAST_CHANNEL_START:nameplate UNIT_SPELLCAST_CHANNEL_STOP:nameplate UNIT_SPELLCAST_CHANNEL_UPDATE:nameplate UNIT_SPELLCAST_DELAYED:nameplate UNIT_SPELLCAST_FAILED:nameplate UNIT_SPELLCAST_FAILED_QUIET:nameplate UNIT_SPELLCAST_INTERRUPTED:nameplate UNIT_SPELLCAST_START:nameplate UNIT_SPELLCAST_STOP:nameplate UNIT_TARGET:nameplate",
						["genericShowOn"] = "showOnActive",
						["names"] = {
						},
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "custom",
						["unevent"] = "auto",
						["unit"] = "player",
						["use_absorbMode"] = true,
						["use_unit"] = true,
					},
					["untrigger"] = {
					},
				},
				[2] = {
					["trigger"] = {
						["custom"] = "function()\n    \n    local loc = select(1, GetInstanceInfo())\n    \n    if loc then\n        if aura_env.LocalT[loc] then\n            aura_env.Target = aura_env.LocalT[loc]\n        else\n            aura_env.Target = {}   \n        end\n        if aura_env.LocalN[loc] then\n            aura_env.TbN = aura_env.LocalN[loc]\n        else\n            aura_env.TbN = {}     \n        end\n    end\n    \nend\n\n\n\n\n",
						["custom_hide"] = "custom",
						["custom_type"] = "event",
						["event"] = "Health",
						["events"] = "ZONE_CHANGED_NEW_AREA, PLAYER_ENTERING_WORLD, CHALLENGE_MODE_START",
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "custom",
					},
					["untrigger"] = {
					},
				},
				["activeTriggerMode"] = 1,
				["customTriggerLogic"] = "function(t)\n    return t[1]\nend",
				["disjunctive"] = "custom",
			},
			["uid"] = "Ta1Qs)nAEp5",
			["url"] = "https://wago.io/uUwU71sI8/111",
			["version"] = 111,
			["width"] = 57,
			["xOffset"] = 0,
			["yOffset"] = 4320,
			["zoom"] = 0,
		},
		["쐐기 : 상태 이상"] = {
			["actions"] = {
				["finish"] = {
					["custom"] = "aura_env.message = nil",
					["do_custom"] = true,
				},
				["init"] = {
					["custom"] = "aura_env.Status = {}\naura_env.LocalS = {\n    [\"속죄의 전당\"] = {\n        [342494] = {\"교만 맞음\"}, -- 교만\n    },\n    [\"승천의 첨탑\"] = {\n        [342494] = {\"교만 맞음\"}, -- 교만\n        [323744] = {\"기절\"}, --암습\n    },\n    [\"역병 몰락지\"] = {\n        [342494] = {\"교만 맞음\"}, -- 교만\n        [328012] = {\"속박됨\"}, -- 구속의 버섯\n        [326242] = {\"속박됨\"}, -- 점액의 물결\n        [331818] = {\"기절\"}, -- 그림자 매복, 베놈블레이드\n        [328409] = {\"기절\"}, -- 거미줄 올가미  \n    },\n    [\"핏빛 심연\"] = {\n        [342494] = {\"교만 맞음\"}, -- 교만\n        [322299] = {\"기절\"}, -- 탐식\n        [335306] = {\"속박됨\"}, -- 날카로운 족쇄\n    },\n    [\"고통의 투기장\"] = {\n        [342494] = {\"교만 맞음\"}, -- 교만\n        [333567] = {\"현혹됨\"},  -- 빙의, 쿨타로크    \n        [320287] = {\"투기장 입장\"},  -- 핏빛 영광, 자브    \n    },\n    [\"저편\"] = {\n        [342494] = {\"교만 맞음\"}, -- 교만\n        [331847] = {\"기절\"}, -- 컹-컹\n        [338762] = {\"기절\"}, -- 미끄러짐\n        [339978] = {\"침묵\"}, -- 평온의 안개\n        [321349] = {\"방향감각 상실\"}, -- 흡수의 아지랑이\n        [320132] = {\"기절\"}, -- 어둠의 격노, 마나스톰 부부\n        [324010] = {\"기절\"}, -- 분출\n    },\n    [\"죽음의 상흔\"] = {\n        [342494] = {\"교만 맞음\"}, -- 교만\n        [334748] = {\"기절\"}, -- 체액 흡수\n        [345625] = {\"침묵\"}, -- 쥭음의 폭발\n        [320646] = {\"침묵\"}, -- 고약한 가스, 역병뼈닥이\n    },\n    [\"티르너 사이드의 안개\"] = {\n        [342494] = {\"교만 맞음\"}, -- 교만\n        [322487] = {\"기절\"},  -- 과성장\n        [328756] = {\"공포\"}, -- 혐오스러운 형상, 말로크\n        [321893] = {\"기절\"},  -- 얼음 폭발, 미스트콜러\n        [337220] = {\"평정\"}, -- 기생성 평정화, 트레도바\n        [337251] = {\"기절\"}, -- 기생성 무력화\n        [337253] = {\"현혹됨\"}, -- 신경 지배\n    },\n}\n\naura_env.message = nil",
					["do_custom"] = true,
				},
				["start"] = {
					["do_message"] = true,
					["do_sound"] = false,
					["message"] = "%n",
					["message_format_n_format"] = "none",
					["message_type"] = "YELL",
				},
			},
			["alpha"] = 0,
			["anchorFrameType"] = "SCREEN",
			["anchorPoint"] = "CENTER",
			["animation"] = {
				["finish"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["start"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
			},
			["authorOptions"] = {
			},
			["auto"] = false,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0, -- [4]
			},
			["conditions"] = {
			},
			["config"] = {
			},
			["cooldown"] = false,
			["cooldownEdge"] = false,
			["cooldownSwipe"] = true,
			["cooldownTextDisabled"] = false,
			["customTextUpdate"] = "update",
			["desaturate"] = false,
			["displayIcon"] = 135860,
			["frameStrata"] = 1,
			["height"] = 1,
			["icon"] = true,
			["iconSource"] = 0,
			["id"] = "쐐기 : 상태 이상",
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["internalVersion"] = 45,
			["inverse"] = false,
			["keepAspectRatio"] = false,
			["load"] = {
				["class"] = {
					["multi"] = {
					},
				},
				["effectiveLevel"] = "50",
				["effectiveLevel_operator"] = ">",
				["ingroup"] = {
					["single"] = "group",
				},
				["level"] = "60",
				["level_operator"] = "==",
				["size"] = {
					["multi"] = {
					},
					["single"] = "party",
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["use_effectiveLevel"] = false,
				["use_ingroup"] = true,
				["use_level"] = true,
				["use_never"] = false,
				["use_size"] = true,
				["zoneIds"] = "",
			},
			["parent"] = "쐐기 : 기타 0403",
			["preferToUpdate"] = false,
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["semver"] = "1.0.247",
			["stickyDuration"] = false,
			["subRegions"] = {
			},
			["tocversion"] = 90005,
			["triggers"] = {
				[1] = {
					["trigger"] = {
						["buffShowOn"] = "showOnActive",
						["custom"] = "function(event, ...)\n    local _,subevent,_,_,_,_,_,_,destName,_,_,spellID = ...\n    \n    if subevent == \"SPELL_AURA_APPLIED\" and aura_env.Status[spellID] and destName == WeakAuras.me then   \n        aura_env.message = aura_env.Status[spellID][1]\n        return true\n    end\nend",
						["customIcon"] = "",
						["customName"] = "function()\n    return aura_env.message\nend\n\n\n\n\n\n\n\n\n",
						["custom_hide"] = "timed",
						["custom_type"] = "event",
						["debuffType"] = "HELPFUL",
						["duration"] = "0.15",
						["dynamicDuration"] = false,
						["event"] = "Chat Message",
						["events"] = "CLEU:SPELL_AURA_APPLIED",
						["names"] = {
						},
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "custom",
						["unevent"] = "auto",
						["unit"] = "player",
					},
					["untrigger"] = {
					},
				},
				[2] = {
					["trigger"] = {
						["custom"] = "function(event, ...)\n    if event == \"LOSS_OF_CONTROL_ADDED\" then\n        local Index = ...;\n        local loss = C_LossOfControl.GetActiveLossOfControlData(Index)\n        \n        if loss[\"displayText\"] == \"차단\" then\n            aura_env.message = \"차단당함\"\n            return true\n        end\n    end\nend\n\n\n--[[       locType, \n            lockoutSchool \n            displayText, \n            displayType, \n            priority, \n            duration, \n            timeRemaining, \n            startTime, \n            iconTexture, \n            spellID\n}]]\n\n\n\n\n\n\n",
						["customName"] = "function()\n    return aura_env.message\nend\n\n\n\n\n\n\n\n\n",
						["custom_hide"] = "timed",
						["custom_type"] = "event",
						["duration"] = "0.15",
						["event"] = "Health",
						["events"] = "LOSS_OF_CONTROL_ADDED, LOSS_OF_CONTROL_UPDATE",
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "custom",
					},
					["untrigger"] = {
					},
				},
				[3] = {
					["trigger"] = {
						["custom"] = "function()\n    \n    local loc = select(1, GetInstanceInfo())\n    \n    if loc then\n        if aura_env.LocalS[loc] then\n            aura_env.Status = aura_env.LocalS[loc]\n        else\n            aura_env.Status = {}   \n        end\n    end\n    \nend\n\n\n\n\n",
						["custom_hide"] = "timed",
						["custom_type"] = "event",
						["duration"] = "0.15",
						["event"] = "Health",
						["events"] = "ZONE_CHANGED_NEW_AREA, PLAYER_ENTERING_WORLD, CHALLENGE_MODE_START",
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "custom",
					},
					["untrigger"] = {
					},
				},
				["activeTriggerMode"] = -10,
				["customTriggerLogic"] = "function(t)\n    return(t[1] or t[2])\nend",
				["disjunctive"] = "custom",
			},
			["uid"] = "sJO5llLz2SD",
			["url"] = "https://wago.io/fCabQ-hF8/248",
			["version"] = 248,
			["width"] = 1,
			["xOffset"] = 0,
			["yOffset"] = 0,
			["zoom"] = 0,
		},
		["쐐기 : 스턴 점감"] = {
			["actions"] = {
				["finish"] = {
					["do_message"] = false,
				},
				["init"] = {
					["custom"] = "-- Stun debuff whitelist\naura_env.allStuns = {\n    -- General\n    331612, -- 키리안\n    \n    -- Racial\n    20549,  -- War Stomp\n    255654, -- Bull Rush\n    \n    -- Death Knight\n    221562, -- Asphyxiate (Blood)\n    108194, -- Asphyxiate (Unholy/Frost)\n    91800,  -- Gnaw (Pet)\n    212332, -- Smash (Pet)\n    \n    -- Demon Hunter\n    179057, -- Chaos Nova\n    205630, -- Illidan's Grasp\n    211881, -- Fel Eruption\n    \n    -- Druid\n    203123, -- Maim\n    5211,   -- Mighty Bash\n    163505, -- Rake Stun\n    \n    -- Hunter\n    24394,  -- Intimidation (Pet)\n    \n    -- Mage\n    \n    -- Monk\n    119381, -- Leg Sweep\n    \n    -- Paladin\n    853,    -- Hammer of Justice\n    \n    -- Priest\n    200200, -- Holy Word: Chastise\n    64044,  -- Psychic Horror\n    \n    -- Rogue\n    199804, -- Between the Eyes\n    1833,   -- Cheap Shot\n    408,    -- Kidney Shot\n    \n    -- Shaman\n    118345, -- Pulverize (Earth Elemental)\n    118345, -- Pulverize (Enhancement)\n    118905, -- Static Charge\n    \n    -- Warlock\n    89766,  -- Axe Toss (Felguard)\n    220703, -- Infernal Awakening\n    171018, -- Meteor Strike (Abyssal)\n    171017, -- Meteor Strike (Infernal)\n    30283,  -- Shadowfury\n    \n    -- Warrior\n    132168, -- Shockwave\n    132169  -- Storm Bolt\n}\n\n---------------------------------\n-- DO NOT EDIT BELOW THIS LINE --\n---------------------------------\n\n-- Returns true if spell is in above list\naura_env.allStunsContains = function(spellID)\n    for i, v in ipairs(aura_env.allStuns) do\n        if v == spellID then\n            return true\n        end\n    end\n    return false\nend\n\n-- Returns nameplate that has the given GUID or nil\naura_env.getNameplate = function(GUID)\n    local unit\n    for _, plate in pairs(C_NamePlate.GetNamePlates()) do\n        unit = plate.namePlateUnitToken\n        if UnitGUID(unit) == GUID then\n            return unit\n        end\n    end\n    return nil\nend\n\n-- Returns clone from allStates with the given nameplate\naura_env.getCloneWithPlate = function(plate, allStates)\n    for k, v in pairs(allStates) do\n        if v.nameplate == plate then\n            return v\n        end\n    end\n    return nil\nend\n\n-- Anchors the clone to the given frame\naura_env.setAnchor = function(frame, relPoint)\n    aura_env.region:SetPoint(\"TOPRIGHT\", frame, relPoint, aura_env.config.x, aura_env.config.y)\nend",
					["do_custom"] = true,
				},
				["start"] = {
					["custom"] = "\n\n",
					["do_custom"] = false,
				},
			},
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["anchorPoint"] = "CENTER",
			["animation"] = {
				["finish"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["main"] = {
					["alpha"] = 0,
					["colorA"] = 1,
					["colorB"] = 1,
					["colorFunc"] = "\n\n",
					["colorG"] = 1,
					["colorR"] = 1,
					["colorType"] = "custom",
					["duration"] = "",
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["rotate"] = 0,
					["scalex"] = 1,
					["scaley"] = 1,
					["type"] = "none",
					["use_color"] = false,
					["x"] = 0,
					["y"] = 0,
				},
				["start"] = {
					["alpha"] = 0,
					["colorA"] = 1,
					["colorB"] = 1,
					["colorFunc"] = "function(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n    if not aura_env.state then return 0, 0, 0, 1 end  -- error checking.\n    if aura_env.state.stunCount == 1 then\n        return 0, 1, 0, 1  -- Green\n    elseif aura_env.state.stunCount == 2 then\n        return 1, 1, 0, 1  -- Yellow\n    elseif aura_env.state.stunCount >= 3 then\n        return 1, 0, 0, 1  -- Red\n    else\n        return 1, 1, 1, 1\n    end     \nend\n\n\n\n\n\n\n\n\n\n",
					["colorG"] = 1,
					["colorR"] = 1,
					["colorType"] = "custom",
					["duration"] = "0",
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["rotate"] = 0,
					["scalex"] = 1,
					["scaley"] = 1,
					["type"] = "none",
					["use_color"] = false,
					["x"] = 0,
					["y"] = 0,
				},
			},
			["authorOptions"] = {
				{
					["fontSize"] = "medium",
					["text"] = "기본 좌표",
					["type"] = "description",
					["width"] = 2,
				}, -- [1]
				{
					["default"] = -8,
					["key"] = "x",
					["max"] = 100,
					["min"] = -100,
					["name"] = "좌우",
					["step"] = 1,
					["type"] = "range",
					["width"] = 1,
				}, -- [2]
				{
					["default"] = -14,
					["key"] = "y",
					["max"] = 100,
					["min"] = -100,
					["name"] = "상하",
					["step"] = 1,
					["type"] = "range",
					["width"] = 1,
				}, -- [3]
			},
			["auto"] = false,
			["automaticWidth"] = "Auto",
			["backgroundColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				0.80000001192093, -- [4]
			},
			["backgroundOffset"] = 1,
			["backgroundTexture"] = "450915",
			["blendMode"] = "BLEND",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["compress"] = false,
			["conditions"] = {
				{
					["changes"] = {
						{
							["property"] = "customcode",
							["value"] = {
								["custom"] = "-- Runs after initial creation of clone or when DR resets while clone is active\naura_env.region:ClearAllPoints()\n\n-- If nameplate for the clone exists, anchor the clone to the nameplate.\nif aura_env.state.nameplate then\n    aura_env.setAnchor(C_NamePlate.GetNamePlateForUnit(aura_env.state.nameplate), \"TOPRIGHT\")\n    aura_env.state.visible = true\nend",
							},
						}, -- [1]
						{
							["property"] = "foregroundColor",
							["value"] = {
								0, -- [1]
								1, -- [2]
								0, -- [3]
								1, -- [4]
							},
						}, -- [2]
					},
					["check"] = {
						["op"] = "==",
						["trigger"] = 1,
						["value"] = 1,
						["variable"] = "stunCount",
					},
				}, -- [1]
				{
					["changes"] = {
						{
							["property"] = "foregroundColor",
							["value"] = {
								1, -- [1]
								1, -- [2]
								0, -- [3]
								1, -- [4]
							},
						}, -- [1]
					},
					["check"] = {
						["op"] = "==",
						["trigger"] = 1,
						["value"] = 2,
						["variable"] = "stunCount",
					},
				}, -- [2]
				{
					["changes"] = {
						{
							["property"] = "foregroundColor",
							["value"] = {
								1, -- [1]
								0, -- [2]
								0, -- [3]
								1, -- [4]
							},
						}, -- [1]
					},
					["check"] = {
						["op"] = "==",
						["trigger"] = 1,
						["value"] = 3,
						["variable"] = "stunCount",
					},
				}, -- [3]
				{
					["changes"] = {
						{
							["property"] = "customcode",
							["value"] = {
								["custom"] = "-- When visible is true, anchor to the nameplate\naura_env.region:ClearAllPoints()\naura_env.setAnchor(C_NamePlate.GetNamePlateForUnit(aura_env.state.nameplate), \"TOPRIGHT\")",
							},
						}, -- [1]
					},
					["check"] = {
						["trigger"] = 1,
						["value"] = 1,
						["variable"] = "visible",
					},
				}, -- [4]
				{
					["changes"] = {
						{
							["property"] = "customcode",
							["value"] = {
								["custom"] = "-- When visible is false, anchor to the world frame.\naura_env.region:ClearAllPoints()\naura_env.setAnchor(_G[\"WorldFrame\"], \"BOTTOMLEFT\")\n\n\n\n",
							},
						}, -- [1]
					},
					["check"] = {
						["trigger"] = 1,
						["value"] = 0,
						["variable"] = "visible",
					},
				}, -- [5]
			},
			["config"] = {
				["x"] = -8,
				["y"] = -14,
			},
			["cooldown"] = true,
			["cooldownEdge"] = false,
			["cooldownSwipe"] = true,
			["cooldownTextDisabled"] = false,
			["crop_x"] = 0.41,
			["crop_y"] = 0.41,
			["customTextUpdate"] = "update",
			["desaturate"] = false,
			["desaturateBackground"] = false,
			["desaturateForeground"] = false,
			["displayIcon"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Circle_Smooth_Border",
			["displayText"] = "%p",
			["endAngle"] = 360,
			["fixedWidth"] = 200,
			["font"] = "Friz Quadrata TT",
			["fontSize"] = 12,
			["foregroundColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["foregroundTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Circle_White_Border",
			["frameStrata"] = 1,
			["glow"] = false,
			["glowColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["glowType"] = "buttonOverlay",
			["height"] = 14,
			["icon"] = true,
			["id"] = "쐐기 : 스턴 점감",
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["internalVersion"] = 45,
			["inverse"] = false,
			["justify"] = "LEFT",
			["keepAspectRatio"] = false,
			["load"] = {
				["class"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
				},
				["ingroup"] = {
					["multi"] = {
						["group"] = true,
					},
					["single"] = "group",
				},
				["instance_type"] = {
				},
				["level"] = "60",
				["level_operator"] = "==",
				["size"] = {
					["multi"] = {
						["arena"] = true,
						["party"] = true,
						["ratedarena"] = true,
						["scenario"] = true,
					},
					["single"] = "party",
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["use_effectiveLevel"] = false,
				["use_level"] = true,
				["use_never"] = false,
				["use_size"] = false,
				["zoneIds"] = "",
			},
			["mirror"] = false,
			["orientation"] = "ANTICLOCKWISE",
			["outline"] = "OUTLINE",
			["parent"] = "쐐기 : 기타 0403",
			["preferToUpdate"] = false,
			["regionType"] = "progresstexture",
			["rotation"] = 0,
			["sameTexture"] = true,
			["selfPoint"] = "BOTTOM",
			["semver"] = "1.0.247",
			["slantMode"] = "INSIDE",
			["startAngle"] = 0,
			["stickyDuration"] = false,
			["text1"] = " ",
			["text1Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text1Containment"] = "INSIDE",
			["text1Enabled"] = false,
			["text1Font"] = "Friz Quadrata TT",
			["text1FontFlags"] = "OUTLINE",
			["text1FontSize"] = 12,
			["text1Point"] = "BOTTOMRIGHT",
			["text2"] = "%p",
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text2Containment"] = "INSIDE",
			["text2Enabled"] = false,
			["text2Font"] = "Friz Quadrata TT",
			["text2FontFlags"] = "OUTLINE",
			["text2FontSize"] = 24,
			["text2Point"] = "CENTER",
			["textureWrapMode"] = "CLAMP",
			["tocversion"] = 90005,
			["triggers"] = {
				[1] = {
					["trigger"] = {
						["check"] = "event",
						["custom"] = "function(allStates, event, ...)\n    \n    local plate, subEvent, _, source, _, _, _, dest, _, destFlag = ...\n    local spellID = select(12, ...)\n    \n    if event == \"COMBAT_LOG_EVENT_UNFILTERED\" then\n        \n        -- If target is an npc and has been stunned by a tracked spell\n        if subEvent == \"SPELL_AURA_APPLIED\" and aura_env.allStunsContains(spellID) and bit.band(destFlag, 0x800) ~= 0 then\n            \n            -- Create clone if it doesn't exist.  Otherwise, update clone.\n            if not allStates[dest] then\n                \n                allStates[dest] = {\n                    show = true,\n                    changed = true,\n                    progressType = \"timed\",\n                    duration = 24,\n                    expirationTime = 24 + GetTime(),\n                    autoHide = true,\n                    stunCount = 1,\n                    nameplate = aura_env.getNameplate(dest),\n                    visible = false \n                }\n            else\n                allStates[dest].stunCount = (allStates[dest].stunCount) % 3 + 1\n                allStates[dest].expirationTime = 24 + GetTime()\n                allStates[dest].changed = true\n            end\n        end\n    end\n    \n    -- If nameplate with clone disappears from screen, hide the clone.\n    if event == \"NAME_PLATE_UNIT_REMOVED\" then\n        \n        local clone = aura_env.getCloneWithPlate(plate, allStates)\n        if clone then\n            clone.visible = false\n            clone.nameplate = nil\n        end\n    end\n    \n    -- If nameplate with GUID of clone appears, show the clone.\n    if event == \"NAME_PLATE_UNIT_ADDED\" and plate ~= nil then\n        \n        local clone = allStates[UnitGUID(plate)]\n        if clone then\n            clone.visible = true\n            clone.nameplate = plate\n        end\n    end\n    \n    return true\nend",
						["customVariables"] = "{\n    visible = \"bool\",\n    stunCount = {\n        display = \"color\",\n        type = \"select\",\n        values = {\n            [1] = \"green\",\n            [2] = \"yellow\",\n            [3] = \"red\",\n        }\n    }\n}",
						["custom_type"] = "stateupdate",
						["debuffType"] = "HELPFUL",
						["event"] = "Health",
						["events"] = "CLEU:SPELL_AURA_APPLIED, NAME_PLATE_UNIT_ADDED, NAME_PLATE_UNIT_REMOVED",
						["names"] = {
						},
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "custom",
						["unit"] = "player",
					},
					["untrigger"] = {
					},
				},
				[2] = {
					["trigger"] = {
						["check"] = "update",
						["custom"] = "function()\n    local theTime = GetTime()\n    if not aura_env.last or aura_env.last < theTime - 0.05 then\n        aura_env.last = theTime\n        if aura_env.state and aura_env.state.stunCount then\n            print(\"In trigger 2\")\n            aura_env.setColor(aura_env.state.stunCount)\n        end\n    end\nend\n\n\n\n\n\n\n\n\n\n\n\n\n",
						["custom_hide"] = "timed",
						["custom_type"] = "status",
						["event"] = "Health",
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "custom",
					},
					["untrigger"] = {
					},
				},
				["activeTriggerMode"] = -10,
				["disjunctive"] = "any",
			},
			["uid"] = "0QLkkMlOTBf",
			["url"] = "https://wago.io/fCabQ-hF8/248",
			["useAdjustedMax"] = false,
			["useAdjustedMin"] = false,
			["useAdjustededMax"] = false,
			["useAdjustededMin"] = false,
			["useglowColor"] = false,
			["user_x"] = 0,
			["user_y"] = 0,
			["version"] = 248,
			["width"] = 14,
			["wordWrap"] = "WordWrap",
			["xOffset"] = 0,
			["yOffset"] = 0,
			["zoom"] = 0,
		},
		["쐐기 : 시전 대상"] = {
			["actions"] = {
				["finish"] = {
					["custom"] = "aura_env.sortAndOffset()",
					["do_custom"] = true,
				},
				["init"] = {
					["custom"] = "aura_env.Chat = {}\naura_env.BChat = {}\n\naura_env.LocalC = {   \n    [\"??\"] = {\n    }, \n    [\"고통의 투기장\"] = {\n        [\"기회 포착\"] = true, -- 비열한 자 시라\n        [\"죽음풍\"] = true,\n        [\"뼈 창\"] = true,\n        [\"베기\"] = true,\n        [\"시체 삼키기\"] = true,\n        [\"사격\"] = false,\n        [\"날카로운 불화\"] = false,\n        [\"영혼 결속\"] = true,\n        [\"튕기는 칼날\"] = true,\n        [\"영혼의 손길\"] = false,\n        [\"괴저 화살\"] = false,\n        [\"죽음의 화살\"] = false,\n    },\n    [\"속죄의 전당\"] = {\n        [\"생명력 착취\"] = true,\n        [\"절멸의 저주\"] = true,\n        [\"사격\"] = false, \n    },\n    [\"승천의 첨탑\"] = {\n        [\"충전된 창\"] = true,\n        [\"어둠 채찍\"] = true,\n        [\"지식의 무게\"] = true,\n        [\"던지기\"] = true,\n    },\n    [\"역병 몰락지\"] = {\n        [\"사격\"] = true, \n        [\"흉측한 타액\"] = true,\n        [\"옭아매는 감염\"] = true,\n        [\"옭아매는 오물\"] = true,\n        [\"분쇄의 포옹\"] = true,\n    },\n    [\"저편\"] = {\n        [\"사술\"] = false,\n        [\"최면성 반짝먼지\"] = true,\n        [\"흡수의 아지랑이\"] = true,\n        [\"번개 방출\"] = false,\n        [\"컹-컹\"] = false,\n        [\"방향유\"] = false,\n    },\n    [\"죽음의 상흔\"] = {\n        [\"피 포식\"] = false, \n        [\"사격\"] = true, \n        [\"얼음 화살\"] = true, \n        [\"병독의 집착\"] = true, --의사 스티치\n        [\"고기 갈고리\"] = true, \n        [\"질병 분출\"] = true, \n        [\"들붙는 어둠\"] = true, \n        [\"식칼 투척\"] = true, \n        [\"방부 수액\"] = true, \n        [\"살점 던지기\"] = false, \n        [\"체액 흡수\"] = true, \n    },\n    [\"티르너 사이드의 안개\"] = {\n        [\"과성장\"] = true,\n        [\"영혼의 화살\"] = true, \n        [\"안개장막 이빨\"] = true, \n        [\"얼음땡 시선 집중\"] = true, --환영 여우, 미스트콜러\n        [\"휘발성 산\"] = true,\n    },\n    [\"핏빛 심연\"] = {\n        [\"공포의 사격\"] = false,\n        [\"포식\"] = true,\n        [\"연구물 던지기\"] = false,\n        [\"폭발성 양피지\"] = true,\n        [\"어두운 화살\"] = false,\n        [\"암울한 폭발\"] = true,\n        [\"날카로운 족쇄\"] = true,\n        [\"영혼 파멸\"] = false,\n        [\"폭발적인 분노\"] = true,\n        [\"탐식\"] = true,\n        [\"억제의 저주\"] = true,\n    },\n}\n\naura_env.LocalB = {   \n    [\"??\"] = {\n    }, \n    [\"고통의 투기장\"] = {\n    },\n    [\"속죄의 전당\"] = {\n    },\n    [\"승천의 첨탑\"] = {\n        [\"충전된 창\"] = true,\n    },\n    [\"역병 몰락지\"] = {\n    },\n    [\"저편\"] = {\n        [\"비전 번개\"] = true, -- 자이엑사\n    },\n    [\"죽음의 상흔\"] = {\n        [\"들썩이는 구토\"] = true, -- 역병뼈닥이\n        [\"얼어붙은 구속\"] = true, \n        [\"어둠의 추방\"] = true, \n    },\n    [\"티르너 사이드의 안개\"] = {\n        [\"얼음땡\"] = true, -- 미스트콜러\n        [\"정신의 연결\"] = true, -- 트레도바\n        [\"사냥감의 징표\"] = true, \n        [\"기생성 평정화\"] = true, \n        [\"기생성 무력화\"] = true, \n        [\"신경 지배\"] = true,\n    },\n    [\"핏빛 심연\"] = {\n        [\"육중한 돌격\"] = true, -- 크릭시스\n        [\"혹독\"] = true,-- 타르볼드\n    },\n}\n-----------------------------------------\n--            USER SETTINGS            --\n----------------------------------------\nlocal ver = { 'DOWN', 'UP' };\nlocal sor = { 'DESC', 'ASC' };\n\nlocal spacing = aura_env.config.spacing or 3 -- adjust to preference\nlocal vertical_growth = aura_env.config.ver and ver[aura_env.config.ver] or 'DOWN' -- or \"DOWN\"\nlocal sort_direction = aura_env.config.sor and sor[aura_env.config.sor] or 'DESC'\n\n-----------------------------------------\n--             DO NOT TOUCH            --\n-----------------------------------------\n\nlocal aura_env = aura_env\naura_env.sortAndOffset = function()\n    local baseX = WeakAuras.regions[aura_env.id].region.xOffset\n    local baseY = WeakAuras.regions[aura_env.id].region.yOffset\n    local count = 0\n    local t = {}\n    \n    for _, v in pairs(WeakAuras.clones[aura_env.id]) do\n        table.insert(t, v)\n    end\n    \n    table.sort(t, function(a,b) \n            if a.state and b.state then\n                if sort_direction == \"DESC\" then\n                    return a.state.expirationTime < b.state.expirationTime\n                else\n                    return a.state.expirationTime > b.state.expirationTime\n                end\n            end\n    end)\n    \n    for _, region in ipairs(t) do\n        if region.toShow then\n            local yOff = - count * (region.height + spacing)\n            yOff = vertical_growth == \"UP\" and 0-yOff or yOff\n            region:SetOffset(baseX, baseY + yOff)\n            count = count + 1\n        end\n    end\nend",
					["do_custom"] = true,
				},
				["start"] = {
					["custom"] = "aura_env.sortAndOffset()",
					["do_custom"] = true,
					["do_message"] = true,
					["do_sound"] = false,
					["message"] = "%n",
					["message_format_n_format"] = "none",
					["message_type"] = "SAY",
					["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\BananaPeelSlip.ogg",
				},
			},
			["advance"] = false,
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["anchorPoint"] = "BOTTOM",
			["animation"] = {
				["finish"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["main"] = {
					["alpha"] = 0.6,
					["alphaFunc"] = "    function(progress, start, delta)\n      local angle = (progress * 2 * math.pi) - (math.pi / 2)\n      return start + (((math.sin(angle) + 1)/2) * delta)\n    end\n  ",
					["alphaType"] = "alphaPulse",
					["colorA"] = 1,
					["colorB"] = 0,
					["colorFunc"] = "    function(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n      return WeakAuras.GetHSVTransition(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n    end\n  ",
					["colorG"] = 0,
					["colorR"] = 1,
					["colorType"] = "straightHSV",
					["duration"] = "0",
					["duration_type"] = "relative",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["rotate"] = 0,
					["scalex"] = 1,
					["scaley"] = 1,
					["type"] = "none",
					["use_alpha"] = false,
					["use_color"] = true,
					["x"] = 0,
					["y"] = 0,
				},
				["start"] = {
					["alpha"] = 0,
					["colorA"] = 1,
					["colorB"] = 1,
					["colorG"] = 1,
					["colorR"] = 1,
					["duration"] = "",
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["rotate"] = 0,
					["scaleFunc"] = "    function(progress, startX, startY, scaleX, scaleY)\n      return startX + (progress * (scaleX - startX)), startY + (progress * (scaleY - startY))\n    end\n  ",
					["scaleType"] = "straightScale",
					["scalex"] = 5,
					["scaley"] = 5,
					["translateFunc"] = "    function(progress, startX, startY, deltaX, deltaY)\n      return startX + (progress * deltaX), startY + (progress * deltaY)\n    end\n  ",
					["translateType"] = "straightTranslate",
					["type"] = "none",
					["use_alpha"] = false,
					["use_scale"] = false,
					["use_translate"] = false,
					["x"] = 0,
					["y"] = 0,
				},
			},
			["api"] = false,
			["authorOptions"] = {
				{
					["default"] = 1,
					["desc"] = "",
					["key"] = "ver",
					["name"] = "성장 방향",
					["type"] = "select",
					["useDesc"] = false,
					["values"] = {
						"아래로", -- [1]
						"위로", -- [2]
					},
					["width"] = 0.6,
				}, -- [1]
				{
					["default"] = 1,
					["desc"] = "시간 순",
					["key"] = "sor",
					["name"] = "정렬",
					["type"] = "select",
					["useDesc"] = true,
					["values"] = {
						"내림차순", -- [1]
						"오름차순", -- [2]
					},
					["width"] = 0.6,
				}, -- [2]
				{
					["default"] = 3,
					["desc"] = "",
					["key"] = "spacing",
					["max"] = 100,
					["min"] = 0,
					["name"] = "줄 간격",
					["step"] = 0.1,
					["type"] = "number",
					["useDesc"] = false,
					["width"] = 0.5,
				}, -- [3]
			},
			["auto"] = true,
			["automaticWidth"] = "Auto",
			["backdropColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0.5, -- [4]
			},
			["backdropInFront"] = false,
			["backgroundColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				0.5, -- [4]
			},
			["barColor"] = {
				1, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["blendMode"] = "ADD",
			["border"] = false,
			["borderBackdrop"] = "Blizzard Tooltip",
			["borderColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0.5, -- [4]
			},
			["borderEdge"] = "None",
			["borderInFront"] = true,
			["borderInset"] = 11,
			["borderOffset"] = 5,
			["borderSize"] = 16,
			["color"] = {
				0.9921568627451, -- [1]
				1, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["config"] = {
				["sor"] = 1,
				["spacing"] = 3,
				["ver"] = 1,
			},
			["cooldown"] = false,
			["cooldownTextDisabled"] = false,
			["customTextUpdate"] = "update",
			["desaturate"] = false,
			["discrete_rotation"] = 0,
			["displayIcon"] = 841383,
			["displayText"] = "%i%p%i",
			["displayTextLeft"] = "%i %p %i",
			["displayTextRight"] = "%p",
			["displayText_format_p_format"] = "timed",
			["displayText_format_p_time_dynamic_threshold"] = 60,
			["displayText_format_p_time_format"] = 0,
			["displayText_format_p_time_precision"] = 1,
			["fixedWidth"] = 200,
			["font"] = "Friz Quadrata TT",
			["fontFlags"] = "OUTLINE",
			["fontSize"] = 33,
			["frameStrata"] = 1,
			["glow"] = false,
			["height"] = 45,
			["icon"] = true,
			["icon_color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["icon_side"] = "RIGHT",
			["id"] = "쐐기 : 시전 대상",
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["internalVersion"] = 45,
			["inverse"] = false,
			["justify"] = "CENTER",
			["keepAspectRatio"] = false,
			["load"] = {
				["class"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
						["challenge"] = true,
					},
					["single"] = "challenge",
				},
				["effectiveLevel"] = "50",
				["effectiveLevel_operator"] = ">",
				["encounterid"] = "2092",
				["faction"] = {
					["multi"] = {
					},
				},
				["ingroup"] = {
					["multi"] = {
					},
				},
				["level"] = "60",
				["level_operator"] = "==",
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["role"] = {
					["multi"] = {
						["DAMAGER"] = true,
						["HEALER"] = true,
					},
					["single"] = "DAMAGER",
				},
				["size"] = {
					["multi"] = {
						["party"] = true,
					},
					["single"] = "party",
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["talent2"] = {
					["multi"] = {
					},
				},
				["use_effectiveLevel"] = false,
				["use_encounterid"] = false,
				["use_level"] = true,
				["use_never"] = false,
				["use_role"] = false,
				["use_size"] = true,
				["zoneIds"] = "",
			},
			["mirror"] = false,
			["modelIsUnit"] = false,
			["model_path"] = "Creature/Arthaslichking/arthaslichking.m2",
			["model_st_rx"] = 270,
			["model_st_ry"] = 0,
			["model_st_rz"] = 0,
			["model_st_tx"] = 0,
			["model_st_ty"] = 0,
			["model_st_tz"] = 0,
			["model_st_us"] = 40,
			["model_x"] = 0,
			["model_y"] = 0,
			["model_z"] = 0,
			["orientation"] = "HORIZONTAL",
			["outline"] = "OUTLINE",
			["parent"] = "쐐기 : 시전 대상 0216",
			["preferToUpdate"] = true,
			["regionType"] = "text",
			["rotate"] = false,
			["rotateText"] = "NONE",
			["rotation"] = 0,
			["scale"] = 1,
			["selfPoint"] = "CENTER",
			["semver"] = "1.0.110",
			["sequence"] = 1,
			["shadowColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["shadowXOffset"] = 1,
			["shadowYOffset"] = -1,
			["spark"] = false,
			["sparkBlendMode"] = "ADD",
			["sparkColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["sparkDesature"] = false,
			["sparkHeight"] = 30,
			["sparkHidden"] = "NEVER",
			["sparkOffsetX"] = 0,
			["sparkOffsetY"] = 0,
			["sparkRotation"] = 0,
			["sparkRotationMode"] = "AUTO",
			["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
			["sparkWidth"] = 10,
			["stacks"] = true,
			["stacksColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["stacksFlags"] = "None",
			["stacksFont"] = "Friz Quadrata TT",
			["stacksSize"] = 45,
			["stickyDuration"] = false,
			["text"] = true,
			["text1"] = " ",
			["text1Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text1Containment"] = "OUTSIDE",
			["text1Enabled"] = false,
			["text1Font"] = "Friz Quadrata TT",
			["text1FontFlags"] = "OUTLINE",
			["text1FontSize"] = 18,
			["text1Point"] = "BOTTOM",
			["text2"] = "%p",
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text2Containment"] = "INSIDE",
			["text2Enabled"] = false,
			["text2Font"] = "Friz Quadrata TT",
			["text2FontFlags"] = "OUTLINE",
			["text2FontSize"] = 24,
			["text2Point"] = "CENTER",
			["textColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["textFlags"] = "None",
			["textFont"] = "Friz Quadrata TT",
			["textSize"] = 45,
			["texture"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Auras\\Aura27",
			["timer"] = true,
			["timerColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["timerFlags"] = "None",
			["timerFont"] = "Friz Quadrata TT",
			["timerSize"] = 45,
			["tocversion"] = 90005,
			["triggers"] = {
				[1] = {
					["trigger"] = {
						["check"] = "event",
						["custom"] = "function(states)\n    for _, v in pairs(states) do\n        v.show = false;\n        v.changed = true;\n    end\n    \n    for _, plate in pairs(C_NamePlate.GetNamePlates()) do\n        local unit = plate.namePlateUnitToken\n        if unit and UnitIsUnit(unit..\"target\", \"player\") and (UnitChannelInfo(unit) or UnitCastingInfo(unit)) then\n            local cast = UnitCastingInfo(unit)\n            local channel = UnitChannelInfo(unit)\n            local spellInList = (aura_env.Chat[cast] ~= nil or aura_env.Chat[channel] ~= nil)\n            if cast and spellInList then \n                states[unit] = states[unit] or {}\n                local state = states[unit]\n                if aura_env.Chat[cast] then\n                    state.name = select(1,UnitCastingInfo(unit))..\" 대상\"\n                else\n                    state.name = \"\"\n                end\n                state.icon = select(3,UnitCastingInfo(unit))\n                state.duration = (select(5,UnitCastingInfo(unit))-select(4,UnitCastingInfo(unit)))/1000 \n                state.expirationTime = select(5,UnitCastingInfo(unit))/1000\n                state.progressType = \"timed\"\n                state.changed = true\n                state.show = true\n                state.autohide = true\n            elseif channel and spellInList then \n                states[unit] = states[unit] or {}\n                local state = states[unit]\n                if aura_env.Chat[channel] then\n                    state.name = select(1,UnitChannelInfo(unit))..\" 대상\"\n                else\n                    state.name = \"\"\n                end\n                state.icon = select(3,UnitChannelInfo(unit))\n                state.duration = (select(5,UnitChannelInfo(unit))-select(4,UnitChannelInfo(unit)))/1000 \n                state.expirationTime = select(5,UnitChannelInfo(unit))/1000\n                state.progressType = \"timed\"\n                state.changed = true\n                state.show = true\n                state.autohide = true\n            end\n        end\n    end\n    \n    return true\nend",
						["custom_hide"] = "timed",
						["custom_type"] = "stateupdate",
						["debuffType"] = "HELPFUL",
						["event"] = "Health",
						["events"] = "NAME_PLATE_UNIT_ADDED NAME_PLATE_UNIT_REMOVED UNIT_SPELLCAST_CHANNEL_START:nameplate UNIT_SPELLCAST_CHANNEL_STOP:nameplate UNIT_SPELLCAST_CHANNEL_UPDATE:nameplate UNIT_SPELLCAST_DELAYED:nameplate UNIT_SPELLCAST_FAILED:nameplate UNIT_SPELLCAST_FAILED_QUIET:nameplate UNIT_SPELLCAST_INTERRUPTED:nameplate UNIT_SPELLCAST_START:nameplate UNIT_SPELLCAST_STOP:nameplate UNIT_TARGET:nameplate",
						["genericShowOn"] = "showOnActive",
						["names"] = {
						},
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "custom",
						["unit"] = "player",
					},
					["untrigger"] = {
					},
				},
				[2] = {
					["trigger"] = {
						["buffShowOn"] = "showOnActive",
						["check"] = "event",
						["custom"] = "function(states)\n    for _, v in pairs(states) do\n        v.show = false;\n        v.changed = true;\n    end\n    \n    for i = 1, 3 do\n        local unit = \"boss\"..i\n        if UnitExists(unit) and UnitIsUnit(unit..\"target\", \"player\") and (UnitChannelInfo(unit) or UnitCastingInfo(unit)) then\n            if aura_env.BChat[UnitChannelInfo(unit)] ~= nil or aura_env.BChat[UnitCastingInfo(unit)] ~= nil then \n                states[unit] = states[unit] or {}\n                local state = states[unit]\n                state.progressType = \"timed\"\n                state.changed = true\n                state.show = true\n                state.autohide = true\n                if UnitCastingInfo(unit) then\n                    if aura_env.BChat[UnitCastingInfo(unit)] then\n                        state.name = select(1,UnitCastingInfo(unit))..\" 대상\"\n                    else\n                        state.name = \"\"\n                    end\n                    state.icon = select(3,UnitCastingInfo(unit))\n                    state.duration = (select(5,UnitCastingInfo(unit))-select(4,UnitCastingInfo(unit)))/1000 \n                    state.expirationTime = select(5,UnitCastingInfo(unit))/1000\n                elseif UnitChannelInfo(unit) then\n                    if aura_env.BChat[UnitChannelInfo(unit)] then\n                        state.name = select(1,UnitChannelInfo(unit))..\" 대상\"\n                    else\n                        state.name = \"\"\n                    end\n                    state.icon = select(3, UnitChannelInfo(unit))\n                    state.duration =  (select(5,UnitChannelInfo(unit))-select(4,UnitChannelInfo(unit)))/1000\n                    state.expirationTime = select(5,UnitChannelInfo(unit))/1000 \n                end\n            end\n        end\n    end\n    return true\nend",
						["custom_type"] = "stateupdate",
						["debuffType"] = "HELPFUL",
						["event"] = "Health",
						["events"] = "UNIT_SPELLCAST_CHANNEL_START:boss1:boss2:boss3 UNIT_SPELLCAST_CHANNEL_STOP:boss1:boss2:boss3 UNIT_SPELLCAST_CHANNEL_UPDATE:boss1:boss2:boss3 UNIT_SPELLCAST_DELAYED:boss1:boss2:boss3 UNIT_SPELLCAST_FAILED:boss1:boss2:boss3 UNIT_SPELLCAST_FAILED_QUIET:boss1:boss2:boss3 UNIT_SPELLCAST_INTERRUPTED:boss1:boss2:boss3 UNIT_SPELLCAST_START:boss1:boss2:boss3 UNIT_SPELLCAST_STOP:boss1:boss2:boss3 UNIT_TARGET:boss1:boss2:boss3",
						["names"] = {
						},
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "custom",
						["unevent"] = "auto",
						["unit"] = "player",
						["use_absorbMode"] = true,
						["use_unit"] = true,
					},
					["untrigger"] = {
					},
				},
				[3] = {
					["trigger"] = {
						["custom"] = "function()\n    \n    local loc = select(1, GetInstanceInfo())\n    \n    if loc then\n        if aura_env.LocalC[loc] then\n            aura_env.Chat = aura_env.LocalC[loc]\n        else\n            aura_env.Chat = {}   \n        end\n        \n        if aura_env.LocalB[loc] then\n            aura_env.BChat = aura_env.LocalB[loc]\n        else\n            aura_env.BChat = {}     \n        end\n    end\n    \nend\n\n\n\n\n",
						["custom_hide"] = "custom",
						["custom_type"] = "event",
						["event"] = "Health",
						["events"] = "ZONE_CHANGED_NEW_AREA, PLAYER_ENTERING_WORLD, CHALLENGE_MODE_START",
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "custom",
					},
					["untrigger"] = {
					},
				},
				["activeTriggerMode"] = -10,
				["customTriggerLogic"] = "function(t)\n    return t[1] or t[2]\nend",
				["disjunctive"] = "custom",
			},
			["uid"] = "BSBv6iYb28z",
			["url"] = "https://wago.io/uUwU71sI8/111",
			["useAdjustededMax"] = false,
			["useAdjustededMin"] = false,
			["version"] = 111,
			["width"] = 44.000003814697,
			["wordWrap"] = "WordWrap",
			["xOffset"] = 0,
			["yOffset"] = 20,
			["zoom"] = 0,
		},
		["쐐기 : 시전 대상 0216"] = {
			["actions"] = {
				["finish"] = {
				},
				["init"] = {
				},
				["start"] = {
				},
			},
			["anchorFrameType"] = "SCREEN",
			["anchorPoint"] = "CENTER",
			["animation"] = {
				["finish"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["start"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
			},
			["authorOptions"] = {
			},
			["backdropColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0.5, -- [4]
			},
			["border"] = false,
			["borderBackdrop"] = "Blizzard Tooltip",
			["borderColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["borderEdge"] = "1 Pixel",
			["borderInset"] = 1,
			["borderOffset"] = 4,
			["borderSize"] = 2,
			["conditions"] = {
			},
			["config"] = {
			},
			["controlledChildren"] = {
				"쐐기 : 나에게 시전", -- [1]
				"쐐기 : 전방 주의", -- [2]
				"쐐기 : 시전 대상", -- [3]
			},
			["frameStrata"] = 1,
			["groupIcon"] = "525134",
			["id"] = "쐐기 : 시전 대상 0216",
			["information"] = {
				["groupOffset"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["internalVersion"] = 45,
			["load"] = {
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["use_class"] = false,
				["zoneIds"] = "",
			},
			["preferToUpdate"] = true,
			["regionType"] = "group",
			["scale"] = 1,
			["selfPoint"] = "BOTTOMLEFT",
			["semver"] = "1.0.110",
			["subRegions"] = {
			},
			["tocversion"] = 90005,
			["triggers"] = {
				{
					["trigger"] = {
						["debuffType"] = "HELPFUL",
						["event"] = "Health",
						["names"] = {
						},
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "aura2",
						["unit"] = "player",
					},
					["untrigger"] = {
					},
				}, -- [1]
			},
			["uid"] = "EDWZYrb3C1v",
			["url"] = "https://wago.io/uUwU71sI8/111",
			["version"] = 111,
			["xOffset"] = 7.9999389648438,
			["yOffset"] = 1.0000610351563,
		},
		["쐐기 : 전방 주의"] = {
			["actions"] = {
				["finish"] = {
				},
				["init"] = {
					["custom"] = "aura_env.Target = {}\naura_env.TbN = {}\n\naura_env.Exc = {   \n    --    [\"죽음의 찌르기\"] = true,\n    [\"죽음풍\"] = true,\n}\n\naura_env.LocalT = {   \n    [\"??\"] = {\n    }, \n    [\"고통의 투기장\"] = {\n        [\"죽음풍\"] = true,\n        [\"끔찍한 분출\"] = true,\n        [\"암흑 황폐\"] = true, \n    },\n    [\"속죄의 전당\"] = {\n        [\"죽음의 찌르기\"] = true, \n        [\"속사\"] = true, \n        [\"강력 휘둘러치기\"] = true,\n        [\"돌 숨결\"] = true,\n        [\"풀려난 괴로움\"] = true,\n    },\n    [\"승천의 첨탑\"] = {\n        [\"휩쓸기 강타\"] = true,\n        [\"몰아치는 일격\"] = true,\n        [\"점점 여리게\"] = true,\n        [\"눈부신 섬광\"] = true,\n        [\"돌파\"] = true,\n    },\n    [\"역병 몰락지\"] = {\n        [\"폭풍 날개\"] = true, \n        [\"역병 내뿜기\"] = true,\n        [\"부패한 트림\"] = true,\n        [\"맹독 관통자\"] = true,\n        [\"점액의 손길\"] = true,\n    },\n    [\"저편\"] = {\n        [\"분출하는 어둠\"] = true,\n    },\n    [\"죽음의 상흔\"] = {\n        [\"소름 끼치는 회전베기\"] = true, \n        [\"내장 절단\"] = true,\n        [\"괴저 숨결\"] = true, \n    },\n    [\"티르너 사이드의 안개\"] = {\n        [\"혼란의 꽃가루\"] = true,\n        [\"질풍창\"] = true, \n        [\"혀 채찍질\"] = true, \n        [\"빛나는 숨결\"] = true,\n        [\"피구\"] = true,\n    },\n    [\"핏빛 심연\"] = {\n        [\"메아리치는 찌르기\"] = true,\n        [\"절단의 분쇄\"] = true,\n        [\"휩쓰는 베기\"] = true,\n    },\n}\n\n\naura_env.anchorFunc = function()\n    for _, region in pairs(WeakAuras.clones[aura_env.id]) do\n        if region.state and region.state.show then\n            region:ClearAllPoints()\n            region:SetPoint(\"RIGHT\", region.state.frame, \"LEFT\", aura_env.config.cx, aura_env.config.cy)\n            region:SetScale(aura_env.config.cscale)\n        end\n    end\nend",
					["do_custom"] = true,
				},
				["start"] = {
					["custom"] = "aura_env.anchorFunc()",
					["do_custom"] = true,
					["do_message"] = false,
					["do_sound"] = false,
					["message"] = "",
					["message_custom"] = "function()\n    return state.name\nend",
					["message_type"] = "SAY",
					["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\WaterDrop.ogg",
				},
			},
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["anchorPoint"] = "TOP",
			["animation"] = {
				["finish"] = {
					["alpha"] = 0,
					["alphaFunc"] = "function(progress, start, delta)\n    return start + (progress * delta)\nend\n",
					["alphaType"] = "straight",
					["colorA"] = 1,
					["colorB"] = 1,
					["colorG"] = 1,
					["colorR"] = 1,
					["duration"] = "0.15",
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["rotate"] = 0,
					["scaleFunc"] = "function(progress, startX, startY, scaleX, scaleY)\n    return startX + (progress * (scaleX - startX)), startY + (progress * (scaleY - startY))\nend\n",
					["scaleType"] = "straightScale",
					["scalex"] = 0,
					["scaley"] = 0,
					["type"] = "custom",
					["use_alpha"] = true,
					["use_scale"] = false,
					["x"] = 0,
					["y"] = 0,
				},
				["main"] = {
					["alpha"] = 0.6,
					["alphaFunc"] = "    function(progress, start, delta)\n      local angle = (progress * 2 * math.pi) - (math.pi / 2)\n      return start + (((math.sin(angle) + 1)/2) * delta)\n    end\n  ",
					["alphaType"] = "alphaPulse",
					["colorA"] = 1,
					["colorB"] = 1,
					["colorFunc"] = "function(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n    local angle = (progress * 2 * math.pi) - (math.pi / 2)\n    local newProgress = ((math.sin(angle) + 1)/2);\n    return r1 + (newProgress * (r2 - r1)),\n         g1 + (newProgress * (g2 - g1)),\n         b1 + (newProgress * (b2 - b1)),\n         a1 + (newProgress * (a2 - a1))\nend\n",
					["colorG"] = 1,
					["colorR"] = 1,
					["colorType"] = "pulseColor",
					["duration"] = "0.4",
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["rotate"] = 0,
					["scaleFunc"] = "function(progress, startX, startY, scaleX, scaleY)\n    local angle = (progress * 2 * math.pi) - (math.pi / 2)\n    return startX + (((math.sin(angle) + 1)/2) * (scaleX - 1)), startY + (((math.sin(angle) + 1)/2) * (scaleY - 1))\nend\n",
					["scaleType"] = "pulse",
					["scalex"] = 1.05,
					["scaley"] = 1.05,
					["type"] = "custom",
					["use_alpha"] = false,
					["use_color"] = true,
					["use_scale"] = true,
					["x"] = 0,
					["y"] = 0,
				},
				["start"] = {
					["alpha"] = 0,
					["alphaFunc"] = "function(progress, start, delta)\n    return start + (progress * delta)\nend\n",
					["alphaType"] = "straight",
					["colorA"] = 1,
					["colorB"] = 1,
					["colorG"] = 1,
					["colorR"] = 1,
					["duration"] = "0.1",
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["rotate"] = 0,
					["scaleFunc"] = "function(progress, startX, startY, scaleX, scaleY)\n    return startX + (progress * (scaleX - startX)), startY + (progress * (scaleY - startY))\nend\n",
					["scaleType"] = "straightScale",
					["scalex"] = 3,
					["scaley"] = 3,
					["translateFunc"] = "function(progress, startX, startY, deltaX, deltaY)\n    return startX + (progress * deltaX), startY + (progress * deltaY)\nend\n",
					["translateType"] = "straightTranslate",
					["type"] = "custom",
					["use_alpha"] = true,
					["use_scale"] = true,
					["use_translate"] = false,
					["x"] = 0,
					["y"] = 0,
				},
			},
			["authorOptions"] = {
				{
					["fontSize"] = "medium",
					["text"] = "시전 시 좌표 / 크기",
					["type"] = "description",
					["width"] = 2,
				}, -- [1]
				{
					["default"] = -21,
					["key"] = "cx",
					["max"] = 100,
					["min"] = -100,
					["name"] = "좌우",
					["step"] = 1,
					["type"] = "range",
					["width"] = 1,
				}, -- [2]
				{
					["default"] = -4,
					["key"] = "cy",
					["max"] = 100,
					["min"] = -100,
					["name"] = "상하",
					["step"] = 1,
					["type"] = "range",
					["width"] = 1,
				}, -- [3]
				{
					["default"] = 1.2,
					["key"] = "cscale",
					["max"] = 3,
					["min"] = 1,
					["name"] = "크기",
					["step"] = 0.01,
					["type"] = "range",
					["width"] = 2,
				}, -- [4]
			},
			["auto"] = true,
			["blendMode"] = "BLEND",
			["color"] = {
				0, -- [1]
				0.92156862745098, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["config"] = {
				["cscale"] = 1.2,
				["cx"] = -9,
				["cy"] = -4,
			},
			["cooldown"] = false,
			["cooldownTextDisabled"] = false,
			["customTextUpdate"] = "update",
			["desaturate"] = false,
			["discrete_rotation"] = 0,
			["displayIcon"] = 1391535,
			["frameStrata"] = 5,
			["glow"] = false,
			["height"] = 57,
			["icon"] = true,
			["id"] = "쐐기 : 전방 주의",
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["internalVersion"] = 45,
			["inverse"] = false,
			["keepAspectRatio"] = false,
			["load"] = {
				["class"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
						["challenge"] = true,
					},
					["single"] = "challenge",
				},
				["effectiveLevel"] = "50",
				["effectiveLevel_operator"] = ">",
				["encounterid"] = "2092",
				["faction"] = {
					["multi"] = {
					},
				},
				["ingroup"] = {
					["multi"] = {
					},
				},
				["level"] = "60",
				["level_operator"] = "==",
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["role"] = {
					["multi"] = {
					},
					["single"] = "DAMAGER",
				},
				["size"] = {
					["multi"] = {
						["party"] = true,
					},
					["single"] = "party",
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["talent2"] = {
					["multi"] = {
					},
				},
				["use_effectiveLevel"] = false,
				["use_encounterid"] = false,
				["use_level"] = true,
				["use_never"] = false,
				["use_size"] = true,
				["zoneIds"] = "",
			},
			["mirror"] = false,
			["parent"] = "쐐기 : 시전 대상 0216",
			["preferToUpdate"] = true,
			["regionType"] = "texture",
			["rotate"] = false,
			["rotation"] = 0,
			["selfPoint"] = "CENTER",
			["semver"] = "1.0.110",
			["stickyDuration"] = false,
			["text1"] = "%n",
			["text1Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text1Containment"] = "OUTSIDE",
			["text1Enabled"] = true,
			["text1Font"] = "Friz Quadrata TT",
			["text1FontFlags"] = "OUTLINE",
			["text1FontSize"] = 18,
			["text1Point"] = "BOTTOM",
			["text2"] = "%p",
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text2Containment"] = "INSIDE",
			["text2Enabled"] = false,
			["text2Font"] = "Friz Quadrata TT",
			["text2FontFlags"] = "OUTLINE",
			["text2FontSize"] = 24,
			["text2Point"] = "CENTER",
			["texture"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Auras\\Aura15",
			["textureWrapMode"] = "CLAMP",
			["tocversion"] = 90005,
			["triggers"] = {
				[1] = {
					["trigger"] = {
						["check"] = "event",
						["custom"] = "function(states)\n    for _, v in pairs(states) do\n        v.show = false;\n        v.changed = true;\n    end\n    \n    for _, plate in pairs(C_NamePlate.GetNamePlates()) do\n        local unit = plate.namePlateUnitToken\n        local cast = UnitCastingInfo(unit)\n        local channel = UnitChannelInfo(unit)\n        \n        if unit and (cast and aura_env.Target[cast]) or (channel and aura_env.Target[channel]) then\n            if UnitGroupRolesAssigned(\"player\") ~= \"TANK\" and (aura_env.Exc[cast] or aura_env.Exc[channel]) and UnitIsUnit(unit..\"target\", \"player\") then return end\n            states[unit] = states[unit] or {}\n            local state = states[unit]\n            state.frame = C_NamePlate.GetNamePlateForUnit(unit)\n            state.changed = true\n            state.show = true\n            state.cast = true\n        end\n    end\n    return true\nend",
						["custom_type"] = "stateupdate",
						["debuffType"] = "HELPFUL",
						["event"] = "Chat Message",
						["events"] = "NAME_PLATE_UNIT_ADDED NAME_PLATE_UNIT_REMOVED UNIT_SPELLCAST_CHANNEL_START:nameplate UNIT_SPELLCAST_CHANNEL_STOP:nameplate UNIT_SPELLCAST_CHANNEL_UPDATE:nameplate UNIT_SPELLCAST_DELAYED:nameplate UNIT_SPELLCAST_FAILED:nameplate UNIT_SPELLCAST_FAILED_QUIET:nameplate UNIT_SPELLCAST_INTERRUPTED:nameplate UNIT_SPELLCAST_START:nameplate UNIT_SPELLCAST_STOP:nameplate UNIT_TARGET:nameplate",
						["genericShowOn"] = "showOnActive",
						["names"] = {
						},
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "custom",
						["unevent"] = "auto",
						["unit"] = "player",
						["use_absorbMode"] = true,
						["use_unit"] = true,
					},
					["untrigger"] = {
					},
				},
				[2] = {
					["trigger"] = {
						["custom"] = "function()\n    \n    local loc = select(1, GetInstanceInfo())\n    \n    if loc and aura_env.LocalT[loc] then\n        aura_env.Target = aura_env.LocalT[loc]\n    else\n        aura_env.Target = {}   \n    end\n    \nend\n\n\n\n",
						["custom_hide"] = "custom",
						["custom_type"] = "event",
						["event"] = "Health",
						["events"] = "ZONE_CHANGED_NEW_AREA, PLAYER_ENTERING_WORLD, CHALLENGE_MODE_START",
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "custom",
					},
					["untrigger"] = {
					},
				},
				["activeTriggerMode"] = 1,
				["customTriggerLogic"] = "function(t)\n    return t[1]\nend",
				["disjunctive"] = "custom",
			},
			["uid"] = "kqma)OCW)49",
			["url"] = "https://wago.io/uUwU71sI8/111",
			["version"] = 111,
			["width"] = 57,
			["xOffset"] = 0,
			["yOffset"] = 4320,
			["zoom"] = 0,
		},
		["쐐기 : 전율"] = {
			["actions"] = {
				["finish"] = {
				},
				["init"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
				["start"] = {
					["do_sound"] = true,
					["sound"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Sounds\\sonar.ogg",
				},
			},
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["anchorPoint"] = "CENTER",
			["animation"] = {
				["finish"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["main"] = {
					["alpha"] = 0,
					["colorA"] = 1,
					["colorB"] = 0.03921568627451,
					["colorFunc"] = "function(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n    \n    if WeakAuras.IsOptionsOpen() then\n        return r1,g1,b1,a1\n    end\n    \n    local cast = select(5, UnitCastingInfo(\"player\")) or select(5, UnitChannelInfo(\"player\"))\n    local intp = select(8, UnitCastingInfo(\"player\")) or select(7, UnitChannelInfo(\"player\"))\n    \n    if cast and not intp and cast/1000 > aura_env.state.expirationTime then\n        return 1,0,0,1\n    else\n        return r1,g1,b1,a1\n    end\nend\n\n\n\n\n\n\n\n\n\n\n\n\n",
					["colorG"] = 0,
					["colorR"] = 1,
					["colorType"] = "custom",
					["duration"] = "",
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["rotate"] = 0,
					["scalex"] = 1,
					["scaley"] = 1,
					["type"] = "custom",
					["use_color"] = true,
					["x"] = 0,
					["y"] = 0,
				},
				["start"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
			},
			["authorOptions"] = {
			},
			["auto"] = false,
			["automaticWidth"] = "Auto",
			["backdropColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0.5, -- [4]
			},
			["backgroundColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				0.5, -- [4]
			},
			["barColor"] = {
				1, -- [1]
				0.90588235294118, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["barInFront"] = true,
			["border"] = false,
			["borderBackdrop"] = "Blizzard Tooltip",
			["borderColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0.5, -- [4]
			},
			["borderEdge"] = "None",
			["borderInset"] = 11,
			["borderOffset"] = 5,
			["borderSize"] = 16,
			["color"] = {
				1, -- [1]
				1, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["conditions"] = {
				{
					["changes"] = {
						{
							["property"] = "color",
							["value"] = {
								1, -- [1]
								0.48235294117647, -- [2]
								0, -- [3]
								1, -- [4]
							},
						}, -- [1]
					},
					["check"] = {
						["trigger"] = 2,
						["value"] = 1,
						["variable"] = "show",
					},
				}, -- [1]
			},
			["config"] = {
			},
			["customText"] = "",
			["customTextUpdate"] = "update",
			["desaturate"] = false,
			["displayIcon"] = 135975,
			["displayText"] = "%p",
			["displayTextLeft"] = "  시전 중지!!",
			["displayTextRight"] = "%p ",
			["displayText_format_p_format"] = "timed",
			["displayText_format_p_time_dynamic_threshold"] = 60,
			["displayText_format_p_time_format"] = 0,
			["displayText_format_p_time_precision"] = 1,
			["fixedWidth"] = 200,
			["font"] = "Friz Quadrata TT",
			["fontFlags"] = "OUTLINE",
			["fontSize"] = 54,
			["frameStrata"] = 1,
			["height"] = 59.999923706055,
			["icon"] = true,
			["icon_color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["icon_side"] = "RIGHT",
			["id"] = "쐐기 : 전율",
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["internalVersion"] = 45,
			["inverse"] = true,
			["justify"] = "CENTER",
			["load"] = {
				["affixes"] = {
					["single"] = 14,
				},
				["class"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
						["challenge"] = true,
					},
					["single"] = "challenge",
				},
				["effectiveLevel"] = "50",
				["effectiveLevel_operator"] = "==",
				["faction"] = {
					["multi"] = {
					},
				},
				["ingroup"] = {
					["multi"] = {
					},
				},
				["level"] = "60",
				["level_operator"] = "==",
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["role"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
						["party"] = true,
					},
					["single"] = "party",
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["talent2"] = {
					["multi"] = {
					},
				},
				["use_affixes"] = true,
				["use_difficulty"] = true,
				["use_effectiveLevel"] = false,
				["use_level"] = true,
				["use_never"] = false,
				["use_size"] = true,
				["zoneIds"] = "",
			},
			["orientation"] = "HORIZONTAL",
			["outline"] = "None",
			["parent"] = "쐐기 : 기타 0403",
			["preferToUpdate"] = false,
			["regionType"] = "text",
			["rotateText"] = "NONE",
			["selfPoint"] = "CENTER",
			["semver"] = "1.0.247",
			["shadowColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["shadowXOffset"] = 1,
			["shadowYOffset"] = -1,
			["spark"] = true,
			["sparkBlendMode"] = "ADD",
			["sparkColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["sparkDesature"] = false,
			["sparkHeight"] = 100,
			["sparkHidden"] = "NEVER",
			["sparkOffsetX"] = 0,
			["sparkOffsetY"] = 0,
			["sparkRotation"] = 0,
			["sparkRotationMode"] = "AUTO",
			["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
			["sparkWidth"] = 25,
			["stacks"] = false,
			["stacksColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["stacksFlags"] = "None",
			["stacksFont"] = "Friz Quadrata TT",
			["stacksSize"] = 12,
			["stickyDuration"] = false,
			["text"] = true,
			["textColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["textFlags"] = "None",
			["textFont"] = "Friz Quadrata TT",
			["textSize"] = 22,
			["texture"] = "Minimalist",
			["timer"] = true,
			["timerColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["timerFlags"] = "None",
			["timerFont"] = "Friz Quadrata TT",
			["timerSize"] = 30,
			["tocversion"] = 90005,
			["triggers"] = {
				[1] = {
					["trigger"] = {
						["auranames"] = {
							"전율", -- [1]
						},
						["buffShowOn"] = "showOnActive",
						["combineMatches"] = "showLowest",
						["custom_hide"] = "timed",
						["debuffType"] = "HARMFUL",
						["event"] = "Health",
						["matchesShowOn"] = "showOnActive",
						["names"] = {
							"전율", -- [1]
						},
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "aura2",
						["unit"] = "player",
						["useGroup_count"] = false,
						["useName"] = true,
						["use_debuffClass"] = false,
						["use_tooltip"] = false,
					},
					["untrigger"] = {
					},
				},
				[2] = {
					["trigger"] = {
						["check"] = "update",
						["custom"] = "function()\n    if WeakAuras.GetActiveTriggers(aura_env.id)[1] then\n        for unit in WA_IterateGroupMembers() do                \n            if unit ~= \"player\" and WeakAuras.CheckRange(unit, 4, \"<=\") then\n                return true\n            end\n        end\n    end\nend",
						["custom_hide"] = "timed",
						["custom_type"] = "status",
						["duration"] = "1",
						["event"] = "Health",
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "custom",
						["unevent"] = "auto",
						["unit"] = "player",
						["use_absorbMode"] = true,
						["use_unit"] = true,
					},
					["untrigger"] = {
						["custom"] = "function()\nreturn true\nend",
					},
				},
				["activeTriggerMode"] = 1,
				["customTriggerLogic"] = "function(t)\n    return t[1]\nend",
				["disjunctive"] = "custom",
			},
			["uid"] = "xcawWKe9UZi",
			["url"] = "https://wago.io/fCabQ-hF8/248",
			["version"] = 248,
			["width"] = 33.999992370605,
			["wordWrap"] = "WordWrap",
			["xOffset"] = 0,
			["yOffset"] = -245,
			["zoom"] = 0.25,
		},
		["쐐기 : 전율 예상"] = {
			["actions"] = {
				["finish"] = {
					["custom"] = "aura_env.Quake = nil",
					["do_custom"] = true,
				},
				["init"] = {
					["custom"] = "aura_env.Quake = nil",
					["do_custom"] = true,
				},
				["start"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
			},
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["anchorPoint"] = "CENTER",
			["animation"] = {
				["finish"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["main"] = {
					["alpha"] = 0,
					["colorA"] = 1,
					["colorB"] = 0.03921568627451,
					["colorFunc"] = "function(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n    if WeakAuras.IsOptionsOpen() then\n        return 1,0,0,1  \n    end\n    \n    if aura_env.Quake then\n        local Quake = 20 - ((GetTime() - aura_env.Quake)%20)\n        \n        if Quake >= 0 and Quake < 3  then\n            return 1,0,0,1\n        elseif Quake >= 3 and Quake < 5 then\n            return  r1 + ((5-Quake)/2 * (r2 - r1)), g1 + ((5-Quake)/2 * (g2 - g1)), b1 + ((5-Quake)/2 * (b2 - b1)), 1\n        elseif Quake >= 5 and Quake < 10 then\n            return 1,1,1,1\n        elseif Quake >= 10 and Quake < 12 then\n            return 1,1,1,0+((12-Quake)/2 * a2)\n        else\n            return 1,1,1,0\n        end\n    else\n        return 0,0,0,0\n    end \nend",
					["colorG"] = 0,
					["colorR"] = 1,
					["colorType"] = "custom",
					["duration"] = "",
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["rotate"] = 0,
					["scalex"] = 1,
					["scaley"] = 1,
					["type"] = "custom",
					["use_color"] = true,
					["x"] = 0,
					["y"] = 0,
				},
				["start"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
			},
			["authorOptions"] = {
			},
			["auto"] = true,
			["automaticWidth"] = "Auto",
			["backdropColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0.5, -- [4]
			},
			["backgroundColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				0.5, -- [4]
			},
			["barColor"] = {
				1, -- [1]
				0.66666666666667, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["barInFront"] = true,
			["border"] = false,
			["borderBackdrop"] = "Blizzard Tooltip",
			["borderColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0.5, -- [4]
			},
			["borderEdge"] = "None",
			["borderInset"] = 11,
			["borderOffset"] = 5,
			["borderSize"] = 16,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["config"] = {
			},
			["customText"] = "function()\n    if WeakAuras.IsOptionsOpen() then\n        return \"다음 전율 예상: 1.8\" \n    end\n    \n    if aura_env.Quake then\n        local Quake = 20- ((GetTime() - aura_env.Quake)%20)\n        return \"다음 전율 예상: \"..format( \"%.1f\", Quake) \n    end\nend",
			["customTextUpdate"] = "update",
			["desaturate"] = false,
			["displayText"] = "%c",
			["displayTextLeft"] = "  다음 전율 예상",
			["displayTextRight"] = "%p ",
			["fixedWidth"] = 200,
			["font"] = "Friz Quadrata TT",
			["fontFlags"] = "OUTLINE",
			["fontSize"] = 28,
			["frameStrata"] = 1,
			["height"] = 32.999984741211,
			["icon"] = true,
			["icon_color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["icon_side"] = "RIGHT",
			["id"] = "쐐기 : 전율 예상",
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["internalVersion"] = 45,
			["inverse"] = false,
			["justify"] = "CENTER",
			["load"] = {
				["affixes"] = {
					["single"] = 14,
				},
				["class"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
						["challenge"] = true,
					},
					["single"] = "challenge",
				},
				["effectiveLevel"] = "50",
				["effectiveLevel_operator"] = "==",
				["faction"] = {
					["multi"] = {
					},
				},
				["ingroup"] = {
					["multi"] = {
					},
				},
				["level"] = "60",
				["level_operator"] = "==",
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["role"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
						["party"] = true,
					},
					["single"] = "party",
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["talent2"] = {
					["multi"] = {
					},
				},
				["use_affixes"] = true,
				["use_difficulty"] = true,
				["use_effectiveLevel"] = false,
				["use_level"] = true,
				["use_never"] = false,
				["use_size"] = true,
				["zoneIds"] = "",
			},
			["orientation"] = "HORIZONTAL",
			["outline"] = "None",
			["parent"] = "쐐기 : 기타 0403",
			["preferToUpdate"] = false,
			["regionType"] = "text",
			["rotateText"] = "NONE",
			["selfPoint"] = "CENTER",
			["semver"] = "1.0.247",
			["shadowColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["shadowXOffset"] = 1,
			["shadowYOffset"] = -1,
			["spark"] = true,
			["sparkBlendMode"] = "ADD",
			["sparkColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["sparkDesature"] = false,
			["sparkHeight"] = 100,
			["sparkHidden"] = "NEVER",
			["sparkOffsetX"] = 0,
			["sparkOffsetY"] = 0,
			["sparkRotation"] = 0,
			["sparkRotationMode"] = "AUTO",
			["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
			["sparkWidth"] = 25,
			["stacks"] = false,
			["stacksColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["stacksFlags"] = "None",
			["stacksFont"] = "Friz Quadrata TT",
			["stacksSize"] = 12,
			["stickyDuration"] = false,
			["text"] = true,
			["textColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["textFlags"] = "None",
			["textFont"] = "Friz Quadrata TT",
			["textSize"] = 22,
			["texture"] = "Minimalist",
			["timer"] = true,
			["timerColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["timerFlags"] = "None",
			["timerFont"] = "Friz Quadrata TT",
			["timerSize"] = 30,
			["tocversion"] = 90005,
			["triggers"] = {
				[1] = {
					["trigger"] = {
						["custom"] = "function(event, ...)\n    local _,subevent,_,sourceGUID,_,_,_,destGUID,destName,_,_,spellID,spellName = ...\n    \n    if subevent == \"SPELL_AURA_APPLIED\" and spellName == \"전율\" and destName == WeakAuras.me then   \n        aura_env.Quake = GetTime()\n        return true\n    end\nend",
						["custom_hide"] = "timed",
						["custom_type"] = "event",
						["debuffType"] = "HELPFUL",
						["duration"] = "100",
						["dynamicDuration"] = false,
						["event"] = "Chat Message",
						["events"] = "CLEU:SPELL_AURA_APPLIED",
						["names"] = {
						},
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "custom",
						["unevent"] = "timed",
						["unit"] = "player",
					},
					["untrigger"] = {
					},
				},
				["activeTriggerMode"] = 1,
				["disjunctive"] = "all",
			},
			["uid"] = "cIk8QDzZs(5",
			["url"] = "https://wago.io/fCabQ-hF8/248",
			["version"] = 248,
			["width"] = 28.000078201294,
			["wordWrap"] = "WordWrap",
			["xOffset"] = 0,
			["yOffset"] = -245,
			["zoom"] = 0.25,
		},
		["쐐기 : 최대 사거리"] = {
			["actions"] = {
				["finish"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
				["init"] = {
					["custom"] = "aura_env.NpcID = {\n    [164557] = aura_env.config.halk, -- 할키아스의 조각\n    [167965] = aura_env.config.lub, -- 윤활유 도포기\n    [162040] = aura_env.config.over, -- 고위 감시관\n    [174569] = aura_env.config.halk, -- 테스트\n    [174568] = aura_env.config.lub, -- 테스트\n    [174567] = aura_env.config.over, -- 테스트\n}\n\naura_env.InRange = {\n    [164557] = 35, -- 할키아스의 조각\n    [167965] = 25, -- 윤활유 도포기\n    [162040] = 20, -- 고위 감시관\n    [174569] = 35, -- 테스트\n    [174568] = 25, -- 테스트\n    [174567] = 20, -- 테스트\n}",
					["do_custom"] = true,
				},
				["start"] = {
					["custom"] = "local region = WeakAuras.regions[aura_env.id].region\nlocal plate = C_NamePlate.GetNamePlateForUnit(aura_env.state.unit)\n\nif plate then\n    region:ClearAllPoints()\n    region:SetPoint(\"CENTER\", plate, \"CENTER\", aura_env.config.x, aura_env.config.y)\nend",
					["do_custom"] = false,
				},
			},
			["alpha"] = 1,
			["anchorFrameParent"] = true,
			["anchorFrameType"] = "NAMEPLATE",
			["anchorPoint"] = "CENTER",
			["animation"] = {
				["finish"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["main"] = {
					["alpha"] = 0,
					["alphaFunc"] = "function(progress, start, delta)\n    local angle = (progress * 2 * math.pi) - (math.pi / 2)\n    return start + (((math.sin(angle) + 1)/2) * delta)\nend\n",
					["alphaType"] = "alphaPulse",
					["colorA"] = 1,
					["colorB"] = 0.61176470588235,
					["colorFunc"] = "function(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n    \n    local angle = (progress * 2 * math.pi) - (math.pi / 2)\n    local newProgress = ((math.sin(angle) + 1)/2);\n    if aura_env and aura_env.state and aura_env.state.name and aura_env.state.name == \"DANGER\" then\n        return WeakAuras.GetHSVTransition(newProgress, r1, g1, b1, a1, r2, g2, b2, a2)\n    else\n        return r1,g1,b1,a1\n    end\nend\n\n\n",
					["colorG"] = 0.61176470588235,
					["colorR"] = 1,
					["colorType"] = "custom",
					["duration"] = "0.8",
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["rotate"] = 0,
					["scaleFunc"] = "function(progress, startX, startY, scaleX, scaleY)\n    local angle = (progress * 2 * math.pi) - (math.pi / 2)\n    return startX + (((math.sin(angle) + 1)/2) * (scaleX - 1)), startY + (((math.sin(angle) + 1)/2) * (scaleY - 1))\nend\n",
					["scaleType"] = "pulse",
					["scalex"] = 1.1,
					["scaley"] = 1.1,
					["type"] = "custom",
					["use_alpha"] = false,
					["use_color"] = true,
					["use_scale"] = true,
					["x"] = 0,
					["y"] = 0,
				},
				["start"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["preset"] = "grow",
					["type"] = "none",
				},
			},
			["authorOptions"] = {
				{
					["default"] = true,
					["key"] = "halk",
					["name"] = "할키아스의 조각",
					["type"] = "toggle",
					["useDesc"] = false,
					["width"] = 2,
				}, -- [1]
				{
					["default"] = true,
					["key"] = "over",
					["name"] = "고위 감시자",
					["type"] = "toggle",
					["useDesc"] = false,
					["width"] = 2,
				}, -- [2]
				{
					["default"] = false,
					["key"] = "lub",
					["name"] = "윤활유 도포기",
					["type"] = "toggle",
					["useDesc"] = false,
					["width"] = 2,
				}, -- [3]
			},
			["automaticWidth"] = "Auto",
			["blendMode"] = "BLEND",
			["color"] = {
				0, -- [1]
				1, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["conditions"] = {
				{
					["changes"] = {
						{
							["property"] = "color",
							["value"] = {
								0, -- [1]
								1, -- [2]
								0, -- [3]
								0.5, -- [4]
							},
						}, -- [1]
					},
					["check"] = {
						["checks"] = {
							{
								["op"] = ">=",
								["trigger"] = 1,
								["value"] = "40",
								["variable"] = "stack",
							}, -- [1]
							{
								["checks"] = {
									{
										["trigger"] = 2,
										["value"] = 0,
										["variable"] = "show",
									}, -- [1]
									{
										["trigger"] = 3,
										["value"] = 0,
										["variable"] = "show",
									}, -- [2]
								},
								["trigger"] = 2,
								["value"] = 0,
								["variable"] = "show",
							}, -- [2]
						},
						["op"] = ">=",
						["trigger"] = -2,
						["variable"] = "AND",
					},
				}, -- [1]
				{
					["changes"] = {
						{
							["property"] = "color",
							["value"] = {
								1, -- [1]
								0, -- [2]
								0, -- [3]
								1, -- [4]
							},
						}, -- [1]
						{
							["property"] = "sound",
							["value"] = {
								["sound"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Sounds\\hic3.ogg",
								["sound_channel"] = "Master",
								["sound_repeat"] = 2.5,
								["sound_type"] = "Loop",
							},
						}, -- [2]
						{
							["property"] = "fontSize",
							["value"] = 20,
						}, -- [3]
					},
					["check"] = {
						["checks"] = {
						},
						["op"] = "==",
						["trigger"] = 1,
						["value"] = "DANGER",
						["variable"] = "name",
					},
				}, -- [2]
				{
					["changes"] = {
						{
							["property"] = "sound",
							["value"] = {
								["sound_type"] = "Stop",
							},
						}, -- [1]
					},
					["check"] = {
						["op"] = "==",
						["trigger"] = 1,
						["value"] = "SAFE",
						["variable"] = "name",
					},
				}, -- [3]
			},
			["config"] = {
				["halk"] = true,
				["lub"] = true,
				["over"] = true,
			},
			["cooldown"] = false,
			["cooldownEdge"] = false,
			["cooldownSwipe"] = true,
			["cooldownTextDisabled"] = false,
			["customTextUpdate"] = "event",
			["desaturate"] = false,
			["discrete_rotation"] = 0,
			["displayText"] = "%n",
			["displayText_format_n_format"] = "none",
			["displayText_format_p_format"] = "timed",
			["displayText_format_p_time_dynamic_threshold"] = 60,
			["displayText_format_p_time_format"] = 0,
			["displayText_format_p_time_precision"] = 1,
			["fixedWidth"] = 200,
			["font"] = "Friz Quadrata TT",
			["fontSize"] = 15,
			["frameStrata"] = 4,
			["height"] = 50,
			["icon"] = true,
			["iconSource"] = 0,
			["id"] = "쐐기 : 최대 사거리",
			["information"] = {
			},
			["internalVersion"] = 45,
			["inverse"] = false,
			["justify"] = "CENTER",
			["keepAspectRatio"] = false,
			["load"] = {
				["class"] = {
					["multi"] = {
					},
				},
				["class_and_spec"] = {
					["multi"] = {
						[62] = true,
						[63] = true,
						[64] = true,
						[65] = true,
						[102] = true,
						[105] = true,
						[253] = true,
						[254] = true,
						[256] = true,
						[257] = true,
						[258] = true,
						[262] = true,
						[264] = true,
						[265] = true,
						[266] = true,
						[267] = true,
						[270] = true,
					},
				},
				["difficulty"] = {
					["multi"] = {
						["challenge"] = true,
					},
					["single"] = "challenge",
				},
				["ingroup"] = {
				},
				["instance_type"] = {
				},
				["size"] = {
					["multi"] = {
						["party"] = true,
					},
					["single"] = "party",
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["use_class_and_spec"] = false,
				["use_difficulty"] = true,
				["use_encounterid"] = false,
				["use_never"] = false,
				["use_size"] = true,
				["use_zoneIds"] = true,
				["zoneIds"] = "1663,1678,1679,1675,1676",
			},
			["mirror"] = false,
			["outline"] = "OUTLINE",
			["parent"] = "쐐기 : 기타 0403",
			["preferToUpdate"] = false,
			["regionType"] = "text",
			["rotate"] = true,
			["rotation"] = 180,
			["selfPoint"] = "CENTER",
			["semver"] = "1.0.247",
			["shadowColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["shadowXOffset"] = 1,
			["shadowYOffset"] = -1,
			["subRegions"] = {
			},
			["texture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\target_indicator.tga",
			["textureWrapMode"] = "CLAMPTOBLACKADDITIVE",
			["tocversion"] = 90005,
			["triggers"] = {
				[1] = {
					["trigger"] = {
						["check"] = "update",
						["custom"] = "function(states)\n    local theTime = GetTime()\n    if not aura_env.last or aura_env.last < theTime - 0.05 then\n        aura_env.last = theTime\n        for k, v in pairs(states) do\n            v.show = false;\n            v.changed = true;\n        end\n        \n        for _, plate in pairs(C_NamePlate.GetNamePlates()) do\n            local unit = plate.namePlateUnitToken\n            local guid = UnitGUID(unit)\n            if guid then\n                local type, zero, server_id, instance_id, zone_uid, npc_id, spawn_uid = strsplit(\"-\",guid);\n                if npc_id and aura_env.NpcID[tonumber(npc_id)] then\n                    local min = WeakAuras.GetRange(unit)\n                    if min ~= nil and min < 50 then          \n                        states[unit] = states[unit] or {}\n                        local state = states[unit]\n                        state.unit = unit\n                        state.stack = min\n                        if aura_env.InRange[tonumber(npc_id)] > min then\n                            state.name = \"DANGER\"\n                        else\n                            state.name = \"SAFE\"\n                        end\n                        state.changed = true\n                        state.show = true\n                    end\n                end\n            end\n        end\n        return true\n    end\nend",
						["customName"] = "function()\n    if aura_env.Id and aura_env.min then\n        if aura_env.NpcID[aura_env.Id] >= aura_env.min then\n            return \"DANGER\"\n        else\n            return \"SAFE\"\n        end\n    else\n        return \"\"\n    end\nend",
						["customStacks"] = "function()\n    if aura_env.min then return aura_env.min else return 0 end\nend\n\n\n",
						["customVariables"] = "{\n    name = {\n        display = \"거리 상태\",\n        type = \"string\"\n    },\n    stack = {\n        display = \"대상과의 최소 거리\",\n        type = \"number\"\n    },\n    \n}\n\n\n",
						["custom_hide"] = "timed",
						["custom_type"] = "stateupdate",
						["debuffType"] = "HELPFUL",
						["duration"] = "10",
						["event"] = "Combat Log",
						["names"] = {
						},
						["spellIds"] = {
						},
						["spellName"] = "Thrash",
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "custom",
						["unevent"] = "timed",
						["unit"] = "player",
						["use_spellName"] = true,
					},
					["untrigger"] = {
					},
				},
				[2] = {
					["trigger"] = {
						["debuffType"] = "HELPFUL",
						["duration"] = "1",
						["event"] = "Class/Spec",
						["genericShowOn"] = "showOnCooldown",
						["realSpellName"] = 0,
						["specId"] = {
							["multi"] = {
								[102] = true,
								[254] = true,
							},
							["single"] = 102,
						},
						["spellName"] = 0,
						["type"] = "unit",
						["unevent"] = "auto",
						["unit"] = "player",
						["use_genericShowOn"] = true,
						["use_specId"] = false,
						["use_spellName"] = true,
						["use_track"] = true,
					},
					["untrigger"] = {
					},
				},
				[3] = {
					["trigger"] = {
						["debuffType"] = "HELPFUL",
						["duration"] = "1",
						["event"] = "Conditions",
						["genericShowOn"] = "showOnCooldown",
						["realSpellName"] = 0,
						["spellName"] = 0,
						["type"] = "unit",
						["unevent"] = "auto",
						["unit"] = "player",
						["use_alive"] = true,
						["use_genericShowOn"] = true,
						["use_spellName"] = true,
						["use_track"] = true,
					},
					["untrigger"] = {
					},
				},
				["activeTriggerMode"] = 1,
				["customTriggerLogic"] = "function(t)\n    return t[1] and t[3]\nend",
				["disjunctive"] = "custom",
			},
			["uid"] = "FcuCyLeB94g",
			["url"] = "https://wago.io/fCabQ-hF8/248",
			["version"] = 248,
			["width"] = 50,
			["wordWrap"] = "WordWrap",
			["xOffset"] = 0,
			["yOffset"] = 10,
			["zoom"] = 0,
		},
		["자이액사 비전번개"] = {
			["actions"] = {
				["finish"] = {
					["do_sound"] = false,
				},
				["init"] = {
					["custom"] = "\n\n-- 323687 vuln\n-- 323692 lightning\n\n--aura_env.LIGHTNING = 1459 -- arcane intellect for testing, NOTE: need to change code to buff instead of debuff to test\n--aura_env.VULN = 167152 -- food buff for testing\n\naura_env.LIGHTNING = 323687 \naura_env.VULN = 323692\naura_env.CHAT_INTERVAL = 1.5",
					["do_custom"] = true,
				},
				["start"] = {
					["custom"] = "print \"lul\"",
					["do_custom"] = false,
					["do_message"] = false,
					["message"] = "",
					["message_type"] = "SAY",
				},
			},
			["anchorFrameType"] = "SCREEN",
			["anchorPoint"] = "CENTER",
			["animation"] = {
				["finish"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["start"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
			},
			["authorOptions"] = {
			},
			["automaticWidth"] = "Auto",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["config"] = {
			},
			["customTextUpdate"] = "event",
			["displayText"] = "",
			["displayText_format_p_format"] = "timed",
			["displayText_format_p_time_dynamic_threshold"] = 60,
			["displayText_format_p_time_format"] = 0,
			["displayText_format_p_time_precision"] = 1,
			["fixedWidth"] = 200,
			["font"] = "Friz Quadrata TT",
			["fontSize"] = 12,
			["frameStrata"] = 1,
			["id"] = "자이액사 비전번개",
			["information"] = {
			},
			["internalVersion"] = 45,
			["justify"] = "LEFT",
			["load"] = {
				["class"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
						["heroic"] = true,
						["mythic"] = true,
					},
					["single"] = "mythic",
				},
				["encounterid"] = "2400",
				["size"] = {
					["multi"] = {
						["party"] = true,
					},
					["single"] = "party",
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["use_encounterid"] = true,
				["use_never"] = false,
				["use_size"] = true,
				["zoneIds"] = "",
			},
			["outline"] = "OUTLINE",
			["preferToUpdate"] = false,
			["regionType"] = "text",
			["selfPoint"] = "BOTTOM",
			["semver"] = "1.0.1",
			["shadowColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["shadowXOffset"] = 1,
			["shadowYOffset"] = -1,
			["subRegions"] = {
			},
			["tocversion"] = 90002,
			["triggers"] = {
				[1] = {
					["trigger"] = {
						["auraspellids"] = {
							"323687", -- [1]
							"167162", -- [2]
							"1459", -- [3]
						},
						["check"] = "update",
						["custom"] = "function()\n    \n    \n    if WA_GetUnitDebuff(\"player\", aura_env.LIGHTNING) ~= nil and (aura_env.last_sent == nil or GetTime() - aura_env.last_sent > aura_env.CHAT_INTERVAL) then\n        SendChatMessage(\"{해골}\", \"SAY\")\n        aura_env.last_sent = GetTime()\n        \n    elseif WA_GetUnitDebuff(\"player\", aura_env.VULN) ~= nil and (aura_env.last_sent == nil or GetTime() - aura_env.last_sent > aura_env.CHAT_INTERVAL) then\n        SendChatMessage(\"{가위표}\", \"SAY\")\n        aura_env.last_sent = GetTime()\n        \n    elseif aura_env.last_sent == nil or GetTime() - aura_env.last_sent > aura_env.CHAT_INTERVAL then\n        SendChatMessage(\"{세모}\", \"SAY\")\n        aura_env.last_sent = GetTime()\n    end\n    \nend\n\n\n",
						["custom_hide"] = "timed",
						["custom_type"] = "status",
						["debuffType"] = "HELPFUL",
						["duration"] = "1",
						["event"] = "Combat Log",
						["events"] = "UNIT_AURA",
						["matchesShowOn"] = "showOnActive",
						["names"] = {
						},
						["rem"] = "3599",
						["remOperator"] = ">",
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "custom",
						["unevent"] = "timed",
						["unit"] = "player",
						["useExactSpellId"] = true,
						["useRem"] = true,
						["use_absorbMode"] = true,
						["use_unit"] = true,
					},
					["untrigger"] = {
						["custom"] = "\n\n",
					},
				},
				["activeTriggerMode"] = -10,
				["disjunctive"] = "any",
			},
			["uid"] = "CMsa50i0Mda",
			["url"] = "https://wago.io/qxzlhzOxJ/2",
			["version"] = 2,
			["wordWrap"] = "WordWrap",
			["xOffset"] = -30,
			["yOffset"] = 0,
		},
		["항아리"] = {
			["actions"] = {
				["finish"] = {
				},
				["init"] = {
				},
				["start"] = {
					["do_sound"] = false,
					["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\BikeHorn.ogg",
				},
			},
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["anchorPoint"] = "CENTER",
			["animation"] = {
				["finish"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
				["start"] = {
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
					["type"] = "none",
				},
			},
			["authorOptions"] = {
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["config"] = {
			},
			["cooldown"] = false,
			["cooldownEdge"] = false,
			["cooldownSwipe"] = true,
			["cooldownTextDisabled"] = false,
			["desaturate"] = false,
			["frameStrata"] = 1,
			["height"] = 50,
			["icon"] = true,
			["iconSource"] = -1,
			["id"] = "항아리",
			["information"] = {
			},
			["internalVersion"] = 45,
			["inverse"] = false,
			["keepAspectRatio"] = false,
			["load"] = {
				["class"] = {
					["multi"] = {
					},
				},
				["covenant"] = {
					["multi"] = {
						[3] = true,
					},
					["single"] = 3,
				},
				["difficulty"] = {
				},
				["encounterid"] = "168934",
				["instance_type"] = {
				},
				["size"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["use_encounterid"] = false,
				["zoneIds"] = "",
			},
			["preferToUpdate"] = false,
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["subRegions"] = {
				{
					["anchorXOffset"] = 0,
					["anchorYOffset"] = 0,
					["rotateText"] = "NONE",
					["text_anchorPoint"] = "CENTER",
					["text_automaticWidth"] = "Auto",
					["text_color"] = {
						1, -- [1]
						0, -- [2]
						0.00784313725490196, -- [3]
						1, -- [4]
					},
					["text_fixedWidth"] = 64,
					["text_font"] = "Friz Quadrata TT",
					["text_fontSize"] = 30,
					["text_fontType"] = "OUTLINE",
					["text_justify"] = "CENTER",
					["text_selfPoint"] = "AUTO",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_shadowXOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["text_text"] = "%p",
					["text_text_format_p_format"] = "timed",
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["text_text_format_p_time_format"] = 0,
					["text_text_format_p_time_precision"] = 1,
					["text_text_format_s_format"] = "none",
					["text_visible"] = true,
					["text_wordWrap"] = "WordWrap",
					["type"] = "subtext",
				}, -- [1]
				{
					["glow"] = true,
					["glowBorder"] = false,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["glowFrequency"] = 0.25,
					["glowLength"] = 10,
					["glowLines"] = 8,
					["glowScale"] = 1,
					["glowThickness"] = 1,
					["glowType"] = "ACShine",
					["glowXOffset"] = 0,
					["glowYOffset"] = 0,
					["type"] = "subglow",
					["useGlowColor"] = false,
				}, -- [2]
			},
			["tocversion"] = 90002,
			["triggers"] = {
				[1] = {
					["trigger"] = {
						["debuffType"] = "HELPFUL",
						["destNpcId"] = "168934",
						["duration"] = "4.8",
						["event"] = "Combat Log",
						["names"] = {
						},
						["sourceUnit"] = "target",
						["spellIds"] = {
						},
						["spellName"] = "격노한 가면",
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_SUCCESS",
						["type"] = "combatlog",
						["unevent"] = "timed",
						["unit"] = "player",
						["use_destNpcId"] = false,
						["use_sourceUnit"] = true,
						["use_spellName"] = true,
					},
					["untrigger"] = {
					},
				},
				["activeTriggerMode"] = -10,
			},
			["uid"] = "WP0KbSBfOXx",
			["width"] = 50,
			["xOffset"] = 250,
			["yOffset"] = 30,
			["zoom"] = 0,
		},
	},
	["dynamicIconCache"] = {
	},
	["editor_tab_spaces"] = 4,
	["editor_theme"] = "Monokai",
	["lastArchiveClear"] = 1611586667,
	["lastUpgrade"] = 1618143640,
	["login_squelch_time"] = 10,
	["minimap"] = {
		["hide"] = true,
		["minimapPos"] = 52.97999707674736,
	},
	["registered"] = {
	},
}

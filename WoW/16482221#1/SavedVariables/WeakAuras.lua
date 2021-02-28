
WeakAurasSaved = {
	["dbVersion"] = 40,
	["displays"] = {
		["!돌"] = {
			["actions"] = {
				["finish"] = {
				},
				["init"] = {
					["custom"] = "aura_env.options = {'party', 'guild', 'spam'}\n\naura_env.types = {}\n\nfor _, v in ipairs(aura_env.options) do\n    \n    if aura_env.config[\"enabled\"..v] then\n        aura_env.types[v] = true\n    end\n    \nend\n\naura_env.ids = {\n    [138019] = true, -- Legion\n    [158923] = true, -- BfA\n    [180653] = true, -- Shadowlands\n    [151086] = true, -- Tournament\n}\n\naura_env.key = nil\n\naura_env.update = function()\n    for bag = 0, NUM_BAG_SLOTS do\n        local bSlots = GetContainerNumSlots(bag)\n        for slot = 1, bSlots do\n            local itemLink, _, _, itemID = select(7, GetContainerItemInfo(bag, slot))\n            if aura_env.ids[itemID] then\n                aura_env.key = itemLink\n                return\n            end\n        end\n    end\nend\n\naura_env.link = function(channel)\n    \n    channel = channel or \"PARTY\"\n    \n    if channel == \"PARTY\" then\n        if aura_env.config.spam and (aura_env.timeParty or 0) > (GetTime() - 30) then\n            return\n        end\n        aura_env.timeParty = GetTime()\n    else\n        if aura_env.config.spam and (aura_env.timeGuild or 0) > (GetTime() - 30) then\n            return\n        end\n        aura_env.timeGuild = GetTime()\n    end\n    \n    if aura_env.key == nil then aura_env.update() end\n    if aura_env.key ~= nil then SendChatMessage(aura_env.key, channel) end\nend",
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
			["displayText_format_p_time_dynamic"] = false,
			["displayText_format_p_time_precision"] = 1,
			["fixedWidth"] = 200,
			["font"] = "Expressway",
			["fontSize"] = 12,
			["frameStrata"] = 2,
			["id"] = "!돌",
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["internalVersion"] = 40,
			["justify"] = "CENTER",
			["load"] = {
				["class"] = {
					["multi"] = {
					},
				},
				["level"] = "40",
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
				["use_never"] = false,
			},
			["outline"] = "OUTLINE",
			["preferToUpdate"] = false,
			["regionType"] = "text",
			["selfPoint"] = "CENTER",
			["semver"] = "4.1.0",
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
			["url"] = "https://wago.io/bfakeys/30",
			["version"] = 30,
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
			["internalVersion"] = 40,
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
					["text_text_format_p_time_dynamic"] = false,
					["text_text_format_p_time_precision"] = 0,
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
					["text_text_format_p_time_dynamic"] = false,
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
					["text_text_format_p_time_dynamic"] = false,
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
						["type"] = "event",
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
		["BfA: Nameplate Enemy Auras"] = {
			["actions"] = {
				["finish"] = {
					["custom"] = "if aura_env.state then\n    local region = WeakAuras.GetRegion(aura_env.id, aura_env.cloneId)\n    region.Backdrop:Hide()\n    --region:Hide()\n    --region:SetScale(1) \n    --region:SetParent(WeakAuras.frames[\"WeakAuras Main Frame\"])\nend",
					["do_custom"] = true,
				},
				["init"] = {
					["custom"] = "--- CONFIG IN \"CUSTOM OPTIONS\" TAB - DO NOT TOUCH THIS ---\naura_env.frameStratas = {\n    [1] = \"BACKGROUND\",\n    [2] = \"LOW\",\n    [3] = \"MEDIUM\",\n    [4] = \"HIGH\",\n    [5] = \"DIALOG\",\n    [6] = \"FULLSCREEN\",\n    [7] = \"FULLSCREEN_DIALOG\",\n    [8] = \"TOOLTIP\",\n}\n\naura_env.anchorConfValues = {\n    [1] = \"TOP\",\n    [2] = \"BOTTOM\",\n    [3] = \"LEFT\",\n    [4] = \"RIGHT\",\n    [5] = \"CENTER\",\n    [6] = \"TOPLEFT\",\n    [7] = \"TOPRIGHT\",\n    [8] = \"BOTTOMLEFT\",\n    [9] = \"BOTTOMRIGHT\",\n}\n\naura_env.growthDirectionValues = {\n    [1] = {xDir =  0, yDir =  1}, -- UP\n    [2] = {xDir =  0, yDir = -1}, -- DOWN\n    [3] = {xDir = -1, yDir =  0}, -- LEFT\n    [4] = {xDir =  1, yDir =  0}, -- RIGHT\n}\n\n-- border color for enrage buffs\naura_env.color_enrage = {\n    red = 0.85,\n    green = 0.2,\n    blue = 0.1,\n}\n\n-- CUSTOM BUFFS/DEBUFFS\naura_env.spellId = {}\naura_env.spellIdDungeon = {}\naura_env.missingDebuffs = {}\n\n-- Test Spells:\n-- Renewing Mist\n-- aura_env.spellIdDungeon[\"\"..119611] = true\n-- Holy Fire\n-- aura_env.spellIdDungeon[\"\"..14914] = true\n-- Chastized\n-- aura_env.spellIdDungeon[\"\"..200196] = true\n-- Schism\n-- aura_env.spellIdDungeon[\"\"..214621] = true\n-- SW: Pain\n-- aura_env.spellIdDungeon[\"\"..589] = true\n-- Chaos Brand\n--aura_env.spellIdDungeon[\"\"..1490] = true\n-- Trail of Ruin\n--aura_env.spellIdDungeon[\"\"..258883] = true\n-- Azerite Globule\n--aura_env.spellIdDungeon[\"\"..279956] = true\n\n-- Mythic+:\n-- Sanguine Ichor\naura_env.spellIdDungeon[\"\"..226510] = true\n-- Symbiote of G'huun\naura_env.spellIdDungeon[\"\"..277242] = true\n-- Challenger's Might\n--- aura_env.spellIdDungeon[\"\"..206150] = true\n\n-- Atal'Dazar:\n-- Fanatic's Rage\n-- aura_env.spellIdDungeon[\"\"..255824] = true\n-- Gathered Souls\n-- aura_env.spellIdDungeon[\"\"..254974] = true\n-- Bwonsamdi's Mantle\naura_env.spellIdDungeon[\"\"..253548] = true\n-- Bulwark of Juju\naura_env.spellIdDungeon[\"\"..258653] = true\n-- Dino Might\n-- aura_env.spellIdDungeon[\"\"..256849] = true\n\n-- Freehold:\n-- Healing Balm\n-- aura_env.spellIdDungeon[\"\"..257397] = true\n-- Confidence-Boosting Freehold Brew\naura_env.spellIdDungeon[\"\"..265085] = true\n-- Invigorating Freehold Brew\naura_env.spellIdDungeon[\"\"..265056] = true\n\n-- Kings' Rest:\n-- Bound by Shadow\n-- aura_env.spellIdDungeon[\"\"..269935] = true\n-- Ancestral Fury\n-- aura_env.spellIdDungeon[\"\"..269976] = true\n-- Earthwall\n-- aura_env.spellIdDungeon[\"\"..267256] = true\n-- Seduction\naura_env.spellIdDungeon[\"\"..270920] = true\n\n-- Shrine of the Storm:\n-- Tidal Surge\n-- aura_env.spellIdDungeon[\"\"..267977] = true\n-- Mending Rapids\n-- aura_env.spellIdDungeon[\"\"..268030] = true\n-- Swiftness\n-- aura_env.spellIdDungeon[\"\"..276265] = true\n-- Minor Reinforcing Ward\naura_env.spellIdDungeon[\"\"..268212] = true\n-- Minor Swiftness Ward\naura_env.spellIdDungeon[\"\"..268183] = true\n-- Detect Thoughts\n-- aura_env.spellIdDungeon[\"\"..268375] = true\n-- Reanimated Bones\n-- aura_env.spellIdDungeon[\"\"..274210] = true\n-- Reinforcing Ward\naura_env.spellIdDungeon[\"\"..268186] = true\n-- Swiftness Ward\naura_env.spellIdDungeon[\"\"..267890] = true\n\n-- Siege of Boralus:\n-- Watertight Shell\n-- aura_env.spellIdDungeon[\"\"..256957] = true\n-- Bolstering Shout\n-- aura_env.spellIdDungeon[\"\"..275826] = true\n\n-- Temple of Sethraliss:\n-- Lightning Shield 1\naura_env.spellIdDungeon[\"\"..273411] = true\n-- Lightning Shield 2\naura_env.spellIdDungeon[\"\"..263246] = true\n-- Electrified Scales\n-- aura_env.spellIdDungeon[\"\"..272659] = true\n-- Dust Cloud\naura_env.spellIdDungeon[\"\"..260792] = true\n-- Embryonic Vigor\n-- aura_env.spellIdDungeon[\"\"..269896] = true\n-- Reclaimed Orb\naura_env.spellIdDungeon[\"\"..265755] = true\n-- Accumulated Charge\n-- aura_env.spellIdDungeon[\"\"..269129] = true\n\n-- THE MOTHERLODE!!:\n-- Inhale Vapors\n-- aura_env.spellIdDungeon[\"\"..262092] = true\n-- Earth Shield\n-- aura_env.spellIdDungeon[\"\"..268709] = true\n-- Overcharge\n-- aura_env.spellIdDungeon[\"\"..262540] = true\n-- Tectonic Barrier\n-- aura_env.spellIdDungeon[\"\"..263215] = true\n-- Azerite Infusion\naura_env.spellIdDungeon[\"\"..257597] = true\n-- Azerite Injection\n-- aura_env.spellIdDungeon[\"\"..262947] = true\n\n-- The Underrot:\n-- Gift of G'huun\n-- aura_env.spellIdDungeon[\"\"..265091] = true\n-- Bone Shield\n-- aura_env.spellIdDungeon[\"\"..266201] = true\n-- Warcry\n-- aura_env.spellIdDungeon[\"\"..265081] = true\n\n-- Tol Dagor:\n-- Enrage\n-- aura_env.spellIdDungeon[\"\"..257609] = true\n-- Watery Dome\n-- aura_env.spellIdDungeon[\"\"..258153] = true\n-- Motivated\n-- aura_env.spellIdDungeon[\"\"..257956] = true\n-- Inner Flames\n-- aura_env.spellIdDungeon[\"\"..258938] = true\n\n-- Waycrest Manor:\n-- Soul Fetish\n-- aura_env.spellIdDungeon[\"\"..278567] = true\n-- Warding Candles\naura_env.spellIdDungeon[\"\"..264027] = true\n-- Spirited Defense\n-- aura_env.spellIdDungeon[\"\"..265368] = true\n-- Consumed Soul Fragment\n-- aura_env.spellIdDungeon[\"\"..264387] = true\n-- Spectral Talisman\n-- aura_env.spellIdDungeon[\"\"..264396] = true\n-- Focusing Iris\naura_env.spellIdDungeon[\"\"..260805] = true\n\n\n-- hadle additional custom spells:\naura_env.NEAhandleAdditionalCustom = function()\n    -- dungeon\n    if aura_env.config[\"showDungeon\"] then\n        for spell, bool in pairs(aura_env.spellIdDungeon) do\n            local spellId = select(7,GetSpellInfo(spell))\n            if spellId then\n                aura_env.spellId[\"\"..spellId] = bool\n            end\n        end\n    end\n    \n    -- whitelist\n    if aura_env.config[\"showCustom\"] then\n        local additionalCustom = WeakAuras.split(aura_env.config[\"additionalCustom\"]);\n        for index, spell in pairs(additionalCustom) do\n            local spellId = select(7,GetSpellInfo(spell))\n            if spellId then\n                aura_env.spellId[\"\"..spellId] = true\n                aura_env.hasCustom = true\n            end\n        end\n    end\n    \n    -- blacklist\n    local blacklistCustom = WeakAuras.split(aura_env.config[\"blacklistCustom\"]);\n    for index, spell in pairs(blacklistCustom) do\n        local spellId = select(7,GetSpellInfo(spell))\n        if spellId then\n            aura_env.spellId[\"\"..spellId] = false\n        end\n    end\n    \n    -- missing debuffs\n    local missingDebuffs = WeakAuras.split(aura_env.config[\"missingDebuffs\"]);\n    for index, spell in pairs(missingDebuffs) do\n        local spellId = select(7,GetSpellInfo(spell))\n        if spellId then\n            aura_env.missingDebuffs[\"\"..spellId] = true\n        end\n    end\nend\n\n\n-- for positioning of more than one aura\naura_env.width = aura_env.region:GetWidth() + (aura_env.config[\"borderSize\"] * 2)\naura_env.height = aura_env.region:GetHeight() + (aura_env.config[\"borderSize\"] * 2)\n\n-- check if ElvUI is used and the nameplates module is enabled\naura_env.useElvUINameplates = ElvUI and ElvUI[1].NamePlates and ElvUI[1].NamePlates.Initialized\n-- check if KuiNameplates are used\naura_env.useKuiNameplates = KuiNameplates ~= nil\n-- check if Tidy Plates are used\naura_env.useTidyPlates = TidyPlates ~= nil\naura_env.usePlater = Plater ~= nil\n\n\n\n-- custom functions\naura_env.NEAupdateRegionGraphics = function(nameplate, region, state)\n    local unitIsMyTarget = UnitIsUnit(state.unit, \"target\") \n    local unitIsMouseover = UnitIsUnit(state.unit, \"mouseover\")\n    \n    local alpha = 1;\n    if unitIsMyTarget then\n        if aura_env.config[\"useAlphaTarget\"] then\n            if aura_env.useElvUINameplates and nameplate.unitFrame then\n                alpha = nameplate.unitFrame:GetAlpha()\n            elseif aura_env.useTidyPlates then\n                alpha = nameplate.extended.requestedAlpha\n            elseif aura_env.useKuiNameplates then\n                alpha = nameplate.kui:GetAlpha()\n            elseif aura_env.usePlater then\n                alpha = nameplate.unitFrame.healthBar:GetAlpha()\n            else\n                alpha = nameplate:GetAlpha()\n            end\n        else\n            alpha = aura_env.config[\"targetAlpha\"]\n        end\n    elseif unitIsMouseover then\n        if aura_env.config[\"useAlphaMouseover\"] then\n            if aura_env.useElvUINameplates and nameplate.unitFrame then\n                alpha = nameplate.unitFrame:GetAlpha()\n            elseif aura_env.useTidyPlates then\n                alpha = nameplate.extended.requestedAlpha\n            elseif aura_env.useKuiNameplates then\n                alpha = nameplate.kui:GetAlpha()\n            elseif aura_env.usePlater then\n                alpha = nameplate.unitFrame.healthBar:GetAlpha()\n            else\n                alpha = nameplate:GetAlpha()\n            end\n        else\n            alpha = aura_env.config[\"mouseoverAlpha\"]\n        end\n    else\n        if aura_env.config[\"useAlpha\"] then\n            if aura_env.useElvUINameplates and nameplate.unitFrame then\n                alpha = nameplate.unitFrame:GetAlpha()\n            elseif aura_env.useTidyPlates then\n                alpha = nameplate.extended.requestedAlpha\n            elseif aura_env.useKuiNameplates then\n                alpha = nameplate.kui:GetAlpha()\n            elseif aura_env.usePlater then\n                alpha = nameplate.unitFrame.healthBar:GetAlpha()\n            else\n                alpha = nameplate:GetAlpha()\n            end\n        else\n            alpha = aura_env.config[\"nonTargetAlpha\"]\n        end\n    end\n    \n    if unitIsMyTarget then\n        region:SetFrameStrata(aura_env.frameStratas[aura_env.config[\"targetFrameStrata\"]])\n    elseif unitIsMouseover then\n        region:SetFrameStrata(aura_env.frameStratas[aura_env.config[\"mouseoverFrameStrata\"]])\n    else\n        region:SetFrameStrata(aura_env.frameStratas[aura_env.config[\"frameStrata\"]])\n    end\n    \n    region.icon:SetAlpha(alpha);\n    region.Backdrop:SetAlpha(alpha*aura_env.config[\"borderAlpha\"]);\n    \n    --scaling tests\n    --[[\n    if aura_env.useElvUINameplates then\n        region:SetScale(state.nameplate.unitFrame.HealthBar.currentScale) \n    end\n    --]]\nend\n\naura_env.NEAupdateRegion = function(state, aura_number, num_auras)\n    local region = WeakAuras.GetRegion(aura_env.id, state.cloneId)\n    if not state.unit then\n        region:Hide()\n        return\n    end\n    \n    state.nameplate = state.nameplate or C_NamePlate.GetNamePlateForUnit(state.unit)\n    \n    if not state.nameplate or not state.show then\n        if region.Backdrop then region.Backdrop:Hide() end\n        region:Hide()\n        return\n    end\n    \n    region:SetFrameStrata(aura_env.frameStratas[aura_env.config[\"frameStrata\"]])\n    region:SetFrameLevel(1)\n    \n    if aura_env.config[\"borderSize\"] == 0 then\n        if region.Backdrop then\n            region.Backdrop:Hide()\n        end\n    else\n        if not region.Backdrop then\n            region.Backdrop = CreateFrame(\"frame\", nil, region, \"BackdropTemplate\");\n        end\n        \n        local backdrop = {\n            edgeFile = \"Interface\\\\AddOns\\\\WeakAuras\\\\Media\\\\Textures\\\\Square_FullWhite.tga\",\n            edgeSize = aura_env.config[\"borderSize\"],\n            insets = {\n                left = 0,\n                right = 0,\n                top = 0,\n                bottom = 0,\n            }\n        }\n        region.Backdrop:SetBackdrop(backdrop)\n        \n        \n        local red = DebuffTypeColor[\"none\"].r\n        local green = DebuffTypeColor[\"none\"].g\n        local blue = DebuffTypeColor[\"none\"].b\n        local type = state.aura_type\n        \n        if type == \"\" then\n            red = aura_env.color_enrage.red\n            green = aura_env.color_enrage.green\n            blue = aura_env.color_enrage.blue\n        elseif type == \"MISSING\" then\n            red = aura_env.config[\"missingBorderColor\"][1]\n            green = aura_env.config[\"missingBorderColor\"][2]\n            blue = aura_env.config[\"missingBorderColor\"][3]\n        elseif type then\n            red = DebuffTypeColor[type].r\n            green = DebuffTypeColor[type].g\n            blue = DebuffTypeColor[type].b\n        end\n        \n        region.Backdrop:SetBackdropColor(0,0,0,0)\n        region.Backdrop:SetBackdropBorderColor(red,green,blue,aura_env.config[\"borderAlpha\"])\n        \n        region.Backdrop:SetParent(region)\n        region.Backdrop:SetFrameLevel(0)\n        \n        region.Backdrop:ClearAllPoints()\n        region.Backdrop:SetPoint(\"BOTTOMLEFT\", region, \"BOTTOMLEFT\", -aura_env.config[\"borderSize\"], -aura_env.config[\"borderSize\"])\n        region.Backdrop:SetPoint(\"TOPRIGHT\", region, \"TOPRIGHT\", aura_env.config[\"borderSize\"], aura_env.config[\"borderSize\"])\n        \n        region.Backdrop:Show()\n    end\n    \n    \n    local xOffset = aura_env.config[\"xOffset\"]+aura_env.width*(aura_number-1)*aura_env.growthDirectionValues[aura_env.config[\"growthDirection\"]].xDir\n    local yOffset = aura_env.config[\"yOffset\"]+aura_env.height*(aura_number-1)*aura_env.growthDirectionValues[aura_env.config[\"growthDirection\"]].yDir\n    \n    if aura_env.config[\"growEvenly\"] then \n        xOffset = xOffset-aura_env.width*((num_auras or 1)-1)/2*aura_env.growthDirectionValues[aura_env.config[\"growthDirection\"]].xDir\n        yOffset = yOffset-aura_env.height*((num_auras or 1)-1)/2*aura_env.growthDirectionValues[aura_env.config[\"growthDirection\"]].yDir\n    end\n    if aura_env.useElvUINameplates and state.nameplate.unitFrame then\n        region:SetAnchor(aura_env.anchorConfValues[aura_env.config[\"anchorPoint\"]], state.nameplate.unitFrame.Health, aura_env.anchorConfValues[aura_env.config[\"relativeAnchor\"]])\n    elseif aura_env.useTidyPlates then\n        region:SetAnchor(aura_env.anchorConfValues[aura_env.config[\"anchorPoint\"]], state.nameplate.extended.bars.healthbar, aura_env.anchorConfValues[aura_env.config[\"relativeAnchor\"]])\n    elseif aura_env.useKuiNameplates then\n        region:SetAnchor(aura_env.anchorConfValues[aura_env.config[\"anchorPoint\"]], state.nameplate.kui.HealthBar, aura_env.anchorConfValues[aura_env.config[\"relativeAnchor\"]])\n    elseif aura_env.usePlater then\n        region:SetAnchor(aura_env.anchorConfValues[aura_env.config[\"anchorPoint\"]], state.nameplate.unitFrame, aura_env.anchorConfValues[aura_env.config[\"relativeAnchor\"]])\n        --region:SetAnchor(aura_env.anchorConfValues[aura_env.config[\"anchorPoint\"]], state.nameplate.unitFrame.healthBar, aura_env.anchorConfValues[aura_env.config[\"relativeAnchor\"]])\n    else\n        region:SetAnchor(aura_env.anchorConfValues[aura_env.config[\"anchorPoint\"]], state.nameplate, aura_env.anchorConfValues[aura_env.config[\"relativeAnchor\"]])\n    end\n    region:SetOffset(xOffset, yOffset)\n    \n    aura_env.NEAupdateRegionGraphics(state.nameplate, region, state)\n    \n    region:Show()\nend\n\naura_env.NEAisShowBuff = function(state)\n    if not state.show then return end\n    \n    local isPlayer = UnitIsPlayer(state.unit)\n    --local isFriend = UnitIsFriend(\"player\", state.unit)\n    local canAttack = UnitCanAttack(\"player\", state.unit);\n    local inInstance, instanceType = IsInInstance()\n    \n    local spellId = state.spellId\n    local NEAtype = state.buffType\n    \n    local showAura = (not isPlayer or aura_env.config[\"showPlayers\"]) or (inInstance and canAttack and instanceType == \"party\") or (state.caster == \"player\" and aura_env.config[\"showPlayersDebuffs\"] and NEAtype == 1) or (state.caster == \"player\" and aura_env.config[\"showPlayersBuffs\"] and NEAtype == 2) or aura_env.hasCustom\n    \n    -- NEAtype: 1=debuff, 2=buff\n    if NEAtype == 1 then\n        local type = state.type --select(4,UnitDebuff(state.unit, state.index))\n        if showAura and (aura_env.config[\"showAllDebuffs\"]\n            or (aura_env.spellId[\"\"..spellId])\n            or (state.caster == \"player\" and aura_env.config[\"showPlayersDebuffs\"])\n            and (aura_env.spellId[\"\"..spellId] == nil or aura_env.spellId[\"\"..spellId])) -- m/r and not blacklisted\n        then\n            state.aura_type = type\n            return true\n        end\n    end\n    \n    \n    if NEAtype == 2 then\n        local type = state.type --select(4,UnitBuff(state.unit, state.index))\n        if showAura and ((aura_env.config[\"showAllBuffs\"]\n                or (aura_env.spellId[\"\"..spellId]) -- is custom or whitelist\n                or (type == \"Magic\" and aura_env.config[\"showMagic\"] -- magic\n                    or type == \"\" and aura_env.config[\"showEnrage\"] -- or enrage\n                    or (state.caster == \"player\" and aura_env.config[\"showPlayersBuffs\"]))  -- or players\n                and (aura_env.spellId[\"\"..spellId] == nil or aura_env.spellId[\"\"..spellId]))) -- m/r and not blacklisted\n        then\n            state.aura_type = type\n            return true    \n        end\n    end\n    \n    return false\nend\n\n-- initialize\naura_env.NEAhandleAdditionalCustom()\nprint(\"Loaded WA: \\\"\"..aura_env.id..\"\\\" - Version: \"..WeakAuras.GetData(aura_env.id).semver)",
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
				}, -- [15]
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
				}, -- [16]
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
				}, -- [17]
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
				}, -- [18]
				{
					["text"] = "Positioning",
					["type"] = "header",
					["useName"] = true,
					["width"] = 2,
				}, -- [19]
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
				}, -- [20]
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
				}, -- [21]
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
				}, -- [22]
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
				}, -- [23]
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
				}, -- [24]
				{
					["default"] = true,
					["key"] = "growEvenly",
					["name"] = "Grow Evenly",
					["type"] = "toggle",
					["width"] = 1,
				}, -- [25]
				{
					["text"] = "Strata",
					["type"] = "header",
					["useName"] = true,
					["width"] = 2,
				}, -- [26]
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
				}, -- [27]
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
				}, -- [28]
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
				}, -- [29]
				{
					["text"] = "Alpha",
					["type"] = "header",
					["useName"] = true,
					["width"] = 2,
				}, -- [30]
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
				}, -- [31]
				{
					["default"] = true,
					["key"] = "useAlphaTarget",
					["name"] = "Use Nameplate Alpha for Targets",
					["type"] = "toggle",
					["width"] = 1,
				}, -- [32]
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
				}, -- [33]
				{
					["default"] = false,
					["key"] = "useAlphaMouseover",
					["name"] = "Use Nameplate Alpha for Mouseover",
					["type"] = "toggle",
					["width"] = 1,
				}, -- [34]
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
				}, -- [35]
				{
					["default"] = true,
					["key"] = "useAlpha",
					["name"] = "Use Nameplate Alpha for non-targets",
					["type"] = "toggle",
					["width"] = 1,
				}, -- [36]
				{
					["text"] = "Border",
					["type"] = "header",
					["useName"] = true,
					["width"] = 2,
				}, -- [37]
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
				}, -- [38]
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
				}, -- [39]
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
				}, -- [40]
				{
					["text"] = "Performance",
					["type"] = "header",
					["useName"] = true,
					["width"] = 1,
				}, -- [41]
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
				}, -- [42]
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
				["showBolster"] = false,
				["showCustom"] = false,
				["showDungeon"] = true,
				["showEnrage"] = true,
				["showMagic"] = true,
				["showMissing"] = false,
				["showOnUnitTypes"] = 3,
				["showOwnMissing"] = false,
				["showPlayers"] = false,
				["showPlayersBuffs"] = false,
				["showPlayersDebuffs"] = false,
				["showPurgeGlow"] = true,
				["targetAlpha"] = 1,
				["targetFrameStrata"] = 2,
				["updateThrottle"] = 100,
				["useAlpha"] = true,
				["useAlphaMouseover"] = false,
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
			["id"] = "BfA: Nameplate Enemy Auras",
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["internalVersion"] = 40,
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
			},
			["preferToUpdate"] = false,
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["semver"] = "4.3.13",
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
			["tocversion"] = 90001,
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
			["url"] = "https://wago.io/SyNLm-ACX/44",
			["version"] = 44,
			["width"] = 30,
			["xOffset"] = -10,
			["yOffset"] = 0,
			["zoom"] = 0,
		},
		["Dungeon RIO and Class"] = {
			["actions"] = {
				["finish"] = {
				},
				["init"] = {
					["custom"] = "local function GetRioScore(fullname)    \n    local score = 0;    \n    \n    if not RaiderIO then return score end;\n    \n    if not string.match(fullname, \"-\") then\n        local realmName = GetRealmName();\n        fullname = fullname..\"-\"..realmName;        \n    end\n    \n    local FACTIONS = { Alliance = 1, Horde = 2, Neutral = 3 }\n    local playerFactionID = FACTIONS[UnitFactionGroup(\"player\")]    \n    local playerProfile = RaiderIO.GetProfile(fullname, playerFactionID);\n    local currentScore = 0;\n    local previousScore = 0;\n    \n    if (playerProfile ~= nil) then\n        if playerProfile.mythicKeystoneProfile ~= nil then\n            currentScore = playerProfile.mythicKeystoneProfile.currentScore or 0;    \n            previousScore = playerProfile.mythicKeystoneProfile.previousScore or 0;\n        end\n    end    \n    \n    score = currentScore\n    \n    local previousRIO = _G[\"ShowRIORaitingWA1PreviousRIO\"];\n    \n    if previousRIO == true and currentScore < previousScore then\n        score = previousScore\n    end\n    \n    return score;\nend\n\nlocal function componentToHex(c)\n    c = math.floor(c * 255)    \n    local hex = string.format(\"%x\", c)    \n    if (hex:len() == 1) then\n        return \"0\"..hex;\n    end    \n    return hex;\nend\n\nlocal function rgbToHex(r, g, b)\n    return componentToHex(r)..componentToHex(g)..componentToHex(b);\nend\n\n\nlocal function getColorStr(hexColor)\n    return \"|cff\"..hexColor..\"+|r\";\nend\n\nlocal function getRioScoreColorText(rioScore) \n    if not RaiderIO then return nil end;\n    \n    local r, g, b = RaiderIO.GetScoreColor(rioScore);\n    local hex = rgbToHex(r, g, b);    \n    return getColorStr(hex);\nend\n\nlocal function getRioScoreText(rioScore)\n    local colorText = getRioScoreColorText(rioScore);\n    if colorText == nil then return \"\" end\n    \n    local rioText = colorText:gsub(\"+\", rioScore);\n    \n    local textFormat = _G[\"ShowRIORaitingWA1TextFormatRIO\"]\n    local trim = _G[\"ShowRIORaitingWA1Trim\"]\n    if (textFormat ~= nil and trim ~= nil and trim(textFormat) ~= \"\") then\n        rioText = textFormat:gsub(\"@rio\", rioText)        \n    end\n    \n    return rioText..\" \";\nend\n\nlocal function getIndex(values, val)\n    local index={};\n    \n    for k,v in pairs(values) do\n        index[v]=k;\n    end\n    \n    return index[val];\nend\n\nlocal function filterTable(t, ids)\n    for i, id in ipairs(ids) do\n        for j = #t, 1, -1 do\n            if ( t[j] == id ) then\n                tremove(t, j);\n                break;\n            end\n        end\n    end\nend\n\nlocal function addFilteredId(self, id)\n    if ( not self.filteredIDs ) then\n        self.filteredIDs = { };\n    end\n    tinsert(self.filteredIDs, id);\nend\n\naura_env.Trim = function(str)\n    local match = string.match\n    return match(str,'^()%s*$') and '' or match(str,'^%s*(.*%S)')\nend\n\naura_env.UpdateApplicantMember = function(member, appID, memberIdx, ...)     \n    if( RaiderIO == nil ) then return; end    \n    if( _G[\"ShowRIORaitingWA1NotShowApplicantRio\"] == true ) then return; end\n    \n    local textName = member.Name:GetText();\n    local name, class = C_LFGList.GetApplicantMemberInfo(appID, memberIdx);\n    local rioScore = GetRioScore(name);    \n    local rioText;    \n    if (rioScore > 0) then\n        rioText = getRioScoreText(rioScore);\n    else\n        rioText = \"\";\n    end\n    \n    if ( memberIdx > 1 ) then\n        member.Name:SetText(\"  \"..rioText..textName);\n    else\n        member.Name:SetText(rioText..textName);\n    end\n    \n    local nameLength = 100;\n    if ( relationship ) then\n        nameLength = nameLength - 22;\n    end\n    \n    if ( member.Name:GetWidth() > nameLength ) then\n        member.Name:SetWidth(nameLength);\n    end\nend\n\naura_env.SearchEntryUpdate = function(entry, ...)\n    if( not LFGListFrame.SearchPanel:IsShown() ) then return; end\n    \n    local categoryID = LFGListFrame.SearchPanel.categoryID;\n    local resultID = entry.resultID;\n    local resultInfo = C_LFGList.GetSearchResultInfo(resultID);\n    local leaderName = resultInfo.leaderName;\n    entry.rioScore = 0;\n    \n    if (leaderName ~= nil) then\n        entry.rioScore = GetRioScore(leaderName);\n    end\n    \n    for i = 1, 5 do\n        local texture = \"tex\"..i;                \n        if (entry.DataDisplay.Enumerate[texture]) then\n            entry.DataDisplay.Enumerate[texture]:Hide();\n        end                \n    end\n    \n    if (categoryID == 2 and _G[\"ShowRIORaitingWA1NotShowClasses\"] ~= true) then\n        local numMembers = resultInfo.numMembers;\n        local _, appStatus, pendingStatus, appDuration = C_LFGList.GetApplicationInfo(resultID);\n        local isApplication = entry.isApplication;\n        \n        entry.DataDisplay:SetPoint(\"RIGHT\", entry.DataDisplay:GetParent(), \"RIGHT\", 0, -5);\n        \n        local orderIndexes = {};\n        \n        for i=1, numMembers do                    \n            local role, class = C_LFGList.GetSearchResultMemberInfo(resultID, i);\n            local orderIndex = getIndex(LFG_LIST_GROUP_DATA_ROLE_ORDER, role);\n            table.insert(orderIndexes, {orderIndex, class});\n        end\n        \n        table.sort(orderIndexes, function(a,b)\n                return a[1] < b[1]\n        end);\n        \n        local xOffset = -88;\n        \n        for i = 1, numMembers do\n            local class = orderIndexes[i][2];\n            local classColor = RAID_CLASS_COLORS[class];\n            local r, g, b, a = classColor:GetRGBA();\n            local texture = \"tex\"..i;\n            \n            if (not entry.DataDisplay.Enumerate[texture]) then\n                entry.DataDisplay.Enumerate[texture] = entry.DataDisplay.Enumerate:CreateTexture(nil, \"ARTWORK\");\n                entry.DataDisplay.Enumerate[texture]:SetSize(10, 3);\n                entry.DataDisplay.Enumerate[texture]:SetPoint(\"RIGHT\", entry.DataDisplay.Enumerate, \"RIGHT\", xOffset, 15);\n            end\n            \n            entry.DataDisplay.Enumerate[texture]:Show();                    \n            entry.DataDisplay.Enumerate[texture]:SetColorTexture(r, g, b, 0.75);\n            \n            xOffset = xOffset + 18;                    \n        end\n    end            \n    \n    local name = entry.Name:GetText() or \"\";\n    \n    local rioText;    \n    if (entry.rioScore > 0 and _G[\"ShowRIORaitingWA1NotShowRio\"] ~= true) then\n        rioText = getRioScoreText(entry.rioScore);\n    else\n        rioText = \"\";\n    end\n    entry.Name:SetText(rioText..name);\nend\n\naura_env.SortSearchResults = function(results)\n    \n    local sortMethod = _G[\"ShowRIORaitingWA1SortMethod\"] or 1;\n    local removeRole = _G[\"ShowRIORaitingWA1RemoveWithoutRole\"] or false;\n    local minRio = _G[\"ShowRIORaitingWA1MinRio\"] or -1;\n    local maxRio = _G[\"ShowRIORaitingWA1MaxRio\"] or 9999;\n    local filterRIO = _G[\"ShowRIORaitingWA1FilterRIO\"] or false;\n    local categoryID = LFGListFrame.SearchPanel.categoryID;\n    \n    local function RemainingSlotsForLocalPlayerRole(lfgSearchResultID)    \n        local roleRemainingKeyLookup = {\n            [\"TANK\"] = \"TANK_REMAINING\",\n            [\"HEALER\"] = \"HEALER_REMAINING\",\n            [\"DAMAGER\"] = \"DAMAGER_REMAINING\",\n        };\n        local roles = C_LFGList.GetSearchResultMemberCounts(lfgSearchResultID);\n        local playerRole = GetSpecializationRole(GetSpecialization());\n        return roles[roleRemainingKeyLookup[playerRole]];\n    end\n    \n    local function FilterSearchResults(searchResultID)\n        local searchResultInfo = C_LFGList.GetSearchResultInfo(searchResultID);\n        \n        if (searchResultInfo == nil) then\n            return;\n        end        \n        \n        local remainingRole = RemainingSlotsForLocalPlayerRole(searchResultID) > 0\n        \n        if removeRole == true then            \n            if (remainingRole == false) then\n                LFGListSearchPanel_AddFilteredID(LFGListFrame.SearchPanel, searchResultID);\n            end\n        end \n        \n        local leaderName = searchResultInfo.leaderName;\n        local rioScore = 0;\n        \n        if (leaderName ~= nil) then\n            rioScore = GetRioScore(leaderName);\n        end \n        \n        if (not RaiderIO) then filterRIO = false end\n        \n        if (filterRIO == true) then            \n            if (rioScore < minRio or rioScore > maxRio) then\n                LFGListSearchPanel_AddFilteredID(LFGListFrame.SearchPanel, searchResultID);\n            end\n        end\n    end\n    \n    local function SortSearchResultsCB(searchResultID1, searchResultID2)\n        local searchResultInfo1 = C_LFGList.GetSearchResultInfo(searchResultID1);\n        local searchResultInfo2 = C_LFGList.GetSearchResultInfo(searchResultID2);\n        \n        if (searchResultInfo1 == nil) then\n            return false;\n        end        \n        \n        if (searchResultInfo2 == nil) then\n            return true;\n        end    \n        \n        local remainingRole1 = RemainingSlotsForLocalPlayerRole(searchResultID1) > 0;\n        local remainingRole2 = RemainingSlotsForLocalPlayerRole(searchResultID2) > 0;\n        \n        local leaderName1 = searchResultInfo1.leaderName;\n        local leaderName2 = searchResultInfo2.leaderName;\n        \n        local rioScore1 = 0;\n        local rioScore2 = 0;       \n        \n        if (leaderName1 ~= nil) then\n            rioScore1 = GetRioScore(leaderName1);\n        end   \n        if (leaderName2 ~= nil) then\n            rioScore2 = GetRioScore(leaderName2);\n        end       \n        \n        if (remainingRole1 ~= remainingRole2) then\n            return remainingRole1;\n        end\n        \n        if (sortMethod == 3) then\n            return rioScore1 > rioScore2;\n        else\n            return rioScore1 < rioScore2;\n        end\n    end\n    \n    if (#results > 0 and categoryID == 2) then\n        for i,id in ipairs(results) do\n            FilterSearchResults(id)\n        end\n        \n        if (LFGListFrame.SearchPanel.filteredIDs) then\n            LFGListUtil_FilterSearchResults(LFGListFrame.SearchPanel.results, LFGListFrame.SearchPanel.filteredIDs);\n            LFGListFrame.SearchPanel.filteredIDs = nil;\n        end\n    end\n    \n    if sortMethod ~= 1 then\n        table.sort(results, SortSearchResultsCB);\n    end\n    \n    if #results > 0 then\n        LFGListSearchPanel_UpdateResults(LFGListFrame.SearchPanel);\n    end\nend\n\naura_env.SortApplicants = function(applicants)    \n    local sortMethod = _G[\"ShowRIORaitingWA1ApplicantSortMethod\"] or 1;\n    local minRio = _G[\"ShowRIORaitingWA1ApplicantMinRio\"] or -1;\n    local maxRio = _G[\"ShowRIORaitingWA1ApplicantMaxRio\"] or 9999;\n    local filterRIO = _G[\"ShowRIORaitingWA1ApplicantFilterRIO\"] or false;\n    local categoryID = LFGListFrame.CategorySelection.selectedCategory;\n    \n    local function FilterApplicants(applicantID)\n        local applicantInfo = C_LFGList.GetApplicantInfo(applicantID);\n        \n        if (applicantInfo == nil) then\n            return;\n        end \n        \n        local name = C_LFGList.GetApplicantMemberInfo(applicantInfo.applicantID, 1);\n        local rioScore = 0;\n        \n        if (name ~= nil) then\n            rioScore = GetRioScore(name);\n        end   \n        \n        if (filterRIO == true) then\n            if (rioScore < minRio or rioScore > maxRio) then\n                addFilteredId(LFGListFrame.ApplicationViewer, applicantID)\n            end\n        end\n    end\n    \n    local function SortApplicantsCB(applicantID1, applicantID2)\n        local applicantInfo1 = C_LFGList.GetApplicantInfo(applicantID1);\n        local applicantInfo2 = C_LFGList.GetApplicantInfo(applicantID2);\n        \n        if (applicantInfo1 == nil) then\n            return false;\n        end        \n        \n        if (applicantInfo2 == nil) then\n            return true;\n        end    \n        \n        local name1 = C_LFGList.GetApplicantMemberInfo(applicantInfo1.applicantID, 1);\n        local name2 = C_LFGList.GetApplicantMemberInfo(applicantInfo2.applicantID, 1);\n        \n        local rioScore1 = 0;\n        local rioScore2 = 0;       \n        \n        if (name1 ~= nil) then\n            rioScore1 = GetRioScore(name1);\n        end   \n        if (name2 ~= nil) then\n            rioScore2 = GetRioScore(name2);\n        end\n        \n        if (sortMethod == 3) then\n            return rioScore1 > rioScore2;\n        else\n            return rioScore1 < rioScore2;\n        end\n    end\n    \n    if (categoryID == 2 and #applicants > 0) then\n        for i,id in ipairs(applicants) do\n            FilterApplicants(id)\n        end\n        \n        if (LFGListFrame.ApplicationViewer.filteredIDs) then\n            filterTable(applicants, LFGListFrame.ApplicationViewer.filteredIDs);\n            LFGListFrame.ApplicationViewer.filteredIDs = nil;\n        end\n    end\n    \n    if (sortMethod ~= 1 and #applicants > 1) then \n        table.sort(applicants, SortApplicantsCB);        \n        LFGListApplicationViewer_UpdateResults(LFGListFrame.ApplicationViewer);\n    end\n    \n    if (#applicants > 0) then        \n        LFGListApplicationViewer_UpdateResults(LFGListFrame.ApplicationViewer);\n    end\nend\n\nlocal isLoad = _G[\"ShowRIORaitingWA1\"];\n\n_G[\"ShowRIORaitingWA1NotShowRio\"] = aura_env.config.NotShowRio\n_G[\"ShowRIORaitingWA1NotShowApplicantRio\"] = aura_env.config.NotShowApplicantRio\n_G[\"ShowRIORaitingWA1NotShowClasses\"] = aura_env.config.NotShowClasses \n_G[\"ShowRIORaitingWA1TextFormatRIO\"] = aura_env.config.TextFormatRIO;\n_G[\"ShowRIORaitingWA1Trim\"] = aura_env.Trim;\n_G[\"ShowRIORaitingWA1SortMethod\"] = aura_env.config.RioSort;\n_G[\"ShowRIORaitingWA1ApplicantSortMethod\"] = aura_env.config.ApplicantRioSort;\n_G[\"ShowRIORaitingWA1RemoveWithoutRole\"] = aura_env.config.RemoveWithoutRole;\n_G[\"ShowRIORaitingWA1MinRio\"] = aura_env.config.MinRio;\n_G[\"ShowRIORaitingWA1MaxRio\"] = aura_env.config.MaxRio;\n_G[\"ShowRIORaitingWA1ApplicantMinRio\"] = aura_env.config.ApplicantMinRio;\n_G[\"ShowRIORaitingWA1ApplicantMaxRio\"] = aura_env.config.ApplicantMaxRio;\n_G[\"ShowRIORaitingWA1FilterRIO\"] = aura_env.config.FilterRIO;\n_G[\"ShowRIORaitingWA1ApplicantFilterRIO\"] = aura_env.config.ApplicantFilterRIO;\n_G[\"ShowRIORaitingWA1PreviousRIO\"] = aura_env.config.ShowPreviousRIO;\n\nif (not isLoad) then \n    hooksecurefunc(\"LFGListUtil_SortSearchResults\", aura_env.SortSearchResults);\n    hooksecurefunc(\"LFGListSearchEntry_Update\", aura_env.SearchEntryUpdate);\n    hooksecurefunc(\"LFGListUtil_SortApplicants\", aura_env.SortApplicants);\n    hooksecurefunc(\"LFGListApplicationViewer_UpdateApplicantMember\", aura_env.UpdateApplicantMember);\n    _G[\"ShowRIORaitingWA1\"] = true;\nend\n\n\n\n",
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
			["displayText_format_p_time_dynamic"] = false,
			["displayText_format_p_time_precision"] = 1,
			["fixedWidth"] = 200,
			["font"] = "Friz Quadrata TT",
			["fontSize"] = 12,
			["frameStrata"] = 1,
			["id"] = "Dungeon RIO and Class",
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["internalVersion"] = 40,
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
			},
			["outline"] = "OUTLINE",
			["preferToUpdate"] = false,
			["regionType"] = "text",
			["selfPoint"] = "BOTTOM",
			["semver"] = "1.0.13",
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
						["type"] = "status",
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
			["url"] = "https://wago.io/klC4qqHaF/14",
			["version"] = 14,
			["wordWrap"] = "WordWrap",
			["xOffset"] = 0,
			["yOffset"] = 0,
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
			["internalVersion"] = 40,
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
				["use_zoneId"] = false,
				["use_zonegroupId"] = false,
				["zonegroupId"] = "413",
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
						["type"] = "status",
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
			["internalVersion"] = 40,
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
				["use_zoneId"] = false,
				["use_zonegroupId"] = false,
				["zonegroupId"] = "413",
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
						["type"] = "status",
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
			["internalVersion"] = 40,
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
				["use_zoneId"] = false,
				["use_zonegroupId"] = true,
				["zonegroupId"] = "409",
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
						["type"] = "status",
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
			["internalVersion"] = 40,
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
				["use_zonegroupId"] = true,
				["zonegroupId"] = "409",
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
						["type"] = "status",
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
			["internalVersion"] = 40,
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
				["use_zoneId"] = true,
				["use_zonegroupId"] = false,
				["zoneId"] = "1669",
				["zonegroupId"] = "13334",
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
						["type"] = "status",
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
			["internalVersion"] = 40,
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
				["use_zoneId"] = true,
				["use_zonegroupId"] = false,
				["zoneId"] = "1669",
				["zonegroupId"] = "13334",
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
						["type"] = "status",
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
			["internalVersion"] = 40,
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
				["use_zoneId"] = true,
				["use_zonegroupId"] = false,
				["zoneId"] = "1669",
				["zonegroupId"] = "13334",
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
					["text_text_format_p_time_dynamic"] = true,
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
					["text_text_format_p_time_dynamic"] = false,
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
						["type"] = "status",
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
			["internalVersion"] = 40,
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
				["use_zoneId"] = false,
				["use_zonegroupId"] = false,
				["zoneId"] = "",
				["zonegroupId"] = "13334",
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
						["type"] = "status",
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
			["internalVersion"] = 40,
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
				["use_zoneId"] = false,
				["use_zonegroupId"] = true,
				["zonegroupId"] = "410",
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
						["type"] = "status",
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
			["internalVersion"] = 40,
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
				["use_zonegroupId"] = true,
				["zonegroupId"] = "410",
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
						["type"] = "status",
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
			["internalVersion"] = 40,
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
				["use_zoneId"] = false,
				["use_zonegroupId"] = true,
				["zoneId"] = "1666, 1667, 1668",
				["zonegroupId"] = "410",
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
						["type"] = "status",
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
			["internalVersion"] = 40,
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
				["use_zoneId"] = false,
				["use_zonegroupId"] = true,
				["zonegroupId"] = "410",
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
						["type"] = "status",
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
			["internalVersion"] = 40,
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
				["use_zoneId"] = true,
				["use_zonegroupId"] = false,
				["zoneId"] = "1680, 1678, 1679, 1677, 1663, 1664, 1665, 1669, 1674, 1697, 1675, 1676, 1692, 1693, 1694, 1695, 1683, 1684, 1685, 1686, 1687",
				["zonegroupId"] = "413, 409, 415, 412, 419, 414, 415",
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
						["type"] = "status",
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
			["internalVersion"] = 40,
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
				["use_zoneId"] = false,
				["use_zonegroupId"] = false,
				["zonegroupId"] = "415",
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
						["type"] = "status",
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
			["internalVersion"] = 40,
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
				["use_zoneId"] = false,
				["use_zonegroupId"] = true,
				["zonegroupId"] = "415",
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
						["type"] = "status",
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
			["internalVersion"] = 40,
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
				["use_zoneId"] = false,
				["use_zonegroupId"] = true,
				["zonegroupId"] = "415",
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
					["text_text_format_p_time_dynamic"] = true,
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
					["text_text_format_p_time_dynamic"] = false,
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
						["type"] = "status",
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
			["internalVersion"] = 40,
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
				["use_zoneId"] = false,
				["use_zonegroupId"] = false,
				["zonegroupId"] = "412",
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
						["type"] = "status",
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
			["internalVersion"] = 40,
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
				["use_zonegroupId"] = true,
				["zonegroupId"] = "412",
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
						["type"] = "event",
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
			["internalVersion"] = 40,
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
				["use_zonegroupId"] = true,
				["zonegroupId"] = "412",
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
						["type"] = "status",
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
			["internalVersion"] = 40,
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
				["use_zonegroupId"] = true,
				["zonegroupId"] = "412",
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
						["type"] = "status",
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
			["internalVersion"] = 40,
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
				["use_zonegroupId"] = true,
				["zonegroupId"] = "419",
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
					["text_text_format_p_time_dynamic"] = true,
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
					["text_text_format_p_time_dynamic"] = false,
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
						["type"] = "status",
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
			["internalVersion"] = 40,
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
				["use_zonegroupId"] = true,
				["zonegroupId"] = "419",
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
					["text_text_format_p_time_dynamic"] = true,
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
					["text_text_format_p_time_dynamic"] = false,
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
						["type"] = "status",
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
			["internalVersion"] = 40,
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
				["use_zonegroupId"] = true,
				["zonegroupId"] = "419",
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
					["text_text_format_p_time_dynamic"] = true,
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
					["text_text_format_p_time_dynamic"] = false,
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
						["type"] = "status",
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
			["internalVersion"] = 40,
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
				["use_zonegroupId"] = true,
				["zonegroupId"] = "419",
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
					["text_text_format_p_time_dynamic"] = true,
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
					["text_text_format_p_time_dynamic"] = false,
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
						["type"] = "status",
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
			["internalVersion"] = 40,
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
				["use_zonegroupId"] = true,
				["zonegroupId"] = "419",
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
						["type"] = "status",
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
			["internalVersion"] = 40,
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
				["use_zoneId"] = false,
				["use_zonegroupId"] = false,
				["zonegroupId"] = "414",
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
						["type"] = "status",
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
			["internalVersion"] = 40,
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
				["use_zoneId"] = false,
				["use_zonegroupId"] = false,
				["zonegroupId"] = "414",
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
						["type"] = "event",
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
			["internalVersion"] = 40,
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
				["use_zoneId"] = false,
				["use_zonegroupId"] = false,
				["zonegroupId"] = "414",
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
						["type"] = "status",
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
			["internalVersion"] = 40,
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
				["use_zoneId"] = false,
				["use_zonegroupId"] = false,
				["zonegroupId"] = "414",
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
						["type"] = "status",
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
			["internalVersion"] = 40,
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
			["displayText_format_p_time_dynamic"] = false,
			["displayText_format_p_time_precision"] = 1,
			["fixedWidth"] = 200,
			["font"] = "Friz Quadrata TT",
			["fontSize"] = 12,
			["frameStrata"] = 1,
			["id"] = "Great Vault on Weekly Reward frame",
			["information"] = {
			},
			["internalVersion"] = 40,
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
			["internalVersion"] = 40,
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
			["internalVersion"] = 40,
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
						["type"] = "status",
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
			["internalVersion"] = 40,
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
					["text_text_format_p_time_dynamic"] = false,
					["text_text_format_p_time_precision"] = 0,
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
					["text_text_format_p_time_dynamic"] = false,
					["text_text_format_p_time_precision"] = 0,
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
						["type"] = "status",
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
						["type"] = "status",
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
			["internalVersion"] = 40,
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
					["text_text_format_p_time_dynamic"] = false,
					["text_text_format_p_time_precision"] = 1,
					["text_text_format_s_format"] = "none",
					["text_text_format_t_format"] = "timed",
					["text_text_format_t_time_dynamic"] = false,
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
						["type"] = "status",
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
			["internalVersion"] = 40,
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
					["text_text_format_p_time_dynamic"] = false,
					["text_text_format_p_time_precision"] = 0,
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
					["text_text_format_p_time_dynamic"] = false,
					["text_text_format_p_time_precision"] = 0,
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
			["internalVersion"] = 40,
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
					["text_text_format_p_time_dynamic"] = false,
					["text_text_format_p_time_precision"] = 0,
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
					["text_text_format_p_time_dynamic"] = false,
					["text_text_format_p_time_precision"] = 0,
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
						["type"] = "status",
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
						["type"] = "status",
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
						["type"] = "status",
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
			["internalVersion"] = 40,
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
					["text_text_format_p_time_dynamic"] = false,
					["text_text_format_p_time_precision"] = 0,
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
					["text_text_format_p_time_dynamic"] = false,
					["text_text_format_p_time_precision"] = 0,
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
			["internalVersion"] = 40,
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
					["text_text_format_p_time_dynamic"] = false,
					["text_text_format_p_time_precision"] = 0,
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
						["type"] = "status",
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
						["type"] = "status",
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
			["internalVersion"] = 40,
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
					["text_text_format_p_time_dynamic"] = false,
					["text_text_format_p_time_precision"] = 0,
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
					["text_text_format_p_time_dynamic"] = false,
					["text_text_format_p_time_precision"] = 0,
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
						["type"] = "status",
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
						["type"] = "status",
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
			["internalVersion"] = 40,
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
					["text_text_format_p_time_dynamic"] = false,
					["text_text_format_p_time_precision"] = 0,
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
					["text_text_format_p_time_dynamic"] = false,
					["text_text_format_p_time_precision"] = 0,
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
			["internalVersion"] = 40,
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
					["text_text_format_p_time_dynamic"] = false,
					["text_text_format_p_time_precision"] = 0,
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
					["text_text_format_p_time_dynamic"] = false,
					["text_text_format_p_time_precision"] = 0,
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
			["internalVersion"] = 40,
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
				["use_zoneId"] = true,
				["use_zonegroupId"] = false,
				["zoneId"] = "1669",
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
			["internalVersion"] = 40,
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
				["use_zoneId"] = true,
				["zoneId"] = "1669",
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
			["internalVersion"] = 40,
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
				["use_zoneId"] = true,
				["zoneId"] = "1669",
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
			["internalVersion"] = 40,
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
				["use_zoneId"] = true,
				["zoneId"] = "1669",
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
			["internalVersion"] = 40,
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
				["use_zoneId"] = true,
				["zoneId"] = "1669",
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
			["internalVersion"] = 40,
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
				["use_zoneId"] = true,
				["zoneId"] = "1669",
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
			["internalVersion"] = 40,
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
				["use_zoneId"] = true,
				["zoneId"] = "1669",
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
			["internalVersion"] = 40,
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
				["use_zoneId"] = true,
				["zoneId"] = "1669",
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
			["internalVersion"] = 40,
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
				["use_zoneId"] = true,
				["zoneId"] = "1669",
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
			["internalVersion"] = 40,
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
				["use_zoneId"] = true,
				["zoneId"] = "1669",
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
			["internalVersion"] = 40,
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
				["use_zoneId"] = true,
				["zoneId"] = "1669",
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
			["internalVersion"] = 40,
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
				["use_zoneId"] = true,
				["zoneId"] = "1669",
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
			["internalVersion"] = 40,
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
				["use_zoneId"] = true,
				["zoneId"] = "1669",
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
			["internalVersion"] = 40,
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
				["use_zoneId"] = true,
				["zoneId"] = "1669",
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
			["internalVersion"] = 40,
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
				["use_zoneId"] = true,
				["use_zonegroupId"] = false,
				["zoneId"] = "1669",
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
			["displayText_format_p_time_dynamic"] = false,
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
			["internalVersion"] = 40,
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
				["use_zoneId"] = true,
				["use_zonegroupId"] = false,
				["zoneId"] = "1669",
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
						["type"] = "status",
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
			["internalVersion"] = 40,
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
				["use_zoneId"] = true,
				["use_zonegroupId"] = false,
				["zoneId"] = "1669",
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
			["internalVersion"] = 40,
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
				["use_zoneId"] = true,
				["use_zonegroupId"] = false,
				["zoneId"] = "1669",
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
			["internalVersion"] = 40,
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
				["use_zoneId"] = true,
				["use_zonegroupId"] = false,
				["zoneId"] = "1669",
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
			["internalVersion"] = 40,
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
				["use_zoneId"] = true,
				["use_zonegroupId"] = false,
				["zoneId"] = "1669",
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
			["internalVersion"] = 40,
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
				["use_zoneId"] = true,
				["use_zonegroupId"] = false,
				["zoneId"] = "1669",
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
			["internalVersion"] = 40,
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
				["use_zoneId"] = true,
				["use_zonegroupId"] = false,
				["zoneId"] = "1669",
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
			["internalVersion"] = 40,
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
				["use_zoneId"] = true,
				["use_zonegroupId"] = false,
				["zoneId"] = "1669",
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
						["type"] = "status",
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
			["internalVersion"] = 40,
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
	},
	["dynamicIconCache"] = {
	},
	["editor_tab_spaces"] = 4,
	["editor_theme"] = "Monokai",
	["lastArchiveClear"] = 1611586667,
	["lastUpgrade"] = 1611586673,
	["login_squelch_time"] = 10,
	["minimap"] = {
		["hide"] = true,
		["minimapPos"] = 52.97999707674736,
	},
	["registered"] = {
	},
}

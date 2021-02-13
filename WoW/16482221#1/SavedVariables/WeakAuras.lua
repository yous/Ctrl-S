
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
			["preferToUpdate"] = false,
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["semver"] = "1.0.4",
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
			["url"] = "https://wago.io/uYX5mP3U5/5",
			["useAdjustededMax"] = false,
			["useAdjustededMin"] = false,
			["version"] = 5,
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
			["preferToUpdate"] = false,
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["semver"] = "1.0.4",
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
			["url"] = "https://wago.io/uYX5mP3U5/5",
			["useAdjustededMax"] = false,
			["useAdjustededMin"] = false,
			["version"] = 5,
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
			["preferToUpdate"] = false,
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["semver"] = "1.0.4",
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
			["url"] = "https://wago.io/uYX5mP3U5/5",
			["version"] = 5,
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
			["preferToUpdate"] = false,
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["semver"] = "1.0.4",
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
			["url"] = "https://wago.io/uYX5mP3U5/5",
			["useAdjustededMax"] = false,
			["useAdjustededMin"] = false,
			["useTooltip"] = false,
			["version"] = 5,
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
			["preferToUpdate"] = false,
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["semver"] = "1.0.4",
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
			["url"] = "https://wago.io/uYX5mP3U5/5",
			["useAdjustededMax"] = false,
			["useAdjustededMin"] = false,
			["useTooltip"] = false,
			["version"] = 5,
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
			["preferToUpdate"] = false,
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["semver"] = "1.0.4",
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
			["url"] = "https://wago.io/uYX5mP3U5/5",
			["useAdjustededMax"] = false,
			["useAdjustededMin"] = false,
			["useTooltip"] = false,
			["version"] = 5,
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
			["preferToUpdate"] = false,
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["semver"] = "1.0.4",
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
			["url"] = "https://wago.io/uYX5mP3U5/5",
			["useAdjustededMax"] = false,
			["useAdjustededMin"] = false,
			["useTooltip"] = false,
			["version"] = 5,
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
			["preferToUpdate"] = false,
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["semver"] = "1.0.4",
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
			["url"] = "https://wago.io/uYX5mP3U5/5",
			["version"] = 5,
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
			["preferToUpdate"] = false,
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["semver"] = "1.0.4",
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
			["url"] = "https://wago.io/uYX5mP3U5/5",
			["version"] = 5,
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
				["use_size"] = false,
				["use_spec"] = false,
				["use_spellknown"] = false,
				["use_talent"] = false,
				["use_zoneId"] = false,
				["use_zonegroupId"] = true,
				["zoneId"] = "1666, 1667, 1668",
				["zonegroupId"] = "410",
			},
			["parent"] = "Ellesmere's Dungeon Essentials",
			["preferToUpdate"] = false,
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["semver"] = "1.0.4",
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
			["url"] = "https://wago.io/uYX5mP3U5/5",
			["version"] = 5,
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
			["preferToUpdate"] = false,
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["semver"] = "1.0.4",
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
			["url"] = "https://wago.io/uYX5mP3U5/5",
			["version"] = 5,
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
				["use_size"] = false,
				["use_spec"] = false,
				["use_spellknown"] = false,
				["use_talent"] = false,
				["use_zoneId"] = false,
				["use_zonegroupId"] = true,
				["zoneId"] = "1666, 1667, 1668",
				["zonegroupId"] = "413, 409, 415, 412, 419, 414, 415",
			},
			["parent"] = "Ellesmere's Dungeon Essentials",
			["preferToUpdate"] = false,
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["semver"] = "1.0.4",
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
			["url"] = "https://wago.io/uYX5mP3U5/5",
			["version"] = 5,
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
			["preferToUpdate"] = false,
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["semver"] = "1.0.4",
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
			["url"] = "https://wago.io/uYX5mP3U5/5",
			["version"] = 5,
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
			["preferToUpdate"] = false,
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["semver"] = "1.0.4",
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
			["url"] = "https://wago.io/uYX5mP3U5/5",
			["useAdjustededMax"] = false,
			["useAdjustededMin"] = false,
			["useTooltip"] = false,
			["version"] = 5,
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
			["preferToUpdate"] = false,
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["semver"] = "1.0.4",
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
			["url"] = "https://wago.io/uYX5mP3U5/5",
			["useAdjustededMax"] = false,
			["useAdjustededMin"] = false,
			["useTooltip"] = false,
			["version"] = 5,
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
			["preferToUpdate"] = false,
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["semver"] = "1.0.4",
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
			["url"] = "https://wago.io/uYX5mP3U5/5",
			["useAdjustededMax"] = false,
			["useAdjustededMin"] = false,
			["useTooltip"] = false,
			["version"] = 5,
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
			["preferToUpdate"] = false,
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["semver"] = "1.0.4",
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
			["url"] = "https://wago.io/uYX5mP3U5/5",
			["useAdjustededMax"] = false,
			["useAdjustededMin"] = false,
			["useTooltip"] = false,
			["version"] = 5,
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
			["preferToUpdate"] = false,
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["semver"] = "1.0.4",
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
			["url"] = "https://wago.io/uYX5mP3U5/5",
			["useAdjustededMax"] = false,
			["useAdjustededMin"] = false,
			["useTooltip"] = false,
			["version"] = 5,
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
			["preferToUpdate"] = false,
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["semver"] = "1.0.4",
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
			["url"] = "https://wago.io/uYX5mP3U5/5",
			["useAdjustededMax"] = false,
			["useAdjustededMin"] = false,
			["useTooltip"] = false,
			["version"] = 5,
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
			["preferToUpdate"] = false,
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["semver"] = "1.0.4",
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
			["url"] = "https://wago.io/uYX5mP3U5/5",
			["useAdjustededMax"] = false,
			["useAdjustededMin"] = false,
			["useTooltip"] = false,
			["version"] = 5,
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
			["preferToUpdate"] = false,
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["semver"] = "1.0.4",
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
			["url"] = "https://wago.io/uYX5mP3U5/5",
			["useAdjustededMax"] = false,
			["useAdjustededMin"] = false,
			["useTooltip"] = false,
			["version"] = 5,
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
			["preferToUpdate"] = false,
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["semver"] = "1.0.4",
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
			["url"] = "https://wago.io/uYX5mP3U5/5",
			["useAdjustededMax"] = false,
			["useAdjustededMin"] = false,
			["useTooltip"] = false,
			["version"] = 5,
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
			["preferToUpdate"] = false,
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["semver"] = "1.0.4",
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
			["url"] = "https://wago.io/uYX5mP3U5/5",
			["useAdjustededMax"] = false,
			["useAdjustededMin"] = false,
			["useTooltip"] = false,
			["version"] = 5,
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
				"EDE [NW] Repentance Check", -- [19]
				"EDE [OTHERS] Blinding Light Check", -- [20]
				"EDE [NW] Shadow Well", -- [21]
				"EDE [MOTS] Bewildering Pollen (Boss) 2", -- [22]
				"EDE [MOTS] Bewildering Pollen (Trash)", -- [23]
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
			["preferToUpdate"] = false,
			["radius"] = 200,
			["regionType"] = "dynamicgroup",
			["rotation"] = 0,
			["rowSpace"] = 1,
			["scale"] = 1,
			["selfPoint"] = "LEFT",
			["semver"] = "1.0.4",
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
			["url"] = "https://wago.io/uYX5mP3U5/5",
			["useLimit"] = false,
			["version"] = 5,
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

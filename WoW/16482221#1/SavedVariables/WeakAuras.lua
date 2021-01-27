
WeakAurasSaved = {
	["dbVersion"] = 40,
	["displays"] = {
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
				["anchorPoint"] = 2,
				["blacklistCustom"] = "",
				["borderAlpha"] = 0.9,
				["borderSize"] = 1,
				["frameStrata"] = 1,
				["growEvenly"] = true,
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
				["relativeAnchor"] = 1,
				["showAllBuffs"] = false,
				["showAllDebuffs"] = false,
				["showBolster"] = true,
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
				["xOffset"] = 0,
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
			["xOffset"] = 0,
			["yOffset"] = 0,
			["zoom"] = 0,
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
		["hide"] = false,
		["minimapPos"] = 52.97999707674736,
	},
	["registered"] = {
	},
}

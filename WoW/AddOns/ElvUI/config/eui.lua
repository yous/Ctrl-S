local E, L, V, P, G, _ = unpack(select(2, ...)); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB

P["cooldown"].fontSize = 20

P["combattext"] = {
	["enable"] = true,							-- Global enable combat text
	["blizz_head_numbers"] = false,				-- Use blizzard damage/healing output(above mob/player head)
	["damage_style"] = true,					-- Change default damage/healing font above mobs/player heads(you need to restart WoW to see changes)
	["damage"] = true,							-- Show outgoing damage in it's own frame
	["healing"] = true,							-- Show outgoing healing in it's own frame
	["show_hots"] = true,						-- Show periodic healing effects in healing frame
	["show_overhealing"] = true,				-- Show outgoing overhealing
	["pet_damage"] = true,						-- Show your pet damage
	["dot_damage"] = true,						-- Show damage from your dots
	["damage_color"] = true,					-- Display damage numbers depending on school of magic
	["crit_prefix"] = "*",						-- Symbol that will be added before crit
	["crit_postfix"] = "*",						-- Symbol that will be added after crit
	["icons"] = true,							-- Show outgoing damage icons
	["icon_size"] = 16,							-- Icon size of spells in outgoing damage frame, also has effect on dmg font size
	["treshold"] = 1,							-- Minimum damage to show in damage frame
	["heal_treshold"] = 1,						-- Minimum healing to show in incoming/outgoing healing messages
	["scrollable"] = false,						-- Allows you to scroll frame lines with mousewheel
	["max_lines"] = 15,							-- Max lines to keep in scrollable mode(more lines = more memory)
	["time_visible"] = 3,						-- Time(seconds) a single message will be visible
	["dk_runes"] = true,						-- Show deathknight rune recharge
	["killingblow"] = false,					-- Tells you about your killingblows
	["merge_aoe_spam"] = true,					-- Merges multiple aoe damage spam into single message
	["merge_melee"] = true,						-- Merges multiple auto attack damage spam
	["dispel"] = true,							-- Tells you about your dispels(works only with ["damage"] = true)
	["interrupt"] = true,						-- Tells you about your interrupts(works only with ["damage"] = true)
	["direction"] = "bottom",					-- Scrolling Direction("top"(goes down) or "bottom"(goes up))
}

P['RLBox'] = {
	['enable'] = false,
	['TitleFontSize'] = 12,
	['wpTime'] = 0,
	['UIType'] = 'bar',
	['party'] = false,
	
	['DEFAULT'] = {
		['enable'] = true,
		['IconSize'] = 26,
		['BarHeight'] = 8,
		['BarWidth'] = 120,
		['FontSize'] = 12,
		['minperrow'] = 5,
		['rownums'] = 6,
		['sendStartMsg'] = 'RAID',
		['sendEndMsg'] = 'RAID',
	},
		
	['OTHER'] = {
		['enable'] = true,
		['IconSize'] = 26,
		['BarHeight'] = 8,
		['BarWidth'] = 120,
		['FontSize'] = 12,
		['minperrow'] = 8,
		['rownums'] = 6,
		['sendStartMsg'] = 'RAID',
		['sendEndMsg'] = 'RAID',
	},
	
	['MISC'] = {
		['enable'] = false,
		['IconSize'] = 26,
		['BarHeight'] = 8,
		['BarWidth'] = 120,
		['FontSize'] = 12,
		['minperrow'] = 10,
		['rownums'] = 6,
		['sendStartMsg'] = 'RAID',
		['sendEndMsg'] = 'RAID',
	},
	
	['minperrow'] = 5,
	
	['USER_SPELLS'] = {}, 
	['postion'] = {},
}

P['ALM'] = {
	['enable'] = false,
	['learning'] = true,
	['font'] = 'EUI',
	['fontSize'] = 9,
	['fontOutline'] = 'OUTLINE',
	['tooltip'] = true,
	['maxCacheNum'] = 30,
	['playerBuff'] = {
		['enable'] = true,
		['iconSize'] = 36,
		['x_direction'] = 'RIGHT',
		['y_direction'] = 'UP',
		['interval'] = 4,
		['perRow'] = 8,
		['maxNum'] = 20,
		['pos'] = {"BOTTOMLEFT", "ElvUF_Player", "TOPLEFT", 0, 20},
		['useList'] = {},
		['whiteList'] = {},
		['cacheList'] = {},
	},
	['playerDebuff'] = {
		['enable'] = true,
		['iconSize'] = 36,
		['x_direction'] = 'RIGHT',
		['y_direction'] = 'UP',
		['interval'] = 4,
		['perRow'] = 8,
		['maxNum'] = 20,
		['pos'] = {"BOTTOMLEFT", "ElvUF_Player", "TOPLEFT", 0, 120},
		['useList'] = {},
		['whiteList'] = {},
		['cacheList'] = {},
	},
	['targetBuff'] = {
		['enable'] = true,
		['iconSize'] = 36,
		['x_direction'] = 'LEFT',
		['y_direction'] = 'UP',
		['interval'] = 4,
		['perRow'] = 8,
		['maxNum'] = 20,
		['pos'] = {"BOTTOMRIGHT", "ElvUF_Target", "TOPRIGHT", 0, 20},
		['useList'] = {},
		['whiteList'] = {},
		['cacheList'] = {},
	},
	['targetDebuff'] = {
		['enable'] = true,
		['iconSize'] = 36,
		['x_direction'] = 'LEFT',
		['y_direction'] = 'UP',
		['interval'] = 4,
		['perRow'] = 6,
		['maxNum'] = 20,
		['pos'] = {"BOTTOMRIGHT", "ElvUF_Target", "TOPRIGHT", 0, 120},
		['useList'] = {},
		['whiteList'] = {},
		['cacheList'] = {},
	},
	['spellCD'] = {
		['enable'] = true,
		['iconSize'] = 28,
		['x_direction'] = 'RIGHT',
		['y_direction'] = 'UP',
		['interval'] = 4,
		['perRow'] = 8,
		['maxNum'] = 20,
		['combat'] = false,
		['alwaysShow'] = false,
		['pos'] = {"BOTTOMLEFT", "ElvUF_Player", "TOPLEFT", 0, 220},
		['useList'] = {},
	},
}

P["CooldownFlash"]={
	enable = false,
	fadeInTime = 0.1,
	fadeOutTime = 0.2,
	maxAlpha = 0.8,
	animScale = 1.2,
	iconSize = 80,
	holdTime = 0.3,
	enablePet = false,
	ignoredSpells = "",
	petOverlay = {1,1,1},
	showSpellName = false,	
}

G['skins'] = {
	['embedRight'] = '',
	['embedcombat'] = false,
}
G['reminder'] = {}
G['extracd'] = {}

V['reminder'] = {
	['enable'] = true,
	['sound'] = "Warning",
}

P['sao'] = {
	['enable'] = false,
	['onlyTime'] = 'no', --no,time,name
	['offsetX'] = 0,
	['offsetY'] = 0,
	['useIcon'] = false,
	['fontSize'] = 24,
	['useBuffIcon'] = false,
	['iconSize'] = 64,
	['iconGap'] = 8,
	['spells'] = {
		['DRUID'] = {
			[69369] = {
				['enable'] = true,
				['texture'] = 'FURY_OF_STORMRAGE',
				['position'] = 'TOP',
				['showing'] = false,
				['active'] = false,
				['offsetX'] = 0,
				['offsetY'] = 0,
			},
		},
		['PRIEST'] = {},
		['HUNTER'] = {},
		['MAGE'] = {},
		['PALADIN'] = {},
		['SHAMAN'] = {},
		['WARRIOR'] = {},
		['DEATHKNIGHT'] = {
			[50421] = {
				['enable'] = true,
				['texture'] = 'FURY_OF_STORMRAGE',
				['position'] = 'TOP',
				['showing'] = false,
				['active'] = false,
				['offsetX'] = 0,
				['offsetY'] = 0,
			},		
		},
		['ROGUE'] = {},
		['WARLOCK'] = {},
		['MONK'] = {},
	},
}

P['general'].bordercolor = { r = .31,g = .31,b = .31 }
P['general'].backdropfadecolor = { r = .06,g = .06,b = .06, a = 0.9 }
P['general'].stickyFrames = false
P['general'].nudgeWindow = true
P['general'].hideDisableFrame = true
P['general'].disableOmnicc = true
P['general'].questfontSize = 14
P['general'].lootWidth = 328
P['general'].lootHeight = 28

P['unitframe'].colors.health = P.general.bordercolor
P['unitframe'].colors.auraBarBuff = P.general.bordercolor
P['unitframe'].casttimeformat = 1

P['bags'].alignToChat = false
P['bags'].spacing = 4
P['bags'].point = {}
P['bags'].transparent = false

P["FindIt"] = {
	msg = "",
	FindType = "spell",
}

P["AuraWatch"] = {
	["enable"] = false,
	["checkSpellid"] = false,
	["loadDefault"] = false,
	['font'] = 'EUI',
	['fontSize'] = 11,
	['fontSize2'] = 10,
	['fontOutline'] = 'OUTLINE',
	['delay'] = 0.5,
	['Spellname'] = false,
	["DB"] = {},
}

V["AuraWatch"] = {
	["enable"] = false,
}

V["SoraClassTimer"] = {
	["enable"] = false,
}

P["SoraClassTimer"] = {
	["enable"] = false,
	['font'] = 'EUI',
	['fontSize'] = 11,
	['fontOutline'] = 'OUTLINE',	
	["timelimit"] = 60,
	["PlayerMode"] = "Icon",
		["PlayerIconSize"] = 48,
	["TargetMode"] = "Icon",
		["TargetIconSize"] = 42,
	["BlackList"] = {
		[GetSpellInfo(80166)] = true, 
		[GetSpellInfo(87601)] = true, 
	},
	["WhiteList"] = {

		[GetSpellInfo( 2825)] = true, 
	},
}	

P['general'].font = 'EUI'
P['general'].watchFontSize = 12
P['nameplate'].font = 'EUI'
P['nameplate'].fontSize = 10
P['nameplate'].fontOutline = 'OUTLINE'
P['nameplate'].buffs.font = 'EUI'
P['nameplate'].buffs.fontOutline = 'OUTLINE'
P['nameplate'].buffs.timeX = 2
P['nameplate'].buffs.timeY = 2
P['nameplate'].buffs.stacksX = 2
P['nameplate'].buffs.stacksY = -2
P['nameplate'].buffs.additionalFilter2 = ''
P['nameplate'].debuffs.additionalFilter2 = ''
P['nameplate'].debuffs.font = 'EUI'
P['nameplate'].debuffs.fontOutline = 'OUTLINE'
P['nameplate'].debuffs.additionalFilter = ''
P['nameplate'].debuffs.timeX = 2
P['nameplate'].debuffs.timeY = 2
P['nameplate'].debuffs.stacksX = 2
P['nameplate'].debuffs.stacksY = -2
P['nameplate'].castBar.enable = true
P['auras'].font = 'EUI'
P['auras'].auraFont = 'EUI'
P['auras'].auraFontOutline = 'OUTLINE'
P['auras'].fontOutline = 'OUTLINE'
P['auras'].fontSize = 12
P['auras'].consolidatedBuffs.consolidateTo = false
P['auras'].consolidatedBuffs.font = 'EUI'
P['auras'].consolidatedBuffs.fontOutline = 'OUTLINE'
P['auras'].consolidatedBuffs.fontSize = 11
P['tooltip'].healthBar.font = 'EUI'
P['chat'].font = 'EUI'
P['chat'].tabFont = 'EUI'
P['chat'].tabFontSize = 12
P['datatexts'].font = 'EUI'
P['datatexts'].fontSize = 12
P['unitframe'].font = 'EUI'
P['actionbar'].font = 'EUI'

if GetLocale()=="zhCN" then
	V["general"].dmgfont = "伤害数字"
	V["general"].namefont = "EUI"
	P['unitframe'].fontOutline = 'OUTLINE'
	P['actionbar'].fontOutline = 'OUTLINE'
	P['unitframe'].fontSize = 12
elseif GetLocale() == "koKR" then
	V["general"].dmgfont = "피해 수치"
	V["general"].namefont = "EUI"
	P['unitframe'].fontOutline = 'OUTLINE'
	P['actionbar'].fontOutline = 'OUTLINE'
	P['unitframe'].fontSize = 12
end	

P['chat'].keywords = '%MYNAME%, EUI'
P['chat'].sendRW = false
P['chat'].autoToggleBackdrop = false
P["actionbar"].euiabstyle = "None"
P["actionbar"].keyDown = false
P["actionbar"].rightClickCast = false
P["actionbar"].extraButtonScale = 1
P["actionbar"]["bar1"]["paging"]["ROGUE"] = "[stance:1] 7; [stance:2] 7; [stance:3] 10;"
P["actionbar"]["bar1"].backdrop = true
P["actionbar"]["bar1"].buttonspacing = 4
P["actionbar"]["bar1"].buttonsize = 30
P["actionbar"]["bar2"].buttonsize = 30
P["actionbar"]["bar3"].buttonsize = 30
P["actionbar"]["bar4"].buttonsize = 30
P["actionbar"]["bar5"].buttonsize = 30

P["actionbar"]["bar2"].buttonspacing = 4
P["actionbar"]["bar3"].buttonspacing = 4
P["actionbar"]["bar4"].buttonspacing = 4
P["actionbar"]["bar3"].backdrop = true
P["actionbar"]["bar5"].backdrop = true
P["actionbar"]["bar5"].buttonspacing = 4
P["actionbar"]["barPet"].buttonspacing = 4

P["actionbar"]["stanceBar"].buttonspacing = 4

for i = 6, 9 do
	P["actionbar"]['bar'..i] = {
		['enabled'] = false,
		['mouseover'] = false,
		['buttons'] = 12,
		['buttonsPerRow'] = 12,
		['point'] = 'BOTTOMLEFT',
		['backdrop'] = true,
		['heightMult'] = 1,
		['widthMult'] = 1,
		["buttonsize"] = 30,
		["buttonspacing"] = 4,		
		['alpha'] = 1,
		['paging'] = {},
		['visibility'] = "[vehicleui] hide; [overridebar] hide; [petbattle] hide; show",
	}
end

P['datatexts'].spec1 = '';
P['datatexts'].spec2 = '';
P['datatexts']['userColor'] = { r = 1, g = 1, b = 1 }
P['datatexts']['customColor'] = 2
P['datatexts']['panels']['MainABInfobar'] = {
	['left'] = '',
	['middle'] = '',
	['right'] = '',
}
P['datatexts']['panels']['ABLeftInfobar'] = ''
P['datatexts']['panels']['ABRightInfobar'] = ''
P['datatexts']['panels']['TopDataTextsBar1'] = 'E_Coord'
P['datatexts']['panels']['TopDataTextsBar2'] = 'E_Range'
P['datatexts']['panels']['TopDataTextsBar4'] = 'E_Zone'
P['datatexts']['panels']['TopDataTextsBar3'] = {
	['left'] = 'E_Menu',
	['right'] = 'E_Shortopt',
	['middle'] = 'E_Raidtool',
}

P['infobar'] = {
	['width'] = 74,
	['height'] = 22,
}


P["general"].panelWidth = 360
P["general"].transparent = false
P["general"].transparentStyle = 1
P["general"].classcolor = false
P['general'].bottomPanel = false
P["general"].uiscale = 0.71

P["skins"] = {
	fontSize = 12,
	barHeight = 10,
}

V['chat'].embedright = "None"
V['chat'].embedcombat = false
P['chat'].panelWidth = 362
P['chat'].panelHeight = 180
P['chat'].panelWidthRight = 362
P['chat'].panelHeightRight = 180
P['chat'].separateSizes = true
P['chat'].throttleInterval = 0
P['chat'].autojoin = true

P['tooltip'].range = true
P['tooltip'].achievementpoint = true
P['tooltip'].transparent = false
P['tooltip'].hh = true
P['tooltip'].mountinfo = true
P['tooltip'].itemCount = 'BOTH'

P["nameplate"].healthBar.text.enable = true
P["nameplate"].buffs.fontsize = 9
P["nameplate"].buffs.perrow = 8
P["nameplate"].debuffs.fontsize = 9
P["nameplate"].debuffs.perrow = 8
P["nameplate"].debuffs.stretchTexture = false
P["nameplate"].healthBar.text.format = 'CURRENT_PERCENT'
P["nameplate"].nonTargetAlpha = 0.75
P["nameplate"].classIcon = {
	['enable'] = true,
	['xOffset'] = -4,
	['yOffset'] = 6,
	['size'] = 36,
	['attachTo'] = 'LEFT',
}
P["nameplate"].raidHealIcon = {
	["markHealers"] = true,
	['xOffset'] = 4,
	['yOffset'] = 6,
	['size'] = 36,
	['attachTo'] = 'RIGHT',
}

P["unitframe"].number = "K"
P["unitframe"].colors.nameclasscolor = false
P["unitframe"].targetGlow = true
P["unitframe"].unitframeType = 1
P["unitframe"].transparent = false
P["unitframe"].powertrans = true
P['unitframe'].units.target.smartAuraDisplay = 'DISABLED'
P['unitframe'].units.target.rangeCheck = false
P['unitframe'].units.target.name.position = 'LEFT'
P['unitframe'].units.target.power.position = 'BOTTOMRIGHT'
P['unitframe'].units.target.debuffs.useWhitelist = {friendly = false, enemy = true}
P['unitframe'].units.target.buffs.playerOnly = {friendly = false, enemy = false}
P['unitframe'].units.target.castbar.InterruptSound = false
P['unitframe'].units.target.DragonOverlayStyle = 'none'
P['unitframe'].units.focus.castbar.InterruptSound = false
P['unitframe'].units.player.classbar.text = true
P['unitframe'].units.player.classbar.fill = 'spaced'
P['unitframe'].units.player.classbar.dkRunesBorderColor = true
P['unitframe'].units.player.aurabar.auraBarWidth = 270
P['unitframe'].units.player.aurabar.auraBarHeight = 20
P['unitframe'].units.player.aurabar.lock = true
P['unitframe'].units.player.aurabar.showValue = true
P['unitframe'].units.player.aurabar.maxDuration = 300
P['unitframe'].units.player.power.text_format = '[powercolor][power:current-percent]'
P['unitframe'].units.player.power.width = 'fill'
P['unitframe'].units.player.stagger.enable = false
P['unitframe'].units.target.aurabar.auraBarWidth = 270
P['unitframe'].units.target.aurabar.auraBarHeight = 20
P['unitframe'].units.target.aurabar.lock = true
P['unitframe'].units.target.aurabar.showValue = true
P['unitframe'].units.target.aurabar.attachTo = 'DEBUFFS'
P['unitframe'].units.target.power.width = 'fill'
P['unitframe'].units.target.tapped = {
	['position'] = 'TOPLEFT',
	['text_format'] = '||cFFB04F4F[tapped]||r',
}

P['unitframe'].units.focus.aurabar.auraBarWidth = 190
P['unitframe'].units.focus.aurabar.auraBarHeight = 20
P['unitframe'].units.focus.aurabar.lock = true
P['unitframe'].units.focus.aurabar.showValue = true
P['unitframe'].units.player.tankshield = {
	['enable'] = true,
--	['position'] = 'RIGHT',
	['xOffset'] = 0,
	['yOffset'] = 0,
	['sizeOverride'] = 0,
}
P['unitframe'].units.target.range = {
	['enable'] = true,
	['position'] = 'BOTTOMLEFT',
	['offsetX'] = 2,
	['offsetY'] = 2,
}
P['unitframe'].units.focus.range = {
	['enable'] = true,
	['position'] = 'TOPLEFT',
	['offsetX'] = 2,
	['offsetY'] = 2,
}

P['unitframe'].units.boss.health.text_format = '[healthcolor][health:current-percent]'
P['unitframe'].units.boss.targetBossColor = FACTION_BAR_COLORS[2]
P['unitframe'].units.boss.space = 12
P['unitframe'].units.boss.bossvisibility = false
P["unitframe"].units.player.Swing = {
	['enable'] = false,
	['width'] = 270,
	['height'] = 12,
	['text'] = true,
	['color'] = { r = 1,g = 1,b = 1 },
}
P["unitframe"].units.player.gcd = false
P["unitframe"].units.player.portrait.enable = true
P["unitframe"].units.player.portrait.overlay = true
P["unitframe"].units.player.portrait.alpha = 0.35
P["unitframe"].units.target.portrait.alpha = 0.35
P["unitframe"].units.boss.portrait.alpha = 0.35
P["unitframe"].units.player.classbar.totemtime = true
P["unitframe"].units.player.classbar.fill = 'spaced'
P["unitframe"].units.player.threatStyle = 'HEALTHBORDER'
P["unitframe"].units.player.combobar = {
	['enable'] = false,
	['fill'] = 'spaced',
	['height'] = 10,
}

P["unitframe"].units.targettarget.power.width = 'fill'
P["unitframe"].units.targettarget.name.length = 'LONGLEVEL'
P["unitframe"].colors.castColor = { r = .78,g = .67,b = .35 }
P["unitframe"].units.target.portrait.enable = true
P["unitframe"].units.target.portrait.overlay = true
P["unitframe"].units.target.debuffs.enable = true
P["unitframe"].units.target.threatStyle = 'HEALTHBORDER'
P["unitframe"].units.party.threatStyle = 'HEALTHBORDER'
P["unitframe"].units.party['portrait'] = {
	['enable'] = false,
	['width'] = 45,
	['overlay'] = false,
	['camDistanceScale'] = 1,
	['rotation'] = 0,
	['style'] = '3D'
}
P["unitframe"].units.party.verticalSpacing = 30
P["unitframe"].units.party.castbar = {
	['enable'] = true,
	['width'] = 180,
	['height'] = 18,
	['icon'] = true,
	['format'] = 'REMAINING',
	['spark'] = true,
}

P["unitframe"].units["raid"].width = 70
P["unitframe"].units["raid"].threatStyle = 'HEALTHBORDER'
P["unitframe"].units["raid"].power.width = 'fill'
P["unitframe"].units["raid"].debuffs.enable = false
P["unitframe"].units["raid"].debuffs.initialAnchor = 'BOTTOMRIGHT'
P["unitframe"].units["raid"].debuffs.anchorPoint = 'BOTTOMRIGHT'
P["unitframe"].units["raid"].debuffs['growth-x'] = 'LEFT'
P["unitframe"].units["raid"].debuffs.useFilter = 'RaidDebuffs'
P["unitframe"].units["raid"].rdebuffs.enable = true
P["unitframe"].units["raid"].rdebuffs.xOffset = 0
P["unitframe"].units["raid"].rdebuffs.yOffset = 2
P["unitframe"].units["raid"].roleIcon.position = 'BOTTOMLEFT'

P["unitframe"].units["raid"].health.text_format = '[status]'
P["unitframe"].units["raid"].health.colorClass = false
P["unitframe"].units["raid"].petframe = false
P["unitframe"].units["raid"].numGroups = 8
P["unitframe"].units["raid"].growthDirection = 'RIGHT_UP'
P["unitframe"].units["raid"].visibility = '[@raid2,noexists] hide;show';

P["unitframe"].colors.nameclasscolor = true

P["unitframe"].units.party.showRaid = false
P["unitframe"].units.party.visibility = "[@raid2,exists][nogroup] hide;show";

local unitsGroup = {'player', 'target', 'targettarget', 'targettargettarget', 'focus', 'focustarget', 'pet', 'pettarget'}
for i = 1, #unitsGroup do
	if P['unitframe'].units[unitsGroup[i]].health then
		P['unitframe'].units[unitsGroup[i]].health.orientation = 'HORIZONTAL'
	end
	if P['unitframe'].units[unitsGroup[i]].power then
		P['unitframe'].units[unitsGroup[i]].power.orientation = 'HORIZONTAL'
	end
end

P["unitframe"].units.attention =  {
	['enable'] = true,
	['width'] = 120,
	['height'] = 28,
}

G['InfoFilter'] = {
	['enable'] = true,
	['level'] = 10,
	['matchNum'] = 2,
	['Debug'] = false,
	['filterFriend'] = true,
	['blackName'] = {},
	['blackList'] = {
		["1-60"] = true,
		["1-90"] = true,
		["1-100"] = true,
		["90-100"] = true,
	},	
}

P["clickset"] = {
	['spec1'] = {
		["type1"] = "NONE",
		["shiftztype1"]	= "NONE",
		["ctrlztype1"]	= "NONE",
		["altztype1"]	= "NONE",
		["altzctrlztype1"]	= "NONE",
		["shiftzaltztype1"] = "NONE",
		["type2"]		= "NONE",
		["shiftztype2"]	= "NONE",
		["ctrlztype2"]	= "NONE",
		["altztype2"]	= "NONE",
		["altzctrlztype2"]	= "NONE",
		["shiftzaltztype2"] = "NONE",
		["type3"]		= "NONE",
		["shiftztype3"]	= "NONE",
		["ctrlztype3"]	= "NONE",
		["altztype3"]	= "NONE",
		["altzctrlztype3"]	= "NONE",
		["shiftzaltztype3"] = "NONE",	
		["shiftztype4"]	= "NONE",
		["ctrlztype4"]	= "NONE",
		["altztype4"]	= "NONE",
		["altzctrlztype4"]	= "NONE",
		["type4"] = "NONE",
		["shiftztype5"]	= "NONE",
		["ctrlztype5"]	= "NONE",
		["altztype5"]	= "NONE",
		["altzctrlztype5"]	= "NONE",
		["type5"] = "NONE",
	},
	['spec2'] = {
		["type1"] = "NONE",
		["shiftztype1"]	= "NONE",
		["ctrlztype1"]	= "NONE",
		["altztype1"]	= "NONE",
		["altzctrlztype1"]	= "NONE",
		["shiftzaltztype1"] = "NONE",
		["type2"]		= "NONE",
		["shiftztype2"]	= "NONE",
		["ctrlztype2"]	= "NONE",
		["altztype2"]	= "NONE",
		["altzctrlztype2"]	= "NONE",
		["shiftzaltztype2"] = "NONE",
		["type3"]		= "NONE",
		["shiftztype3"]	= "NONE",
		["ctrlztype3"]	= "NONE",
		["altztype3"]	= "NONE",
		["altzctrlztype3"]	= "NONE",	
		["shiftzaltztype3"] = "NONE",
		["shiftztype4"]	= "NONE",
		["ctrlztype4"]	= "NONE",
		["altztype4"]	= "NONE",
		["altzctrlztype4"]	= "NONE",
		["type4"] = "NONE",
		["shiftztype5"]	= "NONE",
		["ctrlztype5"]	= "NONE",
		["altztype5"]	= "NONE",
		["altzctrlztype5"]	= "NONE",
		["type5"] = "NONE",
	},
	["enable"] = false,
	["clicksetlist"] = {},
	["defaultlistloaded"] = false,
	["specswap"] = true,
}

local function SpellName(id)
--	local spellname = GetSpellInfo(id)
	return tostring(id)
end

P["euiscript"] = {
	['spellSay'] = true,
	['breeze'] = true,
	['gmm'] = true,
	['QSAlert'] = true,
	['FriendGroups'] = {
		enable = false,
		collapsed = {},
		hide_offline = false,
		colour_classes = true,
		enable_oqueue = true,
	},
	['bg'] = {
		['enable'] = true,
		['size'] = 40,
		['fontsize'] = 16,
	},
	['autoleavebnsec'] = -1,
	['gemplus'] = true,
	['threat'] = {
		enable = false,
		NameTextL = 4,
		ThreatLimited = 3,
		ThreatUnit = 'target',
		width = 170,
		height = 3,
		solo = false,
		font_size = 11,
	},
	['shenxian'] = {
		['enable'] = true,
		['size'] = 60,
		['selectmodel'] = 2,
		['combat'] = false,
	},
	["questnoti"] = {
		enable = false,
		Instance = true,
		Raid = true,
		Party = true,
		Solo = true,
		NoDetail = false,
		CompleteX = true,
	},
	["fivecombo"] = true,
	["bossnotes"] = true,
	["castby"] = true,
	["chatmod"] = true,
	["drag"] = true,
--	["ilevel"] = true,
	["sr"] = true,
	["statreport"] = true,
--	["talent"] = true,
	["tradetabs"] = true,
	["dispel"] = false,
	["raidcheck"] = true,
	["hovertip"] = true,
	["idq"] = false,
	["raidcd"] = true,
		["raidcd_width"] = 208,
		["raidcd_height"] = 20,
		["raidcd_maxbars"] = 10,
		["raidcd_direction"] = "down",
		["raidcd_style"] = 'bar',
		["raidcd_iconsize"] = 36,
		["raidcd_perrow"] = 10,
		["raidcd_icondirection"] = 'right',
		["raidcd_iconfontsize"] = 10,
		["raidcd_iconspace"] = 8,		
	["raid_spells"] = {
		[SpellName(20484)] = { cd = 600, enable = true},	
		[SpellName(126393)] = { cd = 600, enable = true}, 
		[SpellName(61999)] = { cd = 600, enable = true},	
		[SpellName(6346)] = { cd = 180, enable = true},	
		[SpellName(29166)] = { cd = 180, enable = true},	
		[SpellName(32182)] = { cd = 300, enable = true},	
		[SpellName(2825)] = { cd = 300, enable = true},	
		[SpellName(80353)] = { cd = 300, enable = true},	
		[SpellName(90355)] = { cd = 300, enable = true},


		[SpellName(33206)] = { cd = 180, enable = true},
		[SpellName(6940)] = { cd = 120, enable = true},
		[SpellName(102342)] = { cd = 60, enable = true},
		[SpellName(114030)] = { cd = 120, enable = true},
		[SpellName(47788)] = { cd = 180, enable = true},
	
	
		[SpellName(115310)] = { cd = 180, enable = true},
		[SpellName(108280)] = { cd = 180, enable = true},
		[SpellName(64843)] = { cd = 180, enable = true},
		[SpellName(740)] = { cd = 180, enable = true},
		[SpellName(15286)] = { cd = 180, enable = true},

	
		[SpellName(97462)] = { cd = 180, enable = true},  
		[SpellName(31821)] = { cd = 180, enable = true},  
		[SpellName(62618)] = { cd = 180, enable = true},  
		[SpellName(98008)] = { cd = 180, enable = true},  
		[SpellName(76577)] = { cd = 180, enable = true}, 
		[SpellName(51052)] = { cd = 120, enable = true}, 
		
	
		[SpellName(172106)] = { cd = 180, enable = true},  
		[SpellName(106898)] = { cd = 120, enable = true},  
		[SpellName(159916)] = { cd = 120, enable = true},	
		
	},		
	["classcd"] = true,
		["classcd_width"] = 130,
		["classcd_height"] = 40,
		["classcd_maxbars"] = 5,
		["classcd_direction"] = "right",
		["classcd_style"] = "icon",
	["wildmushroom"] = true,
		["wildmushroom_width"] = 208,
		["wildmushroom_height"] = 20,
		["wildmushroom_direction"] = "down",
	["priestpet"] = true,
		["priestpet_width"] = 208,
		["priestpet_height"] = 20,
	["mapfull"] = false,
	["chatbar"] = true,
	["chatbarName"] = false,
	["mapmove"] = true,
	["combatnoti"] = true,
		["combatnoti_leaving"] = "LEAVING COMBAT",
		["combatnoti_entering"] = "ENTERING COMBAT",
	["wgtimenoti"] = 'NONE',
	["lfgnoti"] = 'NONE',
	['holidayMsg'] = true,
--	["chatemote"] = true,
	["autogreed"] = false,
--	["buffreminder"] = true,
	["autoinvenable"] = true,
	["ainvkeyword"] = "eui",
	["errorenable"] = true,
--	["threat"] = true,
	["dcp"] = false,
	["autosell"] = true,
	["autosellList"] = {},
	["autoLFG"] = false,
	["MozzFullWorldMap"] = {},
	["autobutton"] = {
		["enable"] = true,
		["questNum"] = 5,
		["itemList"] = {},
		["slotNum"] = 5,
		["slotList"] = {},
		["countFontSize"] = 18,
		["bindFontSize"] = 10,
		["whiteList"] = {
			[90006] = true, 
			[86534] = true,
			[86536] = true,
			[76097] = true, 
			[76098] = true, 
			[5512] = true,  
			[36799] = true, 
			[81901] = true, 
			[76089] = true, 
			[76090] = true, 
			[76093] = true,  
			[76094] = true, 
			[76095] = true, 
			[86125] = true, 
			[86569] = true, 
			[118922] = true, 
			
			[63359] = true,
			[64398] = true,
			[64399] = true,
			[18606] = true,
			[64400] = true,
			[64401] = true,
			[64402] = true,
			[18607] = true,
			
			[109217] = true,
			[109218] = true,
			[109219] = true,
			[109220] = true,
			[109221] = true,
			[109222] = true,
			[109223] = true,
		},
		['blankList'] = {},
		['blankitemID'] = '',
		['itemID'] = '',
		['questPerRow'] = 5,
		['questSize'] = 40,
		['slotPerRow'] = 5,
		['slotSize'] = 40,
	},
	['wsbutton'] = {
		["enable"] = true,
		["size"] = 40,
		["fontsize"] = 20,
	},
	['euiDistance30'] = {
		["enable"] = false,
		["size"] = 60,
		["fontsize"] = 24,
	},
	['vbutton'] = {
		["enable"] = true,
		["size"] = 50,
		["fontsize"] = 18,
	},	
	['fsbutton'] = {
		["enable"] = true,
		["size"] = 58,
		["fontsize"] = 20,
		["maxValue"] = 50000,
		["overlay"] = true,
		['sound'] = "Whisper Alert",
	},	
	["cameraspeed"] = 15,
	["camerafactor"] = 2,
	["cameradistance"] = 20,
	["auto_confirm_de"] = false,
	["bloodshield"] = false,
	["autobuy"] = true,
	["autobuy_maxlevel"] = MAX_PLAYER_LEVEL;
	['autobuylist'] = {
		["79249"] = 20, 
	},
	["bgInfo"] = true,
	["TaintError"] = false,
	["achievementpoint"] = true,
	["myslot"] = '',
	["raid_marking1"] = 'alt',
	["raid_marking2"] = 'LeftButton',
	["autochangeloot"] = false,
	['inviteRank'] = 4,
	['embedfocuser1'] = 'shift',
	['embedfocuser2'] = '1',
	['buttonCollect'] = true,
	['buttonCollectDC'] = 'DOWN',
	['autoscreenshoot'] = true,
	['logging_combat'] = false,
	["SavedAddonProfiles"] = {},
	["SavedAddonTalent"] = {},
	["SavedAddonTalentReload"] = false,
	["LCData"] = {
		enable = true,
		minRank = 2,
		disenchanter = '',
		allowPersonalVotes = true,
		broadcastChannel = 1,
	},	
	['executebutton'] = {
		["enable"] = true,
		["size"] = 60,
		["fontsize"] = 16,
		['sound'] = "None",
		['instance'] = false,
		['spellList'] = {
			['DEATHKNIGHT'] = {
				[1] = {
					['enabled'] = false,
					['spellid'] = 114866,
					['perc'] = 35,
				},
				[2] = {
					['enabled'] = true,
					['spellid'] = 130735,
					['perc'] = 35,
				},
				[3] = {
					['enabled'] = true,
					['spellid'] = 130736,
					['perc'] = 45,
				},
			},
			['WARRIOR'] = {
				[1] = {
					['enabled'] = true,
					['spellid'] = 5308,
					['perc'] = 20,
				},
				[2] = {
					['enabled'] = true,
					['spellid'] = 5308,
					['perc'] = 20,
				},
				[3] = {
					['enabled'] = true,
					['spellid'] = 5308,
					['perc'] = 20,
				},				
			},
			['PRIEST'] = {
				[1] = {
					['enabled'] = false,
					['spellid'] = 32379,
					['perc'] = 20,
				},
				[2] = {
					['enabled'] = false,
					['spellid'] = 32379,
					['perc'] = 20,
				},				
				[3] = {
					['enabled'] = true,
					['spellid'] = 32379,
					['perc'] = 20,
				},
			},
			['WARLOCK'] = {
				[1] = {
					['enabled'] = true,
					['spellid'] = 32862,
					['perc'] = 20,
				},
				[2] = {
					['enabled'] = true,
					['spellid'] = 6353,
					['perc'] = 25,
				},
				[3] = {
					['enabled'] = true,
					['spellid'] = 17877,
					['perc'] = 20,
				},
			},
			['MONK'] = {
				[1] = {
					['enabled'] = false,
					['spellid'] = 115080,
					['perc'] = 100,
				},		
				[3] = {
					['enabled'] = true,
					['spellid'] = 115080,
					['perc'] = 100,
				},
			},		
			['PALADIN'] = {
				[3] = {
					['enabled'] = true,
					['spellid'] = 24275,
					['perc'] = 20,
				},
			},
			['DRUID'] = {
				[2] = {
					['enabled'] = true,
					['spellid'] = 22568,
					['perc'] = 25,
				},
			},
			['HUNTER'] = {
				[1] = {
					['enabled'] = true,
					['spellid'] = 53351,
					['perc'] = 20,
				},
				[2] = {
					['enabled'] = true,
					['spellid'] = 53351,
					['perc'] = 35,
				},
				[3] = {
					['enabled'] = false,
					['spellid'] = 53351,
					['perc'] = 20,
				},
			},
			['ROGUE'] = {
				[1] = {
					['enabled'] = true,
					['spellid'] = 111240,
					['perc'] = 35,
				},
			},
			['MAGE'] = {
			},
			['SHAMAN'] = {
			},	
		},
	},
	['afkspincamera'] = true,
	['announcements'] = false,
}

if(GetLocale()=="zhCN") then
	P["euiscript"].combatnoti_entering = "进入战斗状态"
	P["euiscript"].combatnoti_leaving = "离开战斗状态"
elseif (GetLocale()=="koKR") then
	P["euiscript"].combatnoti_entering = "전투 시작"
	P["euiscript"].combatnoti_leaving = "전투 종료"
else
	P["euiscript"].combatnoti_entering = "ENTERING COMBAT"
	P["euiscript"].combatnoti_leaving = "LEAVING COMBAT"
end

E.ClickSets_Sets = {
	PRIEST = { 
			["shift-type1"]	= 139,
			["ctrl-type1"]	= 527,
			["alt-type1"]	= 2061,
			["alt-ctrl-type1"]	= 2006,
			["type2"]		= 17,
			["shift-type2"]	= 33076,
			["ctrl-type2"]	= 528,
			["alt-type2"]	= 2060,
			["alt-ctrl-type2"]	= 32546,
			["type3"]		= 34861,
			["shift-type3"] = 2050, 
			["alt-type3"] = 1706, 
			["ctrl-type3"] = 21562,
			["type4"] = 596, 
			["shift-type4"] = 47758, 
			["ctrl-type4"] = 73325, 
			["type5"] = 48153, 
			["shift-type5"] = 88625, 
			["ctrl-type5"] = 33206,
	},
	
	DRUID = { --XD
			["shift-type1"]	= 774,
			["ctrl-type1"]	= 2782,
			["alt-type1"]	= 8936,
			["alt-ctrl-type1"]	= 50769,
			["type2"]		= 48438,
			["shift-type2"]	= 18562,
			["ctrl-type2"]	= 88423, 
			["alt-type2"]	= 50464,
			["alt-ctrl-type2"] = 1126, 
			["type3"]		= 33763,
			["shift-type3"] = 5185,
			["ctrl-type3"] = 20484,
			["alt-type3"] = 29166, 
	},
	SHAMAN = { --SM
			["alt-type1"]	= 8004,		
			["shift-type1"]	= 974,		
			["ctrl-type1"]	= 1064,		
			["alt-ctrl-type1"]	= 2008,	
			["type2"]		= 61295,	
			["alt-type2"]	= 331,		
			["shift-type2"]	= 77472,	
			["ctrl-type2"]	= 51886,	
			["type3"]		= 1064,		
			["shift-type3"] = 546, 
			["alt-type3"] = 131, 
	},

	PALADIN = { --QS
			["shift-type1"]	= 19750,
			["alt-type1"]	= 635,
			["ctrl-type1"]	= 53563,
			["alt-ctrl-type1"]	= 7328,
		["type2"]		= 20473,
			["shift-type2"]	= 82326,
			["ctrl-type2"]	= 4987,
			["alt-type2"]	= 85673,
			["alt-ctrl-type2"]	= 633,
		["type3"]		= 31789,
			["alt-type3"]	= 20217,
			["shift-type3"]	= 20911,
			["ctrl-type3"]	= 19740,
			["alt-ctrl-type3"] = 31789, 
		["type4"] = 1022, 
			["alt-type4"] = 1044, 
			["shift-type4"] = 1038, 
			["ctrl-type4"] = 6940, 
	},

	WARRIOR = { --ZS
			["ctrl-type1"]	= 50720,
			["type2"]		= 3411,
	},

	MAGE = { --FS
			["alt-type1"]	= 1459,
			["ctrl-type1"]	= 54646,
			["type2"]		= 475,
			["shift-type2"]	= 130,
	},

	WARLOCK = { --SS
			["alt-type1"]	= 80398,
			["type2"]		= 5697,
	},

	HUNTER = { --LR
			["type2"]		= 34477,
			["shift-type2"] = 136, 
	},
	
	ROGUE = { --DZ
			["type2"]		= 57933,
	},
	
	DEATHKNIGHT = {
			["shift-type1"] = 61999, 
			["type2"] = 47541, 
			["type3"] = 49016, 
	},
	MONK = {
			["shift-type1"] = 115450, 
			["alt-type1"]	= 116849, 
			["ctrl-type1"]	= 115175,
			["type2"]		= 124682,
			["alt-type2"]	= 116841,
			["shift-type2"]	= 115151,
	},	
}

local class = select(2, UnitClass("player"))
if class == 'PRIEST' then
	P['unitframe'].units.player.tankshield.enable = false
end

for k, v in pairs(E.ClickSets_Sets[class]) do
	if GetSpellInfo(v) then P["clickset"]['spec1'][string.gsub(k,"-","z")] = GetSpellInfo(v) end
	if GetSpellInfo(v) then P["clickset"]['spec2'][string.gsub(k,"-","z")] = GetSpellInfo(v) end
end

E.build = GetAddOnMetadata("EuiScript", "Version")

if GetLocale() == 'koKR' then
	E.MoveTooltip = {
	}
else
	E.MoveTooltip = {}
end
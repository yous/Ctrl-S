local E, L, V, P, G, _ = unpack(select(2, ...)); --Engine

local function SpellName(id)
	local name, _, _, _, _, _, _, _, _ = GetSpellInfo(id) 	
	if not name then
		print('|cff1784d1ElvUI:|r SpellID is not valid: '..id..'. Please check for an updated version, if none exists report to ElvUI author.')
		return 'Impale'
	else
		return name
	end
end

local function Defaults(priorityOverride)
	return {['enable'] = true, ['priority'] = priorityOverride or 0}
end

local function DefaultsID(spellID, priorityOverride)
	return {['enable'] = true, ['spellID'] = spellID, ['priority'] = priorityOverride or 0}
end
G.unitframe.aurafilters = {};

--[[
	These are debuffs that are some form of CC
]]
G.unitframe.aurafilters['CCDebuffs'] = {
	['type'] = 'Whitelist',
	['spells'] = {
		-- Death Knight
			[SpellName(47476)] = Defaults(), --Strangulate
			[SpellName(91800)] = Defaults(), --Gnaw (Pet)
			[SpellName(91807)] = Defaults(), --Shambling Rush (Pet)
			[SpellName(91797)] = Defaults(), --Monstrous Blow (Pet)
			[SpellName(108194)] = Defaults(), --Asphyxiate
			[SpellName(115001)] = Defaults(), --Remorseless Winter
		-- Druid
			[SpellName(33786)] = Defaults(), --Cyclone
		--	[SpellName(2637)] = Defaults(), --Hibernate
			[SpellName(339)] = Defaults(), --Entangling Roots
			[SpellName(78675)] = Defaults(), --Solar Beam
			[SpellName(22570)] = Defaults(), --Maim
			[SpellName(5211)] = Defaults(), --Mighty Bash
		--	[SpellName(9005)] = Defaults(), --Pounce
			[SpellName(102359)] = Defaults(), --Mass Entanglement
			[SpellName(99)] = Defaults(), --Disorienting Roar
			[SpellName(127797)] = Defaults(), --Ursol's Vortex
			[SpellName(45334)] = Defaults(), --Immobilized
		--	[SpellName(102795)] = Defaults(), --Bear Hug
			[SpellName(114238)] = Defaults(), --Fae Silence
		--	[SpellName(113004)] = Defaults(), --Intimidating Roar (Warrior Symbiosis)
		-- Hunter
			[SpellName(3355)] = Defaults(), --Freezing Trap
		--	[SpellName(1513)] = Defaults(), --Scare Beast
		--	[SpellName(19503)] = Defaults(), --Scatter Shot
		--	[SpellName(34490)] = Defaults(), --Silencing Shot
			[SpellName(24394)] = Defaults(), --Intimidation
			[SpellName(64803)] = Defaults(), --Entrapment
			[SpellName(19386)] = Defaults(), --Wyvern Sting
			[SpellName(117405)] = Defaults(), --Binding Shot
			[SpellName(128405)] = Defaults(), --Narrow Escape
		--	[SpellName(50519)] = Defaults(), --Sonic Blast (Bat)
		--	[SpellName(91644)] = Defaults(), --Snatch (Bird of Prey)
		--	[SpellName(90337)] = Defaults(), --Bad Manner (Monkey)
		--	[SpellName(54706)] = Defaults(), --Venom Web Spray (Silithid)
		--	[SpellName(4167)] = Defaults(), --Web (Spider)
		--	[SpellName(90327)] = Defaults(), --Lock Jaw (Dog)
		--	[SpellName(56626)] = Defaults(), --Sting (Wasp)
		--	[SpellName(50245)] = Defaults(), --Pin (Crab)
		--	[SpellName(50541)] = Defaults(), --Clench (Scorpid)
		--	[SpellName(96201)] = Defaults(), --Web Wrap (Shale Spider)
		-- Mage
			[SpellName(31661)] = Defaults(), --Dragon's Breath
			[SpellName(118)] = Defaults(), --Polymorph
		--	[SpellName(55021)] = Defaults(), --Silenced - Improved Counterspell
			[SpellName(122)] = Defaults(), --Frost Nova
			[SpellName(82691)] = Defaults(), --Ring of Frost
		--	[SpellName(118271)] = Defaults(), --Combustion Impact
			[SpellName(44572)] = Defaults(), --Deep Freeze
			[SpellName(33395)] = Defaults(), --Freeze (Water Ele)
			[SpellName(102051)] = Defaults(), --Frostjaw
		-- Paladin
			[SpellName(20066)] = Defaults(), --Repentance
			[SpellName(10326)] = Defaults(), --Turn Evil
			[SpellName(853)] = Defaults(), --Hammer of Justice
			[SpellName(105593)] = Defaults(), --Fist of Justice
			[SpellName(31935)] = Defaults(), --Avenger's Shield
			[SpellName(105421)] = Defaults(), --Blinding Light
		-- Priest
			[SpellName(605)] = Defaults(), --Dominate Mind
			[SpellName(64044)] = Defaults(), --Psychic Horror
			--[SpellName(64058)] = Defaults(), --Psychic Horror (Disarm)
			[SpellName(8122)] = Defaults(), --Psychic Scream
			[SpellName(9484)] = Defaults(), --Shackle Undead
			[SpellName(15487)] = Defaults(), --Silence
			[SpellName(114404)] = Defaults(), --Void Tendrils
			[SpellName(88625)] = Defaults(), --Holy Word: Chastise
		--	[SpellName(113792)] = Defaults(), --Psychic Terror (Psyfiend)
			[SpellName(87194)] = Defaults(), --Sin and Punishment
		-- Rogue
			[SpellName(2094)] = Defaults(), --Blind
			[SpellName(1776)] = Defaults(), --Gouge
			[SpellName(6770)] = Defaults(), --Sap
			[SpellName(1833)] = Defaults(), --Cheap Shot
		--	[SpellName(51722)] = Defaults(), --Dismantle
			[SpellName(1330)] = Defaults(), --Garrote - Silence
			[SpellName(408)] = Defaults(), --Kidney Shot
			[SpellName(88611)] = Defaults(), --Smoke Bomb
		--	[SpellName(115197)] = Defaults(), --Partial Paralytic
		--	[SpellName(113953)] = Defaults(), --Paralysis
		-- Shaman
			[SpellName(51514)] = Defaults(), --Hex
			[SpellName(64695)] = Defaults(), --Earthgrab
			[SpellName(63685)] = Defaults(), --Freeze (Frozen Power)
		--	[SpellName(76780)] = Defaults(), --Bind Elemental
			[SpellName(118905)] = Defaults(), --Static Charge
			[SpellName(118345)] = Defaults(), --Pulverize (Earth Elemental)
		-- Warlock
			[SpellName(710)] = Defaults(), --Banish
			[SpellName(6789)] = Defaults(), --Mortal Coil
			[SpellName(118699)] = Defaults(), --Fear
			[SpellName(5484)] = Defaults(), --Howl of Terror
			[SpellName(6358)] = Defaults(), --Seduction
			[SpellName(30283)] = Defaults(), --Shadowfury
		--	[SpellName(24259)] = Defaults(), --Spell Lock (Felhunter)
		--	[SpellName(115782)] = Defaults(), --Optical Blast (Observer)
			[SpellName(115268)] = Defaults(), --Mesmerize (Shivarra)
		--	[SpellName(118093)] = Defaults(), --Disarm (Voidwalker)
			[SpellName(89766)] = Defaults(), --Axe Toss (Felguard)
			[SpellName(137143)] = Defaults(), --Blood Horror
		-- Warrior
		--	[SpellName(20511)] = Defaults(), --Intimidating Shout
			[SpellName(7922)] = Defaults(), --Charge Stun
		--	[SpellName(676)] = Defaults(), --Disarm
			[SpellName(105771)] = Defaults(), --Warbringer
			[SpellName(107566)] = Defaults(), --Staggering Shout
			[SpellName(132168)] = Defaults(), --Shockwave
			[SpellName(107570)] = Defaults(), --Storm Bolt
			[SpellName(118895)] = Defaults(), --Dragon Roar
			[SpellName(18498)] = Defaults(), --Gag Order
		-- Monk
			[SpellName(116706)] = Defaults(), --Disable
		--	[SpellName(117368)] = Defaults(), --Grapple Weapon
			[SpellName(115078)] = Defaults(), --Paralysis
		--	[SpellName(122242)] = Defaults(), --Clash
			[SpellName(119392)] = Defaults(), --Charging Ox Wave
			[SpellName(119381)] = Defaults(), --Leg Sweep
			[SpellName(120086)] = Defaults(), --Fists of Fury
		--	[SpellName(116709)] = Defaults(), --Spear Hand Strike
		--	[SpellName(123407)] = Defaults(), --Spinning Fire Blossom
			[SpellName(140023)] = Defaults(), --Ring of Peace
		-- Racial
			[SpellName(25046)] = Defaults(), --Arcane Torrent
			[SpellName(20549)] = Defaults(), --War Stomp
			[SpellName(107079)] = Defaults(), --Quaking Palm
	},
}

--[[
	These are buffs that can be considered "protection" buffs
]]
G.unitframe.aurafilters['TurtleBuffs'] = {
	['type'] = 'Whitelist',
	['spells'] = {
		--Mage
			[SpellName(45438)] = Defaults(5), -- Ice Block
			[SpellName(115610)] = Defaults(), -- Temporal Shield
		--Death Knight
			[SpellName(48797)] = Defaults(5), -- Anti-Magic Shell
			[SpellName(48792)] = Defaults(), -- Icebound Fortitude
			[SpellName(49039)] = Defaults(), -- Lichborne
			[SpellName(87256)] = Defaults(4), -- Dancing Rune Weapon
			[SpellName(55233)] = Defaults(), -- Vampiric Blood
			[SpellName(50461)] = Defaults(), -- Anti-Magic Zone
		--Priest
			[SpellName(33206)] = Defaults(3), -- Pain Suppression
			[SpellName(47788)] = Defaults(), -- Guardian Spirit
			[SpellName(62618)] = Defaults(), -- Power Word: Barrier
			[SpellName(47585)] = Defaults(5), -- Dispersion
		--Warlock
			[SpellName(104773)] = Defaults(), -- Unending Resolve
			[SpellName(110913)] = Defaults(), -- Dark Bargain
			[SpellName(108359)] = Defaults(), -- Dark Regeneration
		--Druid
			[SpellName(22812)] = Defaults(2), -- Barkskin
			[SpellName(102342)] = Defaults(2), -- Ironbark
			[SpellName(61336)] = Defaults(), -- Survival Instincts
		--Hunter
			[SpellName(19263)] = Defaults(5), -- Deterrence
			[SpellName(53480)] = Defaults(), -- Roar of Sacrifice (Cunning)
		--Rogue
			[SpellName(1966)] = Defaults(), -- Feint
			[SpellName(31224)] = Defaults(), -- Cloak of Shadows
			[SpellName(74001)] = Defaults(), -- Combat Readiness
			--[SpellName(74002)] = Defaults(), -- Combat Insight (stacking buff from CR)
			[SpellName(5277)] = Defaults(5), -- Evasion
			[SpellName(45182)] = Defaults(), -- Cheating Death
		--Shaman
			[SpellName(98007)] = Defaults(), -- Spirit Link Totem
			[SpellName(30823)] = Defaults(), -- Shamanistic Rage
			[SpellName(108271)] = Defaults(), -- Astral Shift
		--Paladin
			[SpellName(1022)] = Defaults(5), -- Hand of Protection
			[SpellName(6940)] = Defaults(), -- Hand of Sacrifice
			[SpellName(114039)] = Defaults(), -- Hand of Purity
			[SpellName(31821)] = Defaults(3), -- Devotion Aura
			[SpellName(498)] = Defaults(2), -- Divine Protection
			[SpellName(642)] = Defaults(5), -- Divine Shield
			[SpellName(86659)] = Defaults(4), -- Guardian of the Ancient Kings (Prot)
			[SpellName(31850)] = Defaults(4), -- Ardent Defender
		--Warrior
			[SpellName(118038)] = Defaults(5), -- Die by the Sword
			[SpellName(55694)] = Defaults(), -- Enraged Regeneration
			[SpellName(97463)] = Defaults(), -- Rallying Cry
			[SpellName(12975)] = Defaults(), -- Last Stand
			[SpellName(114029)] = Defaults(2), -- Safeguard
			[SpellName(871)] = Defaults(3), -- Shield Wall
			[SpellName(114030)] = Defaults(), -- Vigilance
		--Monk
			[SpellName(120954)] = Defaults(2), -- Fortifying Brew
		--	[SpellName(131523)] = Defaults(5), -- Zen Meditation
			[SpellName(122783)] = Defaults(), -- Diffuse Magic
			[SpellName(122278)] = Defaults(), -- Dampen Harm
		--	[SpellName(115213)] = Defaults(), -- Avert Harm
			[SpellName(116849)] = Defaults(), -- Life Cocoon
		--Racial
			[SpellName(20594)] = Defaults(), -- Stoneform
	},
}

G.unitframe.aurafilters['PlayerBuffs'] = {
	['type'] = 'Whitelist',
	['spells'] = {
		--Mage
			[SpellName(45438)] = Defaults(), -- Ice Block
			[SpellName(115610)] = Defaults(), -- Temporal Shield
			[SpellName(110909)] = Defaults(), -- Alter Time
			[SpellName(12051)] = Defaults(), -- Evocation
			[SpellName(12472)] = Defaults(), -- Icy Veins
			[SpellName(80353)] = Defaults(), -- Time Warp
			[SpellName(12042)] = Defaults(), -- Arcane Power
			[SpellName(32612)] = Defaults(), -- Invisibility
			[SpellName(110960)] = Defaults(), -- Greater Invisibility
			[SpellName(108839)] = Defaults(), -- Ice Flows
			[SpellName(111264)] = Defaults(), -- Ice Ward
			[SpellName(108843)] = Defaults(), -- Blazing Speed
		--Death Knight
			[SpellName(48797)] = Defaults(), -- Anti-Magic Shell
			[SpellName(48792)] = Defaults(), -- Icebound Fortitude
			[SpellName(49039)] = Defaults(), -- Lichborne
			[SpellName(87256)] = Defaults(), -- Dancing Rune Weapon
			[SpellName(49222)] = Defaults(), -- Bone Shield
			[SpellName(55233)] = Defaults(), -- Vampiric Blood
			[SpellName(50461)] = Defaults(), -- Anti-Magic Zone
		--	[SpellName(49016)] = Defaults(), -- Unholy Frenzy
			[SpellName(51271)] = Defaults(), -- Pillar of Frost
			[SpellName(96268)] = Defaults(), -- Death's Advance
		--Priest
			[SpellName(33206)] = Defaults(), -- Pain Suppression
			[SpellName(47788)] = Defaults(), -- Guardian Spirit
			[SpellName(62618)] = Defaults(), -- Power Word: Barrier
			[SpellName(47585)] = Defaults(), -- Dispersion
			[SpellName(6346)] = Defaults(), -- Fear Ward
			[SpellName(10060)] = Defaults(), -- Power Infusion
			[SpellName(114239)] = Defaults(), -- Phantasm
			[SpellName(119032)] = Defaults(), -- Spectral Guise
			[SpellName(27827)] = Defaults(), -- Spirit of Redemption
		--Warlock
			[SpellName(104773)] = Defaults(), -- Unending Resolve
			[SpellName(110913)] = Defaults(), -- Dark Bargain
			[SpellName(108359)] = Defaults(), -- Dark Regeneration
			[SpellName(113860)] = Defaults(), -- Dark Sould: Misery
			[SpellName(113861)] = Defaults(), -- Dark Soul: Knowledge
			[SpellName(113858)] = Defaults(), -- Dark Soul: Instability
			[SpellName(88448)] = Defaults(), -- Demonic Rebirth
		--Druid
			[SpellName(22812)] = Defaults(), -- Barkskin
			[SpellName(102342)] = Defaults(), -- Ironbark
			[SpellName(61336)] = Defaults(), -- Survival Instincts
			[SpellName(117679)] = Defaults(), -- Incarnation (Tree of Life)
			[SpellName(102543)] = Defaults(), -- Incarnation: King of the Jungle
			[SpellName(102558)] = Defaults(), -- Incarnation: Son of Ursoc
			[SpellName(102560)] = Defaults(), -- Incarnation: Chosen of Elune
		--	[SpellName(16689)] = Defaults(), -- Nature's Grasp
			[SpellName(132158)] = Defaults(), -- Nature's Swiftness
			[SpellName(106898)] = Defaults(), -- Stampeding Roar
			[SpellName(1850)] = Defaults(), -- Dash
			[SpellName(106951)] = Defaults(), -- Berserk
		--	[SpellName(29166)] = Defaults(), -- Innervate
			[SpellName(52610)] = Defaults(), -- Savage Roar
			[SpellName(69369)] = Defaults(), -- Predatory Swiftness
			[SpellName(112071)] = Defaults(), -- Celestial Alignment
			[SpellName(124974)] = Defaults(), -- Nature's Vigil
		--Hunter
			[SpellName(19263)] = Defaults(), -- Deterrence
			[SpellName(53480)] = Defaults(), -- Roar of Sacrifice (Cunning)
			[SpellName(51755)] = Defaults(), -- Camouflage
			[SpellName(54216)] = Defaults(), -- Master's Call
		--	[SpellName(34471)] = Defaults(), -- The Beast Within
			[SpellName(3045)] = Defaults(), -- Rapid Fire
			[SpellName(3584)] = Defaults(), -- Feign Death
			[SpellName(131894)] = Defaults(), -- A Murder of Crows
			[SpellName(90355)] = Defaults(), -- Ancient Hysteria
			[SpellName(90361)] = Defaults(), -- Spirit Mend
		--Rogue
			[SpellName(31224)] = Defaults(), -- Cloak of Shadows
			[SpellName(74001)] = Defaults(), -- Combat Readiness
			--[SpellName(74002)] = Defaults(), -- Combat Insight (stacking buff from CR)
			[SpellName(5277)] = Defaults(), -- Evasion
			[SpellName(45182)] = Defaults(), -- Cheating Death
			[SpellName(51713)] = Defaults(), -- Shadow Dance
			[SpellName(114018)] = Defaults(), -- Shroud of Concealment
			[SpellName(2983)] = Defaults(), -- Sprint
		--	[SpellName(121471)] = Defaults(), -- Shadow Blades
			[SpellName(11327)] = Defaults(), -- Vanish
			[SpellName(108212)] = Defaults(), -- Burst of Speed
			[SpellName(57933)] = Defaults(), -- Tricks of the Trade
			[SpellName(79140)] = Defaults(), -- Vendetta
			[SpellName(13750)] = Defaults(), -- Adrenaline Rush
		--Shaman
			[SpellName(98007)] = Defaults(), -- Spirit Link Totem
			[SpellName(30823)] = Defaults(), -- Shamanistic Rage
			[SpellName(108271)] = Defaults(), -- Astral Shift
			[SpellName(16188)] = Defaults(), -- Ancestral Swiftness
			[SpellName(2825)] = Defaults(), -- Bloodlust
			[SpellName(79206)] = Defaults(), -- Spiritwalker's Grace
		--	[SpellName(16191)] = Defaults(), -- Mana Tide
			[SpellName(8178)] = Defaults(), -- Grounding Totem Effect
			[SpellName(58875)] = Defaults(), -- Spirit Walk
			[SpellName(108281)] = Defaults(), -- Ancestral Guidance
			[SpellName(108271)] = Defaults(), -- Astral Shift
			[SpellName(16166)] = Defaults(), -- Elemental Mastery
			[SpellName(114896)] = Defaults(), -- Windwalk Totem
		--Paladin
			[SpellName(1044)] = Defaults(), -- Hand of Freedom
			[SpellName(1022)] = Defaults(), -- Hand of Protection
			[SpellName(1038)] = Defaults(), -- Hand of Salvation
			[SpellName(6940)] = Defaults(), -- Hand of Sacrifice
			[SpellName(114039)] = Defaults(), -- Hand of Purity
			[SpellName(31821)] = Defaults(), -- Devotion Aura
			[SpellName(498)] = Defaults(), -- Divine Protection
			[SpellName(642)] = Defaults(), -- Divine Shield
			[SpellName(86659)] = Defaults(), -- Guardian of the Ancient Kings (Prot)
			[SpellName(148039)] = Defaults(), -- Sacred Shield
			[SpellName(31850)] = Defaults(), -- Ardent Defender
			[SpellName(31884)] = Defaults(), -- Avenging Wrath
			[SpellName(53563)] = Defaults(), -- Beacon of Light
			[SpellName(31842)] = Defaults(), -- Divine Favor
		--	[SpellName(54428)] = Defaults(), -- Divine Plea
			[SpellName(105809)] = Defaults(), -- Holy Avenger
			[SpellName(85499)] = Defaults(), -- Speed of Light
		--Warrior
			[SpellName(118038)] = Defaults(), -- Die by the Sword
			[SpellName(55694)] = Defaults(), -- Enraged Regeneration
			[SpellName(97463)] = Defaults(), -- Rallying Cry
			[SpellName(12975)] = Defaults(), -- Last Stand
			[SpellName(114029)] = Defaults(), -- Safeguard
			[SpellName(871)] = Defaults(), -- Shield Wall
			[SpellName(114030)] = Defaults(), -- Vigilance
			[SpellName(18499)] = Defaults(), -- Berserker Rage
		--	[SpellName(85730)] = Defaults(), -- Deadly Calm
			[SpellName(1719)] = Defaults(), -- Recklessness
			[SpellName(23920)] = Defaults(), -- Spell Reflection
			[SpellName(114028)] = Defaults(), -- Mass Spell Reflection
			[SpellName(46924)] = Defaults(), -- Bladestorm
			[SpellName(3411)] = Defaults(), -- Intervene
			[SpellName(107574)] = Defaults(), -- Avatar
		--Monk
			[SpellName(120954)] = Defaults(), -- Fortifying Brew
		--	[SpellName(131523)] = Defaults(), -- Zen Meditation
			[SpellName(122783)] = Defaults(), -- Diffuse Magic
			[SpellName(122278)] = Defaults(), -- Dampen Harm
		--	[SpellName(115213)] = Defaults(), -- Avert Harm
			[SpellName(116849)] = Defaults(), -- Life Cocoon
			[SpellName(125174)] = Defaults(), -- Touch of Karma
			[SpellName(116841)] = Defaults(), -- Tiger's Lust
		--Racial
			[SpellName(20594)] = Defaults(), -- Stoneform
			[SpellName(59545)] = Defaults(), -- Gift of the Naaru
			[SpellName(20572)] = Defaults(), -- Blood Fury
			[SpellName(26297)] = Defaults(), -- Berserking
			[SpellName(68992)] = Defaults(), -- Darkflight			
	},
}



--[[
	Buffs that really we dont need to see
]]

G.unitframe.aurafilters['Blacklist'] = {
	['type'] = 'Blacklist',
	['spells'] = {
		[SpellName(36900)] = Defaults(), --Soul Split: Evil!
		[SpellName(36901)] = Defaults(), --Soul Split: Good
		[SpellName(36893)] = Defaults(), --Transporter Malfunction
		[SpellName(114216)] = Defaults(), --Angelic Bulwark
		[SpellName(97821)] = Defaults(), --Void-Touched
		[SpellName(36032)] = Defaults(), -- Arcane Charge
	--	[SpellName(132365)] = Defaults(), -- Vengeance
		[SpellName(8733)] = Defaults(), --Blessing of Blackfathom
		[SpellName(57724)] = Defaults(), --Sated
		[SpellName(25771)] = Defaults(), --forbearance
		[SpellName(57723)] = Defaults(), --Exhaustion
		[SpellName(36032)] = Defaults(), --arcane blast
		[SpellName(58539)] = Defaults(), --watchers corpse
		[SpellName(26013)] = Defaults(), --deserter
		[SpellName(6788)] = Defaults(), --weakended soul
		[SpellName(71041)] = Defaults(), --dungeon deserter
		[SpellName(41425)] = Defaults(), --"Hypothermia"
		[SpellName(55711)] = Defaults(), --Weakened Heart
		[SpellName(8326)] = Defaults(), --ghost
		[SpellName(23445)] = Defaults(), --evil twin
		[SpellName(24755)] = Defaults(), --gay homosexual tricked or treated debuff
		[SpellName(25163)] = Defaults(), --fucking annoying pet debuff oozeling disgusting aura
		[SpellName(80354)] = Defaults(), --timewarp debuff
		[SpellName(95809)] = Defaults(), --Insanity debuff (Hunter Pet heroism)		
		[SpellName(95223)] = Defaults(), --group res debuff
--		[SpellName(124275)] = Defaults(), -- Stagger
--		[SpellName(124274)] = Defaults(), -- Stagger
--		[SpellName(124273)] = Defaults(), -- Stagger
		[SpellName(117870)] = Defaults(), -- Touch of The Titans		
		[SpellName(72221)] = Defaults(),
		[SpellName(123981)] = Defaults(), -- Perdition
		[SpellName(15007)] = Defaults(), -- Ress Sickness
		[SpellName(113942)] = Defaults(), -- Demonic: Gateway
		[SpellName(89140)] = Defaults(), -- Demonic Rebirth: Cooldown
	},
}

--[[
	This should be a list of important buffs that we always want to see when they are active
	bloodlust, paladin hand spells, raid cooldowns, etc.. 
]]

G.unitframe.aurafilters['Whitelist'] = {
	['type'] = 'Whitelist',
	['spells'] = {
		[SpellName(31821)] = Defaults(), -- Devotion Aura
		[SpellName(2825)] = Defaults(), -- Bloodlust
		[SpellName(32182)] = Defaults(), -- Heroism	
		[SpellName(80353)] = Defaults(), --Time Warp
		[SpellName(90355)] = Defaults(), --Ancient Hysteria		
		[SpellName(104993)] = Defaults(), --jade spirit	
		[SpellName(123059)] = Defaults(),
		[SpellName(47788)] = Defaults(), --Guardian Spirit
		[SpellName(33206)] = Defaults(), --Pain Suppression
		[SpellName(116849)] = Defaults(), --Life Cocoon
		[SpellName(22812)] = Defaults(), --Barkskin	
		[SpellName(116631)] = Defaults(), --风暴之盾(FM)
		[SpellName(138242)] = Defaults(), --荣耀之盾(T15)	
		[SpellName(137590)] = Defaults(), --橙色多彩(肾上腺素-急速+30%)
		[SpellName(137593)] = Defaults(), --橙色多彩(刚毅-减伤+20%)
		[SpellName(137596)] = Defaults(), --橙色多彩(电荷)
		[SpellName(137288)] = Defaults(), --橙色多彩(节能施法,5.3改名叫'清醒')
		[SpellName(136431)] = Defaults(), --龟壳震荡(DEBUFF)
		[SpellName(142535)] = Defaults(), -- 征服之魂
		[SpellName(142530)] = Defaults(), -- 血腥舞钢		
		[SpellName(173322)] = Defaults(), --血环之印
		[SpellName(159234)] = Defaults(), --雷神之印
		[SpellName(159675)] = Defaults(), --战歌之印
	
		--悬槌堡 / 天槌 BOSS BUFF
		[SpellName(159515)] = Defaults(), --迅擊/狂莽突击
		[SpellName(157323)] = Defaults(), --力量新星：強化/奥能新星
		[SpellName(157289)] = Defaults(), --秘法防護/奥术防护
		[SpellName(174057)] = Defaults(), --秘法防護/奥术防护
		[SpellName(162569)] = Defaults(), --破源者之力/毁灭者之力
		[SpellName(163297)] = Defaults(), --秘法扭曲/扭曲奥能
		[SpellName(162288)] = Defaults(), --凝聚/附岩
		[SpellName(159972)] = Defaults(), --食腐者/食肉者
	},
}

G.unitframe.aurafilters['Whitelist (Strict)'] = {
	['type'] = 'Whitelist',
	['spells'] = {
		[SpellName(123059)] = DefaultsID(123059), --Destabilize (Amber-Shaper Un'sok)
		[SpellName(136431)] = DefaultsID(136431), --Shell Concussion (Tortos)
		[SpellName(137332)] = DefaultsID(137332), --Beast of Nightmares (Twin Consorts)
		[SpellName(137375)] = DefaultsID(137375), --Beast of Nightmares (Twin Consorts)
		[SpellName(144351)] = DefaultsID(144351), --Mark of Arrogance (Norushen)
		[SpellName(142863)] = DefaultsID(142863), --Weak Ancient Barrier (Malkorok)
		[SpellName(142864)] = DefaultsID(142864), --Ancient Barrier (Malkorok)
		[SpellName(142865)] = DefaultsID(142865), --Strong Ancient Barrier (Malkorok)
		[SpellName(143198)] = DefaultsID(143198), --Garrote (Fallen Protectors)
	},
}

--RAID DEBUFFS
--[[
	This should be pretty self explainitory
]]
G.unitframe.aurafilters['RaidDebuffs'] = {
	['type'] = 'Whitelist',
	['spells'] = {
		--Blackwing Descent
			--Magmaw
			[SpellName(79589)] = Defaults(), -- Constricting Chains
			[SpellName(78941)] = Defaults(), -- Parasitic Infection
			[SpellName(89773)] = Defaults(), -- Mangle
			[SpellName(78199)] = Defaults(), -- Sweltering Armor

			--Omintron Defense System
			[SpellName(79888)] = Defaults(), --Lightning Conductor
			[SpellName(79035)] = Defaults(), --Incineration Security Measure
		--	[SpellName(120018)] = Defaults(), --Fixate 

			--Maloriak
			[SpellName(77711)] = Defaults(), -- Flash Freeze
			[SpellName(77760)] = Defaults(), -- Biting Chill

			--Atramedes
			[SpellName(76246)] = Defaults(), -- Searing Flame
			[SpellName(78555)] = Defaults(), -- Roaring Flame
			[SpellName(78098)] = Defaults(), -- Sonic Breath

			--Chimaeron
			[SpellName(82881)] = Defaults(), -- Break
			[SpellName(89084)] = Defaults(), -- Low Health

			--Nefarian

			--Sinestra
			[SpellName(89435)] = Defaults(), --Wrack

		--The Bastion of Twilight
			--Valiona & Theralion
			[SpellName(86825)] = Defaults(), -- Blackout
			[SpellName(86631)] = Defaults(), -- Engulfing Magic
			[SpellName(86214)] = Defaults(), -- Twilight Zone
			[SpellName(88518)] = Defaults(), -- Twilight Meteorite

			--Halfus Wyrmbreaker
			[SpellName(83908)] = Defaults(), -- Malevolent Strikes

			--Twilight Ascendant Council
			[SpellName(125988)] = Defaults(), -- Hydro Lance
			[SpellName(82762)] = Defaults(), -- Waterlogged
		--	[SpellName(50635)] = Defaults(), -- Frozen
			[SpellName(100795)] = Defaults(), -- Flame Torrent
			[SpellName(105342)] = Defaults(), -- Lightning Rod
			[SpellName(92075)] = Defaults(), -- Gravity Core

			--Cho'gall
			[SpellName(86028)] = Defaults(), -- Cho's Blast
			[SpellName(86029)] = Defaults(), -- Gall's Blast

		--Throne of the Four Winds
			--Conclave of Wind
				--Nezir <Lord of the North Wind>
				[SpellName(86122)] = Defaults(), --Ice Patch
				--Anshal <Lord of the West Wind>
				[SpellName(86206)] = Defaults(), --Soothing Breeze
				[SpellName(86290)] = Defaults(), --Toxic Spores
				--Rohash <Lord of the East Wind>
				[SpellName(86182)] = Defaults(), --Slicing Gale
				
			--Al'Akir
			[SpellName(87470)] = Defaults(), -- Ice Storm
			[SpellName(105342)] = Defaults(), -- Lightning Rod
			
		--Firelands	
			--Beth'tilac
			[SpellName(99506)] = Defaults(), -- Widows Kiss
			
			--Alysrazor
			[SpellName(100024)] = Defaults(), -- Gushing Wound
			
			--Shannox
			[SpellName(99837)] = Defaults(), -- Crystal Prison
			[SpellName(99937)] = Defaults(), -- Jagged Tear
			
			--Baleroc
			[SpellName(99257)] = Defaults(), -- Tormented
			[SpellName(99256)] = Defaults(), -- Torment
			
			--Lord Rhyolith
				--<< NONE KNOWN YET >>
			
			--Majordomo Staghelm
			[SpellName(98450)] = Defaults(), -- Searing Seeds
			[SpellName(98565)] = Defaults(), -- Burning Orb
			
			--Ragnaros
			[SpellName(99399)] = Defaults(), -- Burning Wound
				
			--Trash
			[SpellName(99532)] = Defaults(), -- Melt Armor	
			
		--Baradin Hold
			--Occu'thar
			[SpellName(96913)] = Defaults(), -- Searing Shadows
			--Alizabal
			[SpellName(104936)] = Defaults(), -- Skewer
			
		--Dragon Soul
			--Morchok
			[SpellName(103541)] = Defaults(), -- Safe
			[SpellName(103536)] = Defaults(), -- Warning
			[SpellName(103534)] = Defaults(), -- Danger
			[SpellName(103785)] = Defaults(), -- Black Blood of the Earth

			--Warlord Zon'ozz
			[SpellName(103434)] = Defaults(), -- Disrupting Shadows

			--Yor'sahj the Unsleeping
			[SpellName(105171)] = Defaults(), -- Deep Corruption

			--Hagara the Stormbinder
			[SpellName(105465)] = Defaults(), -- Lighting Storm
			[SpellName(104451)] = Defaults(), -- Ice Tomb
			[SpellName(109325)] = Defaults(), -- Frostflake
			[SpellName(105289)] = Defaults(), -- Shattered Ice
			[SpellName(105285)] = Defaults(), -- Target

			--Ultraxion
			[SpellName(109075)] = Defaults(), -- Fading Light

			--Warmaster Blackhorn
			[SpellName(108043)] = Defaults(), -- Sunder Armor
			[SpellName(107558)] = Defaults(), -- Degeneration
			[SpellName(107567)] = Defaults(), -- Brutal Strike
			[SpellName(108046)] = Defaults(), -- Shockwave

			--Spine of Deathwing
			[SpellName(105479)] = Defaults(), -- Searing Plasma
			[SpellName(105490)] = Defaults(), -- Fiery Grip
			[SpellName(106199)] = { 
				['enable'] = true,
				['priority'] = 5,
			}, -- Blood Corruption: Death
			
			--Madness of Deathwing
			[SpellName(105841)] = Defaults(), -- Degenerative Bite
			[SpellName(106385)] = Defaults(), -- Crush
			[SpellName(106730)] = Defaults(), -- Tetanus
			[SpellName(106444)] = Defaults(), -- Impale
			[SpellName(106794)] = Defaults(), -- Shrapnel (target)			
	
	   -- Mogu'shan Vaults
			-- The Stone Guard
			[SpellName(116281)] = Defaults(), -- Cobalt Mine Blast
			[SpellName(125206)] = Defaults(),	-- Rend Flesh
			[SpellName(130395)] = Defaults(),	-- Jasper Chains			
			-- Feng the Accursed
			[SpellName(116784)] = Defaults(), -- Wildfire Spark
			[SpellName(116417)] = Defaults(), -- Arcane Resonance
			[SpellName(116942)] = Defaults(), -- Flaming Spear
			[SpellName(131788)] = Defaults(),	-- Lightning Lash
			[SpellName(131790)] = Defaults(),	-- Arcane Shock
			[SpellName(131792)] = Defaults(),	-- Shadowburn
			-- Gara'jal the Spiritbinder
			[SpellName(116161)] = Defaults(), -- Crossed Over
			[SpellName(117723)] = Defaults(),	-- Frail Soul
			[SpellName(122151)] = Defaults(),	-- Voodoo Doll
			-- The Spirit Kings
			[SpellName(117708)] = Defaults(), -- Maddening Shout
			[SpellName(118303)] = Defaults(), -- Fixate
			[SpellName(118048)] = Defaults(), -- Pillaged
			[SpellName(118135)] = Defaults(), -- Pinned Down
			[SpellName(118163)] = Defaults(),	-- Robbed Blind
			-- Elegon
			[SpellName(117878)] = Defaults(), -- Overcharged
			[SpellName(117949)] = Defaults(), -- Closed Circuit
			[SpellName(132222)] = Defaults(),	-- Destabilizing Energies
			-- Will of the Emperor
			[SpellName(116835)] = Defaults(), -- Devastating Arc
			[SpellName(116778)] = Defaults(), -- Focused Defense
			[SpellName(116525)] = Defaults(), -- Focused Assault 
		-- Sha of Anger
			[SpellName(119622)] = Defaults(),	-- Growing Anger
			[SpellName(119626)] = Defaults(),	-- Aggressive Behavior			
		-- Heart of Fear
			-- Imperial Vizier Zor'lok
			[SpellName(122761)] = Defaults(), -- Exhale
			[SpellName(122760)] = Defaults(), -- Exhale
			[SpellName(122740)] = Defaults(), -- Convert
			[SpellName(123812)] = Defaults(), -- Pheromones of Zeal
			-- Blade Lord Ta'yak
			[SpellName(123180)] = Defaults(), -- Wind Step
			[SpellName(123474)] = Defaults(), -- Overwhelming Assault
			-- Garalon
			[SpellName(122835)] = Defaults(), -- Pheromones
			[SpellName(123081)] = Defaults(), -- Pungency
			-- Wind Lord Mel'jarak
			[SpellName(129078)] = Defaults(),	-- Amber Prison
			[SpellName(122055)] = Defaults(),	-- Residue
			[SpellName(122064)] = Defaults(),	-- Corrosive Resin
			[SpellName(123963)] = Defaults(),   -- Korthik Strike
			-- Amber-Shaper Un'sok
			[SpellName(121949)] = Defaults(),	-- Parasitic Growth
			[SpellName(122370)] = Defaults(),	-- Reshape Life
			-- Grand Empress Shek'zeer
			[SpellName(123707)] = Defaults(),	-- Eyes of the Empress
			[SpellName(123713)] = Defaults(),	-- Servant of the Empress
			[SpellName(123788)] = Defaults(),	-- Cry of Terror
			[SpellName(124849)] = Defaults(),	-- Consuming Terror
			[SpellName(124863)] = Defaults(),	-- Visions of Demise			
			-- Wind Lord Mel'jarak
			[SpellName(121949)] = Defaults(), -- Parasitic Growth
			-- Grand Empress Shek'zeer
		-- Terrace of Endless Spring
			-- Protectors of the Endless
			[SpellName(117436)] = Defaults(), -- Lightning Prison
			[SpellName(118091)] = Defaults(), -- Defiled Ground
			[SpellName(117519)] = Defaults(), -- Touch of Sha
			-- Tsulong
			[SpellName(122752)] = Defaults(), -- Shadow Breath
			[SpellName(123011)] = Defaults(), -- Terrorize
			[SpellName(116161)] = Defaults(), -- Crossed Over
			-- Lei Shi
			[SpellName(123121)] = Defaults(), -- Spray
			-- Sha of Fear
			[SpellName(119985)] = Defaults(), -- Dread Spray
			[SpellName(119086)] = Defaults(), -- Penetrating Bolt
			[SpellName(119775)] = Defaults(), -- Reaching Attack	
			
			
			[SpellName(122151)] = Defaults(), -- Voodoo Doll
		-- Throne of Thunder
			--Trash
			[SpellName(137162)] = Defaults(4),	-- Static Burst (Tank switch)
			[SpellName(138349)] = Defaults(),	-- Static Wound (Tank stacks)
			[SpellName(137371)] = Defaults(4),	-- Thundering Throw (Tank stun)
			[SpellName(138732)] = Defaults(),	-- Ionization (Heroic - Dispel)
			[SpellName(137422)] = Defaults(),	-- Focused Lightning (Fixated - Kiting)
			[SpellName(138006)] = Defaults(),	-- Electrified Waters (Pool)			
			--Horridon
			[SpellName(136767)] = Defaults(), --Triple Puncture
			[SpellName(136708)] = Defaults(4),	-- Stone Gaze (Stun - Dispel)
			[SpellName(136654)] = Defaults(),	-- Rending Charge (DoT)
			[SpellName(136719)] = Defaults(),	-- Blazing Sunlight (Dispel)
			[SpellName(136587)] = Defaults(),	-- Venom Bolt Volley (Dispel)
			[SpellName(136710)] = Defaults(),	-- Deadly Plague (Dispel)
			[SpellName(136512)] = Defaults(),	-- Hex of Confusion (Dispel)			
			--Council of Elders
			[SpellName(137641)] = Defaults(), --Soul Fragment
			[SpellName(137359)] = Defaults(), --Shadowed Loa Spirit Fixate
			[SpellName(137972)] = Defaults(), --Twisted Fate
			[SpellName(136903)] = Defaults(), --Frigid Assault
			[SpellName(136922)] = Defaults(),	-- Frostbite (DoT)
			[SpellName(136992)] = Defaults(),	-- Biting Cold (DoT)
			[SpellName(136857)] = Defaults(4),	-- Entrapped (Dispel)
			--Tortos
			[SpellName(136753)] = Defaults(), --Slashing Talons
			[SpellName(137633)] = Defaults(), --Crystal Shell
			[SpellName(140701)] = Defaults(4),	-- Crystal Shell: Full Capacity! (Heroic)
			
			--Megaera
			[SpellName(137731)] = Defaults(), --Ignite Flesh
			[SpellName(139843)] = Defaults(),	-- Arctic Freeze (Tank stacks)
			[SpellName(139840)] = Defaults(),	-- Rot Armor (Tank stacks)
			[SpellName(139822)] = Defaults(4),	-- Cinder (DoT - Dispell)
			[SpellName(139857)] = Defaults(4),	-- Torrent of Ice (Fixated - Kiting)
			[SpellName(140179)] = Defaults(4),	-- Suppression (Heroic - Dispell)						
			-- Ji-Kun
			[SpellName(140092)] = Defaults(),	-- Infected Talons (Tank DoT)
			[SpellName(134366)] = Defaults(4),	--  (Tank DoT)
			[SpellName(134256)] = Defaults(),	-- Slimed (DoT)
			--Durumu the Forgotten
			[SpellName(133767)] = Defaults(), --Serious Wound
			[SpellName(133768)] = Defaults(4), --Arterial Cut
			[SpellName(133798)] = Defaults(),	-- Life Drain (Stun)
			[SpellName(133597)] = Defaults(),	-- Dark Parasite (Heroic - Dispel)			
			--Primordius
			[SpellName(136050)] = Defaults(), --Malformed Blood
			[SpellName(136228)] = Defaults(),	-- Volatile Pathogen (DoT)			
			--Dark Animus
			[SpellName(138569)] = Defaults(4), --Explosive Slam
			[SpellName(138659)] = Defaults(),-- Touch of the Animus (DoT)			
			--Iron Qon
			[SpellName(134691)] = Defaults(), --Impale
			[SpellName(134628)] = Defaults(),	-- Unleashed Flame (Damage staks)
			[SpellName(136192)] = Defaults(4),	-- Lightning Storm (Stun)	
			--Twin Consorts
			[SpellName(137440)] = Defaults(), --Icy Shadows
			[SpellName(137408)] = Defaults(), --Fan of Flames
			[SpellName(137360)] = Defaults(), --Corrupted Healing
			[SpellName(136722)] = Defaults(),	-- Slumber Spores (Dispel)
			[SpellName(137341)] = Defaults(),	-- Beast of Nightmares (Fixate)
			--Lei Shen
			[SpellName(135000)] = Defaults(), --Decapitate
			[SpellName(136478)] = Defaults(),	-- Fusion Slash (Tank only)
			[SpellName(136914)] = Defaults(),	-- Electrical Shock (Tank staks)
			[SpellName(135695)] = Defaults(),	-- Static Shock (Damage Split)		
			[SpellName(136295)] = Defaults(),	-- Overcharged
			[SpellName(139011)] = Defaults(),	-- Helm of Command (Heroic)
			--Ra-den
			[SpellName(138297)] = Defaults(), -- 不稳定的生命
			[SpellName(138372)] = Defaults(), -- 生命过敏
			
		-- Siege of Orgrimmar
			-- Immerseus
			[SpellName(143436)] = Defaults(4),	-- Corrosive Blast (Tank switch)
			[SpellName(143459)] = Defaults(),	-- Sha Residue
			-- The Fallen Protectors
			[SpellName(143198)] = Defaults(),	-- Garrote (DoT)
			[SpellName(143434)] = Defaults(4),	-- Shadow Word: Bane (Dispel)
			[SpellName(147383)] = Defaults(),	-- Debilitation (Heroic)
			-- Norushen
			[SpellName(146124)] = Defaults(4),	-- Self Doubt (Tank switch)
			[SpellName(144514)] = Defaults(),	-- Lingering Corruption (Dispel)
			-- Sha of Pride
			[SpellName(144358)] = Defaults(4),	-- Wounded Pride (Tank switch)
			[SpellName(144351)] = Defaults(),	-- Mark of Arrogance (Dispel)
			[SpellName(146594)] = Defaults(),	-- Gift of the Titans
			[SpellName(147207)] = Defaults(),	-- Weakened Resolve (Heroic)
			-- Galakras
			[SpellName(146765)] = Defaults(),	-- Flame Arrows (DoT)
			[SpellName(146902)] = Defaults(),	-- Poison-Tipped Blades (Poison stacks)
			-- Iron Juggernaut
			[SpellName(144467)] = Defaults(4),	-- Ignite Armor (Tank stacks)
			[SpellName(144459)] = Defaults(),	-- Laser Burn (DoT)
			-- Kor'kron Dark Shaman
			[SpellName(144215)] = Defaults(),	-- Froststorm Strike (Tank stacks)
			[SpellName(144089)] = Defaults(),	-- Toxic Mist (DoT)
			[SpellName(144330)] = Defaults(),	-- Iron Prison (Heroic)
			-- General Nazgrim
			[SpellName(143494)] = Defaults(),	-- Sundering Blow (Tank stacks)
			[SpellName(143638)] = Defaults(),	-- Bonecracker (DoT)
			[SpellName(143431)] = Defaults(),	-- Magistrike (Dispel)
			-- Malkorok
			[SpellName(142990)] = Defaults(),	-- Fatal Strike (Tank stacks)
			[SpellName(142913)] = Defaults(),	-- Displaced Energy (Dispel)
			[SpellName(142863)] = Defaults(),   --上古屏障
			[SpellName(142864)] = Defaults(),
			[SpellName(142865)] = Defaults(),
			-- Spoils of Pandaria
			[SpellName(145218)] = Defaults(),	-- Harden Flesh (Dispel)
			[SpellName(146235)] = Defaults(),	-- Breath of Fire (Dispel)
			-- Thok the Bloodthirsty
			[SpellName(143766)] = Defaults(),	-- Panic (Tank stacks)
			[SpellName(143780)] = Defaults(),	-- Acid Breath (Tank stacks)
			[SpellName(143773)] = Defaults(),	-- Freezing Breath (Tank Stacks)
			[SpellName(143800)] = Defaults(),	-- Icy Blood (Random Stacks)
			[SpellName(143767)] = Defaults(),	-- Scorching Breath (Tank Stacks)
			[SpellName(143791)] = Defaults(),	-- Corrosive Blood (Dispel)
			-- Siegecrafter Blackfuse
			[SpellName(143385)] = Defaults(),	-- Electrostatic Charge (Tank stacks)
			[SpellName(144236)] = Defaults(),	-- Pattern Recognition
			-- Paragons of the Klaxxi
			[SpellName(142929)] = Defaults(),	-- Tenderizing Strikes (Tank stacks)
			[SpellName(143275)] = Defaults(),	-- Hewn (Tank stacks)
			[SpellName(143279)] = Defaults(),	-- Genetic Alteration (Tank stacks)
			[SpellName(143974)] = Defaults(),	-- Shield Bash (Tank stun)
			[SpellName(142948)] = Defaults(),	-- Aim
			-- Garrosh Hellscream
			[SpellName(145183)] = Defaults(),	-- Gripping Despair (Tank stacks)
			[SpellName(145195)] = Defaults(),	-- Empowered Gripping Despair (Tank stacks)
		
		--Highmaul	
			--Trash
			[SpellName(175601)] = Defaults(), -- Trash  TAINTED CLAWS
			[SpellName(172069)] = Defaults(), -- Trash RADIATING POISON
			[SpellName(56037)] = Defaults(), -- Trash  RUNE OF DESTRUCTION
			[SpellName(175654)] = Defaults(), -- Trash RUNE OF DISINTEGRATION
			[SpellName(174939)] = Defaults(), -- Time Stop
			[SpellName(172066)] = Defaults(), -- Radiating Poison
			[SpellName(172115)] = Defaults(), -- Earthen Thrust
			[SpellName(166200)] = Defaults(), --ARCANEVOLATILITY
			
			--The Butcher
			[SpellName(156152)] = Defaults(), --GUSHINGWOUNDS
			[SpellName(156151)] = Defaults(), --THETENDERIZER
			[SpellName(156143)] = Defaults(), --THECLEAVER
			[SpellName(163046)] = Defaults(), --PALEVITRIOL

			--Kargath Bladefist
			[SpellName(159113)] = Defaults(), --IMPALE
			[SpellName(159178)] = Defaults(), --OPENWOUNDS
			[SpellName(159213)] = Defaults(), --MONSTERSBRAWL
			[SpellName(158986)] = Defaults(), --BERSERKERRUSH
			[SpellName(159410)] = Defaults(), --MAULINGBREW
			[SpellName(160521)] = Defaults(), --VILEBREATH
			[SpellName(159386)] = Defaults(), --IRONBOMB
			[SpellName(159188)] = Defaults(), --GRAPPLE
			[SpellName(162497)] = Defaults(), --ONTHEHUNT
			[SpellName(159202)] = Defaults(), --FLAME JET

			--Twin Ogron 
			[SpellName(158026)] = Defaults(), --ENFEEBLINGROAR
			[SpellName(158241)] = Defaults(), --BLAZE
			[SpellName(155569)] = Defaults(), --INJURED
			[SpellName(167200)] = Defaults(), --ARCANEWOUND
			[SpellName(159709)] = Defaults(), --WEAKENEDDEFENSES 159709 167179
			[SpellName(163374)] = Defaults(), --ARCANEVOLATILITY
			[SpellName(158200)] = Defaults(), --QUAKE
			
			--Ko'ragh
			[SpellName(161242)] = Defaults(), --CAUSTICENERGY
			[SpellName(161358)] = Defaults(), --SUPPRESSION FIELD
			[SpellName(162184)] = Defaults(), --EXPELMAGICSHADOW
			[SpellName(162186)] = Defaults(), --EXPELMAGICARCANE
			[SpellName(161411)] = Defaults(), --EXPELMAGICFROST
			[SpellName(163472)] = Defaults(), --DOMINATINGPOWER
			[SpellName(162185)] = Defaults(),--EXPELMAGICFEL

			--Tectus
			--CRYSTALLINEBARRAGE
			[SpellName(162892)] = Defaults(), --PETRIFICATION
			[SpellName(162346)] = Defaults(), --CRYSTALLINEBARRAGE
			[SpellName(162475)] = Defaults(), --Tectonic Upheaval

			--Brackenspore
			[SpellName(163242)] = Defaults(), --INFESTINGSPORES
			[SpellName(163590)] = Defaults(),--CREEPINGMOSS
			[SpellName(163241)] = Defaults(), --ROT
			[SpellName(159220)] = Defaults(), --NECROTICBREATH
			[SpellName(160179)] = Defaults(), --MINDFUNGUS
			[SpellName(159972)] = Defaults(), --FLESHEATER

			--Imperator Mar'gok 
			[SpellName(156238)] = Defaults(), --BRANDED  156238 163990 163989 163988
			[SpellName(156467)] = Defaults(), --DESTRUCTIVERESONANCE  156467 164075 164076 164077
			[SpellName(157349)] = Defaults(), --FORCENOVA  157349 164232 164235 164240
			[SpellName(158605)] = Defaults(), --MARKOFCHAOS  158605 164176 164178 164191
			[SpellName(157763)] = Defaults(), --FIXATE
			[SpellName(158553)] = Defaults(), --CRUSHARMOR
		--Blackrock Foundry
			--Blackhand
			[SpellName(156096)] = Defaults(), --MARKEDFORDEATH
			[SpellName(156107)] = Defaults(), --IMPALED
			[SpellName(156047)] = Defaults(), --SLAGGED
			[SpellName(156401)] = Defaults(), --MOLTENSLAG
			[SpellName(156404)] = Defaults(), --BURNED
			[SpellName(158054)] = Defaults(), --SHATTERINGSMASH 158054 155992 159142
			[SpellName(156888)] = Defaults(), --OVERHEATED
			[SpellName(157000)] = Defaults(), --ATTACHSLAGBOMBS

			--Beastlord Darmac
			[SpellName(155365)] = Defaults(), --PINNEDDOWN
			[SpellName(155061)] = Defaults(), --RENDANDTEAR
			[SpellName(155030)] = Defaults(), --SEAREDFLESH
			[SpellName(155236)] = Defaults(), --CRUSHARMOR
			[SpellName(159044)] = Defaults(), --EPICENTRE
			[SpellName(162276)] = Defaults(), --UNSTEADY Mythic
			[SpellName(155657)] = Defaults(), --FLAMEINFUSION

			--Flamebender Ka'graz
			[SpellName(155318)] = Defaults(), --LAVASLASH
			[SpellName(155277)] = Defaults(), --BLAZINGRADIANCE
			[SpellName(154952)] = Defaults(), --FIXATE
			[SpellName(155074)] = Defaults(), --CHARRINGBREATH
			[SpellName(163284)] = Defaults(), --RISINGFLAME
			[SpellName(162293)] = Defaults(), --EMPOWEREDARMAMENT

			--Operator Thogar 
			[SpellName(155921)] = Defaults(), --ENKINDLE
			[SpellName(165195)] = Defaults(), --PROTOTYPEPULSEGRENADE
			[SpellName(155701)] = Defaults(), --SERRATEDSLASH
			[SpellName(156310)] = Defaults(), --LAVASHOCK
			[SpellName(164380)] = Defaults(), --BURNING

			--The Blast Furnace
			[SpellName(155240)] = Defaults(), --TEMPERED
			[SpellName(155242)] = Defaults(), --HEAT
			[SpellName(176133)] = Defaults(),--BOMB
			[SpellName(156934)] = Defaults(), --RUPTURE
			[SpellName(175104)] = Defaults(),--MELTARMOR
			[SpellName(176121)] = Defaults(),--VOLATILEFIRE
			[SpellName(158702)] = Defaults(), --FIXATE
			[SpellName(155225)] = Defaults(), --MELT

			--Hans'gar and Franzok 
			[SpellName(157139)] = Defaults(),--SHATTEREDVERTEBRAE
			[SpellName(161570)] = Defaults(), --SEARINGPLATES
			[SpellName(157853)] = Defaults(), --AFTERSHOCK

			--Gruul
			[SpellName(155080)] = Defaults(), --INFERNOSLICE
			[SpellName(143962)] = Defaults(), --INFERNOSTRIKE 
			[SpellName(155078)] = Defaults(), --OVERWHELMINGBLOWS
			[SpellName(36240)] = Defaults(), --CAVEIN
			[SpellName(165300)] = Defaults(), --FLARE Mythic

			--Kromog
			[SpellName(157060)] = Defaults(), --RUNEOFGRASPINGEARTH
			[SpellName(156766)] = Defaults(), --WARPEDARMOR
			[SpellName(161839)] = Defaults(), --RUNEOFCRUSHINGEARTH

			--Oregorger
			[SpellName(156309)] = Defaults(), --ACIDTORRENT
			[SpellName(156203)] = Defaults(), --RETCHEDBLACKROCK
			[SpellName(173471)] = Defaults(), --ACIDMAW

			--The Iron Maidens
			[SpellName(164271)] = Defaults(), --PENETRATINGSHOT
			[SpellName(158315)] = Defaults(), --DARKHUNT
			[SpellName(156601)] = Defaults(), --SANGUINESTRIKES
			[SpellName(170395)] = Defaults(), --SORKASPREY
			[SpellName(170405)] = Defaults(), --MARAKSBLOODCALLING
			[SpellName(158692)] = Defaults(), --DEADLYTHROW
			[SpellName(158702)] = Defaults(), --FIXATE
			[SpellName(158686)] = Defaults(),--EXPOSEARMOR
			[SpellName(158683)] = Defaults(), --CORRUPTEDBLOOD		
		--user report
			[SpellName(164004)] = Defaults(), --烙印(7# 元首)
			[SpellName(156225)] = Defaults(),
			[SpellName(164005)] = Defaults(),
			[SpellName(164006)] = Defaults(),
	},
}

--Spells that we want to show the duration backwards
E.ReverseTimer = {

}

--BuffWatch
--List of personal spells to show on unitframes as icon
local function ClassBuff(id, point, color, anyUnit, onlyShowMissing, style, displayText, textColor, textThreshold, xOffset, yOffset)
	local r, g, b = unpack(color)
	
	local r2, g2, b2 = 1, 1, 1
	if textColor then
		r2, g2, b2 = unpack(textColor)
	end
	
	return {["enabled"] = true, ["id"] = id, ["point"] = point, ["color"] = {["r"] = r, ["g"] = g, ["b"] = b}, 
	["anyUnit"] = anyUnit, ["onlyShowMissing"] = onlyShowMissing, ['style'] = style or 'coloredIcon', ['displayText'] = displayText or false, 
	['textColor'] = {["r"] = r2, ["g"] = g2, ["b"] = b2}, ['textThreshold'] = textThreshold or -1, ['xOffset'] = xOffset or 0, ['yOffset'] = yOffset or 0}
end

G.unitframe.buffwatch = {
	PRIEST = {
		ClassBuff(6788, "TOPRIGHT", {1, 0, 0}, true),	 -- Weakened Soul
		ClassBuff(41635, "BOTTOMRIGHT", {0.2, 0.7, 0.2}),	 -- Prayer of Mending
		ClassBuff(139, "BOTTOMLEFT", {0.4, 0.7, 0.2}), -- Renew
		ClassBuff(17, "TOPLEFT", {0.81, 0.85, 0.1}, true),	 -- Power Word: Shield
		ClassBuff(123258, "TOPLEFT", {0.81, 0.85, 0.1}, true),	 -- Power Word: Shield Power Insight
		ClassBuff(10060 , "RIGHT", {227/255, 23/255, 13/255}), -- Power Infusion
		ClassBuff(47788, "LEFT", {221/255, 117/255, 0}, true), -- Guardian Spirit
		ClassBuff(33206, "LEFT", {227/255, 23/255, 13/255}, true), -- Pain Suppression		
	},
	DRUID = {
		ClassBuff(774, "TOPRIGHT", {0.8, 0.4, 0.8}),	 -- Rejuvenation
		ClassBuff(155777, "RIGHT", {0.8, 0.4, 0.4}),	 -- Rejuvenation 2
		ClassBuff(8936, "BOTTOMLEFT", {0.2, 0.8, 0.2}),	 -- Regrowth
		ClassBuff(33763, "TOPLEFT", {0.4, 0.8, 0.2}),	 -- Lifebloom
		ClassBuff(48438, "BOTTOMRIGHT", {0.8, 0.4, 0}),	 -- Wild Growth
	},
	PALADIN = {
		ClassBuff(53563, "TOPRIGHT", {0.7, 0.3, 0.7}),	 -- Beacon of Light
		ClassBuff(156910, "TOPRIGHT", {0.7, 0.2, 0.3}),	 -- Beacon of Light(WOD)
		ClassBuff(157007, "TOPRIGHT", {0.7, 0.3, 0.7}),	 -- Beacon of Light(WOD)
		ClassBuff(1022, "BOTTOMRIGHT", {0.2, 0.2, 1}, true),	-- Hand of Protection
		ClassBuff(1044, "BOTTOMRIGHT", {0.89, 0.45, 0}, true),	-- Hand of Freedom
		ClassBuff(1038, "BOTTOMRIGHT", {0.93, 0.75, 0}, true),	-- Hand of Salvation
		ClassBuff(6940, "BOTTOMRIGHT", {0.89, 0.1, 0.1}, true),	-- Hand of Sacrifice
		ClassBuff(114039, "BOTTOMRIGHT", {164/255, 105/255, 184/255}, true), -- Hand of Purity
		ClassBuff(148039, 'TOPLEFT', {0.93, 0.75, 0}), -- Sacred Shield
		ClassBuff(156322, 'BOTTOMLEFT', {0.87, 0.7, 0.03}), -- Eternal Flame
	},
	SHAMAN = {
		ClassBuff(61295, "TOPRIGHT", {0.7, 0.3, 0.7}),	 -- Riptide
		ClassBuff(974, "BOTTOMLEFT", {0.2, 0.7, 0.2}, true),	 -- Earth Shield
		ClassBuff(51945, "BOTTOMRIGHT", {0.7, 0.4, 0}),	 -- Earthliving
	},
	MONK = {
		ClassBuff(119611, "TOPLEFT", {0.8, 0.4, 0.8}),	 --Renewing Mist
		ClassBuff(116849, "TOPRIGHT", {0.2, 0.8, 0.2}),	 -- Life Cocoon
		ClassBuff(132120, "BOTTOMLEFT", {0.4, 0.8, 0.2}), -- Enveloping Mist
		ClassBuff(124081, "BOTTOMRIGHT", {0.7, 0.4, 0}), -- Zen Sphere
	},
	ROGUE = {
		ClassBuff(57934, "TOPRIGHT", {227/255, 23/255, 13/255}), -- Tricks of the Trade
	},
	MAGE = {
		ClassBuff(111264, "TOPLEFT", {0.2, 0.2, 1}), -- Ice Ward
	},
	WARRIOR = {
		ClassBuff(114030, "TOPLEFT", {0.2, 0.2, 1}), -- Vigilance
		ClassBuff(3411, "TOPRIGHT", {227/255, 23/255, 13/255}), -- Intervene	
		ClassBuff(114029, "TOPRIGHT", {227/255, 23/255, 13/255}), -- Safe Guard
	},
	DEATHKNIGHT = {
		ClassBuff(49016, "TOPRIGHT", {227/255, 23/255, 13/255}), -- Unholy Frenzy	
	},
	PET = {
		ClassBuff(19615, 'TOPLEFT', {227/255, 23/255, 13/255}, true), -- Frenzy
		ClassBuff(136, 'TOPRIGHT', {0.2, 0.8, 0.2}, true) --Mend Pet
	},
}

--List of spells to display ticks
G.unitframe.ChannelTicks = {
	--Warlock
--	[SpellName(1120)] = 6, --"Drain Soul"
	[SpellName(689)] = 6, -- "Drain Life"
	[SpellName(108371)] = 6, -- "Harvest Life"
	[SpellName(5740)] = 4, -- "Rain of Fire"
	[SpellName(755)] = 6, -- Health Funnel
	[SpellName(103103)] = 4, --Malefic Grasp
	[SpellName(1949)] = 15,	-- Hellfire
	--Druid
--	[SpellName(44203)] = 4, -- "Tranquility"
	[SpellName(16914)] = 10, -- "Hurricane"
	[SpellName(106996)] = 10, -- 星界风暴
	[SpellName(127663)] = 4, -- 沟涌星界
	--Priest
	[SpellName(48045)] = 5, -- "Mind Sear"
	[SpellName(47540)] = 2, -- "Penance"
--	[SpellName(64901)] = 4, -- Hymn of Hope
	[SpellName(64843)] = 4, -- Divine Hymn
	--Mage
	[SpellName(5143)] = 5, -- "Arcane Missiles"
	[SpellName(10)] = 8, -- "Blizzard"
	[SpellName(12051)] = 4, -- "Evocation"
	-- Monk
	[SpellName(115175)] = 9,	-- Soothing Mist
	-- Shaman
	[SpellName(61882)] = 8,	-- Earthquake	
}

G.unitframe.ChannelTicksSize = {
    --Warlock
--    [SpellName(1120)] = 2, --"Drain Soul"
    [SpellName(689)] = 1, -- "Drain Life"
	[SpellName(108371)] = 1, -- "Harvest Life"
	[SpellName(103103)] = 1, -- "Malefic Grasp"
}

--Spells Effected By Haste
G.unitframe.HastedChannelTicks = {
--	[SpellName(64901)] = true, -- Hymn of Hope
	[SpellName(64843)] = true, -- Divine Hymn
}

--This should probably be the same as the whitelist filter + any personal class ones that may be important to watch
G.unitframe.AuraBarColors = {
	[SpellName(2825)] = {r = 250/255, g = 146/255, b = 27/255},	--Bloodlust
	[SpellName(32182)] = {r = 250/255, g = 146/255, b = 27/255}, --Heroism
	[SpellName(80353)] = {r = 250/255, g = 146/255, b = 27/255}, --Time Warp
	[SpellName(90355)] = {r = 250/255, g = 146/255, b = 27/255}, --Ancient Hysteria
}

G.unitframe.InvalidSpells = {
	[65148] = true, --Sacred Shield
}
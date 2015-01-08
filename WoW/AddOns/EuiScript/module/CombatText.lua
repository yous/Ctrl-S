local E, L = unpack(ElvUI)
if E.db.combattext.enable ~= true then return end
local T = {}
----------------------------------------------------------------------------------------
--	Combat Text(xCT by Affli)
----------------------------------------------------------------------------------------
-- Justify messages in frames
local ct = {
	["justify_1"] = "LEFT",			-- Incoming damage justify
	["justify_2"] = "RIGHT",		-- Incoming healing justify
	["justify_3"] = "CENTER",		-- Various messages justify
	["justify_4"] = "RIGHT",		-- Outgoing damage/healing justify
}

-- General filter outgoing healing
if E.db.combattext.healing then
	T.healfilter = {}
end

-- General merge outgoing damage
if E.db.combattext.merge_aoe_spam then
	T.merge = {}
	T.aoespam = {}
	T.aoespam[6603] = 3				-- Auto Attack
	T.aoespam[148008] = 3			-- Essence of Yu'lon
	T.aoespam[148009] = 3			-- Spirit of Chi-Ji
	T.aoespam[149276] = 3			-- Flurry of Xuen
	T.aoespam[147891] = 3			-- Flurry of Xuen
end

-- Class config
if E.myclass == "DEATHKNIGHT" then
	if E.db.combattext.merge_aoe_spam then
		T.aoespam[55095] = 3		-- Frost Fever
		T.aoespam[55078] = 3		-- Blood Plague
		T.aoespam[50842] = 0		-- Blood Boil
		T.aoespam[49184] = 0		-- Howling Blast
		T.aoespam[52212] = 3		-- Death and Decay
		T.aoespam[50401] = 3		-- Razor Frost
		T.aoespam[91776] = 3		-- Claw (Ghoul)
		T.aoespam[49020] = 0		-- Obliterate
		T.aoespam[49143] = 0		-- Frost Strike
		T.aoespam[45462] = 0		-- Plague Strike
		T.aoespam[49998] = 0		-- Death Strike
		T.merge[66198] = 49020		-- Obliterate Off-Hand
		T.merge[66196] = 49143		-- Frost Strike Off-Hand
		T.merge[66216] = 45462		-- Plague Strike Off-Hand
		T.merge[66188] = 49998		-- Death Strike Off-Hand
	end
	if E.db.combattext.healing then
		T.healfilter[119980] = true	-- Conversion
	end
elseif E.myclass == "DRUID" then
	if E.db.combattext.merge_aoe_spam then
		-- Healing spells
		T.aoespam[774] = 3			-- Rejuvenation
		T.aoespam[48438] = 3		-- Wild Growth
		T.aoespam[8936] = 3			-- Regrowth
		T.aoespam[33763] = 3		-- Lifebloom
		T.aoespam[157982] = 3		-- Tranquility
		T.aoespam[81269] = 3		-- Wild Mushroom
		T.aoespam[124988] = 3		-- Nature's Vigil
		T.aoespam[162359] = 3		-- Genesis
		T.aoespam[144876] = 3		-- Spark of Life (T16)
		-- Damaging spells
		T.aoespam[164812] = 3		-- Moonfire
		T.aoespam[164815] = 3		-- Sunfire
		T.aoespam[42231] = 3		-- Hurricane
		T.aoespam[106998] = 3		-- Astral Storm
		T.aoespam[50288] = 3		-- Starfall
		T.aoespam[61391] = 0		-- Typhoon
		T.aoespam[155722] = 3		-- Rake
		T.aoespam[33917] = 0		-- Mangle
		T.aoespam[106785] = 0		-- Swipe
		T.aoespam[33745] = 3		-- Lacerate
		T.aoespam[77758] = 3		-- Thrash (Bear Form)
		T.aoespam[106830] = 3		-- Thrash (Cat Form)
		T.aoespam[1079] = 3			-- Rip
		T.aoespam[124991] = 3		-- Nature's Vigil
	end
	if E.db.combattext.healing then
		T.healfilter[145109] = true	-- Ysera's Gift (Self)
		T.healfilter[145110] = true	-- Ysera's Gift
		T.healfilter[68285] = true	-- Leader of the Pack
	end
elseif E.myclass == "HUNTER" then
	if E.db.combattext.merge_aoe_spam then
		T.aoespam[2643] = 0			-- Multi-Shot
		T.aoespam[118253] = 3		-- Serpent Sting
		T.aoespam[13812] = 3		-- Explosive Trap
		T.aoespam[53301] = 3		-- Explosive Shot
		T.aoespam[118459] = 3		-- Beast Cleave
		T.aoespam[120699] = 3		-- Lynx Rush
		T.aoespam[120361] = 3		-- Barrage
		T.aoespam[131900] = 3		-- A Murder of Crows
		T.aoespam[3674] = 3			-- Black Arrow
		T.aoespam[121414] = 3		-- Glaive Toss
		T.aoespam[162543] = 3		-- Poisoned Ammo
		T.aoespam[162541] = 3		-- Incendiary Ammo
		T.aoespam[34655] = 3		-- Deadly Poison (Trap)
		T.aoespam[93433] = 3		-- Burrow Attack (Worm)
		T.aoespam[92380] = 3		-- Froststorm Breath (Chimaera)
		T.merge[120761] = 121414	-- Glaive Toss
	end
	if E.db.combattext.healing then
		T.healfilter[51753] = true	-- Camouflage
	end
elseif E.myclass == "MAGE" then
	if E.db.combattext.merge_aoe_spam then
		T.aoespam[44457] = 3		-- Living Bomb
		T.aoespam[44461] = 3		-- Living Bomb (AoE)
		T.aoespam[2120] = 3			-- Flamestrike
		T.aoespam[12654] = 3		-- Ignite
		T.aoespam[11366] = 3		-- Pyroblast
		T.aoespam[31661] = 0		-- Dragon's Breath
		T.aoespam[42208] = 3		-- Blizzard
		T.aoespam[122] = 0			-- Frost Nova
		T.aoespam[1449] = 0			-- Arcane Explosion
		T.aoespam[83853] = 3		-- Combustion
		T.aoespam[120] = 0			-- Cone of Cold
		T.aoespam[114923] = 3		-- Nether Tempest
		T.aoespam[114954] = 3		-- Nether Tempest (AoE)
		T.aoespam[7268] = 3			-- Arcane Missiles
		T.aoespam[113092] = 0		-- Frost Bomb
		T.aoespam[44425] = 0		-- Arcane Barrage
		T.aoespam[84721] = 3		-- Frozen Orb
		T.aoespam[148022] = 3		-- Icicle (Mastery)
		T.aoespam[31707] = 3		-- Waterbolt (Pet)
		T.aoespam[30455] = 0		-- Ice Lance
		T.aoespam[115611] = 6		-- Temporal Ripples
		T.aoespam[157981] = 1		-- Blast Wave
		T.aoespam[157997] = 1		-- Ice Nova
		T.aoespam[157980] = 1		-- Supernova
		T.aoespam[135029] = 3		-- Water Jet (Pet)
	end
elseif E.myclass == "MONK" then
	if E.db.combattext.merge_aoe_spam then
		-- Healing spells
		T.aoespam[119611] = 3		-- Renewing Mist
		T.aoespam[132120] = 3		-- Enveloping Mist
		T.aoespam[115175] = 3		-- Soothing Mist
		T.aoespam[125953] = 3		-- Soothing Mist (Statue)
		T.aoespam[126890] = 3		-- Eminence
		T.aoespam[117640] = 3		-- Spinning Crane Kick
		T.aoespam[132463] = 3		-- Chi Wave
		T.aoespam[130654] = 3		-- Chi Burst
		T.aoespam[124081] = 3		-- Zen Sphere
		T.aoespam[124101] = 3		-- Zen Sphere: Detonate
		T.aoespam[116670] = 0		-- Uplift
		T.merge[159621] = 126890	-- Eminence
		-- Damaging spells
		T.aoespam[117952] = 3		-- Crackling Jade Lightning
		T.aoespam[117418] = 3		-- Fists of Fury
		T.aoespam[128531] = 3		-- Blackout Kick (DoT)
		T.aoespam[121253] = 0		-- Keg Smash
		T.aoespam[115181] = 0		-- Breath of Fire
		T.aoespam[123725] = 3		-- Breath of Fire (DoT)
		T.aoespam[107270] = 3		-- Spinning Crane Kick
		T.aoespam[123586] = 3		-- Flying Serpent Kick
		T.aoespam[132467] = 3		-- Chi Wave
		T.aoespam[148135] = 3		-- Chi Burst
		T.aoespam[124098] = 3		-- Zen Sphere
		T.aoespam[125033] = 3		-- Zen Sphere: Detonate
	end
elseif E.myclass == "PALADIN" then
	if E.db.combattext.merge_aoe_spam then
		-- Healing spells
		T.aoespam[20167] = 3		-- Seal of Insight
		T.aoespam[123530] = 3		-- Battle Insight
		T.aoespam[53652] = 3		-- Beacon of Light
		T.aoespam[85222] = 0		-- Light of Dawn
		T.aoespam[82327] = 0		-- Holy Radiance
		T.aoespam[121129] = 0		-- Daybreak
		T.aoespam[114163] = 3		-- Eternal Flame
		T.aoespam[114852] = 0		-- Holy Prism
		T.aoespam[119952] = 3		-- Arcing Light
		T.aoespam[114917] = 3		-- Stay of Execution
		T.aoespam[144581] = 3		-- Blessing of the Guardians (T16)
		-- Damaging spells
		T.aoespam[81297] = 3		-- Consecration
		T.aoespam[119072] = .5		-- Holy Wrath
		T.aoespam[53385] = 0		-- Divine Storm
		T.aoespam[122032] = 0		-- Exorcism (Glyph)
		T.aoespam[31803] = 3		-- Censure
		T.aoespam[42463] = 3		-- Seal of Truth
		T.aoespam[101423] = 3		-- Seal of Righteousness
		T.aoespam[88263] = 0		-- Hammer of the Righteous
		T.aoespam[96172] = 3		-- Hand of Light (Mastery)
		T.aoespam[31935] = .5		-- Avenger's Shield
		T.aoespam[114871] = 0		-- Holy Prism
		T.aoespam[114919] = 3		-- Arcing Light
		T.aoespam[114916] = 3		-- Execution Sentence
		T.aoespam[86704] = 0		-- Ancient Fury
		T.merge[53595] = 88263		-- Hammer of the Righteous
	end
	if E.db.combattext.healing then
		T.healfilter[115547] = true	-- Glyph of Avenging Wrath
	end
elseif E.myclass == "PRIEST" then
	if E.db.combattext.merge_aoe_spam then
		-- Healing spells
		T.aoespam[47750] = 3		-- Penance
		T.aoespam[23455] = 0		-- Holy Nova
		T.aoespam[139] = 3			-- Renew
		T.aoespam[596] = 0			-- Prayer of Healing
		T.aoespam[64844] = 3		-- Divine Hymn
		T.aoespam[32546] = 3		-- Binding Heal
		T.aoespam[77489] = 3		-- Echo of Light
		T.aoespam[34861] = 0		-- Circle of Healing
		T.aoespam[33110] = 3		-- Prayer of Mending
		T.aoespam[88686] = 3		-- Holy Word: Sanctuary
		T.aoespam[81751] = 3		-- Atonement
		T.aoespam[120692] = 3		-- Halo
		T.aoespam[121148] = 3		-- Cascade
		T.aoespam[110745] = 3		-- Divine Star
		T.merge[94472] = 81751		-- Atonement
		-- Damaging spells
		T.aoespam[47666] = 3		-- Penance
		T.aoespam[132157] = 0		-- Holy Nova
		T.aoespam[589] = 3			-- Shadow Word: Pain
		T.aoespam[34914] = 3		-- Vampiric Touch
		T.aoespam[2944] = 3			-- Devouring Plague
		T.aoespam[15407] = 3		-- Mind Flay
		T.aoespam[49821] = 3		-- Mind Sear
		T.aoespam[14914] = 3		-- Holy Fire
		T.aoespam[129250] = 3		-- Power Word: Solace
		T.aoespam[120696] = 3		-- Halo
		T.aoespam[127628] = 3		-- Cascade
		T.aoespam[122128] = 3		-- Divine Star
		T.aoespam[129197] = 3		-- Insanity
		T.aoespam[148859] = 3		-- Shadowy Apparition
		T.merge[158831] = 2944		-- Devouring Plague
	end
	if E.db.combattext.healing then
		T.healfilter[127626] = true	-- Devouring Plague
		T.healfilter[15290] = true	-- Vampiric Embrace
	end
elseif E.myclass == "ROGUE" then
	if E.db.combattext.merge_aoe_spam then
		T.aoespam[51723] = 0		-- Fan of Knives
		T.aoespam[122233] = 3		-- Crimson Tempest (DoT)
		T.aoespam[2818] = 3			-- Deadly Poison
		T.aoespam[8680] = 3			-- Wound Poison
		T.aoespam[22482] = 3		-- Blade Flurry
		T.aoespam[16511] = 3		-- Hemorrhage
		T.aoespam[5374] = 0			-- Mutilate
		T.merge[27576] = 5374		-- Mutilate Off-Hand
		T.merge[113780] = 2818		-- Deadly Poison
		T.merge[168908] = 16511		-- Hemorrhage
		T.merge[121411] = 122233	-- Crimson Tempest
	end
	if E.db.combattext.healing then
		T.healfilter[112974] = true	-- Leeching Poison
	end
elseif E.myclass == "SHAMAN" then
	if E.db.combattext.merge_aoe_spam then
		-- Healing spells
		T.aoespam[73921] = 3		-- Healing Rain
		T.aoespam[52042] = 3		-- Healing Stream Totem
		T.aoespam[1064] = 3			-- Chain Heal
		T.aoespam[61295] = 3		-- Riptide
		T.aoespam[98021] = 3		-- Spirit Link
		T.aoespam[114911] = 3		-- Ancestral Guidance
		T.aoespam[114942] = 3		-- Healing Tide
		T.aoespam[114083] = 3		-- Restorative Mists
		-- Damaging spells
		T.aoespam[421] = 1			-- Chain Lightning
		T.aoespam[8349] = 0			-- Fire Nova
		T.aoespam[77478] = 3		-- Earhquake
		T.aoespam[51490] = 0		-- Thunderstorm
		T.aoespam[8187] = 3			-- Magma Totem
		T.aoespam[8050] = 3			-- Flame Shock
		T.aoespam[25504] = 3		-- Windfury Attack
		T.aoespam[10444] = 3		-- Flametongue Attack
		T.aoespam[3606] = 3			-- Searing Bolt
		T.aoespam[170379] = 3		-- Molten Earth
		T.aoespam[114074] = 1		-- Lava Beam
		T.aoespam[32175] = 0		-- Stormstrike
		T.aoespam[114089] = 3		-- Windlash
		T.aoespam[115357] = 0		-- Windstrike
		T.merge[168477] = 421		-- Chain Lightning (Multi)
		T.merge[168489] = 114074	-- Lava Beam (Multi)
		T.merge[32176] = 32175		-- Stormstrike Off-Hand
		T.merge[114093] = 114089	-- Windlash Off-Hand
		T.merge[115360] = 115357	-- Windstrike Off-Hand
	end
elseif E.myclass == "WARLOCK" then
	if E.db.combattext.merge_aoe_spam then
		T.aoespam[27243] = 3		-- Seed of Corruption
		T.aoespam[27285] = 3		-- Seed of Corruption (AoE)
		T.aoespam[87385] = 3		-- Seed of Corruption (Soulburn)
		T.aoespam[146739] = 3		-- Corruption
		T.aoespam[30108] = 3		-- Unstable Affliction
		T.aoespam[348] = 3			-- Immolate
		T.aoespam[980] = 3			-- Agony
		T.aoespam[80240] = 3		-- Havoc
		T.aoespam[42223] = 3		-- Rain of Fire
		T.aoespam[689] = 3			-- Drain Life
		T.aoespam[5857] = 3			-- Hellfire
		T.aoespam[129476] = 3		-- Immolation Aura
		T.aoespam[103103] = 3		-- Drain Soul
		T.aoespam[86040] = 3		-- Hand of Gul'dan
		T.aoespam[124915] = 3		-- Chaos Wave
		T.aoespam[47960] = 3		-- Shadowflame
		T.aoespam[30213] = 3		-- Legion Strike (Felguard)
		T.aoespam[89753] = 3		-- Felstorm (Felguard)
		T.aoespam[20153] = 3		-- Immolation (Infrenal)
		T.aoespam[114654] = 0		-- Incinerate
		T.aoespam[108685] = 0		-- Conflagrate
		T.aoespam[22703] = 0		-- Infernal Awakening
		T.aoespam[171017] = 0		-- Meteor Strike (Infrenal)
		T.aoespam[104318] = 3		-- Fel Firebolt
		T.aoespam[3110] = 3			-- Firebolt (Imp)
		T.merge[157736] = 348		-- Immolate
		T.merge[108686] = 348		-- Immolate
		T.merge[131737] = 980		-- Agony (Drain Soul)
		T.merge[131740] = 146739	-- Corruption (Drain Soul)
		T.merge[131736] = 30108		-- Unstable Affliction (Drain Soul)
	end
	if E.db.combattext.healing then
		T.healfilter[63106] = true	-- Siphon Life
		T.healfilter[89653] = true	-- Drain Life
		T.healfilter[108359] = true	-- Dark Regeneration
	end
elseif E.myclass == "WARRIOR" then
	if E.db.combattext.merge_aoe_spam then
		T.aoespam[46968] = 0		-- Shockwave
		T.aoespam[6343] = 0			-- Thunder Clap
		T.aoespam[1680] = 0			-- Whirlwind
		T.aoespam[115767] = 3		-- Deep Wounds
		T.aoespam[50622] = 3		-- Bladestorm
		T.aoespam[52174] = 0		-- Heroic Leap
		T.aoespam[118000] = 0		-- Dragon Roar
		T.aoespam[76858] = 3		-- Opportunity Strike
		T.aoespam[113344] = 3		-- Bloodbath
		T.aoespam[96103] = 0		-- Raging Blow
		T.aoespam[6572] = 0			-- Revenge
		T.aoespam[5308] = 0			-- Execute
		T.aoespam[772] = 3			-- Rend
		T.merge[44949] = 1680		-- Whirlwind Off-Hand
		T.merge[85384] = 96103		-- Raging Blow Off-Hand
		T.merge[95738] = 50622		-- Bladestorm Off-Hand
		T.merge[163558] = 5308		-- Execute Off-Hand
		T.merge[94009] = 772		-- Rend
	end
	if E.db.combattext.healing then
		T.healfilter[117313] = true	-- Bloodthirst Heal
		T.healfilter[55694] = true	-- Enraged Regeneration
		T.healfilter[159363] = true	-- Blood Craze
	end
end

-- Do not edit below unless you know what you are doing
local numf
if E.db.combattext.damage or E.db.combattext.healing then
	numf = 4
else
	numf = 3
end

-- Detect vehicle
local function SetUnit()
	if UnitHasVehicleUI("player") then
		ct.unit = "vehicle"
	else
		ct.unit = "player"
	end
	CombatTextSetActiveUnit(ct.unit)
end

-- Limit lines
local function LimitLines()
	for i = 1, #ct.frames do
		f = ct.frames[i]
		f:SetMaxLines(f:GetHeight() / E.private.general.dmgfont_size)
	end
end

-- Scrollable frames
local function SetScroll()
	for i = 1, #ct.frames do
		ct.frames[i]:EnableMouseWheel(true)
		ct.frames[i]:SetScript("OnMouseWheel", function(self, delta)
			if delta > 0 then
				self:ScrollUp()
			elseif delta < 0 then
				self:ScrollDown()
			end
		end)
	end
end

-- Partial resists styler
local part = "-%s [%s %s]"
local r, g, b

-- Function, handles everything
local function OnEvent(self, event, subevent, ...)
	if event == "COMBAT_TEXT_UPDATE" then
		local arg2, arg3 = ...
		if SHOW_COMBAT_TEXT == "0" then
			return
		else
			if subevent == "DAMAGE" then
				xCT1:AddMessage("-"..arg2, 0.75, 0.1, 0.1)
			elseif subevent == "DAMAGE_CRIT" then
				xCT1:AddMessage("|cffFF0000"..E.db.combattext.crit_prefix.."|r".."-"..arg2.."|cffFF0000"..E.db.combattext.crit_postfix.."|r", 1, 0.1, 0.1)
			elseif subevent == "SPELL_DAMAGE" then
				xCT1:AddMessage("-"..arg2, 0.75, 0.3, 0.85)
			elseif subevent == "SPELL_DAMAGE_CRIT" then
				xCT1:AddMessage("|cffFF0000"..E.db.combattext.crit_prefix.."|r".."-"..arg2.."|cffFF0000"..E.db.combattext.crit_postfix.."|r", 1, 0.3, 0.5)
			elseif subevent == "HEAL" then
				if arg3 >= E.db.combattext.heal_treshold then
					if arg2 then
						if COMBAT_TEXT_SHOW_FRIENDLY_NAMES == "1" then
							xCT2:AddMessage(arg2.." +"..arg3, 0.1, 0.75, 0.1)
						else
							xCT2:AddMessage("+"..arg3, 0.1, 0.75, 0.1)
						end
					end
				end
			elseif subevent == "HEAL_CRIT" then
				if arg3 >= E.db.combattext.heal_treshold then
					if arg2 then
						if COMBAT_TEXT_SHOW_FRIENDLY_NAMES == "1" then
							xCT2:AddMessage(arg2.." +"..arg3, 0.1, 1, 0.1)
						else
							xCT2:AddMessage("+"..arg3, 0.1, 1, 0.1)
						end
					end
				end
			elseif subevent == "PERIODIC_HEAL" then
				if arg3 >= E.db.combattext.heal_treshold then
					xCT2:AddMessage("+"..arg3, 0.1, 0.5, 0.1)
				end
			elseif subevent == "ABSORB_ADDED" and GetCVar("CombatHealingAbsorbSelf") == "1" then
				if arg3 >= E.db.combattext.heal_treshold then
					if arg2 then
						if COMBAT_TEXT_SHOW_FRIENDLY_NAMES == "1" then
							xCT2:AddMessage(arg2.." +"..arg3, 0.6, 0.65, 0.1)
						else
							xCT2:AddMessage("+"..arg3, 0.6, 0.65, 0.1)
						end
					end
				end
			elseif subevent == "SPELL_CAST" then
				xCT3:AddMessage(arg2, 1, 0.82, 0)
			elseif subevent == "MISS" and COMBAT_TEXT_SHOW_DODGE_PARRY_MISS == "1" then
				xCT1:AddMessage(MISS, 0.5, 0.5, 0.5)
			elseif subevent == "DODGE" and COMBAT_TEXT_SHOW_DODGE_PARRY_MISS == "1" then
				xCT1:AddMessage(DODGE, 0.5, 0.5, 0.5)
			elseif subevent == "PARRY" and COMBAT_TEXT_SHOW_DODGE_PARRY_MISS == "1" then
				xCT1:AddMessage(PARRY, 0.5, 0.5, 0.5)
			elseif subevent == "EVADE" and COMBAT_TEXT_SHOW_DODGE_PARRY_MISS == "1" then
				xCT1:AddMessage(EVADE, 0.5, 0.5, 0.5)
			elseif subevent == "IMMUNE" and COMBAT_TEXT_SHOW_DODGE_PARRY_MISS == "1" then
				xCT1:AddMessage(IMMUNE, 0.5, 0.5, 0.5)
			elseif subevent == "DEFLECT" and COMBAT_TEXT_SHOW_DODGE_PARRY_MISS == "1" then
				xCT1:AddMessage(DEFLECT, 0.5, 0.5, 0.5)
			elseif subevent == "REFLECT" and COMBAT_TEXT_SHOW_DODGE_PARRY_MISS == "1" then
				xCT1:AddMessage(REFLECT, 0.5, 0.5, 0.5)
			elseif subevent == "SPELL_MISS" and COMBAT_TEXT_SHOW_DODGE_PARRY_MISS == "1" then
				xCT1:AddMessage(MISS, 0.5, 0.5, 0.5)
			elseif subevent == "SPELL_DODGE"and COMBAT_TEXT_SHOW_DODGE_PARRY_MISS == "1" then
				xCT1:AddMessage(DODGE, 0.5, 0.5, 0.5)
			elseif subevent == "SPELL_PARRY" and COMBAT_TEXT_SHOW_DODGE_PARRY_MISS == "1" then
				xCT1:AddMessage(PARRY, 0.5, 0.5, 0.5)
			elseif subevent == "SPELL_EVADE" and COMBAT_TEXT_SHOW_DODGE_PARRY_MISS == "1" then
				xCT1:AddMessage(EVADE, 0.5, 0.5, 0.5)
			elseif subevent == "SPELL_IMMUNE" and COMBAT_TEXT_SHOW_DODGE_PARRY_MISS == "1" then
				xCT1:AddMessage(IMMUNE, 0.5, 0.5, 0.5)
			elseif subevent == "SPELL_DEFLECT" and COMBAT_TEXT_SHOW_DODGE_PARRY_MISS == "1" then
				xCT1:AddMessage(DEFLECT, 0.5, 0.5, 0.5)
			elseif subevent == "SPELL_REFLECT" and COMBAT_TEXT_SHOW_DODGE_PARRY_MISS == "1" then
				xCT1:AddMessage(REFLECT, 0.5, 0.5, 0.5)
			elseif subevent == "RESIST" then
				if arg3 then
					if COMBAT_TEXT_SHOW_RESISTANCES == "1" then
						xCT1:AddMessage(part:format(arg2, RESIST, arg3), 0.75, 0.5, 0.5)
					else
						xCT1:AddMessage("-"..arg2, 0.75, 0.1, 0.1)
					end
				elseif COMBAT_TEXT_SHOW_RESISTANCES == "1" then
					xCT1:AddMessage(RESIST, 0.5, 0.5, 0.5)
				end
			elseif subevent == "BLOCK" then
				if arg3 then
					if COMBAT_TEXT_SHOW_RESISTANCES == "1" then
						xCT1:AddMessage(part:format(arg2, BLOCK, arg3), 0.75, 0.5, 0.5)
					else
						xCT1:AddMessage("-"..arg2, 0.75, 0.1, 0.1)
					end
				elseif COMBAT_TEXT_SHOW_RESISTANCES == "1" then
					xCT1:AddMessage(BLOCK, 0.5, 0.5, 0.5)
				end
			elseif subevent == "ABSORB" then
				if arg3 then
					if COMBAT_TEXT_SHOW_RESISTANCES == "1" then
						xCT1:AddMessage(part:format(arg2, ABSORB, arg3), 0.75, 0.5, 0.5)
					else
						xCT1:AddMessage("-"..arg2, 0.75, 0.1, 0.1)
					end
				elseif COMBAT_TEXT_SHOW_RESISTANCES == "1" then
					xCT1:AddMessage(ABSORB, 0.5, 0.5, 0.5)
				end
			elseif subevent == "SPELL_RESIST" then
				if arg3 then
					if COMBAT_TEXT_SHOW_RESISTANCES == "1" then
						xCT1:AddMessage(part:format(arg2, RESIST, arg3), 0.5, 0.3, 0.5)
					else
						xCT1:AddMessage("-"..arg2, 0.75, 0.3, 0.85)
					end
				elseif COMBAT_TEXT_SHOW_RESISTANCES == "1" then
					xCT1:AddMessage(RESIST, 0.5, 0.5, 0.5)
				end
			elseif subevent == "SPELL_BLOCK" then
				if arg3 then
					if COMBAT_TEXT_SHOW_RESISTANCES == "1" then
						xCT1:AddMessage(part:format(arg2, BLOCK, arg3), 0.5, 0.3, 0.5)
					else
						xCT1:AddMessage("-"..arg2, 0.75, 0.3, 0.85)
					end
				elseif COMBAT_TEXT_SHOW_RESISTANCES == "1" then
					xCT1:AddMessage(BLOCK, 0.5, 0.5, 0.5)
				end
			elseif subevent == "SPELL_ABSORB" then
				if arg3 then
					if COMBAT_TEXT_SHOW_RESISTANCES == "1" then
						xCT1:AddMessage(part:format(arg2, ABSORB, arg3), 0.5, 0.3, 0.5)
					else
						xCT1:AddMessage("-"..arg2, 0.75, 0.3, 0.85)
					end
				elseif COMBAT_TEXT_SHOW_RESISTANCES == "1" then
					xCT1:AddMessage(ABSORB, 0.5, 0.5, 0.5)
				end
			elseif subevent == "ENERGIZE" and COMBAT_TEXT_SHOW_ENERGIZE == "1" then
				if tonumber(arg2) > 0 then
					if arg3 and arg3 == "MANA" or arg3 == "RAGE" or arg3 == "FOCUS" or arg3 == "ENERGY" or arg3 == "RUNIC_POWER" or arg3 == "SOUL_SHARDS" or arg3 == "HOLY_POWER" or arg3 == "CHI" then
						xCT3:AddMessage("+"..arg2.." ".._G[arg3], PowerBarColor[arg3].r, PowerBarColor[arg3].g, PowerBarColor[arg3].b)
					elseif arg3 and arg3 == "ECLIPSE" then
						xCT3:AddMessage("+"..arg2.." "..BALANCE_POSITIVE_ENERGY, PowerBarColor[arg3].positive.r, PowerBarColor[arg3].positive.g, PowerBarColor[arg3].positive.b)
					end
				else
					if arg3 and arg3 == "ECLIPSE" then
						xCT3:AddMessage("+"..abs(arg2).." "..BALANCE_NEGATIVE_ENERGY, PowerBarColor[arg3].negative.r, PowerBarColor[arg3].negative.g, PowerBarColor[arg3].negative.b)
					end
				end
			elseif subevent == "PERIODIC_ENERGIZE" and COMBAT_TEXT_SHOW_PERIODIC_ENERGIZE == "1" then
				if tonumber(arg2) > 0 then
					if arg3 and arg3 == "MANA" or arg3 == "RAGE" or arg3 == "FOCUS" or arg3 == "ENERGY" or arg3 == "RUNIC_POWER" or arg3 == "SOUL_SHARDS" or arg3 == "HOLY_POWER" or arg3 == "CHI" then
						xCT3:AddMessage("+"..arg2.." ".._G[arg3], PowerBarColor[arg3].r, PowerBarColor[arg3].g, PowerBarColor[arg3].b)
					elseif arg3 and arg3 == "ECLIPSE" then
						xCT3:AddMessage("+"..arg2.." "..BALANCE_POSITIVE_ENERGY, PowerBarColor[arg3].positive.r, PowerBarColor[arg3].positive.g, PowerBarColor[arg3].positive.b)
					end
				else
					if arg3 and arg3 == "ECLIPSE" then
						xCT3:AddMessage("+"..abs(arg2).." "..BALANCE_NEGATIVE_ENERGY, PowerBarColor[arg3].negative.r, PowerBarColor[arg3].negative.g, PowerBarColor[arg3].negative.b)
					end
				end
			elseif subevent == "SPELL_AURA_START" and COMBAT_TEXT_SHOW_AURAS == "1" then
				xCT3:AddMessage("+"..arg2, 1, 0.5, 0.5)
			elseif subevent == "SPELL_AURA_END" and COMBAT_TEXT_SHOW_AURAS == "1" then
				xCT3:AddMessage("-"..arg2, 0.5, 0.5, 0.5)
			elseif subevent == "SPELL_AURA_START_HARMFUL" and COMBAT_TEXT_SHOW_AURAS == "1" then
				xCT3:AddMessage("+"..arg2, 1, 0.1, 0.1)
			elseif subevent == "SPELL_AURA_END_HARMFUL" and COMBAT_TEXT_SHOW_AURAS == "1" then
				xCT3:AddMessage("-"..arg2, 0.1, 1, 0.1)
			elseif subevent == "HONOR_GAINED" and COMBAT_TEXT_SHOW_HONOR_GAINED == "1" then
				arg2 = tonumber(arg2)
				if arg2 and abs(arg2) > 1 then
					arg2 = floor(arg2)
					if arg2 > 0 then
						xCT3:AddMessage(HONOR.." +"..arg2, 0.1, 0.1, 1)
					end
				end
			elseif subevent == "FACTION" and COMBAT_TEXT_SHOW_REPUTATION == "1" then
				xCT3:AddMessage(arg2.." +"..arg3, 0.1, 0.1, 1)
			elseif subevent == "SPELL_ACTIVE" and COMBAT_TEXT_SHOW_REACTIVES == "1" then
				xCT3:AddMessage(arg2, 1, 0.82, 0)
			end
		end
	elseif event == "UNIT_HEALTH" and COMBAT_TEXT_SHOW_LOW_HEALTH_MANA == "1" then
		if subevent == ct.unit then
			if UnitHealth(ct.unit) / UnitHealthMax(ct.unit) <= COMBAT_TEXT_LOW_HEALTH_THRESHOLD then
				if not lowHealth then
					xCT3:AddMessage(HEALTH_LOW, 1, 0.1, 0.1)
					lowHealth = true
				end
			else
				lowHealth = nil
			end
		end
	elseif event == "UNIT_MANA" and COMBAT_TEXT_SHOW_LOW_HEALTH_MANA == "1" then
		if subevent == ct.unit then
			local _, powerToken = UnitPowerType(ct.unit)
			if powerToken == "MANA" and (UnitPower(ct.unit) / UnitPowerMax(ct.unit)) <= COMBAT_TEXT_LOW_MANA_THRESHOLD then
				if not lowMana then
					xCT3:AddMessage(MANA_LOW, 1, 0.1, 0.1)
					lowMana = true
				end
			else
				lowMana = nil
			end
		end
	elseif event == "PLAYER_REGEN_ENABLED" and COMBAT_TEXT_SHOW_COMBAT_STATE == "1" then
			xCT3:AddMessage("-"..LEAVING_COMBAT, 0.1, 1, 0.1)
	elseif event == "PLAYER_REGEN_DISABLED" and COMBAT_TEXT_SHOW_COMBAT_STATE == "1" then
			xCT3:AddMessage("+"..ENTERING_COMBAT, 1, 0.1, 0.1)
	elseif event == "UNIT_COMBO_POINTS" and COMBAT_TEXT_SHOW_COMBO_POINTS == "1" then
		if subevent == ct.unit then
			local cp = GetComboPoints(ct.unit, "target")
			if cp > 0 then
				r, g, b = 1, 0.82, 0
				if cp == MAX_COMBO_POINTS then
					r, g, b = 0, 0.82, 1
				end
				xCT3:AddMessage(format(COMBAT_TEXT_COMBO_POINTS, cp), r, g, b)
			end
		end
	elseif event == "RUNE_POWER_UPDATE" then
		local arg1 = subevent
		if GetRuneCooldown(arg1) ~= 0 then return end
		local rune = GetRuneType(arg1)
		local msg = COMBAT_TEXT_RUNE[rune]
		if rune == 1 then
			r, g, b = 0.75, 0, 0
		elseif rune == 2 then
			r, g, b = 0.75, 1, 0
		elseif rune == 3 then
			r, g, b = 0, 1, 1
		elseif rune == 4 then
			r, g, b = 0.8, 0.7, 0.6
		end
		if rune then
			xCT3:AddMessage("+"..msg, r, g, b)
		end
	elseif event == "UNIT_ENTERED_VEHICLE" or event == "UNIT_EXITING_VEHICLE" then
		if arg1 == "player" then
			SetUnit()
		end
	elseif event == "PLAYER_ENTERING_WORLD" then
		SetUnit()
		if E.db.combattext.scrollable then
			SetScroll()
		else
			LimitLines()
		end
		if E.db.combattext.damage or E.db.combattext.healing then
			ct.pguid = UnitGUID("player")
		end
	end
end

-- Change damage font
if E.db.combattext.damage_style then
	DAMAGE_TEXT_FONT = E.private.general.dmgfont
end

-- Frames
ct.locked = true
ct.frames = {}
for i = 1, numf do
	local f = CreateFrame("ScrollingMessageFrame", "xCT"..i, UIParent)
	f:SetFont(E.private.general.dmgfont, E.private.general.dmgfont_size, E.private.general.dmgfont_style)
	f:SetShadowColor(0, 0, 0, E.private.general.dmgfont_shadow and 1 or 0)
	f:SetShadowOffset(E.private.general.dmgfont_shadow and 1 or 0, E.private.general.dmgfont_shadow and -1 or 0)
	f:SetTimeVisible(E.db.combattext.time_visible)
	f:SetMaxLines(E.db.combattext.max_lines)
	f:SetSpacing(1)
	f:SetWidth(128)
	f:SetHeight(112)
	f:SetPoint("CENTER", 0, 0)
	f:SetMovable(true)
	f:SetResizable(true)
	f:SetMinResize(128, 128)
	f:SetMaxResize(768, 768)
	f:SetClampedToScreen(true)
	f:SetClampRectInsets(0, 0, E.private.general.dmgfont_size, 0)
	f:SetInsertMode(E.db.combattext.direction or "bottom")
	if i == 1 then
		f:SetJustifyH(ct.justify_1)
		if C.unitframe.enable == true and _G.oUF_Player then
			f:SetPoint("BOTTOMLEFT", "oUF_Player", "TOPLEFT", -3, 60)
		else
			f:SetPoint("CENTER", -192, -32)
		end
	elseif i == 2 then
		f:SetJustifyH(ct.justify_2)
		if C.unitframe.enable == true and _G.oUF_Player then
			f:SetPoint("BOTTOMRIGHT", "oUF_Player", "TOPRIGHT", 5, 60)
		else
			f:SetPoint("CENTER", 192, -32)
		end
	elseif i == 3 then
		f:SetJustifyH(ct.justify_3)
		f:SetWidth(256)
		f:SetPoint("CENTER", 0, 205)
	else
		f:SetJustifyH(ct.justify_4)
		f:SetWidth(200)
		if E.db.combattext.icons then
			f:SetHeight(150)
		end
		if C.unitframe.enable == true and _G.oUF_Target then
			f:SetPoint("BOTTOMRIGHT", "oUF_Target", "TOPRIGHT", 2, 278)
		else
			f:SetPoint("CENTER", 330, 205)
		end
		local a, _, c = f:GetFont()
		if E.private.general.dmgfont_size == "auto" then
			if E.db.combattext.icons then
				f:SetFont(a, E.db.combattext.icon_size / 2, c)
			end
		elseif type(E.private.general.dmgfont_size) == "number" then
			f:SetFont(a, E.private.general.dmgfont_size, c)
		end
	end
	ct.frames[i] = f
end

-- Register events
local xCT = CreateFrame("Frame")
xCT:RegisterEvent("COMBAT_TEXT_UPDATE")
xCT:RegisterEvent("UNIT_HEALTH")
xCT:RegisterEvent("UNIT_MANA")
xCT:RegisterEvent("PLAYER_REGEN_DISABLED")
xCT:RegisterEvent("PLAYER_REGEN_ENABLED")
xCT:RegisterEvent("UNIT_COMBO_POINTS")
if E.db.combattext.dk_runes and E.myclass == "DEATHKNIGHT" then
	xCT:RegisterEvent("RUNE_POWER_UPDATE")
end
xCT:RegisterEvent("UNIT_ENTERED_VEHICLE")
xCT:RegisterEvent("UNIT_EXITING_VEHICLE")
xCT:RegisterEvent("PLAYER_ENTERING_WORLD")
xCT:SetScript("OnEvent", OnEvent)

-- Turn off Blizzard CT
CombatText:UnregisterAllEvents()
CombatText:SetScript("OnLoad", nil)
CombatText:SetScript("OnEvent", nil)
CombatText:SetScript("OnUpdate", nil)

-- Steal external messages sent by other addons using CombatText_AddMessage
hooksecurefunc("CombatText_AddMessage", function(message, scrollFunction, r, g, b, displayType, isStaggered)
	local lastEntry = COMBAT_TEXT_TO_ANIMATE[#COMBAT_TEXT_TO_ANIMATE]
	CombatText_RemoveMessage(lastEntry)
	xCT3:AddMessage(message, r, g, b)
end)

-- Color printer
local pr = function(msg)
	print(tostring(msg))
end

-- Configmode and testmode
local StartConfigmode = function()
	if not InCombatLockdown()then
		for i = 1, #ct.frames do
			f = ct.frames[i]
			f:SetTemplate("Transparent")
			f:SetBackdropBorderColor(1, 0, 0, 1)

			f.fs = f:CreateFontString(nil, "OVERLAY")
			f.fs:SetFont(E.private.general.dmgfont, E.private.general.dmgfont_size, E.private.general.dmgfont_style)
			f.fs:SetPoint("BOTTOM", f, "TOP", 0, 0)
			if i == 1 then
				f.fs:SetText(DAMAGE)
				f.fs:SetTextColor(1, 0.1, 0.1, 0.9)
			elseif i == 2 then
				f.fs:SetText(SHOW_COMBAT_HEALING)
				f.fs:SetTextColor(0.1, 1, 0.1, 0.9)
			elseif i == 3 then
				f.fs:SetText(COMBAT_TEXT_LABEL)
				f.fs:SetTextColor(0.1, 0.1, 1, 0.9)
			else
				f.fs:SetText(SCORE_DAMAGE_DONE.." / "..SCORE_HEALING_DONE)
				f.fs:SetTextColor(1, 1, 0, 0.9)
			end

			f.t = f:CreateTexture("ARTWORK")
			f.t:SetPoint("TOPLEFT", f, "TOPLEFT", 1, -1)
			f.t:SetPoint("TOPRIGHT", f, "TOPRIGHT", -1, -19)
			f.t:SetHeight(20)
			f.t:SetTexture(0.5, 0.5, 0.5)
			f.t:SetAlpha(0.3)

			f.d = f:CreateTexture("ARTWORK")
			f.d:SetHeight(16)
			f.d:SetWidth(16)
			f.d:SetPoint("BOTTOMRIGHT", f, "BOTTOMRIGHT", -1, 1)
			f.d:SetTexture(0.5, 0.5, 0.5)
			f.d:SetAlpha(0.3)

			f.tr = f:CreateTitleRegion()
			f.tr:SetPoint("TOPLEFT", f, "TOPLEFT", 0, 0)
			f.tr:SetPoint("TOPRIGHT", f, "TOPRIGHT", 0, 0)
			f.tr:SetHeight(20)

			f:EnableMouse(true)
			f:RegisterForDrag("LeftButton")
			f:SetScript("OnDragStart", f.StartSizing)
			if not E.db.combattext.scrollable then
				f:SetScript("OnSizeChanged", function(self)
					self:SetMaxLines(self:GetHeight() / E.private.general.dmgfont_size)
					self:Clear()
				end)
			end

			f:SetScript("OnDragStop", f.StopMovingOrSizing)
			ct.locked = false
		end
		pr("|cffffff00"..L_COMBATTEXT_UNLOCKED.."|r")
	else
		pr("|cffffff00"..ERR_NOT_IN_COMBAT.."|r")
	end
end

local function EndConfigmode()
	for i = 1, #ct.frames do
		f = ct.frames[i]
		f:SetBackdrop(nil)
		f.iborder:Hide()
		f.oborder:Hide()
		f.fs:Hide()
		f.fs = nil
		f.t:Hide()
		f.t = nil
		f.d:Hide()
		f.d = nil
		f.tr = nil
		f:EnableMouse(false)
		f:SetScript("OnDragStart", nil)
		f:SetScript("OnDragStop", nil)
	end
	ct.locked = true
	pr("|cffffff00"..L_COMBATTEXT_UNSAVED.."|r")
end

local function StartTestMode()
	-- Init random number generator
	local random = math.random
	random(time()); random(); random(time())

	local TimeSinceLastUpdate = 0
	local UpdateInterval
	if E.db.combattext.damage_color then
		ct.dmindex = {}
		ct.dmindex[1] = 1
		ct.dmindex[2] = 2
		ct.dmindex[3] = 4
		ct.dmindex[4] = 8
		ct.dmindex[5] = 16
		ct.dmindex[6] = 32
		ct.dmindex[7] = 64
	end

	for i = 1, #ct.frames do
		ct.frames[i]:SetScript("OnUpdate", function(self, elapsed)
			UpdateInterval = random(65, 1000) / 250
			TimeSinceLastUpdate = TimeSinceLastUpdate + elapsed
			if TimeSinceLastUpdate > UpdateInterval then
				if i == 1 then
					ct.frames[i]:AddMessage("-"..random(100000), 1, random(255) / 255, random(255) / 255)
				elseif i == 2 then
					ct.frames[i]:AddMessage("+"..random(50000), 0.1, random(128, 255) / 255, 0.1)
				elseif i == 3 then
					ct.frames[i]:AddMessage(COMBAT_TEXT_LABEL, random(255) / 255, random(255) / 255, random(255) / 255)
				elseif i == 4 then
					local msg
					local icon
					local color = {}
					msg = random(40000)
					if E.db.combattext.icons then
						_, _, icon = GetSpellInfo(msg)
					end
					if icon then
						msg = msg.." \124T"..icon..":"..E.db.combattext.icon_size..":"..E.db.combattext.icon_size..":0:0:64:64:5:59:5:59\124t"
						if E.db.combattext.damage_color then
							color = ct.dmgcolor[ct.dmindex[random(#ct.dmindex)]]
						else
							color = {1, 1, 0}
						end
					elseif E.db.combattext.damage_color and not E.db.combattext.icons then
						color = ct.dmgcolor[ct.dmindex[random(#ct.dmindex)]]
					elseif not E.db.combattext.damage_color then
						color = {1, 1, random(0, 1)}
					end
					ct.frames[i]:AddMessage(msg, unpack(color))
				end
				TimeSinceLastUpdate = 0
			end
		end)
		ct.testmode = true
	end
end

local function EndTestMode()
	for i = 1, #ct.frames do
		ct.frames[i]:SetScript("OnUpdate", nil)
		ct.frames[i]:Clear()
	end
	if E.db.combattext.damage_color then
		ct.dmindex = nil
	end
	ct.testmode = false
end

-- Popup dialog
StaticPopupDialogs.XCT_LOCK = {
	text = L_COMBATTEXT_POPUP,
	button1 = ACCEPT,
	button2 = CANCEL,
	OnAccept = function() if not InCombatLockdown() then ReloadUI() else EndConfigmode() end end,
	OnCancel = EndConfigmode,
	timeout = 0,
	whileDead = 1,
	hideOnEscape = true,
	showAlert = true,
	preferredIndex = 5,
}

-- Slash commands
SlashCmdList.XCT = function(input)
	input = string.lower(input)
	if input == "unlock" then
		if ct.locked then
			StartConfigmode()
		else
			pr("|cffffff00"..L_COMBATTEXT_ALREADY_UNLOCKED.."|r")
		end
	elseif input == "lock" then
		if ct.locked then
			pr("|cffffff00"..L_COMBATTEXT_ALREADY_LOCKED.."|r")
		else
			StaticPopup_Show("XCT_LOCK")
		end
	elseif input == "test" then
		if ct.testmode then
			EndTestMode()
			pr("|cffffff00"..L_COMBATTEXT_TEST_DISABLED.."|r")
		else
			StartTestMode()
			pr("|cffffff00"..L_COMBATTEXT_TEST_ENABLED.."|r")
		end
	else
		pr("|cffffff00"..L_COMBATTEXT_TEST_USE_UNLOCK.."|r")
		pr("|cffffff00"..L_COMBATTEXT_TEST_USE_LOCK.."|r")
		pr("|cffffff00"..L_COMBATTEXT_TEST_USE_TEST.."|r")
	end
end
SLASH_XCT1 = "/xct"

-- Spam merger
local SQ
if E.db.combattext.merge_aoe_spam then
	if E.db.combattext.damage or E.db.combattext.healing then
		local pairs = pairs
		SQ = {}
		for k, v in pairs(T.aoespam) do
			SQ[k] = {queue = 0, msg = "", color = {}, count = 0, utime = 0, locked = false}
		end
		ct.SpamQueue = function(spellId, add)
			local amount
			local spam = SQ[spellId]["queue"]
			if spam and type(spam) == "number" then
				amount = spam + add
			else
				amount = add
			end
			return amount
		end
		local tslu = 0
		local xCTspam = CreateFrame("Frame")
		xCTspam:SetScript("OnUpdate", function(self, elapsed)
			local count
			tslu = tslu + elapsed
			if tslu > 0.5 then
				tslu = 0
				local utime = time()
				for k, v in pairs(SQ) do
					if not SQ[k]["locked"] and SQ[k]["queue"] > 0 and SQ[k]["utime"] <= utime then
						if SQ[k]["count"] > 1 then
							count = " |cffFFFFFF x "..SQ[k]["count"].."|r"
						else
							count = ""
						end
						xCT4:AddMessage(SQ[k]["queue"]..count..SQ[k]["msg"], unpack(SQ[k]["color"]))
						SQ[k]["queue"] = 0
						SQ[k]["count"] = 0
					end
				end
			end
		end)
	end
end

-- Damage
if E.db.combattext.damage then
	local unpack, select, time = unpack, select, time
	local gflags = bit.bor(COMBATLOG_OBJECT_AFFILIATION_MINE,
 		COMBATLOG_OBJECT_REACTION_FRIENDLY,
 		COMBATLOG_OBJECT_CONTROL_PLAYER,
 		COMBATLOG_OBJECT_TYPE_GUARDIAN
 	)
	local xCTd = CreateFrame("Frame")
	if E.db.combattext.damage_color then
		ct.dmgcolor = {}
		ct.dmgcolor[1] = {1, 1, 0}		-- Physical
		ct.dmgcolor[2] = {1, 0.9, 0.5}	-- Holy
		ct.dmgcolor[4] = {1, 0.5, 0}	-- Fire
		ct.dmgcolor[8] = {0.3, 1, 0.3}	-- Nature
		ct.dmgcolor[16] = {0.5, 1, 1}	-- Frost
		ct.dmgcolor[32] = {0.5, 0.5, 1}	-- Shadow
		ct.dmgcolor[64] = {1, 0.5, 1}	-- Arcane
	end
	if E.db.combattext.icons then
		ct.blank = E["media"].blankTex
	end
	local misstypes = {ABSORB = ABSORB, BLOCK = BLOCK, DEFLECT = DEFLECT, DODGE = DODGE, EVADE = EVADE, IMMUNE = IMMUNE, MISS = MISS, MISFIRE = MISS, PARRY = PARRY, REFLECT = REFLECT, RESIST = RESIST}
	local dmg = function(self, event, ...)
		local msg, icon
		local eventType, _, sourceGUID, _, sourceFlags, _, destGUID = select(2, ...)
		if (sourceGUID == ct.pguid and destGUID ~= ct.pguid) or (sourceGUID == UnitGUID("pet") and E.db.combattext.pet_damage) or (sourceFlags == gflags) then
			if eventType == "SWING_DAMAGE" then
				local amount, _, _, _, _, _, critical = select(12, ...)
				if amount >= E.db.combattext.treshold then
					local rawamount = amount
					if critical then
						amount = "|cffFF0000"..E.db.combattext.crit_prefix.."|r"..amount.."|cffFF0000"..E.db.combattext.crit_postfix.."|r"
					end
					if E.db.combattext.icons then
						if (sourceGUID == UnitGUID("pet")) or (sourceFlags == gflags) then
							icon = PET_ATTACK_TEXTURE
						else
							icon = GetSpellTexture(6603)
						end
						msg = " \124T"..icon..":"..E.db.combattext.icon_size..":"..E.db.combattext.icon_size..":0:0:64:64:5:59:5:59\124t"
					end
					local color = {1, 1, 1}
					if E.db.combattext.merge_aoe_spam and E.db.combattext.merge_melee then
						local spellId = 6603
						SQ[spellId]["locked"] = true
						SQ[spellId]["queue"] = ct.SpamQueue(spellId, rawamount)
						SQ[spellId]["msg"] = msg
						SQ[spellId]["color"] = color
						SQ[spellId]["count"] = SQ[spellId]["count"] + 1
						if SQ[spellId]["count"] == 1 then
							SQ[spellId]["utime"] = time() + T.aoespam[spellId]
						end
						SQ[spellId]["locked"] = false
						return
					end
					xCT4:AddMessage(amount..""..msg, unpack(color))
				end
			elseif eventType == "RANGE_DAMAGE" then
				local spellId, _, _, amount, _, _, _, _, _, critical = select(12, ...)
				if amount >= E.db.combattext.treshold then
					msg = amount
					if critical then
						msg = "|cffFF0000"..E.db.combattext.crit_prefix.."|r"..msg.."|cffFF0000"..E.db.combattext.crit_postfix.."|r"
					end
					if E.db.combattext.icons then
						icon = GetSpellTexture(spellId)
						msg = msg.." \124T"..icon..":"..E.db.combattext.icon_size..":"..E.db.combattext.icon_size..":0:0:64:64:5:59:5:59\124t"
					end
					xCT4:AddMessage(msg)
				end
			elseif eventType == "SPELL_DAMAGE" or (eventType == "SPELL_PERIODIC_DAMAGE" and E.db.combattext.dot_damage) then
				local spellId, _, spellSchool, amount, _, _, _, _, _, critical = select(12, ...)
				if amount >= E.db.combattext.treshold then
					local color = {}
					local rawamount = amount
					if critical then
						amount = "|cffFF0000"..E.db.combattext.crit_prefix.."|r"..amount.."|cffFF0000"..E.db.combattext.crit_postfix.."|r"
					end
					if E.db.combattext.icons then
						icon = GetSpellTexture(spellId)
					end
					if E.db.combattext.damage_color then
						if ct.dmgcolor[spellSchool] then
							color = ct.dmgcolor[spellSchool]
						else
							color = ct.dmgcolor[1]
						end
					else
						color = {1, 1, 0}
					end
					if icon then
						msg = " \124T"..icon..":"..E.db.combattext.icon_size..":"..E.db.combattext.icon_size..":0:0:64:64:5:59:5:59\124t"
					elseif E.db.combattext.icons then
						msg = " \124T"..ct.blank..":"..E.db.combattext.icon_size..":"..E.db.combattext.icon_size..":0:0:64:64:5:59:5:59\124t"
					else
						msg = ""
					end
					if E.db.combattext.merge_aoe_spam then
						spellId = T.merge[spellId] or spellId
						if T.aoespam[spellId] then
							SQ[spellId]["locked"] = true
							SQ[spellId]["queue"] = ct.SpamQueue(spellId, rawamount)
							SQ[spellId]["msg"] = msg
							SQ[spellId]["color"] = color
							SQ[spellId]["count"] = SQ[spellId]["count"] + 1
							if SQ[spellId]["count"] == 1 then
								SQ[spellId]["utime"] = time() + T.aoespam[spellId]
							end
							SQ[spellId]["locked"] = false
							return
						end
					end
					xCT4:AddMessage(amount..""..msg, unpack(color))
				end
			elseif eventType == "SWING_MISSED" then
				local missType = select(12, ...)
				if E.db.combattext.icons then
					if sourceGUID == UnitGUID("pet") or sourceFlags == gflags then
						icon = PET_ATTACK_TEXTURE
					else
						icon = GetSpellTexture(6603)
					end
					missType = misstypes[missType].." \124T"..icon..":"..E.db.combattext.icon_size..":"..E.db.combattext.icon_size..":0:0:64:64:5:59:5:59\124t"
				else
					missType = misstypes[missType]
				end
				xCT4:AddMessage(missType)
			elseif eventType == "SPELL_MISSED" or eventType == "RANGE_MISSED" then
				local spellId, _, _, missType = select(12, ...)
				if missType == "IMMUNE" and spellId == 118895 then return end
				if E.db.combattext.icons then
					icon = GetSpellTexture(spellId)
					missType = misstypes[missType].." \124T"..icon..":"..E.db.combattext.icon_size..":"..E.db.combattext.icon_size..":0:0:64:64:5:59:5:59\124t"
				else
					missType = misstypes[missType]
				end
				xCT4:AddMessage(missType)
			elseif eventType == "SPELL_DISPEL" and E.db.combattext.dispel then
				local id, effect, _, etype = select(15, ...)
				local color
				if E.db.combattext.icons then
					icon = GetSpellTexture(id)
				end
				if icon then
					msg = " \124T"..icon..":"..E.db.combattext.icon_size..":"..E.db.combattext.icon_size..":0:0:64:64:5:59:5:59\124t"
				elseif E.db.combattext.icons then
					msg = " \124T"..ct.blank..":"..E.db.combattext.icon_size..":"..E.db.combattext.icon_size..":0:0:64:64:5:59:5:59\124t"
				else
					msg = ""
				end
				if etype == "BUFF" then
					color = {0, 1, 0.5}
				else
					color = {1, 0, 0.5}
				end
				xCT3:AddMessage(ACTION_SPELL_DISPEL..": "..effect..msg, unpack(color))
			elseif eventType == "SPELL_STOLEN" and E.db.combattext.dispel then
				local id, effect = select(15, ...)
				local color = {1, 0.5, 0}
				if E.db.combattext.icons then
					icon = GetSpellTexture(id)
				end
				if icon then
					msg = " \124T"..icon..":"..E.db.combattext.icon_size..":"..E.db.combattext.icon_size..":0:0:64:64:5:59:5:59\124t"
				elseif E.db.combattext.icons then
					msg = " \124T"..ct.blank..":"..E.db.combattext.icon_size..":"..E.db.combattext.icon_size..":0:0:64:64:5:59:5:59\124t"
				else
					msg = ""
				end
				xCT3:AddMessage(ACTION_SPELL_STOLEN..": "..effect..msg, unpack(color))
			elseif eventType == "SPELL_INTERRUPT" and E.db.combattext.interrupt then
				local id, effect = select(15, ...)
				local color = {1, 0.5, 0}
				if E.db.combattext.icons then
					icon = GetSpellTexture(id)
				end
				if icon then
					msg = " \124T"..icon..":"..E.db.combattext.icon_size..":"..E.db.combattext.icon_size..":0:0:64:64:5:59:5:59\124t"
				elseif E.db.combattext.icons then
					msg = " \124T"..ct.blank..":"..E.db.combattext.icon_size..":"..E.db.combattext.icon_size..":0:0:64:64:5:59:5:59\124t"
				else
					msg = ""
				end
				xCT3:AddMessage(ACTION_SPELL_INTERRUPT..": "..effect..msg, unpack(color))
			elseif eventType == "PARTY_KILL" and E.db.combattext.killingblow then
				local destGUID, tname = select(8, ...)
				local classIndex = select(2, GetPlayerInfoByGUID(destGUID))
				local color = classIndex and RAID_CLASS_COLORS[classIndex] or {r = 0.2, g = 1, b = 0.2}
				xCT3:AddMessage("|cff33FF33"..ACTION_PARTY_KILL..": |r"..tname, color.r, color.g, color.b)
			end
		end
	end

	xCTd:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
	xCTd:SetScript("OnEvent", dmg)
end

-- Healing
if E.db.combattext.healing then
	local unpack, select, time = unpack, select, time
	local xCTh = CreateFrame("Frame")
	if E.db.combattext.icons then
		ct.blank = E["media"].blankTex
	end
	local heal = function(self, event, ...)
		local msg, icon
		local eventType, _, sourceGUID, _, sourceFlags = select(2, ...)
		if sourceGUID == ct.pguid or sourceFlags == gflags then
			if eventType == "SPELL_HEAL" or (eventType == "SPELL_PERIODIC_HEAL" and E.db.combattext.show_hots) then
				if E.db.combattext.healing then
					local spellId, _, _, amount, overhealing, _, critical = select(12, ...)
					if T.healfilter[spellId] then
						return
					end
					if amount >= E.db.combattext.heal_treshold then
						local color = {}
						local rawamount = amount
						if E.db.combattext.show_overhealing and abs(overhealing) > 0 then
							amount = math.floor(amount-overhealing).." ["..floor(overhealing).."]"
						end
						if critical then
							amount = "|cffFF0000"..E.db.combattext.crit_prefix.."|r"..amount.."|cffFF0000"..E.db.combattext.crit_postfix.."|r"
							color = {0.1, 1, 0.1}
						else
							color = {0.1, 0.65, 0.1}
						end
						if E.db.combattext.icons then
							icon = GetSpellTexture(spellId)
						else
							msg = ""
						end
						if icon then
							msg = " \124T"..icon..":"..E.db.combattext.icon_size..":"..E.db.combattext.icon_size..":0:0:64:64:5:59:5:59\124t"
						elseif E.db.combattext.icons then
							msg=" \124T"..ct.blank..":"..E.db.combattext.icon_size..":"..E.db.combattext.icon_size..":0:0:64:64:5:59:5:59\124t"
						end
						if E.db.combattext.merge_aoe_spam then
							spellId = T.merge[spellId] or spellId
							if T.aoespam[spellId] then
								SQ[spellId]["locked"] = true
								SQ[spellId]["queue"] = ct.SpamQueue(spellId, rawamount)
								SQ[spellId]["msg"] = msg
								SQ[spellId]["color"] = color
								SQ[spellId]["count"] = SQ[spellId]["count"] + 1
								if SQ[spellId]["count"] == 1 then
									SQ[spellId]["utime"] = time() + T.aoespam[spellId]
								end
								SQ[spellId]["locked"] = false
								return
							end
						end
						xCT4:AddMessage(amount..""..msg, unpack(color))
					end
				end
			end
		end
	end

	xCTh:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
	xCTh:SetScript("OnEvent", heal)
end
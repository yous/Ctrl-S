local E, L, V, P, G = unpack(select(2, ...)); --Engine

G['RLBox'] = {}

G['RLBox']['DEFAULT_SPELLS'] = {
	{'MONK', 115310, true, nil}, 
	{'DRUID', 740, true, nil}, 
	{'WARRIOR', 97462, true, nil},
--	{'WARRIOR', 114203, true, nil},
	{'PRIEST', 64843, true, nil}, 
	{'PRIEST', 62618, true, nil}, 
	{'PRIEST', 15286, true, nil}, 
	{'PALADIN', 31821, true, nil}, 
	{'ROGUE', 76577, true, nil}, 
	{'DEATHKNIGHT', 51052, true, nil}, 
	{'SHAMAN', 108280, true, nil}, 
	{'SHAMAN', 98008, true, nil}, 
	{'HUNTER', 172106, true, nil}, 
	{'MAGE', 159916, true, nil},
}

G['RLBox']['OTHER_SPELLS'] = {
	{'DRUID', 20484, true, nil}, 
	{'DEATHKNIGHT', 61999, true, nil}, 
	{'WARLOCK', 20707, true, nil}, 
--	{'PRIEST', 64901, true, nil}, 
--	{'DRUID', 29166, true, nil}, 
--	{'SHAMAN', 16190, true, nil}, 	
}

G['RLBox']['MISC_SPELLS'] = {
	{"SHAMAN", 2825, true, "Horde"},	
	{"SHAMAN", 32182, true, "Alliance"},	
	{"SHAMAN", 108271, false, nil, 90}, 
	{"MAGE", 80353, true, nil},	
	{'MAGE', 87023, false, nil, 120}, 
	{'MAGE', 45438, false, nil}, 
	{'PALADIN', 1022, false, nil}, 
	{'PALADIN', 6940, false, nil}, 
	{'PALADIN', 642, false, nil}, 
	{'PALADIN', 498, false, nil}, 
	{'PALADIN', 86659, false, nil, 180}, 
	{'PALADIN', 114039, false, nil, 30}, 
	{'WARRIOR', 114207, false, nil}, 
	{'WARRIOR', 871, false, nil}, 
	{'WARRIOR', 102060, false, nil}, 
	{'WARRIOR', 114030, false, nil, 120}, 
	{'DRUID', 22812, false, nil}, 
	{'DRUID', 102342, false, nil}, 
	{'WARLOCK', 104773, false, nil, 180}, 
	{'WARLOCK', 110913, false, nil, 180}, 
	{'MONK', 122278, false, nil, 90}, 
	{'MONK', 115203, false, nil, 180}, 
	{'MONK', 122783, false, nil, 90}, 
	{'MONK', 116844, false, nil, 45}, 
	{'DEATHKNIGHT', 48792, false, nil}, 
	{'RAGE', 31224, false, nil}, 
	{'PRIEST', 33206, false, nil}, 
	{'PRIEST', 47788, false, nil}, 
	{'PRIEST', 47585, false, nil, 120}, 
	{'HUNTER', 19263, false, nil}, 
}

G['RLBox']['SPELL_MONITOR_SCHEMA'] = {
	["schema"] = 60000,
	["revision"] = 1,
	["spellmetadata"] = {
		-- Death Knight
		[47528] 	= { ["duration"] = "4" },
		[48792] 	= { ["duration"] = "12" },		
		[55233] 	= { ["duration"] = "10" },		
		[51052] 	= { ["duration"] = "10" }, --5to3
		[48707] 	= { ["duration"] = "5" },
		[20594] 	= { ["2ndcooldown"] = "6" }, --8?		
		[47476] 	= { ["duration"] = "5" },
		[49028] 	= { ["duration"] = "12" },
		[49039] 	= { ["duration"] = "10" },

		-- Warrior
		[12975] 	= { ["duration"] = "20" },
		[64382] 	= { ["duration"] = "10" },
		[871] 		= { ["duration"] = "12" },
		[6552] 		= { ["duration"] = "4" },
		[97462] 	= { ["duration"] = "10" },
		[102060] 	= { ["duration"] = "4" },
		[114028] 	= { ["duration"] = "5" },
		[114203] 	= { ["duration"] = "15" },
		[114207] 	= { ["duration"] = "10" },
		
		-- Druid
		[22812] 	= { ["duration"] = "12" },
		[22842] 	= { ["duration"] = "20" },
		[29166] 	= { ["duration"] = "10" },
		[61336] 	= { ["duration"] = "12" },
		[740] 		= { ["duration"] = "8" },
		[33891] 	= { ["duration"] = "30" },
		[5211] 		= { ["duration"] = "5" },
		[102351] 	= { ["duration"] = "30" },
		[102342] 	= { ["duration"] = "12" },
		[124974] 	= { ["duration"] = "30" },
		
		-- Mage
		[45438] 	= { ["duration"] = "10" },
		[80353] 	= { ["duration"] = "40" },
		[2139] 		= { ["duration"] = "6" },
		[159916]	= { ["duration"] = "6" },
		
		-- Priest
		[109964] 	= { ["duration"] = "15" },
		[64843] 	= { ["duration"] = "8" },
		[47788] 	= { ["duration"] = "10" },
		[64901] 	= { ["duration"] = "8" },
		[33206] 	= { ["duration"] = "8" },
		[62618] 	= { ["duration"] = "10" },
		[15286] 	= { ["duration"] = "15" },
		[108920] 	= { ["duration"] = "20" },
		[113277] 	= { ["duration"] = "8" },
		
		-- Monk
		[115176] 	= { ["duration"] = "8" },   -- Zen Meditation
		[116849] 	= { ["duration"] = "12" },  -- Life Cocoon
		
		-- Paladin
		[31850] 	= { ["duration"] = "10" },
		[31821] 	= { ["duration"] = "6" },		
		[498] 		= { ["duration"] = "10" },
		[642] 		= { ["duration"] = "8" },
		[1044] 		= { ["duration"] = "6" },
		[1022] 		= { ["duration"] = "10" },
		[6940] 		= { ["duration"] = "12" },
		[1038] 		= { ["duration"] = "10" },
		[114039] 	= { ["duration"] = "6" },
		[96231] 	= { ["duration"] = "4" },
		[853] 		= { ["duration"] = "6" },
		[105593] 	= { ["duration"] = "6" },
		
		-- Rogue
		[2094] 		= { ["duration"] = "60" },
		[31224] 	= { ["duration"] = "5" },
		[1766] 		= { ["duration"] = "5" },
		[114018] 	= { ["duration"] = "15" },
		[76577] 	= { ["duration"] = "5" },

		-- Shaman
		[16190] 	= { ["duration"] = "16" },
		[32182] 	= { ["duration"] = "40" },
		[5394] 		= { ["duration"] = "15" },
		[98008] 	= { ["duration"] = "6" },
		[57994] 	= { ["duration"] = "3" },
		[108280] 	= { ["duration"] = "11" },
		[108281] 	= { ["duration"] = "10" },
		
		--Hunter
		[172106]	= { ["duration"] = "6" },
		
		-- Warlock
	},
	["requirements"] = {
		[698] 	= { { ["k"] = 10, ["level"] = 42, } },
		[47528] = { { ["k"] = 10, ["level"] = 57, } },
		[48792] = { { ["k"] = 10, ["level"] = 62, } },
		[73325] = { { ["k"] = 10, ["level"] = 85, } },
		[1038] 	= { { ["k"] = 10, ["level"] = 66, } },
		[97462] = { { ["k"] = 10, ["level"] = 83, } },
		[2139] 	= { { ["k"] = 10, ["level"] = 10, } },
		[57994] = { { ["k"] = 10, ["level"] = 16, } },
		[29893] = { { ["k"] = 10, ["level"] = 68, } },
		[6940] 	= { { ["k"] = 10, ["level"] = 80, } },
		[49576] = { { ["k"] = 10, ["level"] = 55, } },
		[42650] = { { ["k"] = 10, ["level"] = 80, } },
		[22842] = { { ["k"] = 10, ["level"] = 52, } },
		[31224] = { { ["k"] = 10, ["level"] = 58, } },
		[64901] = { { ["k"] = 10, ["level"] = 64, } },
		[34477] = { { ["k"] = 10, ["level"] = 76, } },
		[45438] = { { ["k"] = 10, ["level"] = 30, } },
		[2094] 	= { { ["k"] = 10, ["level"] = 34, } },
		[46584] = { { ["k"] = 10, ["level"] = 56, } },
		[498] 	= { { ["k"] = 10, ["level"] = 30, } },
		[642] 	= { { ["k"] = 10, ["level"] = 48, } },
		[1022] 	= { { ["k"] = 10, ["level"] = 18, } },
		[32182] = { { ["k"] = 10, ["level"] = 70, } },
		[47476] = { { ["k"] = 10, ["level"] = 59, } },
		[6552] 	= { { ["k"] = 10, ["level"] = 38, } },
		[1044] 	= { { ["k"] = 10, ["level"] = 52, } },
		[29166] = { { ["k"] = 10, ["level"] = 28, } },
		[853] 	= { { ["k"] = 10, ["level"] = 14, } },
		[31687] = { { ["k"] = 10, ["level"] = 10, } },
		[22812] = { { ["k"] = 10, ["level"] = 58, } },
		[80353] = { { ["k"] = 10, ["level"] = 85, } },
		[64382] = { { ["k"] = 10, ["level"] = 74, } },
		[20608] = { { ["k"] = 10, ["level"] = 30, } },
		[48707] = { { ["k"] = 10, ["level"] = 68, } },
		[20484] = { { ["k"] = 10, ["level"] = 20, } },
		[740] 	= { { ["k"] = 10, ["level"] = 68, } },
		[61999] = { { ["k"] = 10, ["level"] = 72, } },
		[64843] = { { ["k"] = 10, ["level"] = 78, } },
		[633] 	= { { ["k"] = 10, ["level"] = 16, } },
		[86150] = { { ["k"] = 10, ["level"] = 85, } },
		
		[109964] = { { ["k"] = 10, ["level"] = 28, } },
		[114018] = { { ["k"] = 10, ["level"] = 76, } },
		[108280] = { { ["k"] = 10, ["level"] = 20, } },
		[114028] = { { ["k"] = 10, ["level"] = 20, } },
		[114207] = { { ["k"] = 10, ["level"] = 87, } },
		[114203] = { { ["k"] = 10, ["level"] = 87, } },
		
		-- Monk
		[115176] = { { ["k"] = 10, ["level"] = 82, } }, -- Zen Meditation
		[116849] = { { ["k"] = 10, ["level"] = 50, } }, -- Life Cocoon
		[115310] = { { ["k"] = 10, ["level"] = 78, } }, -- Revival
		
		-- Priest
		[108920] = { { ["k"] = 10, ["level"] = 15, } }, -- Void Tendrils
		
		-----------------------------------
		-- Talent Requirements
		-----------------------------------
		-- Druid
		[124974] 	= { { ["k"] = 25, ["talent_id"] = 18586 }	},
		[102351]	= { { ["k"] = 25, ["talent_id"] = 18574 } },
		
		-- Death Knight
		[49039] 	= { { ["k"] = 25, ["talent_id"] = 19218 }	},
		[51052] 	= { { ["k"] = 25, ["talent_id"] = 19219 }	},
		[48743] 	= { { ["k"] = 25, ["talent_id"] = 19266 } },
				
		-- Paladin
		[105593] 	= { { ["k"] = 25, ["talent_id"] = 17573 } },
		[20066] 	= { { ["k"] = 25, ["talent_id"] = 17575 } },
		[115750] 	= { { ["k"] = 25, ["talent_id"] = 17577 } },
		
		--mage
		[86949] = { { ["k"] = 25, ["talent_id"] = 16028 } },
		
		--monk
		[116844] = { { ["k"] = 25, ["talent_id"] = 19993 } },
		
		-- Priest
		[108920]	= { { ["k"] = 25, ["talent_id"] = 19762 } },
		
		-- Warrior
		[118000]	= { { ["k"] = 25, ["talent_id"] = 16037 } },
		[114028]	= { { ["k"] = 25, ["talent_id"] = 15765 } },
		
		-- Shaman
	--	[108280]	= { { ["k"] = 25, ["talentIndex"] = 13 } }, -- Healing Tide Totem
		[108281]	= { { ["k"] = 25, ["talent_id"] = 19269 } }, -- Ancestral Guidance
		[152256]	= { { ["k"] = 25, ["talent_id"] = 21199 } }, -- Ancestral Guidance
		
		-----------------------------------
		-- Specialization Requirements
		-----------------------------------
		
		-- shaman
		[108280] 	= { { ["k"] = 30, ["specialization"] = 264 } },
		
		-- Death Knight (Blood)
		[55233] 	= { { ["k"] = 30, ["specialization"] = 250 } },
		[49222] 	= { { ["k"] = 30, ["specialization"] = 250 } },
		[49028] 	= { { ["k"] = 30, ["specialization"] = 250 } },
		
		[49028] 	= { { ["k"] = 30, ["specialization"] = 250 } },
		
		-- Druid (Restoration)
		[102342] 	= { { ["k"] = 30, ["specialization"] = 105 } },
		[740]		= { { ["k"] = 30, ["specialization"] = 105 } },
		
		-- Mage (Frost)
		[31687] 	= { { ["k"] = 30, ["specialization"] = 64 } },
		
		-- Shaman (Restoration)
		[98008] 	= { { ["k"] = 30, ["specialization"] = 264 } },
		[5394] 		= { { ["k"] = 30, ["specialization"] = 264 } },	-- Healing Stream Totem
		[16190] 	= { { ["k"] = 30, ["specialization"] = 264 } },	-- Mana Tide Totem
		
		-- Priest (Shadow)
		[15286]		= { { ["k"] = 30, ["specialization"] = 258 } }, -- Vampiric Embrace
		[108968]	= { { ["k"] = 30, ["specialization"] = 258 } }, -- Void Shift
		[113277]	= { { ["k"] = 30, ["specialization"] = 258 } }, -- Tranquility: Symbiosis
		[47585] 	= { { ["k"] = 30, ["specialization"] = 258 } },
		
		-- Priest (Holy)
		[64843]		= { { ["k"] = 30, ["specialization"] = 257 } }, -- Divine Hymn
		[47788]		= { { ["k"] = 30, ["specialization"] = 257 } }, -- Guardian Spirit
		
		
		-- Priest (Discipline)
		[33206]		= { { ["k"] = 30, ["specialization"] = 256 } }, -- Pain Suppression
		[109964]	= { { ["k"] = 30, ["specialization"] = 256 } }, -- Spirit Shell
		[62618]		= { { ["k"] = 30, ["specialization"] = 256 } }, -- Power Word: Barrier
		
		-- Monk (Mistweaver)
		[116849]		= { { ["k"] = 30, ["specialization"] = 270 } }, -- Life Cocoon
		[115310]		= { { ["k"] = 30, ["specialization"] = 270 } }, -- Revival
		
		---- Paladin
		[31821] = { { ["k"] = 30, ["specialization"] = 65 } },
		
		--Warrior
		[97462] = { { ["k"] = 30, ["specialization"] = 71, ["specialization2"] = 72 } },

	},
	
	["cooldowns"] = {
		[31224] 	= 90,
		[42650] 	= 600,
		[33891] 	= 180,
		[16190] 	= 180,
		[20066] 	= 15,
		[20707] 	= 900,
		[57934] 	= 30,
		[20594] 	= 120,
		[49576] 	= 35,
		[59752] 	= 120,
		[48707] 	= 45,
		[29893] 	= 300,
		[46584] 	= 180,
		[871] 		= 300,
		[80353] 	= 300,
		[633] 		= 600,
		[1022] 		= 300,
		[61336] 	= 180,
		[31687] 	= 180,
		[62618] 	= 180,
		[6940] 		= 120,
		[61999] 	= 600,
		[70940] 	= 180,
		[642] 		= 300,
		[33206] 	= 180,
		[31850] 	= 180,
		[698] 		= 120,
		[2094] 		= 180,
		[45438] 	= 300,
		[498] 		= 60,
		[98008] 	= 180,
		[55233] 	= 60,
		[64901] 	= 360,
		[86150] 	= 300,
		[47788] 	= 180,
		[34477] 	= 30,
		[20484] 	= 600,
		[12975] 	= 180,
		[97462] 	= 180,
		[32182] 	= 300,
		[740] 		= 480,
		[64382] 	= 300,
		[1044] 		= 25,
		[31821] 	= 60 * 3,
		[73325] 	= 90,
		[22812] 	= 60,
		[29166] 	= 180,
		[20608] 	= 1800,
		[22842] 	= 180,
		[51052] 	= 120,
		[48792] 	= 180,
		[49222] 	= 60,
		[1038] 		= 120,
		[64843] 	= 60 * 3,
		[5211] 		= 60, --new
		[47528] 	= 10, --new
		[57994] 	= 6, --new
		[6552] 		= 10, --new
		[96231] 	= 10, --new
		[2139] 		= 24, --new
		[1766] 		= 10, --new
		[853] 		= 60, --new
		[47476] 	= 120, --new
		[102060]	= 40,
		[102351]	= 30,
		[114018]	= 300,
		[108280]	= 180,
		[108281]	= 120,
		
		[114028]	= 60,
		[114203]	= 60 * 3,
		[114207]	= 60 * 3,
		
		[109964]	= 60,
		[124974]	= 90,
		[113277]	= 60 * 8,
		
		[115176]	= 180,
		[116849]	= 120,
		[115310]	= 180,
		[5394]		= 30,
		
		[15286]		= 180,
		[108968]	= 360,
		[108920]	= 30,
		[102342]	= 120,
		[76577]		= 60 * 3,
		[159916]	= 120,
		[172106]	= 180,
	},
	["adjustments"] = {
		[740] = { { 	["offset"] = -300, 	["specialization"] = 105, 	["k"] = 30 } },
	},
}
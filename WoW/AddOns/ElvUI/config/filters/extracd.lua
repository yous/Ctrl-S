local E, L, V, P, G = unpack(select(2, ...)); --Engine

G.AnnounceSpells = {
	34477,	
	19801,	
	57934,	
	633,	
	20484,
	61999,	
	20707,	
--	2908,	
}

G['interruptSpell'] = {

	["DRUID"] = {
		[106839] = true, 
		[78675] = true, 
		[770] = false, 
		[106707] = false, 
	},
	
	["HUNTER"] = {
		[50318] = true, 
		[50479] = true, 
		[26090] = true, 
		[34490] = true, 
	},
	
	["MAGE"] = {
		[2139] = true, 
	},	

	["WARLOCK"] = {
		[103135] = true, 
		[119911] = true, 
	},

	["SHAMAN"] = {
		[57994] = true, 
	},

	["PALADIN"] = {
		[96231] = true, 
		[31935] = true, 
	},
	
	["PRIEST"] = {
		[15487] = true, 
	},
	
	["WARRIOR"] = {
		[102060] = true, 
		[6552] = true, 
	},

	["ROGUE"] = {
		[26679] = false, 
		[1766] = true, 
	},

	["DEATHKNIGHT"] = {
		[47528] = true, 
		[47476] = true, 
		[108194] = true, 
	},
	
	["MONK"] = {
		[116705] = true, 
	},
}

G['announcements'] = {
	['AnnounceToys'] = {
		[61031] = true,		-- Toy Train Set
		[49844] = true,		-- Direbrew's Remote
	},
	['AnnounceBots'] = {
		[22700] = true,		-- Field Repair Bot 74A
		[44389] = true,		-- Field Repair Bot 110G
		[54711] = true,		-- Scrapbot
		[67826] = true,		-- Jeeves
		[126459] = true,	-- Blingtron 4000
	},
	['AnnouncePortals'] = {
		-- Alliance
		[10059] = true,		-- Stormwind
		[11416] = true,		-- Ironforge
		[11419] = true,		-- Darnassus
		[32266] = true,		-- Exodar
		[49360] = true,		-- Theramore
		[33691] = true,		-- Shattrath
		[88345] = true,		-- Tol Barad
		[132620] = true,	-- Vale of Eternal Blossoms
		-- Horde
		[11417] = true,		-- Orgrimmar
		[11420] = true,		-- Thunder Bluff
		[11418] = true,		-- Undercity
		[32267] = true,		-- Silvermoon
		[49361] = true,		-- Stonard
		[35717] = true,		-- Shattrath
		[88346] = true,		-- Tol Barad
		[132626] = true,	-- Vale of Eternal Blossoms
		-- Alliance/Horde
		[53142] = true,		-- Dalaran
	},
}
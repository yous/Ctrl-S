
local desc = FollowerLocationInfoData.descriptions;

local alternativeInfo_outpost = "Did you choose the other outpost building?|nYou have two alternatives.|n1. Reset your outpost building.|n &#xA0; &#xA0; &#xA0; (Talk with a NPC in the outpost)|n2. Buy a contract from a vendor in your garrison.";
local alternativeInfo_questrow = "The quest row is completed. Now the other followers are buyable from a vendor in your garrison."
local alternativeInfo_missionfailed = "If the mission failed then you can buy the contract from a vendor in your garrison."

--[=[ 525 Frostfire Ridge ]=]
	desc[32] = { -- 525, 32, Dagg
		nil,
		{
			zone = 525,
			{"Location",
				{525, 65.9, 60.8, Images={ {"location1","Image",false} } },
				{525, 39.6, 28.0, Images={ {"location2","Image",false} } }
			},
			{"Quests", {34733, 90, 79492, 582, 54.8, 69.4, Images={ {"quest","Image",true} }}}
		},
		{
			zone = 525,
			{"Location",
				{525, 65.9, 60.8, Images={ {"location1","Image",false} } },
				{525, 39.6, 28.0, Images={ {"location2","Image",false} } }
			},
			{"Quests", {34733, 90, 79492, 590, 57.76, 15.45, Images={ {"quest","Image",true} }}}
		}
	};

--[=[ 535 Talador ]=]
	desc[154] = { -- 535, 154, Magister Serenaa (A) / Magister Krelas (H)
		nil,
		{
			zone = 535,
			{"Requirements", {"Outpost", 535, 1}},
			{"Quests",
				{34631, 94, 79133, 535, 69.8, 20.8},
				{34815, 94, 80142, 535, 75, 31},
				--
				{34609, 94, 79392, 535, 84.8, 31},
				{34612, 94, 79392, 535, 84.8, 31},
				{34619, 94, 79392, 535, 84.8, 31},
				{34875, 94, 80260, 535, nil}, -- TODO: location
				{34908, 94, 80966, 535, 69.6, 21},
				--
				{34913, 94, 80607, 535, 62.2, 68.2},
				{34909, 94, 80608, 535, 69.8, 69.4},
				{34910, 94, 80608, 535, 69.8, 69.4},
				{34911, 94, 80608, 535, 69.8, 69.4},
				{34912, 94, 80617, 535, nil}, -- appears on your side if you finished the 3 quests from serena
				{34711, 94, 80617, 535, nil},
				--
				{34993, 94, 80672, 535, 69.6, 20.8}
			},
			alternative = {
				{"Merchant", {88633, 582, 58.4, 60.4}},
				{"Items", {119242}},
				{"Price", {"Gold", 50000000}},
				visible = true,
				text = alternativeInfo_outpost
			}
		},
		{
			zone = 535,
			{"Requirements", {"Outpost", 535, 1}},
			--[[
			{"Quests",
				{34632, 94, 79176, 535, 71, 29.8},
				{34814, 94, 80142, 535, 75, 31},
				--
				{34634, 94, 79393, 535, 84.2, 30.4},
				{34635, 94, 79393, 535, 84.2, 30.4},
				{34636, 94, 79393, 535, 84.2, 30.4},
				{34874, 94, 80193, 535, nil}, -- TODO: location
				{34878, 94, 80965, 535, 71.2, 39.6},
				{34879, 94, 80396, 535, 62.2, 68.2},
				--
				{34887, 94, 80390, 535, 68.2, 70.2},
				{34889, 94, 80390, 535, 68.2, 70.2},
				{34890, 94, 80389, 535, nil},
				{34712, 94, 80389, 535, nil},
				--
				{34949, 94, 80553, 535, 71.2, 29.8}
			},
			--]]
			alternative = {
				{"Merchant", {88635, 590, 40.32, 51.04}},
				{"Items", {119243}},
				{"Price", {"Gold", 50000000}},
				visible = true,
				text = alternativeInfo_outpost
			}
		}
	};

	desc[155] = { --  535, 155, Miall (A) / Morketh Bladehowl (H)
		nil,
		{
			zone = 535,
			{"Requirements", {"Outpost", 535, 2}},
			{"Quests",
				{34563, 94, 79160, 535, 69.2, 19.2},
				{34571, 94, 79159, 535, 69.2, 19.2},
				{34573, 94, 79329, 535, 70.0, 20.0},
				{34624, 94, 79329, 535, 70.0, 20.0},
				{34578, 94, 79329, 535, 70.0, 20.0},
				{34976, 94, 80627, 535, 62.4, 67.8},
				{34977, 94, 80628, 535, 69.6, 69.8},
				{34980, 94, 80632, 535, 64.4, 81.8},
				{34981, 94, 80630, 535, 64.4, 81.8},
				{34982, 94, 80968, 535, 69.6, 20.8}
			},
			alternative = {
				{"Merchant", {88633, 582, 58.4, 60.4}},
				{"Items", {119420}},
				{"Price", {"Gold", 50000000}},
				visible = true,
				text = alternativeInfo_outpost
			}
		},
		{
			zone = 535,
			{"Requirements", {"Outpost", 535, 2}},
			{"Quests",
				{34579, 94, 79356, 535, 70.8, 30.4},
				{34837, 94, 79356, 535, 70.8, 30.4},
				{34840, 94, 80229, 535, 62.0, 69.2},
				{34855, 94, 80339, 535, 68.6, 70.4},
				{34858, 94, 80339, 535, 68.6, 70.4},
				{34860, 94, 80339, 535, 68.6, 70.4},
				{34870, 94, 80341, 535, "Appears on your position" },
				{34971, 94, 80342, 535, 64.4, 81.6},
				{34972, 94, 80623, 535, 71.2, 29.8}
			},
			alternative = {
				{"Merchant", {88635, 590, 40.32, 51.04}},
				{"Items", {119418}},
				{"Price", {"Gold", 50000000}},
				visible = true,
				text = alternativeInfo_outpost
			}
		}
	};

	desc[171] = { --  535, 171, Pleasure-Bot 8000
		nil,
		{
			zone = 535,
			{"Location", {535, 62.9, 50.3, Images={{"location","Image",true}} }},
			{"Quests",
				{34761, 94, 79901, 535, 62.8, 50.2},
				{35239, 94, 79853, 535, 62.8, 50.4}
			}
		},
		{
			zone = 535,
			{"Location", {535, 64.2, 47.8, Images={{"location","Image",true}} }},
			{"Quests",
				{34751, 94, 79870, 535, 64.2, 47.8},
				{35238, 94, 79853, 535, 64.2, 47.8}
			}
		}
	};

	desc[190] = { --  535, 190, Image of Archmage Vargoth
		{
			zone=535,
			{"Items",
				{110459, 543, 39.7, 39.9},
				{110469, 525, 68.0, 19.0},
				{110470, 535, 45.3, 37.0},
				{110471, 550, 46.4, 16.0}
			},
			{"Quests",
				{34472, 100, 86949, 535, 85.0, 31.0},
				{36027, 100, 77853, 535, 84.6, 31.6}
			}
		}
	};

	desc[205] = { --  535, 205, Soulbinder Tuulani
		nil,
		{
			zone=535,
			{"Quests",
				{34240, 95, 75250, 535, 57.2, 77},
				{33958, 95, 75256, 535, 57.2, 76.8},
				{34508, 95, 77869, 535, 50.4, 87.4},
				{33976, 95, 77082, 535, 44.8, 90.6},
				{34326, 95, 77082, 535, 44.8, 90.6},
				{34092, 95, 77799, 535, 43.4, 76},
				{34157, 95, 75392, 535, 43, 76},
				{34154, 95, 77582, 535, 31.2, 73.6},
				{36512, 95, 79434, 535, 46.2, 74},
			}
		},
		{
			zone = 535,
			{"Quests",
				{34242, 95, 75246, 535, 61, 72.4},
				{33958, 95, 75256, 535, 57.2, 76.8},
				{34508, 95, 77869, 535, 50.4, 87.4},
				{33976, 95, 77082, 535, 44.8, 90.6},
				{34326, 95, 77082, 535, 44.8, 90.6},
				{34092, 95, 77799, 535, 43.4, 76},
				{34157, 95, 75392, 535, 43, 76},
				{34154, 95, 77582, 535, 31.2, 73.6},
				{36512, 95, 79434, 535, 46.2, 74},
			}
		}
	};

	desc[207] = { --  535, 207, Defender Illona (A) / Aeda Brightdawn (H)
		nil,
		{
			zone=535,
			{"Quests",
				{34777, 94, 79979, 535, 57.5, 51.1},
				{36519, 94, 79978, 535, 57.5, 51.1}
			}
		},
		{
			zone=535,
			{"Quests",
				{34776, 94, 79978, 535, 58.1, 53},
				{36518, 94, 79978, 535, 58.1, 53}
			}
		}
	};

	desc[208] = { --  535, 208, Ahm
		nil,
		{
			zone = 535,
			{"Quests",
				{33973, 94, 77031, 535, 56.7, 26, Images={{"location","Image",false}}},
				{36522, 94, 85777, 582, 52.8, 69}
			}
		},
		{
			zone = 535,
			{"Quests",
				{33973, 94, 77031, 535, 56.7, 26, Images={{"location","Image",false}}},
				{36522, 94, 85777, 590, 50.8, 15.8}
			}
		}
	};

	desc[466] = { --  535, 466, Garona Halforcen
		{
			zone = 535,
			--[[
			{"Quests",
				{36007, 100, 83823, 535, 85.2, 31.6},
				{36009, 100, 83823, 535, 85.2, 31.6},
				{36010, 100, 83823, 535, 85.2, 31.6},
				{36012, 100, 83823, 535, 85.2, 31.6},
				{36013, 100, 83823, 535, 85.2, 31.6},
				{36014, 100, 83823, 535, 85.2, 31.6},
				{36016, 100, 83823, 535, 85.2, 31.6},
				{36017, 100, 83823, 535, 85.2, 31.6},
				{37834, 100, 83823, 535, 85.2, 31.6},
				{37836, 100, 83823, 535, 85.2, 31.6},
				{37535, 100, 83823, 535, 85.2, 31.6},
				{37837, 100, 90233, 535, 67.4, 6.6}
			}
			--]]
		}
	};

--[=[ 539 Shadowmoon Valley ]=]
	desc[179] = { --  539, 179, Artificer Romuul (A) / Weaponsmith Na'Shral (H)
		nil,
		{
			zone = 539,
			{"Quests",
				{35614, 90, 74741, 539, 42.8, 40.4, Images={{"quest","Image",true}}}
			}
		},
		{
			zone = 525,
			{"Quests",
				{33838, 90, 74977, 525, 64.9, 39.5, Images={{"quest","Image",true}}},
				{34729, 90, 74977, 525, 64.7, 39.8}
			}
		}
	};

	desc[180] = { --  539, 180, Fiona (A) / Shadow Hunter Rala (H)
		nil,
		{
			zone = 539,
			{"Quests",
				{33786, 90, 76200, 539, 57, 57.4},
				{33787, 90, 76204, 539, 53.6, 57.2},
				{33808, 90, 76204, 539, 53.6, 57.2},
				{33788, 90, 76204, 539, 53.6, 57.2},
				{35617, 90, 76204, 539, 53.6, 57.2}
				-- giftstarre
			}
		},
		{
			zone = 590,
			{"Quests",
				{34736, 90, 78487, 590, 48.8, 65, optional=true},
				{34344, 90, 78208, 525, 52.62, 40.41},
				{34345, 90, 78208, 525, 52.62, 40.41},
				{34346, 90, 78209, 525, 52.52, 40.42},
				{34348, 90, 78208, 525, 52.62, 40.41},
				{34731, 90, 78208, 525, 52.62, 40.41}
			}
		}
	};

	desc[182] = {	-- 539, 182, Shelly Hamby (A)
		nil,
		{
			zone = 539,
			{"Quests",
				{34820, 90, 80163, 582, 43.8, 53.4},
				{33263, 90, 79966, 539, 39.6, 29.6},
				{33271, 90, 73877, 539, 47, 14.4},
				{35625, 90, 76748, 539, 36.4, 19.2}
			}
		},
		{
			zone = 525,
			{"Requirements",
				{"Unlock", 33527, "First you must unlock the Bladespire Citadel quest row to see Guse."},
			},
			{"Quests",
				-- not enough
				--
				{33119, 90, 78222, 525, 24.4, 37.2},
				{33483, 90, 72890, 525, 30.8, 41.4},
				{33484, 90, 79047, 525, 30.6, 41.4},
				{34732, 90, 79047, 525, 30.6, 41.4}
			}
		}
	};

	desc[183] = { --  539, 183, Rulkan (A)
		nil,
		{
			zone = 539,
			{"Quests", {35631, 90, 75884, 539, 45.6, 26.2}}
		},
		{
			zone = 525,
			{"Quests", {35341, 90, 79229, 525, 59.4, 31.8}}
		}
	}; -- TODO: incomplete?

	desc[184] = {	-- 539, 184, Apprentice Artificer Andren (A) / Kal'gor the Honorable (H)
		nil,	-- 539, 185, Rangari Chel (A) / Lokra (H)
		{		-- 539, 186, Vindicator Onaala (A) / Greatmother Geyah (H)
			collectGroup={184,185,186},
			zone = 539,
			{"Quests",
				{34787, 90, 80078, 539, 56.5, 23.5},
				{35552, 90, 80073, 539, 62.4, 26.2 },
				{34791, 90, 0.233229, 539, 60.9, 24.5},
				{34789, 90, 80073, 535, 62.4, 26.2},
				{34792, 90, 80073, 539, 66.4, 26.2},
				{34788, 90, 80073, 539, 62.4, 26.2}
			},
			alternative = {
				{"Merchant", {88633, 582, 58.4, 60.4}},
				{"Items",
					{119291, id=184},
					{119296, id=185},
					{119292, id=186}
				},
				{"Price", {"Gold", 50000000}},
				visible = {"quest", 34788},
				text = alternativeInfo_questrow
			}
		},
		{
			collectGroup={184,185,186},
			zone = 525,
			{"Quests",
				{33828, 90, 72940, 525, nil, nil, "The Frostwolf Champion will follow you in frostfire ridge"}, -- TODO: check?
				{33493, 90, 72940, 525, nil, nil},
				{37291, 90, 74163, 590, 50, 38.4},
				--{34722, 90, 74163, 590, 50, 38.4},
				{33010, 90, 74163, 590, 50, 38.4},
				{34123, 90, 76720, 525, 65.4, 65.6},
				{34124, 90, 76487, 525, 73.4, 58.8},
			},
			alternative = {
				{"Merchant", {88635, 590, 40.32, 51.04}},
				{"Items",
					{122136, id=184},
					{119240, id=185},
					{122135, id=186}
				},
				{"Price", {"Gold", 50000000}},
				visible = {"quest", 34124},
				text = alternativeInfo_questrow
			}
		},
	}; -- TODO: horde version incomplete?

--[=[ 542 Spikes of Arak ]=]
	desc[168] = { --  542, 168, Ziri'ak
		nil,
		{
			zone = 542,
			{"Requirements", {"Outpost", 542, 1}},
			{"Merchant", {82459, 542, "summoned in near of the player position"}},
			{"Spell", 170108},
			{"Items", {116915}},
			{"Price", {"Gold", 4000000}},
			alternative = {
				{"Merchant", {88633, 582, 58.4, 60.4}},
				{"Items", {119267}},
				{"Price", {"Gold", 50000000}},
				visible = true,
				text = alternativeInfo_outpost
			}
		},
		{
			zone = 542,
			{"Requirements", {"Outpost", 542, 1}},
			{"Merchant", {84243, 542, "summoned in near of the player position"}},
			{"Spell", 170097},
			{"Items", {116915}},
			{"Price", {"Gold", 4000000}},
			alternative = {
				{"Merchant", {88635, 590, 40.32, 51.04}},
				{"Items", {119267}},
				{"Price", {"Gold", 50000000}},
				visible=true,
				text = alternativeInfo_outpost
			}
		}
	};

	desc[192] = { --  542, 192, Kimzee Pinchwhistle
		nil,
		{
			zone=542,
			{"Quests",
				{35619, 96, 85550, 542, 39.6, 60.6, nil, 36861, 86589, 590, 46, 46.2},
				{35077, 96, 81109, 542, 61.4, 72.8},
				{35080, 96, 81109, 542, 61.4, 72.8},
				{35082, 96, 81773, 542, 59, 79.2},
				{35285, 96, 81784, 542, 59, 79.2},
				{35090, 96, 81972, 542, 58.4, 92.2},
				{35091, 96, 81978, 542, 58.8, 92.8},
				{36384, 96, 81443, 542, 58.4, 92.2},
				{36428, 96, 81443, 542, 58.4, 92.2},
				{35211, 96, 81443, 542, 58.4, 92.2},
				{35298, 96, 81443, 542, 58.4, 92.2},
				{36062, 96, 82468, 542, 61.6, 72.8}
			}
		},
		{
			zone=542,
			{"Quests",
				{35620, 96, 85566, 542, 40, 43.8, nil, 36862, 85514, 582, 46.8, 46.2},
				{35077, 96, 81109, 542, 61.4, 72.8},
				{35080, 96, 81109, 542, 61.4, 72.8},
				{35082, 96, 81773, 542, 59, 79.2},
				{35285, 96, 81784, 542, 59, 79.2},
				{35090, 96, 81972, 542, 58.4, 92.2},
				{35091, 96, 81978, 542, 58.8, 92.8},
				{36384, 96, 81443, 542, 58.4, 92.2},
				{36428, 96, 81443, 542, 58.4, 92.2},
				{35211, 96, 81443, 542, 58.4, 92.2},
				{35298, 96, 81443, 542, 58.4, 92.2},
				{36062, 96, 82468, 542, 61.6, 72.8}
			}
		}
	};

	desc[204] = { --  542, 204, Admiral Taylor (A) / Benjamin Gibb (H)
		nil,
		{
			zone=542,
			{"Quests",
				{35293, 96, 81949, 542, 39.8, 60.6},
				{35322, 96, 81961, 542, 39.2, 48.8},
				{35329, 96, 81960, 542, 39, 48.8},
				{35339, 96, 82100, 542, 39, 48.8},
				{35353, 96, 82124, 542, 37.6, 51},
				{35380, 96, 82126, 542, 37.6, 50.8},
				{35407, 96, 82194, 542, 37.6, 53.8},
				{35408, 96, 82212, 542, 37.6, 53.8},
				{35482, 96, 82278, 542, 37.6, 53.8},
				{35549, 96, 82403, 542, 36.8, 56.8},
				{36353, 96, 85050, 542, 40, 60.6}
			}
		},
		{
			zone=542,
			--{"Quests", },
			{"Location", {542, 35.8, 52.2}},
		}
	}; -- TODO: horde version incomplete

	desc[218] = {	-- 542, 218, Talonpriest Ishaal
		nil,
		{
			zone=542,
			{"Achievements", 8925}
		},
		{
			zone=542,
			{"Achievements", 8926}
		}
	};

	desc[219] = { --  542, 219, Leorajh
		{
			zone = 542,
			{"Location",
				{542, 55.3, 68.5, "Cave on image 1"},
				{542, 55, 65.2, "Hidden cave"}
			},
			{"Images",
				{"1","Way 1 - Image 1",false},
				{"2","Way 1 - Image 2",false},
				{"3","Way 1 - Image 3",false}
			}
		}
	}; -- TODO: make new images. better path way and air picture from hidden cave

	desc[224] = { --  542, 224, Talon Guard Kurekk
		{
			zone = 542,
			{"Achievements", 9072},
			{"Quests",{37144, 100, 80578, 542, 54.1, 37.0}}
		}
	};

	desc[453] = { --  542, 453, Hulda Shadowblade (A) / Dark Ranger Velonara (H)
		nil,
		{
			zone=542,
			{"Requirements", {"Outpost", 542, 2}},
			{"Quests", {37281, 96, 88195, 542, 39.6, 60.8}},
			alternative = {
				{"Merchant", {88633, 582, 58.4, 60.4}},
				{"Items", {119244}},
				{"Price", {"Gold", 50000000}},
				visible = true,
				text = alternativeInfo_outpost
			}
		},
		{
			zone=542,
			{"Requirements", {"Outpost", 542, 2}},
			{"Quests", {37276, 96, 88179, 542, 40, 43.2}},
			alternative = {
				{"Merchant", {88635, 590, 40.32, 51.04}},
				{"Items", {119245}},
				{"Price", {"Gold", 50000000}},
				visible = true,
				text = alternativeInfo_outpost
			}
		}
	}; -- TODO: incomplete

--[=[ 543 Gorgrond ]=]
	desc[159] = { --  543, 159, Rangani Kaalya (A) / Kaz the Shrieker (H)
		nil,
		{
			zone = 543,
			{"Quests",
				{35225, 94, 81588, 543, 46.0, 76.8},
				{35234, 94, 75710, 543, 47.6, 94.0},
				{35235, 94, 81751, 543, 48.0, 94.2},
				{35262, 94, 81772, 543, 47.6, 93.2},
			},
		},
		{
			zone = 543,
			{"Quests",
				{35511, 94, 82338, 543, 47.6, 93.2},
			},
		}
	}; -- TODO: incomplete

	desc[176] = { --  543, 176, Pitfighter Vaandaam (A) / Bruto (H)
		nil,
		{
			zone = 543,
			{"Requirements", {"Outpost", 543, 2}},
			{"Quests",
				{34704, 93, 81076, 543, 53.0, 59.6},
				{34699, 93, 79322, 543, 42.8, 63},
				{34703, 93, 77014, 543, 42.8, 63},
				{35137, 93, 79322, 543, 42.8, 63},
			},
			alternative = {
				{"Merchant", {88633, 582, 58.4, 60.4}},
				{"Items", {119254}},
				{"Price", {"Gold", 50000000}},
				visible = true,
				text = alternativeInfo_outpost
			}
		},
		{
			zone = 543,
			{"Requirements", {"Outpost", 543, 2}},
			--{"Quests", {35882, nil} },
			--{"note", "missing quest row data and quest giver positions... not enough found on wowhead.", "ff9922"}
			alternative = {
				{"Merchant", {88635, 590, 40.32, 51.04}},
				{"Items", {119255}},
				{"Price", {"Gold", 50000000}},
				visible = true,
				text = alternativeInfo_outpost
			}
		}
	}; -- TODO: incomplete

	desc[189] = { --  543, 189, Blook
		{
			zone=543,
			{"Location", {543, 42.8, 90.9, "Path to Blook", Images={{"location","Image",false}} }},
			{"Quests", {34279, 93, 78030, 543, 41.2, 91.4}},
		}
	};

	desc[193] = { --  543, 193, Tormmok
		{
			zone = 543,
			{"Location", {543, 44.9, 86.6, Images={{"location","Image",false}} }}
		}
	};

	desc[211] = { --  543, 211, Glirin (A) / Penny Clobberbottom (H)
		nil,
		{
			zone = 543,
			{"Requirements", {"Outpost", 543, 1}},
			{"Quests", {36828, 92, 85119, 543, 53, 59.4}},
			alternative = {
				{"Merchant", {88633, 582, 58.4, 60.4}},
				{"Items", {119256}},
				{"Price", {"Gold", 50000000}},
				visible = true,
				text = alternativeInfo_outpost
			}
		},
		{
			zone=543,
			{"Requirements", {"Outpost", 543, 1}},
			{"Quests",
				{35707, 92, 85077, 543, 46.4, 69.6},
				{35506, 92, 82574, 543, 55.8, 71.4},
				{35505, 92, 84811, 543, 55.8, 71.4},
				{35508, 92, 82569, 543, 57, 71.8},
				{35527, 92, 82569, 543, 57, 71.8},
				{35524, 92, 82569, 543, 57, 71.8},
				{36812, 92, 85077, 543, 46.4, 69.6}
			},
			alternative = {
				{"Merchant", {88635, 590, 40.32, 51.04}},
				{"Items", {119257}},
				{"Price", {"Gold", 50000000}},
				visible = true,
				text = alternativeInfo_outpost
			}
		}
	}; -- TODO: incomplete, missing quest row

	desc[212] = { --  543, 212, Rangari Erdanii (A) / Spirit of Bony Xuk (H)
		nil,
		{
			zone=543,
			{"Requirements", {"Outpost", 543, 2}},
			{"Quests", {36833, 93, 85278, 543, 53.2, 59.8}}, -- Quest: Eiserne Ketten ?
			alternative = {
				{"Merchant", {88633, 582, 58.4, 60.4}},
				{"Items", {119252}},
				{"Price", {"Gold", 50000000}},
				visible = true,
				text = alternativeInfo_outpost
			}
		},
		{
			zone=543,
			{"Requirements", {"Outpost", 543, 2}},
			{"Quests", {36832, 93, 85980, 543, 44, 48.8}}, --  Quest: Ist Xais egal ?
			alternative = {
				{"Merchant", {88635, 590, 40.32, 51.04}},
				{"Items", {119253}},
				{"Price", {"Gold", 50000000}},
				visible = true,
				text = alternativeInfo_outpost
			}
		}
	}; -- TODO: incomplete, mission quest row

--[=[ 550 Nagrand ]=]
	desc[157] = { --  550, 157, Lantresor of the Blade
		nil,
		{
			zone = 550,
			{"Quests",
				{34951, 98, 80624, 550, 63.4, 61.8}, -- travel to hallvalor
				{34954, 98, 80161, 550, 85.4, 54.6}, -- the blade itself
				{34955, 98, 80161, 550, 85.4, 54.6}, -- not without my honer
				{34956, 98, 80161, 550, 85.4, 54.6}, -- meet me in the cavern
				{34957, 98, 80319, 550, 89.8, 55.8}, -- Challenge of the Masters

				{34747, 98, 81790, 550, 64.24, 59.54}, -- The Honor of a Blademaster
			}
		},
		{
			zone = 550,
			{"Quests",
				{34818, 98, 80140, 550, 82.8, 44.2}, -- travel to hallvalor
				{34849, 98, 80161, 550, 85.4, 54.6}, -- the blade itself
				{34850, 98, 80161, 550, 85.4, 54.6}, -- not without my honer
				{34866, 98, 80161, 550, 85.4, 54.6}, -- meet me in the cavern
				{34868, 98, 80319, 550, 89.8, 55.8}, -- Challenge of the Masters

				{34770, 98, 81790, 550, 82.6, 46.6}, -- The Honor of a Blademaster
			}
		}
	};

	desc[170] = { --  550, 170, Goldmane the Skinner
		{
			zone = 550,
			{"Location", {550, 40.4, 76.2, Images={{"location","Image",false}}}},
			{"Quests", {35596, 100, 80083, 550, 40.4, 76.2}}
		}
	};

	desc[209] = { --  550, 209, Abu'gar
		{
			zone=550,
			{"Quests", {36711, 98, 82746, 550, 67.2, 56, Images={ {"npc82746","Image",false} }}},
			{"Items",
				{114243, 550, 85.42, 38.75, Images={ {"item114243","Image",false} }},
				{114242, 550, 65.8, 61.1, Images={ {"item114242","Image",false} }},
				{114245, 550, 38.3, 49.4, Images={ {"item114245","Image",false} }},
			}
		}
	};

--[=[ 582/590 Garrison ]=]
	desc[0] = { -- description for all recruitable followers
		nil,
		{
			zone = 582,
			{"Requirements",
				{"Garrison building", 34}
			},
			{"Npc", 84947, 582, {"Garrison building", 34}}
		},
		{
			zone = 590,
			{"Requirements",
				{"Garrison building", 34}
			},
			{"Npc", 87305, 590, {"Garrison building", 34}}
		}
	};

	desc[34] = { --  582/590, 34, Qiana Moonshadow (Alliance) / Olin Umberhide (Horde)
		nil,
		{
			zone = 582,
			{"Quests", {34646, 90, 79457, 582, 44, 52.8}},
		},
		{
			zone = 590,
			{"Quests",
				{33815, 90, 76411, 590, 49.2, 50}, -- Farseeker Drek'Thar
				{34402, 90, 78272, 525, 41.8, 69.6}, -- Durotan
				{34364, 90, 70859, 525, 48.6, 65.2}, -- Thrall
				{34375, 90, 78466, 590, 42, 55}, -- Gazlowe
				{34378, 90, 78466, 590, 42, 55}, -- Gazlowe
				{34822, 90, 78466, 590, 42, 55}, -- Gazlowe
				{34461, 90, 78466, 590, 42, 55}, -- Gazlowe
				{34861, 90, 78466, 590, 42, 55}, -- Gazlowe
				{34462, 90, 79740, 590, 53.8, 54.2}, -- Warmaster Zog
			},
		}
	};

	desc[153] = { --  582/590, 153, Bruma Swiftstone (A) / Ka'la (H)
		nil,
		{
			zone = 582,
			{"Missions", 66},
		},
		{
			zone = 590,
			{"Missions", 2},
		}
	};

	desc[202] = { --  582/590, 202, Nat Pagle
		nil,
		{
			zone = 582,
			{"Requirements",
				{"Garrison building", 135},
				{"Professions", 131474, 700}
			},
			{"Quests",
				{36611, 94, 85984, 582, {"Garrison building", 135}},
				{36616, 94, 85984, 582, {"Garrison building", 135}}
			}
		},
		{
			zone = 590,
			{"Requirements",
				{"Garrison building", 135},
				{"Professions", 131474, 700}
			},
			{"Quests",
				{36611, 94, 85984, 590, {"Garrison building", 135}},
				{36616, 94, 85984, 590, {"Garrison building", 135}}
			}
		}
	};

	desc[216] = { --  582/590, 216, Delvar Ironfist (A) / Vivianne (H)
		nil,
		{
			zone = 582,
			{"Quests",
				{36624, 90, 79953, 582, 40.6, 53.6},
				{36626, 90, 86065, 622, 31.8, 49.6},
				{36629, 90, 86069, 622, 35.6, 75.4},
				{36630, 90, 86069, 622, 35.6, 75.4},
				{36633, 90, 86084, 622, 47.6, 30.6}
			}
		},
		{
			zone = 525,
			{"Quests",
				{36706, 90, 78466, 590, 52.4, 52.8},
				{36707, 90, 86315, 624, 45.2, 34.6},
				{36708, 90, 86312, 624, 44.4, 45.2},
				{36709, 90, 86312, 624, 44.4, 45.2},
				{35243, 90, 81765, 624, 61.8, 23.4}
			}
		}
	};

	desc[217] = { --  582/590, 217, Thisalee Crow / Choluna
		nil,
		{
			zone = 582,
			{"Quests",
				{36134, 100, 81492, 582, 37.8, 36.8},
				{36341, 100, 84185, 543, 41, 43}
			}
		},
		{
			zone = 590,
			{"Quests",
				{36136, 100, 78487, 590, 45.6, 43.2},
				{36342, 100, 88530, 543, 41, 43}
			}
		}
	}; -- TODO: incomplete

	desc[455] = { --  582/590, 455, Millhouse Manastorm
		nil,
		{
			zone = 582,
			{"Requirements",
				{"Garrison building", 34}
			},
			{"Quests", {37179, 100, 88009, 582, {"Garrison building", 34}}}
		},
		{
			zone = 590,
			{"Requirements",
				{"Garrison building", 34}
			},
			{"Quests", {37179, 100, 88009, 590, {"Garrison building", 34}}}
		}
	};

	desc[458] = { --  582/590, 458, Vindicator Heluun / Cacklebone
		nil,
		{
			zone = 582,
			{"Requirements",
				{"Garrison building", 144},
				{"Reputation", 1710, 7}
			},
			{"Merchant", {85427, 582, {"Garrison building", 144}}},
			{"Price", {"Gold", 50000000}},
		},
		{
			zone = 590,
			{"Requirements",
				{"Garrison building", 144},
				{"Reputation", 1710, 7}
			},
			{"Merchant", {88493, 590, {"Garrison building", 144}}},
			{"Price", {"Gold", 50000000}},
		}
	};

	desc[463] = { --  582/590, 463, Daleera Moonfang (A) / Ulna Thresher (H)
		nil,
		{
			zone = 582,
			{"Missions", 91},
			alternative = {
				{"Merchant", {88633, 582, 58.4, 60.4}},
				{"Items", {119288}},
				{"Price", {"Gold", 100000}},
				visible = true,
				text = alternativeInfo_missionfailed
			}
		},
		{
			zone = 590,
			{"Missions", 7},
			alternative = {
				{"Merchant", {88635, 590, 40.32, 51.04}},
				{"Items", {114825}},
				{"Price", {"Gold", 50000000}},
				visible = true,
				text = alternativeInfo_missionfailed
			}
		}
	};

--[=[ anywhere in draenor ]=]
	desc[194] = { --  572, 194, Phylarch the Evergreen
		{
			zone = 572,
			{"Requirements", {"Garrison building", 138} },
			{"Location", {572, nil, nil, "In the near of any large timber that you try to harvest"}}
		}
	};

	desc[195] = { --  572, 195, Weldon Barov (A) / Alexi Weldon (H)
		{
			zone = 572,
			{"Requirements",
				{"Garrison building", 40}
			},
			{"Location",
				{543, 51.29, 61.97, Images={{"location543","Image",false} }}, --[=[ Gorgrond ]=]
				{535, 73.93, 28.23, Images={{"location535","Image",false} }}, --[=[ Talador ]=]
				{542, 55.14, 79.51, Images={{"location542","Image",false} }}, --[=[ Spikes of Arak ]=]
				{550, 84.4, 54.26, Images={{"location550","Image",false} }}, --[=[ Nagrand ]=]
				{550, 59.2, 38.6, --[[Images={{"location550-2","Image",false} } ]] }, --[=[ Nagrand ]=]
			}
		}
	};

	desc[203] = { --  572, 203, Meatball
		nil,
		{
			zone = 84,
			{"Requirements", {"Brawler's Guild", 1691, 5}},
			--{"Quests", {36702, 100, 86272, 922, 62.21, 25.69, Images={{"location","Image",true}}, Quest}}
		},
		{
			zone = 85,
			{"Requirements", {"Brawler's Guild", 1690, 5}}
		}
	};

	desc[465] = { --  572, 465, Harrison Jones
		nil,
		{
			zone = 572,
			{"Achievements", 9928, 9825}
		},
		{
			zone = 572,
			{"Achievements", 9901, 9836}
		}
	};

--[=[ dungeons ]=]
	desc[177] = { --  573, 177, Croman
		{
			zone = 573,
			zoneType = "dungeon",
			{"Achievements", 9005}
		}
	};

	desc[178] = { --  616, 178, Leeroy Jenkins, Upper Blackrock Spire
		{
			zone = 616,
			zoneType = "dungeon",
			{"Achievements", 9058}
		}
	};

--[=[ raids ]=]
	desc[225] = { --  596, 225, Aknor Steelbringer
		{
			zone = 596,
			zoneType = "raid",
			{"Achievements", 8929}
		}
	};

	desc[474] = { -- 661, 474, Ariok
		{
			zone = 661,
			zoneType = "raid",
			{"Achievements", 9972}
		}
	};

--[=[ 622/624 ashran ]=]
	desc[459] = { --  622/624, 459, Cleric Maluuf (A) / Karg Bloodfury (H)
		nil,
		{
			zone = 622,
			{"Requirements", {"Reputation", 1731, 7}},
			{"Merchant", {85932, 622, 46.6, 76.2}},
			{"Price", {"Gold", 50000000}},
		},
		{
			zone = 624,
			{"Requirements", {"Reputation", 1445, 7}},
			{"Merchant", {86036, 624, 53.4, 62.6}},
			{"Price", {"Gold", 50000000}},
		}
	};

	desc[460] = { --  622/624, 460, Felbast
		nil,
		{
			zone = 622,
			{"Requirements", {"Reputation", 1711, 7}},
			{"Merchant", {88482, 622, 43.2, 77.4}},
			{"Price", {"Gold", 50000000}},
		},
		{
			zone = 624,
			{"Requirements", {"Reputation", 1711, 7}},
			{"Merchant", {88493, 624, 53.8, 60.8}},
			{"Price", {"Gold", 50000000}},
		}
	};

	desc[462] = { --  622/624, 462, Dawnseeker Rukaryx
		nil,
		{
			zone = 622,
			{"Merchant", {86391, 622, 49.9, 61.4}},
			{"Price", {"Currency", 823, 5000}, {"Gold", 50000000}},
		},
		{
			zone = 624,
			{"Merchant", {86382, 624, 64.6, 61.8}},
			{"Price", {"Currency", 823, 5000}, {"Gold", 50000000}},
		}
	};

	desc[467] = { --  622/624, 467, Fen Tao
		nil,
		{
			zone = 622,
			{"Location", {622, 45.3, 70.5, Images={{"location","Image",true}}}}
		},
		{
			zone = 624,
			{"Location", {624, 46.9, 45.2, Images={{"location","Image",true}}}}
		}
	};

--[=[ 534 Tanaan jungle ]=]
	desc[468] = { -- 534, 468, Oronok Torn-heart
		{
			zone = 534,
			{"Quests",
				{39395, 100, 92338, 534, 62.8, 27.8}
			}
		}
	}; -- TODO: questrow is longer. need more verified data.

	desc[580] = { -- 534, 580, Pallas
		{
			zone = 534,
			{"Requirements", {"Reputation", 1850, 6}},
			{"Merchant", {92805, 534, 55.2, 74.8}},
			{"Items", {128439}},
			{"Price", {"Item", 124099, 100}}
		}
	};

	desc[581] = { -- 534, 581, Dowser Bigspark / Dowser Goodwell
		nil,
		{
			zone = 534,
			{"Requirements", {"Reputation", 1847, 6}},
			{"Merchant", {90974, 534, 58.4, 60.4}},
			{"Items", {128445}},
			{"Price", {"Gold", 6000000}}
		},
		{
			zone = 534,
			{"Requirements", {"Reputation", 1848, 6}},
			{"Merchant", {96014, 534, 61.6, 45.6}},
			{"Items", {128445}},
			{"Price", {"Gold", 6000000}}
		}
	};

	desc[582] = { -- 534, 582, Solar Priest Vayx
		nil,
		{
			zone = 534,
			{"Requirements", {"Reputation", 1849, 6}},
			{"Merchant", {95424, 534, 57.8, 59.4}},
			{"Items", {128441}},
			{"Price", {"Currency", 823, 1000}}
		},
		{
			zone = 534,
			{"Requirements", {"Reputation", 1849, 6}},
			{"Merchant", {95424, 534, 60.4, 46.6}},
			{"Items", {128441}},
			{"Price", {"Currency", 823, 1000}}
		}
	};






--[=[ some strings for localization collector script ]=]
--[[
	L["Cave on image 1"]
	L["Hidden cave"]
	L["Random location"]
	L["Path to blook"]
	L["You've choosed the other outpost building?|nYou have two alternatives.|n1. Reset your outpost building by talking with an NPC in the outpost.|n2. Buy a contract in your garrison."]
--]]

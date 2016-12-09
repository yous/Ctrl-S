
ElvDB = {
	["global"] = {
		["gtData"] = {
			["김곱충-줄진"] = "NONE",
			["버징기-줄진"] = "야만은 동색:583,서슬니 굴 속으로:110,서슬달빛의 비밀:110,딱딱한 생물:20,쌓여 가는 충격:28,자비로운 죽음:73,날뛰는 오우거:99,주문 확인:24,루그돌의 아이들:40",
		},
		["gtTime"] = {
			["김곱충-줄진"] = "2015/01/23 01:53:28",
			["버징기-줄진"] = "2015/01/30 22:50:00",
		},
		["luaError"] = {
			"|cffffd200Message:|r|cffffffff ...ns\\Blizzard_AchievementUI\\Blizzard_AchievementUI.lua:699: Usage: GetCategoryNumAchievements(categoryID, includeSuperceded)|r\n|cffffd200Time:|r|cffffffff 01/30/15 22:48:12|r\n|cffffd200Count:|r|cffffffff 95|r\n|cffffd200Stack:|r|cffffffff [C]: ?\n[C]: in function `GetCategoryNumAchievements'\n...ns\\Blizzard_AchievementUI\\Blizzard_AchievementUI.lua:699: in function `AchievementFrameComparison_UpdateStatusBars'\n...ns\\Blizzard_AchievementUI\\Blizzard_AchievementUI.lua:2798: in function <...ns\\Blizzard_AchievementUI\\Blizzard_AchievementUI.lua:2795>\n|r\n|cffffd200Locals:|r|cffffffff |r", -- [1]
		},
		["screenheight"] = 900,
		["screenwidth"] = 1440,
		["unitframe"] = {
			["aurafilters"] = {
				["Blacklist"] = {
					["type"] = "Whitelist",
				},
			},
			["buffwatch"] = {
				["WARLOCK"] = {
				},
			},
		},
	},
	["gold"] = {
		["줄진"] = {
			["김곱충"] = 190507517,
			["김롯리"] = 13136,
			["나라잃은토템"] = 2270,
			["버징기"] = 23729590,
			["언땅에죽기"] = 168676,
		},
	},
	["namespaces"] = {
		["LibDualSpec-1.0"] = {
		},
	},
	["profileKeys"] = {
		["김곱충 - 줄진"] = "김곱충 - 줄진",
		["김롯리 - 줄진"] = "김롯리 - 줄진",
		["나라잃은토템 - 줄진"] = "나라잃은토템 - 줄진",
		["버징기 - 줄진"] = "버징기 - 줄진",
		["언땅에죽기 - 줄진"] = "언땅에죽기 - 줄진",
	},
	["profiles"] = {
		["김곱충 - 줄진"] = {
			["AuraWatch"] = {
				["DB"] = {
					{
						["Direction"] = "RIGHT",
						["IconSize"] = 48,
						["Interval"] = 10,
						["List"] = {
							{
								["AuraID"] = 118,
								["UnitID"] = "player",
							}, -- [1]
						},
						["Mode"] = "ICON",
						["Name"] = "p_디버프",
						["Pos"] = {
							"CENTER", -- [1]
							"UIParent", -- [2]
							"CENTER", -- [3]
							-200, -- [4]
							200, -- [5]
						},
					}, -- [1]
					{
						["Direction"] = "RIGHT",
						["IconSize"] = 42,
						["Interval"] = 6,
						["List"] = {
							{
								["AuraID"] = 122355,
								["UnitID"] = "player",
							}, -- [1]
							{
								["AuraID"] = 117828,
								["UnitID"] = "player",
							}, -- [2]
							{
								["AuraID"] = 34936,
								["UnitID"] = "player",
							}, -- [3]
							{
								["AuraID"] = 108559,
								["UnitID"] = "player",
							}, -- [4]
							{
								["AuraID"] = 17941,
								["UnitID"] = "player",
							}, -- [5]
							{
								["AuraID"] = 126697,
								["UnitID"] = "player",
							}, -- [6]
							{
								["AuraID"] = 126605,
								["UnitID"] = "player",
							}, -- [7]
							{
								["AuraID"] = 126683,
								["UnitID"] = "player",
							}, -- [8]
							{
								["AuraID"] = 126705,
								["UnitID"] = "player",
							}, -- [9]
							{
								["AuraID"] = 126659,
								["UnitID"] = "player",
							}, -- [10]
							{
								["AuraID"] = 126577,
								["UnitID"] = "player",
							}, -- [11]
							{
								["AuraID"] = 104993,
								["UnitID"] = "player",
							}, -- [12]
							{
								["AuraID"] = 125487,
								["UnitID"] = "player",
							}, -- [13]
						},
						["Mode"] = "ICON",
						["Name"] = "p_발동류",
						["Pos"] = {
							"BOTTOMLEFT", -- [1]
							"ElvUF_Player", -- [2]
							"TOPLEFT", -- [3]
							0, -- [4]
							55, -- [5]
						},
					}, -- [2]
					{
						["Direction"] = "RIGHT",
						["IconSize"] = 42,
						["Interval"] = 6,
						["List"] = {
							{
								["AuraID"] = 74434,
								["UnitID"] = "player",
							}, -- [1]
							{
								["AuraID"] = 113861,
								["UnitID"] = "player",
							}, -- [2]
							{
								["AuraID"] = 113860,
								["UnitID"] = "player",
							}, -- [3]
							{
								["AuraID"] = 113858,
								["UnitID"] = "player",
							}, -- [4]
							{
								["AuraID"] = 104773,
								["UnitID"] = "player",
							}, -- [5]
							{
								["AuraID"] = 110913,
								["UnitID"] = "player",
							}, -- [6]
							{
								["AuraID"] = 6229,
								["UnitID"] = "player",
							}, -- [7]
							{
								["AuraID"] = 86211,
								["UnitID"] = "player",
							}, -- [8]
							{
								["AuraID"] = 111400,
								["UnitID"] = "player",
							}, -- [9]
						},
						["Mode"] = "ICON",
						["Name"] = "p_이득/버프",
						["Pos"] = {
							"BOTTOMLEFT", -- [1]
							"ElvUF_Player", -- [2]
							"TOPLEFT", -- [3]
							0, -- [4]
							12, -- [5]
						},
					}, -- [3]
					{
						["Direction"] = "RIGHT",
						["IconSize"] = 48,
						["Interval"] = 4,
						["List"] = {
							{
								["AuraID"] = 1490,
								["Caster"] = "all",
								["UnitID"] = "target",
							}, -- [1]
							{
								["AuraID"] = 18223,
								["Caster"] = "all",
								["UnitID"] = "target",
							}, -- [2]
							{
								["AuraID"] = 109466,
								["Caster"] = "all",
								["UnitID"] = "target",
							}, -- [3]
							{
								["AuraID"] = 1098,
								["Caster"] = "player",
								["UnitID"] = "target",
							}, -- [4]
							{
								["AuraID"] = 63311,
								["Caster"] = "player",
								["UnitID"] = "target",
							}, -- [5]
							{
								["AuraID"] = 93068,
								["Caster"] = "all",
								["UnitID"] = "target",
							}, -- [6]
							{
								["AuraID"] = 24844,
								["Caster"] = "all",
								["UnitID"] = "target",
							}, -- [7]
							{
								["AuraID"] = 34889,
								["Caster"] = "all",
								["UnitID"] = "target",
							}, -- [8]
							{
								["AuraID"] = 603,
								["Caster"] = "player",
								["UnitID"] = "target",
							}, -- [9]
							{
								["AuraID"] = 980,
								["Caster"] = "player",
								["UnitID"] = "target",
							}, -- [10]
							{
								["AuraID"] = 172,
								["Caster"] = "player",
								["UnitID"] = "target",
							}, -- [11]
							{
								["AuraID"] = 27243,
								["Caster"] = "player",
								["UnitID"] = "target",
							}, -- [12]
							{
								["AuraID"] = 348,
								["Caster"] = "player",
								["UnitID"] = "target",
							}, -- [13]
							{
								["AuraID"] = 30108,
								["Caster"] = "player",
								["UnitID"] = "target",
							}, -- [14]
							{
								["AuraID"] = 48181,
								["Caster"] = "player",
								["UnitID"] = "target",
							}, -- [15]
						},
						["Mode"] = "ICON",
						["Name"] = "대상_디버프",
						["Pos"] = {
							"BOTTOMLEFT", -- [1]
							"ElvUF_Target", -- [2]
							"TOPLEFT", -- [3]
							0, -- [4]
							68, -- [5]
						},
					}, -- [4]
				},
				["loadDefault"] = true,
			},
			["actionbar"] = {
				["bar1"] = {
					["backdrop"] = false,
				},
				["bar2"] = {
					["enabled"] = true,
				},
				["bar3"] = {
					["backdrop"] = false,
					["buttons"] = 12,
					["buttonsPerRow"] = 12,
				},
				["bar4"] = {
					["backdrop"] = false,
				},
				["bar5"] = {
					["backdrop"] = false,
					["buttons"] = 12,
					["buttonsPerRow"] = 12,
				},
				["barPet"] = {
					["backdrop"] = false,
				},
			},
			["bags"] = {
				["point"] = {
					["ElvUI_ContainerFrame"] = {
						["p1"] = "BOTTOMRIGHT",
						["p3"] = "BOTTOMRIGHT",
						["p4"] = -9.00009441375732,
						["p5"] = 35.0000114440918,
					},
				},
			},
			["bagsOffsetFixed"] = true,
			["currentTutorial"] = 6,
			["datatexts"] = {
				["panels"] = {
					["LeftChatDataPanel"] = {
						["left"] = "Spell/Heal Power",
						["right"] = "Haste",
					},
				},
			},
			["euiscript"] = {
				["afkspincamera"] = false,
				["combatnoti"] = false,
			},
			["general"] = {
				["autoRepair"] = "GUILD",
				["valuecolor"] = {
					["b"] = 0.79,
					["g"] = 0.51,
					["r"] = 0.58,
				},
			},
			["hideTutorial"] = 1,
			["layoutSet"] = "dpsCaster",
			["movers"] = {
				["BossButton"] = "BOTTOM\u001FElvUIParent\u001FBOTTOM\u001F0\u001F600",
				["ElvAB_2"] = "BOTTOM\u001FElvUIParent\u001FBOTTOM\u001F0\u001F38",
				["ElvAB_3"] = "BOTTOM\u001FElvUIParent\u001FBOTTOM\u001F0\u001F72",
				["ElvAB_4"] = "BOTTOMRIGHT\u001FElvUIParent\u001FBOTTOMRIGHT\u001F-4\u001F220",
				["ElvAB_5"] = "BOTTOM\u001FElvUIParent\u001FBOTTOM\u001F0\u001F106",
				["ElvAB_6"] = "BOTTOM\u001FElvUIParent\u001FBOTTOM\u001F0\u001F108",
				["ElvUF_PartyMover"] = "BOTTOMLEFT\u001FElvUIParent\u001FBOTTOMLEFT\u001F4\u001F225",
				["ElvUF_PetMover"] = "BOTTOM\u001FElvUIParent\u001FBOTTOM\u001F0\u001F184",
				["ElvUF_PlayerCastbarMover"] = "BOTTOM\u001FElvUIParent\u001FBOTTOM\u001F0\u001F144",
				["ElvUF_PlayerMover"] = "BOTTOM\u001FElvUIParent\u001FBOTTOM\u001F-278\u001F207",
				["ElvUF_RaidMover"] = "BOTTOMLEFT\u001FElvUIParent\u001FBOTTOMLEFT\u001F4\u001F195",
				["ElvUF_TargetMover"] = "BOTTOM\u001FElvUIParent\u001FBOTTOM\u001F278\u001F207",
				["ElvUF_TargetTargetMover"] = "BOTTOM\u001FElvUIParent\u001FBOTTOM\u001F0\u001F224",
				["EuiInfoBar1Mover"] = "TOP\u001FElvUIParent\u001FTOP\u001F-113\u001F-2",
				["EuiInfoBar3Mover"] = "TOPLEFT\u001FElvUIParent\u001FTOPLEFT\u001F2\u001F-2",
				["EuiInfoBar4Mover"] = "TOP\u001FElvUIParent\u001FTOP\u001F0\u001F-2",
				["GMMover"] = "TOPLEFT\u001FElvUIParent\u001FTOPLEFT\u001F250\u001F-5",
				["MinimapMover"] = "TOPRIGHT\u001FElvUIParent\u001FTOPRIGHT\u001F-3\u001F-3",
				["ShiftAB"] = "TOPLEFT\u001FElvUIParent\u001FBOTTOMLEFT\u001F4\u001F1052",
			},
			["unitframe"] = {
				["colors"] = {
					["auraBarBuff"] = {
						["b"] = 0.79,
						["g"] = 0.51,
						["r"] = 0.58,
					},
					["castClassColor"] = true,
					["castColor"] = {
						["b"] = 0.1,
						["g"] = 0.1,
						["r"] = 0.1,
					},
					["health"] = {
						["b"] = 0.1,
						["g"] = 0.1,
						["r"] = 0.1,
					},
					["healthclass"] = true,
				},
				["units"] = {
					["player"] = {
						["castbar"] = {
							["height"] = 28,
							["width"] = 406,
						},
					},
					["target"] = {
						["aurabar"] = {
							["attachTo"] = "BUFFS",
						},
						["buffs"] = {
							["playerOnly"] = {
								["friendly"] = true,
							},
						},
						["debuffs"] = {
							["enable"] = false,
						},
						["smartAuraDisplay"] = "SHOW_DEBUFFS_ON_FRIENDLIES",
					},
				},
			},
		},
		["김롯리 - 줄진"] = {
			["AuraWatch"] = {
				["DB"] = {
					{
						["Direction"] = "RIGHT",
						["IconSize"] = 48,
						["Interval"] = 10,
						["List"] = {
							{
								["AuraID"] = 118,
								["UnitID"] = "player",
							}, -- [1]
						},
						["Mode"] = "ICON",
						["Name"] = "p_디버프",
						["Pos"] = {
							"CENTER", -- [1]
							"UIParent", -- [2]
							"CENTER", -- [3]
							-200, -- [4]
							200, -- [5]
						},
					}, -- [1]
					{
						["Direction"] = "RIGHT",
						["IconSize"] = 42,
						["Interval"] = 6,
						["List"] = {
							{
								["AuraID"] = 46916,
								["UnitID"] = "player",
							}, -- [1]
							{
								["AuraID"] = 50227,
								["UnitID"] = "player",
							}, -- [2]
							{
								["AuraID"] = 122510,
								["UnitID"] = "player",
							}, -- [3]
							{
								["AuraID"] = 125831,
								["UnitID"] = "player",
							}, -- [4]
							{
								["AuraID"] = 12880,
								["UnitID"] = "player",
							}, -- [5]
							{
								["AuraID"] = 85739,
								["UnitID"] = "player",
							}, -- [6]
							{
								["AuraID"] = 86663,
								["UnitID"] = "player",
							}, -- [7]
							{
								["AuraID"] = 126697,
								["UnitID"] = "player",
							}, -- [8]
							{
								["AuraID"] = 126646,
								["UnitID"] = "player",
							}, -- [9]
							{
								["AuraID"] = 126533,
								["UnitID"] = "player",
							}, -- [10]
							{
								["AuraID"] = 126597,
								["UnitID"] = "player",
							}, -- [11]
							{
								["AuraID"] = 126657,
								["UnitID"] = "player",
							}, -- [12]
							{
								["AuraID"] = 126657,
								["UnitID"] = "player",
							}, -- [13]
							{
								["AuraID"] = 126599,
								["UnitID"] = "player",
							}, -- [14]
							{
								["AuraID"] = 126679,
								["UnitID"] = "player",
							}, -- [15]
							{
								["AuraID"] = 126700,
								["UnitID"] = "player",
							}, -- [16]
							{
								["AuraID"] = 116660,
								["UnitID"] = "player",
							}, -- [17]
							{
								["AuraID"] = 125489,
								["UnitID"] = "player",
							}, -- [18]
							{
								["AuraID"] = 118335,
								["UnitID"] = "player",
							}, -- [19]
						},
						["Mode"] = "ICON",
						["Name"] = "p_발동류",
						["Pos"] = {
							"BOTTOMLEFT", -- [1]
							"ElvUF_Player", -- [2]
							"TOPLEFT", -- [3]
							0, -- [4]
							55, -- [5]
						},
					}, -- [2]
					{
						["Direction"] = "RIGHT",
						["IconSize"] = 42,
						["Interval"] = 6,
						["List"] = {
							{
								["AuraID"] = 871,
								["UnitID"] = "player",
							}, -- [1]
							{
								["AuraID"] = 12975,
								["UnitID"] = "player",
							}, -- [2]
							{
								["AuraID"] = 55694,
								["UnitID"] = "player",
							}, -- [3]
							{
								["AuraID"] = 2565,
								["UnitID"] = "player",
							}, -- [4]
							{
								["AuraID"] = 112048,
								["UnitID"] = "player",
							}, -- [5]
							{
								["AuraID"] = 23920,
								["UnitID"] = "player",
							}, -- [6]
							{
								["AuraID"] = 18499,
								["UnitID"] = "player",
							}, -- [7]
							{
								["AuraID"] = 12292,
								["UnitID"] = "player",
							}, -- [8]
							{
								["AuraID"] = 1719,
								["UnitID"] = "player",
							}, -- [9]
							{
								["AuraID"] = 85730,
								["UnitID"] = "player",
							}, -- [10]
							{
								["AuraID"] = 12328,
								["UnitID"] = "player",
							}, -- [11]
							{
								["AuraID"] = 32216,
								["UnitID"] = "player",
							}, -- [12]
						},
						["Mode"] = "ICON",
						["Name"] = "p_이득/버프",
						["Pos"] = {
							"BOTTOMLEFT", -- [1]
							"ElvUF_Player", -- [2]
							"TOPLEFT", -- [3]
							0, -- [4]
							12, -- [5]
						},
					}, -- [3]
					{
						["Direction"] = "RIGHT",
						["IconSize"] = 48,
						["Interval"] = 4,
						["List"] = {
							{
								["AuraID"] = 86346,
								["Caster"] = "player",
								["UnitID"] = "target",
							}, -- [1]
							{
								["AuraID"] = 1715,
								["Caster"] = "all",
								["UnitID"] = "target",
							}, -- [2]
							{
								["AuraID"] = 1160,
								["Caster"] = "all",
								["UnitID"] = "target",
							}, -- [3]
							{
								["AuraID"] = 113746,
								["Caster"] = "all",
								["UnitID"] = "target",
							}, -- [4]
							{
								["AuraID"] = 115798,
								["Caster"] = "all",
								["UnitID"] = "target",
							}, -- [5]
						},
						["Mode"] = "ICON",
						["Name"] = "대상_디버프",
						["Pos"] = {
							"BOTTOMLEFT", -- [1]
							"ElvUF_Target", -- [2]
							"TOPLEFT", -- [3]
							0, -- [4]
							68, -- [5]
						},
					}, -- [4]
				},
				["loadDefault"] = true,
			},
			["actionbar"] = {
				["bar1"] = {
					["backdrop"] = false,
				},
				["bar2"] = {
					["enabled"] = true,
				},
				["bar3"] = {
					["backdrop"] = false,
					["buttons"] = 12,
					["buttonsPerRow"] = 12,
				},
				["bar4"] = {
					["backdrop"] = false,
				},
				["bar5"] = {
					["backdrop"] = false,
					["buttons"] = 12,
					["buttonsPerRow"] = 12,
					["point"] = "TOPLEFT",
				},
				["bar6"] = {
					["backdrop"] = false,
				},
				["euiabstyle"] = "Low",
			},
			["currentTutorial"] = 1,
			["datatexts"] = {
				["panels"] = {
					["LeftChatDataPanel"] = {
						["left"] = "Attack Power",
						["right"] = "Haste",
					},
				},
			},
			["general"] = {
				["stickyFrames"] = 1,
				["valuecolor"] = {
					["b"] = 0.819,
					["g"] = 0.513,
					["r"] = 0.09,
				},
			},
			["hideTutorial"] = 1,
			["layoutSet"] = "dpsMelee",
			["movers"] = {
				["ElvAB_1"] = "BOTTOM\u001FElvUIParent\u001FBOTTOM\u001F0\u001F4",
				["ElvAB_2"] = "BOTTOM\u001FElvUIParent\u001FBOTTOM\u001F0\u001F38",
				["ElvAB_3"] = "BOTTOM\u001FElvUIParent\u001FBOTTOM\u001F0\u001F72",
				["ElvAB_4"] = "RIGHT\u001FElvUIParent\u001FRIGHT\u001F-4\u001F0",
				["ElvAB_5"] = "BOTTOM\u001FElvUIParent\u001FBOTTOM\u001F0\u001F106",
				["ElvAB_6"] = "BOTTOM\u001FElvUIParent\u001FBOTTOM\u001F0\u001F106",
				["ElvUF_FocusMover"] = "BOTTOM\u001FElvUIParent\u001FBOTTOM\u001F310\u001F432",
				["ElvUF_PartyMover"] = "BOTTOM\u001FElvUIParent\u001FBOTTOM\u001F0\u001F118",
				["ElvUF_PetMover"] = "BOTTOMRIGHT\u001FElvUIParent\u001FBOTTOM\u001F-210\u001F125",
				["ElvUF_PlayerMover"] = "BOTTOMRIGHT\u001FElvUIParent\u001FBOTTOM\u001F-210\u001F195",
				["ElvUF_Raid10Mover"] = "BOTTOM\u001FElvUIParent\u001FBOTTOM\u001F0\u001F118",
				["ElvUF_Raid25Mover"] = "BOTTOM\u001FElvUIParent\u001FBOTTOM\u001F0\u001F118",
				["ElvUF_Raid40Mover"] = "BOTTOM\u001FElvUIParent\u001FBOTTOM\u001F0\u001F118",
				["ElvUF_TargetMover"] = "BOTTOMLEFT\u001FElvUIParent\u001FBOTTOM\u001F210\u001F195",
				["ElvUF_TargetTargetMover"] = "BOTTOMLEFT\u001FElvUIParent\u001FBOTTOM\u001F210\u001F125",
				["PetAB"] = "RIGHT\u001FElvUIParent\u001FRIGHT\u001F-80\u001F0",
			},
			["unitframe"] = {
				["colors"] = {
					["castColor"] = {
						["b"] = 0.31,
						["g"] = 0.31,
						["r"] = 0.31,
					},
				},
				["fontSize"] = 10,
				["units"] = {
					["party"] = {
						["startOutFromCenter"] = true,
					},
					["raid10"] = {
						["startOutFromCenter"] = true,
					},
					["raid25"] = {
						["startOutFromCenter"] = true,
					},
					["raid40"] = {
						["startOutFromCenter"] = true,
					},
					["target"] = {
						["aurabar"] = {
							["attachTo"] = "BUFFS",
						},
						["debuffs"] = {
							["enable"] = false,
						},
						["smartAuraDisplay"] = "SHOW_DEBUFFS_ON_FRIENDLIES",
					},
				},
			},
		},
		["나라잃은토템 - 줄진"] = {
			["AuraWatch"] = {
				["DB"] = {
					{
						["Direction"] = "RIGHT",
						["IconSize"] = 48,
						["Interval"] = 10,
						["List"] = {
							{
								["AuraID"] = 118,
								["UnitID"] = "player",
							}, -- [1]
						},
						["Mode"] = "ICON",
						["Name"] = "CC",
						["Pos"] = {
							"CENTER", -- [1]
							"UIParent", -- [2]
							"CENTER", -- [3]
							-200, -- [4]
							200, -- [5]
						},
					}, -- [1]
					{
						["Direction"] = "RIGHT",
						["IconSize"] = 42,
						["Interval"] = 6,
						["List"] = {
							{
								["AuraID"] = 16246,
								["UnitID"] = "player",
							}, -- [1]
							{
								["AuraID"] = 77762,
								["UnitID"] = "player",
							}, -- [2]
							{
								["AuraID"] = 118522,
								["UnitID"] = "player",
							}, -- [3]
							{
								["AuraID"] = 53390,
								["UnitID"] = "player",
							}, -- [4]
							{
								["AuraID"] = 126697,
								["UnitID"] = "player",
							}, -- [5]
							{
								["AuraID"] = 126649,
								["UnitID"] = "player",
							}, -- [6]
							{
								["AuraID"] = 126599,
								["UnitID"] = "player",
							}, -- [7]
							{
								["AuraID"] = 126554,
								["UnitID"] = "player",
							}, -- [8]
							{
								["AuraID"] = 126690,
								["UnitID"] = "player",
							}, -- [9]
							{
								["AuraID"] = 126707,
								["UnitID"] = "player",
							}, -- [10]
							{
								["AuraID"] = 126605,
								["UnitID"] = "player",
							}, -- [11]
							{
								["AuraID"] = 126683,
								["UnitID"] = "player",
							}, -- [12]
							{
								["AuraID"] = 126705,
								["UnitID"] = "player",
							}, -- [13]
							{
								["AuraID"] = 126659,
								["UnitID"] = "player",
							}, -- [14]
							{
								["AuraID"] = 126577,
								["UnitID"] = "player",
							}, -- [15]
							{
								["AuraID"] = 126588,
								["UnitID"] = "player",
							}, -- [16]
							{
								["AuraID"] = 125489,
								["UnitID"] = "player",
							}, -- [17]
							{
								["AuraID"] = 118334,
								["UnitID"] = "player",
							}, -- [18]
							{
								["AuraID"] = 104993,
								["UnitID"] = "player",
							}, -- [19]
							{
								["AuraID"] = 125487,
								["UnitID"] = "player",
							}, -- [20]
						},
						["Mode"] = "ICON",
						["Name"] = "발동류",
						["Pos"] = {
							"BOTTOMLEFT", -- [1]
							"ElvUF_Player", -- [2]
							"TOPLEFT", -- [3]
							0, -- [4]
							55, -- [5]
						},
					}, -- [2]
					{
						["Direction"] = "RIGHT",
						["IconSize"] = 42,
						["Interval"] = 6,
						["List"] = {
							{
								["AuraID"] = 53817,
								["UnitID"] = "player",
							}, -- [1]
							{
								["AuraID"] = 30823,
								["UnitID"] = "player",
							}, -- [2]
							{
								["AuraID"] = 324,
								["UnitID"] = "player",
							}, -- [3]
							{
								["AuraID"] = 16166,
								["UnitID"] = "player",
							}, -- [4]
							{
								["AuraID"] = 114050,
								["UnitID"] = "player",
							}, -- [5]
							{
								["AuraID"] = 79206,
								["UnitID"] = "player",
							}, -- [6]
							{
								["AuraID"] = 73683,
								["UnitID"] = "player",
							}, -- [7]
							{
								["AuraID"] = 73685,
								["UnitID"] = "player",
							}, -- [8]
							{
								["AuraID"] = 31616,
								["UnitID"] = "player",
							}, -- [9]
							{
								["AuraID"] = 114893,
								["UnitID"] = "player",
							}, -- [10]
							{
								["AuraID"] = 108281,
								["UnitID"] = "player",
							}, -- [11]
							{
								["AuraID"] = 108271,
								["UnitID"] = "player",
							}, -- [12]
						},
						["Mode"] = "ICON",
						["Name"] = "영심류",
						["Pos"] = {
							"BOTTOMLEFT", -- [1]
							"ElvUF_Player", -- [2]
							"TOPLEFT", -- [3]
							0, -- [4]
							12, -- [5]
						},
					}, -- [3]
					{
						["Direction"] = "RIGHT",
						["IconSize"] = 48,
						["Interval"] = 4,
						["List"] = {
							{
								["AuraID"] = 17364,
								["Caster"] = "player",
								["UnitID"] = "target",
							}, -- [1]
							{
								["AuraID"] = 8056,
								["Caster"] = "player",
								["UnitID"] = "target",
							}, -- [2]
							{
								["AuraID"] = 8050,
								["Caster"] = "player",
								["UnitID"] = "target",
							}, -- [3]
							{
								["AuraID"] = 77661,
								["Caster"] = "player",
								["UnitID"] = "target",
							}, -- [4]
							{
								["AuraID"] = 64695,
								["Caster"] = "player",
								["UnitID"] = "target",
							}, -- [5]
							{
								["AuraID"] = 76780,
								["Caster"] = "player",
								["UnitID"] = "target",
							}, -- [6]
						},
						["Mode"] = "ICON",
						["Name"] = "대상Debuffs",
						["Pos"] = {
							"BOTTOMLEFT", -- [1]
							"ElvUF_Target", -- [2]
							"TOPLEFT", -- [3]
							0, -- [4]
							68, -- [5]
						},
					}, -- [4]
				},
				["loadDefault"] = true,
			},
			["actionbar"] = {
				["bar1"] = {
					["heightMult"] = 3,
				},
				["bar2"] = {
					["enabled"] = true,
				},
				["bar3"] = {
					["backdrop"] = false,
					["buttons"] = 12,
					["buttonsPerRow"] = 12,
				},
				["bar4"] = {
					["widthMult"] = 2,
				},
				["bar5"] = {
					["backdrop"] = false,
					["buttons"] = 12,
					["buttonsPerRow"] = 1,
				},
				["euiabstyle"] = "Low",
			},
			["auras"] = {
				["wrapAfter"] = 10,
			},
			["bags"] = {
				["point"] = {
					["ElvUI_ContainerFrame"] = {
						["p1"] = "BOTTOMRIGHT",
						["p3"] = "BOTTOMRIGHT",
						["p4"] = -374.000549316406,
						["p5"] = 17.0000953674316,
					},
				},
			},
			["bagsOffsetFixed"] = true,
			["convertExp"] = true,
			["currentTutorial"] = 1,
			["datatexts"] = {
				["panels"] = {
					["LeftChatDataPanel"] = {
						["left"] = "Spell/Heal Power",
						["right"] = "Haste",
					},
				},
			},
			["general"] = {
				["experience"] = {
					["width"] = 10,
				},
				["reputation"] = {
					["width"] = 10,
				},
				["valuecolor"] = {
					["b"] = 0.819,
					["g"] = 0.513,
					["r"] = 0.09,
				},
			},
			["hideTutorial"] = true,
			["layoutSet"] = "dpsCaster",
			["lowresolutionset"] = true,
			["movers"] = {
				["ElvAB_1"] = "BOTTOM\u001FElvUIParent\u001FBOTTOM\u001F0\u001F4",
				["ElvAB_2"] = "BOTTOM\u001FElvUIParent\u001FBOTTOM\u001F0\u001F38",
				["ElvAB_3"] = "BOTTOM\u001FElvUIParent\u001FBOTTOM\u001F0\u001F72",
				["ElvAB_4"] = "RIGHT\u001FElvUIParent\u001FRIGHT\u001F-4\u001F0",
				["ElvAB_5"] = "RIGHT\u001FElvUIParent\u001FRIGHT\u001F-38\u001F0",
				["ElvUF_FocusMover"] = "BOTTOM\u001FElvUIParent\u001FBOTTOM\u001F310\u001F332",
				["ElvUF_PartyMover"] = "BOTTOMLEFT\u001FElvUIParent\u001FBOTTOMLEFT\u001F4\u001F225",
				["ElvUF_PetMover"] = "BOTTOM\u001FElvUIParent\u001FBOTTOM\u001F-106\u001F120",
				["ElvUF_PlayerMover"] = "BOTTOM\u001FElvUIParent\u001FBOTTOM\u001F-106\u001F180",
				["ElvUF_RaidMover"] = "BOTTOMLEFT\u001FElvUIParent\u001FBOTTOMLEFT\u001F4\u001F195",
				["ElvUF_TargetMover"] = "BOTTOM\u001FElvUIParent\u001FBOTTOM\u001F106\u001F180",
				["ElvUF_TargetTargetMover"] = "BOTTOM\u001FElvUIParent\u001FBOTTOM\u001F106\u001F120",
				["PetAB"] = "RIGHT\u001FElvUIParent\u001FRIGHT\u001F-80\u001F0",
			},
			["unitframe"] = {
				["colors"] = {
					["castColor"] = {
						["b"] = 0.31,
						["g"] = 0.31,
						["r"] = 0.31,
					},
				},
				["fontSize"] = 10,
				["units"] = {
					["arena"] = {
						["castbar"] = {
							["width"] = 200,
						},
						["width"] = 200,
					},
					["boss"] = {
						["castbar"] = {
							["width"] = 200,
						},
						["width"] = 200,
					},
					["party"] = {
						["startOutFromCenter"] = true,
					},
					["pet"] = {
						["height"] = 26,
						["power"] = {
							["enable"] = false,
						},
						["width"] = 200,
					},
					["player"] = {
						["aurabar"] = {
							["auraBarWidth"] = 200,
						},
						["castbar"] = {
							["width"] = 200,
						},
						["classbar"] = {
							["fill"] = "fill",
						},
						["health"] = {
							["text_format"] = "[healthcolor][health:current]",
						},
						["width"] = 200,
					},
					["raid"] = {
						["startOutFromCenter"] = true,
					},
					["target"] = {
						["aurabar"] = {
							["auraBarWidth"] = 200,
						},
						["castbar"] = {
							["width"] = 200,
						},
						["health"] = {
							["text_format"] = "[healthcolor][health:current]",
						},
						["width"] = 200,
					},
					["targettarget"] = {
						["debuffs"] = {
							["enable"] = false,
						},
						["height"] = 26,
						["power"] = {
							["enable"] = false,
						},
						["width"] = 200,
					},
				},
			},
		},
		["버징기 - 줄진"] = {
			["AuraWatch"] = {
				["DB"] = {
					{
						["Direction"] = "RIGHT",
						["IconSize"] = 48,
						["Interval"] = 10,
						["List"] = {
							{
								["AuraID"] = 118,
								["UnitID"] = "player",
							}, -- [1]
						},
						["Mode"] = "ICON",
						["Name"] = "플레이어 디버프",
						["Pos"] = {
							"CENTER", -- [1]
							"UIParent", -- [2]
							"CENTER", -- [3]
							-200, -- [4]
							200, -- [5]
						},
					}, -- [1]
					{
						["Direction"] = "RIGHT",
						["IconSize"] = 42,
						["Interval"] = 6,
						["List"] = {
							{
								["AuraID"] = 54149,
								["UnitID"] = "player",
							}, -- [1]
							{
								["AuraID"] = 88819,
								["UnitID"] = "player",
							}, -- [2]
							{
								["AuraID"] = 86678,
								["UnitID"] = "player",
							}, -- [3]
							{
								["AuraID"] = 114637,
								["UnitID"] = "player",
							}, -- [4]
							{
								["AuraID"] = 114250,
								["UnitID"] = "player",
							}, -- [5]
							{
								["AuraID"] = 85416,
								["UnitID"] = "player",
							}, -- [6]
							{
								["AuraID"] = 90174,
								["UnitID"] = "player",
							}, -- [7]
							{
								["AuraID"] = 87173,
								["UnitID"] = "player",
							}, -- [8]
							{
								["AuraID"] = 86700,
								["UnitID"] = "player",
							}, -- [9]
							{
								["AuraID"] = 126697,
								["UnitID"] = "player",
							}, -- [10]
							{
								["AuraID"] = 126646,
								["UnitID"] = "player",
							}, -- [11]
							{
								["AuraID"] = 126533,
								["UnitID"] = "player",
							}, -- [12]
							{
								["AuraID"] = 126597,
								["UnitID"] = "player",
							}, -- [13]
							{
								["AuraID"] = 126657,
								["UnitID"] = "player",
							}, -- [14]
							{
								["AuraID"] = 126657,
								["UnitID"] = "player",
							}, -- [15]
							{
								["AuraID"] = 126599,
								["UnitID"] = "player",
							}, -- [16]
							{
								["AuraID"] = 126679,
								["UnitID"] = "player",
							}, -- [17]
							{
								["AuraID"] = 126700,
								["UnitID"] = "player",
							}, -- [18]
							{
								["AuraID"] = 126605,
								["UnitID"] = "player",
							}, -- [19]
							{
								["AuraID"] = 126683,
								["UnitID"] = "player",
							}, -- [20]
							{
								["AuraID"] = 126705,
								["UnitID"] = "player",
							}, -- [21]
							{
								["AuraID"] = 126588,
								["UnitID"] = "player",
							}, -- [22]
							{
								["AuraID"] = 116660,
								["UnitID"] = "player",
							}, -- [23]
							{
								["AuraID"] = 125489,
								["UnitID"] = "player",
							}, -- [24]
							{
								["AuraID"] = 118335,
								["UnitID"] = "player",
							}, -- [25]
							{
								["AuraID"] = 104993,
								["UnitID"] = "player",
							}, -- [26]
							{
								["AuraID"] = 125487,
								["UnitID"] = "player",
							}, -- [27]
						},
						["Mode"] = "ICON",
						["Name"] = "플레이어 중요한 이득",
						["Pos"] = {
							"BOTTOMLEFT", -- [1]
							"ElvUF_Player", -- [2]
							"TOPLEFT", -- [3]
							0, -- [4]
							55, -- [5]
						},
					}, -- [2]
					{
						["Direction"] = "RIGHT",
						["IconSize"] = 42,
						["Interval"] = 6,
						["List"] = {
							{
								["AuraID"] = 642,
								["UnitID"] = "player",
							}, -- [1]
							{
								["AuraID"] = 84963,
								["UnitID"] = "player",
							}, -- [2]
							{
								["AuraID"] = 86698,
								["UnitID"] = "player",
							}, -- [3]
							{
								["AuraID"] = 105809,
								["UnitID"] = "player",
							}, -- [4]
							{
								["AuraID"] = 31884,
								["UnitID"] = "player",
							}, -- [5]
							{
								["AuraID"] = 31842,
								["UnitID"] = "player",
							}, -- [6]
							{
								["AuraID"] = 31850,
								["UnitID"] = "player",
							}, -- [7]
							{
								["AuraID"] = 498,
								["UnitID"] = "player",
							}, -- [8]
							{
								["AuraID"] = 54428,
								["UnitID"] = "player",
							}, -- [9]
							{
								["AuraID"] = 85499,
								["UnitID"] = "player",
							}, -- [10]
							{
								["AuraID"] = 114163,
								["UnitID"] = "player",
							}, -- [11]
							{
								["AuraID"] = 20925,
								["UnitID"] = "player",
							}, -- [12]
						},
						["Mode"] = "ICON",
						["Name"] = "플레이어 이득",
						["Pos"] = {
							"BOTTOMLEFT", -- [1]
							"ElvUF_Player", -- [2]
							"TOPLEFT", -- [3]
							0, -- [4]
							12, -- [5]
						},
					}, -- [3]
					{
						["Direction"] = "RIGHT",
						["IconSize"] = 48,
						["Interval"] = 4,
						["List"] = {
							{
								["AuraID"] = 25771,
								["Caster"] = "all",
								["UnitID"] = "player",
							}, -- [1]
							{
								["AuraID"] = 31803,
								["Caster"] = "player",
								["UnitID"] = "target",
							}, -- [2]
							{
								["AuraID"] = 20170,
								["Caster"] = "player",
								["UnitID"] = "target",
							}, -- [3]
							{
								["AuraID"] = 2812,
								["Caster"] = "player",
								["UnitID"] = "target",
							}, -- [4]
							{
								["AuraID"] = 63529,
								["Caster"] = "player",
								["UnitID"] = "target",
							}, -- [5]
							{
								["AuraID"] = 110300,
								["Caster"] = "player",
								["UnitID"] = "target",
							}, -- [6]
						},
						["Mode"] = "ICON",
						["Name"] = "대상 디버프",
						["Pos"] = {
							"BOTTOMLEFT", -- [1]
							"ElvUF_Target", -- [2]
							"TOPLEFT", -- [3]
							0, -- [4]
							68, -- [5]
						},
					}, -- [4]
				},
				["loadDefault"] = true,
			},
			["actionbar"] = {
				["bar1"] = {
					["heightMult"] = 3,
				},
				["bar2"] = {
					["enabled"] = true,
				},
				["bar3"] = {
					["buttons"] = 12,
					["buttonsPerRow"] = 12,
				},
				["bar4"] = {
					["widthMult"] = 2,
				},
				["bar5"] = {
					["buttons"] = 12,
					["buttonsPerRow"] = 1,
					["point"] = "TOPRIGHT",
				},
				["euiabstyle"] = "Low",
				["macrotext"] = true,
			},
			["auras"] = {
				["wrapAfter"] = 10,
			},
			["bagsOffsetFixed"] = true,
			["currentTutorial"] = 1,
			["datatexts"] = {
				["panels"] = {
					["LeftChatDataPanel"] = {
						["left"] = "Attack Power",
						["right"] = "Haste",
					},
				},
			},
			["general"] = {
				["castNoInterrupt"] = {
				},
				["valuecolor"] = {
					["b"] = 0.819,
					["g"] = 0.513,
					["r"] = 0.09,
				},
			},
			["hideTutorial"] = true,
			["layoutSet"] = "dpsMelee",
			["lowresolutionset"] = true,
			["movers"] = {
				["ElvAB_1"] = "BOTTOM\u001FElvUIParent\u001FBOTTOM\u001F0\u001F4",
				["ElvAB_2"] = "BOTTOM\u001FElvUIParent\u001FBOTTOM\u001F0\u001F38",
				["ElvAB_3"] = "BOTTOM\u001FElvUIParent\u001FBOTTOM\u001F0\u001F72",
				["ElvAB_4"] = "BOTTOMRIGHT\u001FElvUIParent\u001FBOTTOMRIGHT\u001F-4\u001F214",
				["ElvAB_5"] = "BOTTOMRIGHT\u001FElvUIParent\u001FBOTTOMRIGHT\u001F-38\u001F214",
				["ElvUF_FocusMover"] = "BOTTOM\u001FElvUIParent\u001FBOTTOM\u001F310\u001F332",
				["ElvUF_PartyMover"] = "BOTTOMLEFT\u001FElvUIParent\u001FBOTTOMLEFT\u001F4\u001F225",
				["ElvUF_PetMover"] = "BOTTOM\u001FElvUIParent\u001FBOTTOM\u001F-150\u001F114",
				["ElvUF_PlayerMover"] = "BOTTOM\u001FElvUIParent\u001FBOTTOM\u001F-278\u001F182",
				["ElvUF_RaidMover"] = "BOTTOMLEFT\u001FElvUIParent\u001FBOTTOMLEFT\u001F4\u001F195",
				["ElvUF_TargetMover"] = "BOTTOM\u001FElvUIParent\u001FBOTTOM\u001F278\u001F182",
				["ElvUF_TargetTargetMover"] = "BOTTOM\u001FElvUIParent\u001FBOTTOM\u001F150\u001F114",
				["PetAB"] = "RIGHT\u001FElvUIParent\u001FRIGHT\u001F-80\u001F0",
				["ShiftAB"] = "TOPLEFT\u001FElvUIParent\u001FBOTTOMLEFT\u001F886\u001F153",
			},
			["unitframe"] = {
				["colors"] = {
					["castColor"] = {
						["b"] = 0.31,
						["g"] = 0.31,
						["r"] = 0.31,
					},
					["healthclass"] = true,
				},
				["unitframeType"] = 2,
				["units"] = {
					["boss"] = {
						["power"] = {
							["width"] = "spaced",
						},
					},
					["focus"] = {
						["power"] = {
							["width"] = "spaced",
						},
					},
					["targettarget"] = {
						["power"] = {
							["width"] = "spaced",
						},
					},
				},
			},
		},
		["언땅에죽기 - 줄진"] = {
			["AuraWatch"] = {
				["DB"] = {
					{
						["Direction"] = "RIGHT",
						["IconSize"] = 48,
						["Interval"] = 10,
						["List"] = {
							{
								["AuraID"] = 118,
								["UnitID"] = "player",
							}, -- [1]
						},
						["Mode"] = "ICON",
						["Name"] = "플레이어 디버프",
						["Pos"] = {
							"CENTER", -- [1]
							"UIParent", -- [2]
							"CENTER", -- [3]
							-200, -- [4]
							200, -- [5]
						},
					}, -- [1]
					{
						["Direction"] = "RIGHT",
						["IconSize"] = 42,
						["Interval"] = 6,
						["List"] = {
							{
								["AuraID"] = 50421,
								["UnitID"] = "player",
							}, -- [1]
							{
								["AuraID"] = 81141,
								["UnitID"] = "player",
							}, -- [2]
							{
								["AuraID"] = 59052,
								["UnitID"] = "player",
							}, -- [3]
							{
								["AuraID"] = 51124,
								["UnitID"] = "player",
							}, -- [4]
							{
								["AuraID"] = 81340,
								["UnitID"] = "player",
							}, -- [5]
							{
								["AuraID"] = 53365,
								["UnitID"] = "player",
							}, -- [6]
							{
								["AuraID"] = 63560,
								["UnitID"] = "pet",
							}, -- [7]
							{
								["AuraID"] = 126697,
								["UnitID"] = "player",
							}, -- [8]
							{
								["AuraID"] = 126646,
								["UnitID"] = "player",
							}, -- [9]
							{
								["AuraID"] = 126533,
								["UnitID"] = "player",
							}, -- [10]
							{
								["AuraID"] = 126597,
								["UnitID"] = "player",
							}, -- [11]
							{
								["AuraID"] = 126657,
								["UnitID"] = "player",
							}, -- [12]
							{
								["AuraID"] = 126657,
								["UnitID"] = "player",
							}, -- [13]
							{
								["AuraID"] = 126599,
								["UnitID"] = "player",
							}, -- [14]
							{
								["AuraID"] = 126679,
								["UnitID"] = "player",
							}, -- [15]
							{
								["AuraID"] = 126700,
								["UnitID"] = "player",
							}, -- [16]
							{
								["AuraID"] = 116660,
								["UnitID"] = "player",
							}, -- [17]
							{
								["AuraID"] = 125489,
								["UnitID"] = "player",
							}, -- [18]
							{
								["AuraID"] = 118335,
								["UnitID"] = "player",
							}, -- [19]
						},
						["Mode"] = "ICON",
						["Name"] = "플레이어 중요 버프",
						["Pos"] = {
							"BOTTOMLEFT", -- [1]
							"ElvUF_Player", -- [2]
							"TOPLEFT", -- [3]
							0, -- [4]
							55, -- [5]
						},
					}, -- [2]
					{
						["Direction"] = "RIGHT",
						["IconSize"] = 42,
						["Interval"] = 6,
						["List"] = {
							{
								["AuraID"] = 49222,
								["UnitID"] = "player",
							}, -- [1]
							{
								["AuraID"] = 55233,
								["UnitID"] = "player",
							}, -- [2]
							{
								["AuraID"] = 48792,
								["UnitID"] = "player",
							}, -- [3]
							{
								["AuraID"] = 48707,
								["UnitID"] = "player",
							}, -- [4]
							{
								["AuraID"] = 49028,
								["UnitID"] = "player",
							}, -- [5]
							{
								["AuraID"] = 49039,
								["UnitID"] = "player",
							}, -- [6]
							{
								["AuraID"] = 51271,
								["UnitID"] = "player",
							}, -- [7]
							{
								["AuraID"] = 96268,
								["UnitID"] = "player",
							}, -- [8]
							{
								["AuraID"] = 115989,
								["UnitID"] = "player",
							}, -- [9]
						},
						["Mode"] = "ICON",
						["Name"] = "플레이어 버프",
						["Pos"] = {
							"BOTTOMLEFT", -- [1]
							"ElvUF_Player", -- [2]
							"TOPLEFT", -- [3]
							0, -- [4]
							12, -- [5]
						},
					}, -- [3]
					{
						["Direction"] = "RIGHT",
						["IconSize"] = 48,
						["Interval"] = 4,
						["List"] = {
							{
								["AuraID"] = 55095,
								["Caster"] = "player",
								["UnitID"] = "target",
							}, -- [1]
							{
								["AuraID"] = 55078,
								["Caster"] = "player",
								["UnitID"] = "target",
							}, -- [2]
						},
						["Mode"] = "ICON",
						["Name"] = "대상 디버프",
						["Pos"] = {
							"BOTTOMLEFT", -- [1]
							"ElvUF_Target", -- [2]
							"TOPLEFT", -- [3]
							0, -- [4]
							68, -- [5]
						},
					}, -- [4]
				},
				["loadDefault"] = true,
			},
			["actionbar"] = {
				["bar1"] = {
					["heightMult"] = 3,
				},
				["bar2"] = {
					["enabled"] = true,
				},
				["bar3"] = {
					["backdrop"] = false,
					["buttons"] = 12,
					["buttonsPerRow"] = 12,
				},
				["bar4"] = {
					["widthMult"] = 2,
				},
				["bar5"] = {
					["backdrop"] = false,
					["buttons"] = 12,
					["buttonsPerRow"] = 1,
					["point"] = "TOPRIGHT",
				},
				["euiabstyle"] = "Low",
			},
			["bagsOffsetFixed"] = true,
			["currentTutorial"] = 1,
			["datatexts"] = {
				["panels"] = {
					["LeftChatDataPanel"] = {
						["left"] = "Attack Power",
					},
				},
			},
			["general"] = {
				["valuecolor"] = {
					["b"] = 0.819,
					["g"] = 0.513,
					["r"] = 0.09,
				},
			},
			["hideTutorial"] = true,
			["layoutSet"] = "dpsMelee",
			["movers"] = {
				["ElvAB_1"] = "BOTTOM\u001FElvUIParent\u001FBOTTOM\u001F0\u001F4",
				["ElvAB_2"] = "BOTTOM\u001FElvUIParent\u001FBOTTOM\u001F0\u001F38",
				["ElvAB_3"] = "BOTTOM\u001FElvUIParent\u001FBOTTOM\u001F0\u001F72",
				["ElvAB_4"] = "RIGHT\u001FElvUIParent\u001FRIGHT\u001F-4\u001F0",
				["ElvAB_5"] = "RIGHT\u001FElvUIParent\u001FRIGHT\u001F-38\u001F0",
				["ElvUF_PartyMover"] = "BOTTOMLEFT\u001FElvUIParent\u001FBOTTOMLEFT\u001F4\u001F225",
				["ElvUF_PlayerMover"] = "BOTTOM\u001FElvUIParent\u001FBOTTOM\u001F-278\u001F145",
				["ElvUF_RaidMover"] = "BOTTOMLEFT\u001FElvUIParent\u001FBOTTOMLEFT\u001F4\u001F195",
				["ElvUF_TargetMover"] = "BOTTOM\u001FElvUIParent\u001FBOTTOM\u001F278\u001F145",
				["PetAB"] = "RIGHT\u001FElvUIParent\u001FRIGHT\u001F-80\u001F0",
				["ShiftAB"] = "TOPLEFT\u001FElvUIParent\u001FBOTTOMLEFT\u001F4\u001F1052",
			},
			["unitframe"] = {
				["colors"] = {
					["castColor"] = {
						["b"] = 0.31,
						["g"] = 0.31,
						["r"] = 0.31,
					},
				},
				["fontSize"] = 10,
			},
		},
	},
	["worldBoss"] = {
		["reset"] = true,
		["김곱충-줄진"] = {
			["class"] = "WARLOCK",
			["drovKilled"] = false,
			["realm"] = "줄진",
			["rukhmarKilled"] = false,
			["tarlnaKilled"] = false,
		},
		["나라잃은토템-줄진"] = {
			["Celestials"] = false,
			["NalakKilled"] = false,
			["OondastaKilled"] = false,
			["Ordos"] = false,
			["class"] = "SHAMAN",
			["galleonKilled"] = false,
			["realm"] = "줄진",
			["shaKilled"] = false,
		},
		["버징기-줄진"] = {
			["Celestials"] = false,
			["NalakKilled"] = false,
			["OondastaKilled"] = false,
			["Ordos"] = false,
			["class"] = "PALADIN",
			["drovKilled"] = false,
			["galleonKilled"] = false,
			["realm"] = "줄진",
			["rukhmarKilled"] = false,
			["shaKilled"] = false,
			["tarlnaKilled"] = false,
		},
		["언땅에죽기-줄진"] = {
			["class"] = "DEATHKNIGHT",
			["drovKilled"] = false,
			["realm"] = "줄진",
			["rukhmarKilled"] = false,
			["tarlnaKilled"] = false,
		},
	},
	["worldBosses"] = {
		["reset"] = true,
		["김곱충-줄진"] = {
			["class"] = "WARLOCK",
			["realm"] = "줄진",
		},
	},
}
ElvPrivateDB = {
	["profileKeys"] = {
		["김곱충 - 줄진"] = "김곱충 - 줄진",
		["김롯리 - 줄진"] = "김롯리 - 줄진",
		["나라잃은토템 - 줄진"] = "나라잃은토템 - 줄진",
		["버징기 - 줄진"] = "버징기 - 줄진",
		["언땅에죽기 - 줄진"] = "언땅에죽기 - 줄진",
	},
	["profiles"] = {
		["김곱충 - 줄진"] = {
			["install_complete"] = "6.79",
			["theme"] = "class",
		},
		["김롯리 - 줄진"] = {
			["install_complete"] = "6.87",
			["theme"] = "classic",
		},
		["나라잃은토템 - 줄진"] = {
			["install_complete"] = "7.57",
			["theme"] = "classic",
		},
		["버징기 - 줄진"] = {
			["install_complete"] = "7.74",
			["theme"] = "classic",
		},
		["언땅에죽기 - 줄진"] = {
			["install_complete"] = "7.74",
			["theme"] = "classic",
		},
	},
}

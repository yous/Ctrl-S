
TellMeWhenDB = {
	["Version"] = 90701,
	["global"] = {
		["Groups"] = {
			{
				["Icons"] = {
					{
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [1]
					{
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [2]
					{
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [3]
					{
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [4]
				},
			}, -- [1]
		},
		["HelpSettings"] = {
			["CNDT_ANDOR_FIRSTSEE"] = true,
			["CNDT_PARENTHESES_FIRSTSEE"] = true,
			["ICON_DURS_FIRSTSEE"] = true,
			["ICON_EXPORT_DOCOPY"] = true,
			["ICON_POCKETWATCH_FIRSTSEE"] = true,
			["SCROLLBAR_DROPDOWN"] = true,
			["SIMPLEGSTAB"] = true,
			["SUG_FIRSTHELP"] = true,
		},
		["TextLayouts"] = {
			["bar2"] = {
				{
				}, -- [1]
				{
				}, -- [2]
			},
			["icon1"] = {
				{
				}, -- [1]
				{
				}, -- [2]
			},
		},
	},
	["profileKeys"] = {
		["김곱충 - 줄진"] = "김곱충 - 줄진",
		["김롯리 - 줄진"] = "김롯리 - 줄진",
		["나는길을몰라 - 아즈샤라"] = "나는길을몰라 - 아즈샤라",
		["나라잃은토템 - 줄진"] = "나라잃은토템 - 줄진",
		["버징기 - 줄진"] = "버징기 - 줄진",
		["언땅에죽기 - 줄진"] = "언땅에죽기 - 줄진",
		["자동수리로봇 - 아즈샤라"] = "자동수리로봇 - 아즈샤라",
	},
	["profiles"] = {
		["김곱충 - 줄진"] = {
			["Groups"] = {
				{
					["GUID"] = "TMW:group:1KVT4j1qpPCp",
				}, -- [1]
			},
			["Locked"] = true,
			["Version"] = 72332,
		},
		["김롯리 - 줄진"] = {
			["Groups"] = {
				{
					["GUID"] = "TMW:group:1KVT4j1ngk6G",
				}, -- [1]
			},
			["Locked"] = true,
			["Version"] = 72101,
		},
		["나는길을몰라 - 아즈샤라"] = {
			["Groups"] = {
				{
					["Columns"] = 7,
					["GUID"] = "TMW:group:1Vw8U=u0rM8e",
					["Icons"] = {
						{
							["Enabled"] = true,
							["Icons"] = {
								"TMW:icon:1WT9_hW0=ric", -- [1]
								"TMW:icon:1WT9_hVunri0", -- [2]
								"TMW:icon:1WVoI9IicoSi", -- [3]
								"TMW:icon:1WVo2w6Dc7as", -- [4]
							},
							["Name"] = "연타 공격",
							["ShowTimer"] = true,
							["ShowTimerText"] = true,
							["States"] = {
								{
								}, -- [1]
								{
									["Alpha"] = 1,
								}, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
							["Type"] = "meta",
						}, -- [1]
						{
							["Enabled"] = true,
							["Events"] = {
								[1] = {
									["Animation"] = "ACTVTNGLOW",
									["Event"] = "WCSP",
									["Type"] = "Animations",
								},
								["n"] = 1,
							},
							["Icons"] = {
								"TMW:icon:1WT9_hWEya8P", -- [1]
								"TMW:icon:1WT9_hW7=9qh", -- [2]
								"TMW:icon:1WVo778hCgeF", -- [3]
								"TMW:icon:1WVo2xeOFQ0x", -- [4]
							},
							["Name"] = "정조준",
							["ShowTimer"] = true,
							["ShowTimerText"] = true,
							["States"] = {
								{
								}, -- [1]
								{
									["Alpha"] = 1,
								}, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
							["Type"] = "meta",
						}, -- [2]
						{
							["Conditions"] = {
								[1] = {
									["Name"] = "13",
									["Type"] = "ITEMSPELL",
								},
								["n"] = 1,
							},
							["Enabled"] = true,
							["Events"] = {
								[1] = {
									["Animation"] = "ACTVTNGLOW",
									["Event"] = "WCSP",
									["OnConditionConditions"] = {
										[1] = {
											["Level"] = 1,
											["Name"] = "13",
											["Operator"] = "<",
											["Type"] = "ITEMCD",
										},
										["n"] = 1,
									},
									["Type"] = "Animations",
								},
								["n"] = 1,
							},
							["Name"] = "13",
							["SettingsPerView"] = {
								["icon"] = {
									["Texts"] = {
										"", -- [1]
									},
								},
							},
							["ShowTimer"] = true,
							["ShowTimerText"] = true,
							["States"] = {
								{
								}, -- [1]
								{
									["Alpha"] = 1,
								}, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
							["Type"] = "item",
						}, -- [3]
						{
							["Conditions"] = {
								[1] = {
									["Name"] = "14",
									["Type"] = "ITEMSPELL",
								},
								["n"] = 1,
							},
							["Enabled"] = true,
							["Events"] = {
								[1] = {
									["Animation"] = "ACTVTNGLOW",
									["Event"] = "WCSP",
									["OnConditionConditions"] = {
										[1] = {
											["Level"] = 1,
											["Name"] = "14",
											["Operator"] = "<",
											["Type"] = "ITEMCD",
										},
										["n"] = 1,
									},
									["Type"] = "Animations",
								},
								["n"] = 1,
							},
							["Name"] = "14",
							["ShowTimer"] = true,
							["ShowTimerText"] = true,
							["States"] = {
								{
								}, -- [1]
								{
									["Alpha"] = 1,
								}, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
							["Type"] = "item",
						}, -- [4]
						{
							["Enabled"] = true,
							["Events"] = {
								[1] = {
									["Animation"] = "ACTVTNGLOW",
									["Event"] = "WCSP",
									["OnConditionConditions"] = {
										[1] = {
											["Level"] = 1,
											["Name"] = "야생 영혼",
											["Operator"] = "<",
											["Type"] = "SPELLCD",
										},
										["n"] = 1,
									},
									["Type"] = "Animations",
								},
								["n"] = 1,
							},
							["Name"] = "야생 영혼",
							["ShowTimer"] = true,
							["ShowTimerText"] = true,
							["States"] = {
								{
								}, -- [1]
								{
									["Alpha"] = 1,
								}, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
							["Type"] = "cooldown",
						}, -- [5]
						{
							["Conditions"] = {
								[1] = {
									["Type"] = "ALIVE",
									["Unit"] = "target",
								},
								[2] = {
									["Level"] = 20,
									["Operator"] = "<=",
									["Type"] = "HEALTH",
									["Unit"] = "target",
								},
								["n"] = 2,
							},
							["Enabled"] = true,
							["Events"] = {
								[1] = {
									["Animation"] = "ACTVTNGLOW",
									["Event"] = "WCSP",
									["OnConditionConditions"] = {
										[1] = {
											["Icon"] = "TMW:icon:1VyAefWgJxek",
											["Type"] = "ICON",
										},
										[2] = {
											["Level"] = 1,
											["Name"] = "마무리 사격",
											["Operator"] = "<",
											["Type"] = "SPELLCD",
										},
										[3] = {
											["Name"] = "마무리 사격",
											["Type"] = "MANAUSABLE",
										},
										["n"] = 3,
									},
									["Type"] = "Animations",
								},
								["n"] = 1,
							},
							["GUID"] = "TMW:icon:1VyAefWgJxek",
							["ManaCheck"] = true,
							["Name"] = "마무리 사격",
							["ShowTimer"] = true,
							["ShowTimerText"] = true,
							["States"] = {
								{
								}, -- [1]
								{
									["Alpha"] = 1,
								}, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
							["Type"] = "cooldown",
						}, -- [6]
						{
							["Enabled"] = true,
							["Events"] = {
								[1] = {
									["Animation"] = "ACTVTNGLOW",
									["Event"] = "OnCondition",
									["OnConditionConditions"] = {
										[1] = {
											["Name"] = "반격의 사격",
											["Type"] = "SPELLCD",
										},
										["n"] = 1,
									},
									["Type"] = "Animations",
								},
								["n"] = 1,
							},
							["Name"] = "반격의 사격",
							["ShowTimer"] = true,
							["ShowTimerText"] = true,
							["States"] = {
								{
								}, -- [1]
								{
									["Alpha"] = 1,
								}, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
							["Type"] = "cooldown",
						}, -- [7]
						{
							["Conditions"] = {
								[1] = {
									["BitFlags"] = {
										[254] = true,
									},
									["Type"] = "UNITSPEC",
								},
								[2] = {
									["Name"] = "폭발 사격",
									["Type"] = "TALENTLEARNED",
								},
								["n"] = 2,
							},
							["Enabled"] = true,
							["Events"] = {
								[1] = {
									["Animation"] = "ACTVTNGLOW",
									["Event"] = "WCSP",
									["OnConditionConditions"] = {
										[1] = {
											["Level"] = 1,
											["Name"] = "폭발 사격",
											["Operator"] = "<",
											["Type"] = "SPELLCD",
										},
										["n"] = 1,
									},
									["Type"] = "Animations",
								},
								["n"] = 1,
							},
							["ManaCheck"] = true,
							["Name"] = "폭발 사격",
							["ShowTimer"] = true,
							["ShowTimerText"] = true,
							["States"] = {
								{
								}, -- [1]
								{
									["Alpha"] = 1,
								}, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
							["Type"] = "cooldown",
						}, -- [8]
						{
							["Conditions"] = {
								[1] = {
									["BitFlags"] = {
										[254] = true,
									},
									["Type"] = "UNITSPEC",
								},
								[2] = {
									["Name"] = "연발 공격",
									["Type"] = "TALENTLEARNED",
								},
								["n"] = 2,
							},
							["Enabled"] = true,
							["Events"] = {
								[1] = {
									["Animation"] = "ACTVTNGLOW",
									["Event"] = "WCSP",
									["OnConditionConditions"] = {
										[1] = {
											["Level"] = 1,
											["Name"] = "연발 공격",
											["Operator"] = "<",
											["Type"] = "SPELLCD",
										},
										["n"] = 1,
									},
									["Type"] = "Animations",
								},
								["n"] = 1,
							},
							["Name"] = "연발 공격",
							["ShowTimer"] = true,
							["ShowTimerText"] = true,
							["States"] = {
								{
								}, -- [1]
								{
									["Alpha"] = 1,
								}, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
							["Type"] = "cooldown",
						}, -- [9]
						{
							["CustomTex"] = "26297",
							["Enabled"] = true,
							["Events"] = {
								[1] = {
									["Animation"] = "ACTVTNGLOW",
									["Event"] = "WCSP",
									["OnConditionConditions"] = {
										[1] = {
											["Level"] = 1,
											["Name"] = "광폭화",
											["Operator"] = "<",
											["Type"] = "SPELLCD",
										},
										["n"] = 1,
									},
									["Type"] = "Animations",
								},
								["n"] = 1,
							},
							["Icons"] = {
								"TMW:icon:1WTAHKT55R8N", -- [1]
								"TMW:icon:1WTAHK8_PS8e", -- [2]
							},
							["Name"] = "광폭화",
							["SettingsPerView"] = {
								["icon"] = {
									["Texts"] = {
										"", -- [1]
									},
								},
							},
							["ShowTimer"] = true,
							["ShowTimerText"] = true,
							["States"] = {
								{
								}, -- [1]
								{
									["Alpha"] = 1,
								}, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
							["Type"] = "meta",
						}, -- [10]
						{
							["Enabled"] = true,
							["Icons"] = {
								"TMW:icon:1WVo778vnF0c", -- [1]
								"TMW:icon:1WVo7790m2Km", -- [2]
							},
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
							["Type"] = "meta",
						}, -- [11]
						{
							["Enabled"] = true,
							["Icons"] = {
								"TMW:icon:1WW5cc0iyNWg", -- [1]
								"TMW:icon:1WW5ce1gU2S0", -- [2]
							},
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
							["Type"] = "meta",
						}, -- [12]
						{
							["Conditions"] = {
								[1] = {
									["BitFlags"] = {
										[254] = true,
									},
									["Type"] = "UNITSPEC",
								},
								["n"] = 1,
							},
							["Enabled"] = true,
							["Name"] = "실탄 장전",
							["ShowTimer"] = true,
							["ShowTimerText"] = true,
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
							["Type"] = "buff",
						}, -- [13]
						{
							["Enabled"] = true,
							["Events"] = {
								[1] = {
									["Animation"] = "ACTVTNGLOW",
									["Event"] = "OnCondition",
									["OnConditionConditions"] = {
										[1] = {
											["Name"] = "평정의 사격",
											["Type"] = "SPELLCD",
										},
										["n"] = 1,
									},
									["Type"] = "Animations",
								},
								["n"] = 1,
							},
							["Name"] = "평정의 사격",
							["ShowTimer"] = true,
							["ShowTimerText"] = true,
							["States"] = {
								{
								}, -- [1]
								{
									["Alpha"] = 1,
								}, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
							["Type"] = "cooldown",
						}, -- [14]
						{
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
						}, -- [15]
						{
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
						}, -- [16]
						{
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
						}, -- [17]
						{
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
						}, -- [18]
						{
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
						}, -- [19]
						{
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
						}, -- [20]
						{
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
						}, -- [21]
						{
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
						}, -- [22]
					},
					["Locked"] = true,
					["Name"] = "main",
					["Point"] = {
						["x"] = 0.0001169145054707171,
						["y"] = -140,
					},
					["Rows"] = 2,
					["Scale"] = 1.2,
				}, -- [1]
				{
					["Columns"] = 1,
					["Enabled"] = false,
					["GUID"] = "TMW:group:1W3Lo0LoQ7KP",
					["Icons"] = {
						{
							["CustomTex"] = "NONE",
							["Enabled"] = true,
							["PowerType"] = -1,
							["SettingsPerView"] = {
								["bar"] = {
									["TextLayout"] = "bar1",
									["Texts"] = {
										"", -- [1]
										"", -- [2]
									},
								},
							},
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
							["Type"] = "value",
						}, -- [1]
						{
							["CustomTex"] = "NONE",
							["Enabled"] = true,
							["SettingsPerView"] = {
								["bar"] = {
									["TextLayout"] = "bar1",
									["Texts"] = {
										"[Value:Short]", -- [1]
										"", -- [2]
									},
								},
							},
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
							["Type"] = "value",
						}, -- [2]
						{
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
						}, -- [3]
						{
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
						}, -- [4]
						{
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
						}, -- [5]
						{
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
						}, -- [6]
						{
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
						}, -- [7]
						{
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
						}, -- [8]
						{
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
						}, -- [9]
						{
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
						}, -- [10]
						{
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
						}, -- [11]
						{
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
						}, -- [12]
						{
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
						}, -- [13]
						{
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
						}, -- [14]
					},
					["Locked"] = true,
					["Name"] = "resources",
					["Point"] = {
						["x"] = 0.0001169145054707171,
						["y"] = -100,
					},
					["Rows"] = 2,
					["Scale"] = 1.2,
					["SettingsPerView"] = {
						["bar"] = {
							["BorderBar"] = 0.5,
							["BorderInset"] = false,
							["Icon"] = false,
							["SizeX"] = 150,
							["SizeY"] = 10,
						},
					},
					["View"] = "bar",
				}, -- [2]
				{
					["Columns"] = 8,
					["GUID"] = "TMW:group:1WTA3Y9Le7ic",
					["Icons"] = {
						{
							["Conditions"] = {
								[1] = {
									["BitFlags"] = {
										[254] = true,
									},
									["Type"] = "UNITSPEC",
								},
								[2] = {
									["Name"] = "연타 공격",
									["Type"] = "TALENTLEARNED",
								},
								[3] = {
									["Name"] = "연타 공격",
									["Type"] = "BUFFDUR",
								},
								["n"] = 3,
							},
							["Enabled"] = true,
							["Events"] = {
								[1] = {
									["Animation"] = "ACTVTNGLOW",
									["Event"] = "WCSP",
									["OnConditionConditions"] = {
										[1] = {
											["Level"] = 1,
											["Name"] = "연타 공격",
											["Operator"] = "<",
											["Type"] = "SPELLCD",
										},
										["n"] = 1,
									},
									["Type"] = "Animations",
								},
								["n"] = 1,
							},
							["FakeHidden"] = true,
							["GUID"] = "TMW:icon:1WT9_hVunri0",
							["Name"] = "연타 공격",
							["ShowTimer"] = true,
							["ShowTimerText"] = true,
							["States"] = {
								{
								}, -- [1]
								{
									["Alpha"] = 1,
								}, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
							["Type"] = "cooldown",
						}, -- [1]
						{
							["Conditions"] = {
								[1] = {
									["BitFlags"] = {
										[254] = true,
									},
									["Type"] = "UNITSPEC",
								},
								[2] = {
									["Name"] = "연타 공격",
									["Type"] = "TALENTLEARNED",
								},
								["n"] = 2,
							},
							["Enabled"] = true,
							["Events"] = {
								[1] = {
									["Animation"] = "ACTVTNGLOW",
									["Event"] = "WCSP",
									["OnConditionConditions"] = {
										[1] = {
											["Name"] = "연타 공격",
											["Operator"] = ">",
											["Type"] = "BUFFDUR",
										},
										["n"] = 1,
									},
									["Type"] = "Animations",
								},
								["n"] = 1,
							},
							["FakeHidden"] = true,
							["GUID"] = "TMW:icon:1WT9_hW0=ric",
							["Name"] = "연타 공격",
							["ShowTimer"] = true,
							["ShowTimerText"] = true,
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
							["Type"] = "buff",
						}, -- [2]
						{
							["Conditions"] = {
								[1] = {
									["BitFlags"] = {
										[254] = true,
									},
									["Type"] = "UNITSPEC",
								},
								[2] = {
									["Name"] = "정조준",
									["Type"] = "BUFFDUR",
								},
								["n"] = 2,
							},
							["Enabled"] = true,
							["Events"] = {
								[1] = {
									["Animation"] = "ACTVTNGLOW",
									["Event"] = "WCSP",
									["OnConditionConditions"] = {
										[1] = {
											["Level"] = 1,
											["Name"] = "정조준",
											["Operator"] = "<",
											["Type"] = "SPELLCD",
										},
										["n"] = 1,
									},
									["Type"] = "Animations",
								},
								["n"] = 1,
							},
							["FakeHidden"] = true,
							["GUID"] = "TMW:icon:1WT9_hW7=9qh",
							["Name"] = "정조준",
							["ShowTimer"] = true,
							["ShowTimerText"] = true,
							["States"] = {
								{
								}, -- [1]
								{
									["Alpha"] = 1,
								}, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
							["Type"] = "cooldown",
						}, -- [3]
						{
							["Conditions"] = {
								[1] = {
									["BitFlags"] = {
										[254] = true,
									},
									["Type"] = "UNITSPEC",
								},
								["n"] = 1,
							},
							["Enabled"] = true,
							["FakeHidden"] = true,
							["GUID"] = "TMW:icon:1WT9_hWEya8P",
							["Name"] = "정조준",
							["ShowTimer"] = true,
							["ShowTimerText"] = true,
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
							["Type"] = "buff",
						}, -- [4]
						{
							["Conditions"] = {
								[1] = {
									["BitFlags"] = {
										[254] = true,
									},
									["Type"] = "UNITSPEC",
								},
								["n"] = 1,
							},
							["Enabled"] = true,
							["Events"] = {
								[1] = {
									["Animation"] = "ACTVTNGLOW",
									["Event"] = "WCSP",
									["OnConditionConditions"] = {
										[1] = {
											["Name"] = "교묘한 사격",
											["Operator"] = ">",
											["Type"] = "BUFFDUR",
										},
										["n"] = 1,
									},
									["Type"] = "Animations",
								},
								["n"] = 1,
							},
							["FakeHidden"] = true,
							["GUID"] = "TMW:icon:1WVo778vnF0c",
							["Name"] = "교묘한 사격",
							["ShowTimer"] = true,
							["ShowTimerText"] = true,
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
							["Type"] = "buff",
						}, -- [5]
						{
							["Conditions"] = {
								[1] = {
									["BitFlags"] = {
										[254] = true,
									},
									["Type"] = "UNITSPEC",
								},
								["n"] = 1,
							},
							["Enabled"] = true,
							["FakeHidden"] = true,
							["GUID"] = "TMW:icon:1WW5cc0iyNWg",
							["Name"] = "꾸준한 집중",
							["ShowTimer"] = true,
							["ShowTimerText"] = true,
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
							["Type"] = "buff",
						}, -- [6]
						{
							["Conditions"] = {
								[1] = {
									["Name"] = "광폭화",
									["Type"] = "BUFFDUR",
								},
								["n"] = 1,
							},
							["Enabled"] = true,
							["Events"] = {
								[1] = {
									["Animation"] = "ACTVTNGLOW",
									["Event"] = "WCSP",
									["OnConditionConditions"] = {
										[1] = {
											["Level"] = 1,
											["Name"] = "광폭화",
											["Operator"] = "<",
											["Type"] = "SPELLCD",
										},
										["n"] = 1,
									},
									["Type"] = "Animations",
								},
								["n"] = 1,
							},
							["FakeHidden"] = true,
							["GUID"] = "TMW:icon:1WTAHK8_PS8e",
							["Name"] = "광폭화",
							["SettingsPerView"] = {
								["icon"] = {
									["Texts"] = {
										"", -- [1]
									},
								},
							},
							["ShowTimer"] = true,
							["ShowTimerText"] = true,
							["States"] = {
								{
								}, -- [1]
								{
									["Alpha"] = 1,
								}, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
							["Type"] = "cooldown",
						}, -- [7]
						{
							["Enabled"] = true,
							["FakeHidden"] = true,
							["GUID"] = "TMW:icon:1WTAHKT55R8N",
							["Name"] = "광폭화",
							["ShowTimer"] = true,
							["ShowTimerText"] = true,
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
							["Type"] = "buff",
						}, -- [8]
						{
							["Conditions"] = {
								[1] = {
									["BitFlags"] = {
										[253] = true,
									},
									["Type"] = "UNITSPEC",
								},
								[2] = {
									["Name"] = "야수의 격노",
									["Type"] = "BUFFDUR",
								},
								["n"] = 2,
							},
							["Enabled"] = true,
							["Events"] = {
								[1] = {
									["Animation"] = "ACTVTNGLOW",
									["Event"] = "WCSP",
									["OnConditionConditions"] = {
										[1] = {
											["Level"] = 1,
											["Name"] = "야수의 격노",
											["Operator"] = "<",
											["Type"] = "SPELLCD",
										},
										["n"] = 1,
									},
									["Type"] = "Animations",
								},
								["n"] = 1,
							},
							["FakeHidden"] = true,
							["GUID"] = "TMW:icon:1WVo2w6Dc7as",
							["Name"] = "야수의 격노",
							["ShowTimer"] = true,
							["ShowTimerText"] = true,
							["States"] = {
								{
								}, -- [1]
								{
									["Alpha"] = 1,
								}, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
							["Type"] = "cooldown",
						}, -- [9]
						{
							["Conditions"] = {
								[1] = {
									["BitFlags"] = {
										[253] = true,
									},
									["Type"] = "UNITSPEC",
								},
								["n"] = 1,
							},
							["Enabled"] = true,
							["FakeHidden"] = true,
							["GUID"] = "TMW:icon:1WVoI9IicoSi",
							["Name"] = "야수의 격노",
							["ShowTimer"] = true,
							["ShowTimerText"] = true,
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
							["Type"] = "buff",
						}, -- [10]
						{
							["Conditions"] = {
								[1] = {
									["BitFlags"] = {
										[253] = true,
									},
									["Type"] = "UNITSPEC",
								},
								[2] = {
									["Name"] = "야생의 상",
									["Type"] = "BUFFDUR",
								},
								["n"] = 2,
							},
							["Enabled"] = true,
							["Events"] = {
								[1] = {
									["Animation"] = "ACTVTNGLOW",
									["Event"] = "WCSP",
									["OnConditionConditions"] = {
										[1] = {
											["Level"] = 1,
											["Name"] = "야생의 상",
											["Operator"] = "<",
											["Type"] = "SPELLCD",
										},
										["n"] = 1,
									},
									["Type"] = "Animations",
								},
								["n"] = 1,
							},
							["FakeHidden"] = true,
							["GUID"] = "TMW:icon:1WVo2xeOFQ0x",
							["Name"] = "야생의 상",
							["ShowTimer"] = true,
							["ShowTimerText"] = true,
							["States"] = {
								{
								}, -- [1]
								{
									["Alpha"] = 1,
								}, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
							["Type"] = "cooldown",
						}, -- [11]
						{
							["Conditions"] = {
								[1] = {
									["BitFlags"] = {
										[253] = true,
									},
									["Type"] = "UNITSPEC",
								},
								["n"] = 1,
							},
							["Enabled"] = true,
							["FakeHidden"] = true,
							["GUID"] = "TMW:icon:1WVo778hCgeF",
							["Name"] = "야생의 상",
							["ShowTimer"] = true,
							["ShowTimerText"] = true,
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
							["Type"] = "buff",
						}, -- [12]
						{
							["Conditions"] = {
								[1] = {
									["BitFlags"] = {
										[253] = true,
									},
									["Type"] = "UNITSPEC",
								},
								["n"] = 1,
							},
							["Enabled"] = true,
							["Events"] = {
								[1] = {
									["Animation"] = "ACTVTNGLOW",
									["Event"] = "WCSP",
									["OnConditionConditions"] = {
										[1] = {
											["Name"] = "야수의 회전베기",
											["Operator"] = ">",
											["Type"] = "BUFFDUR",
										},
										["n"] = 1,
									},
									["Type"] = "Animations",
								},
								["n"] = 1,
							},
							["FakeHidden"] = true,
							["GUID"] = "TMW:icon:1WVo7790m2Km",
							["Name"] = "야수의 회전베기",
							["ShowTimer"] = true,
							["ShowTimerText"] = true,
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
							["Type"] = "buff",
						}, -- [13]
						{
							["Conditions"] = {
								[1] = {
									["BitFlags"] = {
										[253] = true,
									},
									["Type"] = "UNITSPEC",
								},
								["n"] = 1,
							},
							["Enabled"] = true,
							["FakeHidden"] = true,
							["GUID"] = "TMW:icon:1WW5ce1gU2S0",
							["Name"] = "날카로운 사격",
							["SettingsPerView"] = {
								["icon"] = {
									["Texts"] = {
										"", -- [1]
									},
								},
							},
							["ShowTimer"] = true,
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
							["Type"] = "buff",
						}, -- [14]
						{
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
						}, -- [15]
						{
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
						}, -- [16]
					},
					["Locked"] = true,
					["Name"] = "meta",
					["Point"] = {
						["y"] = -250,
					},
					["Rows"] = 2,
					["Scale"] = 1.2,
				}, -- [3]
			},
			["Locked"] = true,
			["NumGroups"] = 3,
			["Version"] = 90701,
		},
		["나라잃은토템 - 줄진"] = {
			["Groups"] = {
				{
					["GUID"] = "TMW:group:1KVT4jbFJJvh",
				}, -- [1]
			},
			["Locked"] = true,
			["Version"] = 72101,
		},
		["버징기 - 줄진"] = {
			["Groups"] = {
				{
					["Columns"] = 5,
					["GUID"] = "TMW:group:1KZ_USSmSYm4",
					["Icons"] = {
						{
							["Enabled"] = true,
							["Name"] = "퇴마술",
							["RangeCheck"] = true,
							["ShowTimer"] = true,
							["ShowTimerText"] = true,
							["ShowTimerTextnoOCC"] = true,
							["ShowWhen"] = 3,
							["Type"] = "cooldown",
						}, -- [1]
						{
							["Enabled"] = true,
							["Name"] = "심판",
							["RangeCheck"] = true,
							["ShowTimer"] = true,
							["ShowTimerText"] = true,
							["ShowTimerTextnoOCC"] = true,
							["ShowWhen"] = 3,
							["Type"] = "cooldown",
						}, -- [2]
						{
							["Enabled"] = true,
							["Name"] = "성전사의 일격",
							["RangeCheck"] = true,
							["ShowTimer"] = true,
							["ShowTimerText"] = true,
							["ShowTimerTextnoOCC"] = true,
							["ShowWhen"] = 3,
							["Type"] = "cooldown",
						}, -- [3]
						{
							["Enabled"] = true,
							["Name"] = "정의의 망치",
							["RangeCheck"] = true,
							["ShowTimer"] = true,
							["ShowTimerText"] = true,
							["ShowTimerTextnoOCC"] = true,
							["ShowWhen"] = 3,
							["Type"] = "cooldown",
						}, -- [4]
						nil, -- [5]
						{
							["Enabled"] = true,
							["Events"] = {
								[1] = {
									["Animation"] = "ACTVTNGLOW",
									["Event"] = "WCSP",
									["OnConditionConditions"] = {
										[1] = {
											["Name"] = "응징의 격노",
											["Type"] = "SPELLCD",
										},
										["n"] = 1,
									},
									["Type"] = "Animations",
								},
								["n"] = 1,
							},
							["Name"] = "응징의 격노",
							["ShowTimer"] = true,
							["ShowTimerText"] = true,
							["ShowTimerTextnoOCC"] = true,
							["ShowWhen"] = 3,
							["Type"] = "cooldown",
						}, -- [6]
						{
							["Enabled"] = true,
							["Events"] = {
								[1] = {
									["Animation"] = "ACTVTNGLOW",
									["Event"] = "WCSP",
									["OnConditionConditions"] = {
										[1] = {
											["Name"] = "사형 선고",
											["Type"] = "SPELLCD",
										},
										["n"] = 1,
									},
									["Type"] = "Animations",
								},
								["n"] = 1,
							},
							["Name"] = "빛의 무기",
							["RangeCheck"] = true,
							["ShowTimer"] = true,
							["ShowTimerText"] = true,
							["ShowTimerTextnoOCC"] = true,
							["ShowWhen"] = 3,
							["Type"] = "cooldown",
						}, -- [7]
						{
							["Enabled"] = true,
							["Events"] = {
								[1] = {
									["Animation"] = "ACTVTNGLOW",
									["Event"] = "WCSP",
									["OnConditionConditions"] = {
										[1] = {
											["Level"] = 5,
											["Type"] = "HOLY_POWER",
										},
										[2] = {
											["AndOr"] = "OR",
											["Name"] = "신성한 목적",
											["Operator"] = ">",
											["PrtsBefore"] = 1,
											["Type"] = "BUFFDUR",
										},
										[3] = {
											["Level"] = 4,
											["Name"] = "신성한 목적",
											["Operator"] = "<=",
											["PrtsAfter"] = 1,
											["Type"] = "BUFFDUR",
										},
										["n"] = 3,
									},
									["Type"] = "Animations",
								},
								["n"] = 1,
							},
							["ManaCheck"] = true,
							["Name"] = "기사단의 선고",
							["RangeCheck"] = true,
							["ShowTimer"] = true,
							["ShowTimerText"] = true,
							["ShowTimerTextnoOCC"] = true,
							["ShowWhen"] = 3,
							["Type"] = "cooldown",
						}, -- [8]
						{
							["Enabled"] = true,
							["Events"] = {
								[1] = {
									["Animation"] = "ACTVTNGLOW",
									["Event"] = "WCSP",
									["OnConditionConditions"] = {
										[1] = {
											["AndOr"] = "OR",
											["Name"] = "최후의 선고",
											["Operator"] = ">",
											["Type"] = "BUFFDUR",
										},
										[2] = {
											["Name"] = "천상의 십자군",
											["Operator"] = ">",
											["PrtsBefore"] = 1,
											["Type"] = "BUFFDUR",
										},
										[3] = {
											["Level"] = 4,
											["Name"] = "천상의 십자군",
											["Operator"] = "<=",
											["PrtsAfter"] = 1,
											["Type"] = "BUFFDUR",
										},
										["n"] = 3,
									},
									["Type"] = "Animations",
								},
								["n"] = 1,
							},
							["ManaCheck"] = true,
							["Name"] = "천상의 폭풍",
							["ShowTimer"] = true,
							["ShowTimerText"] = true,
							["ShowTimerTextnoOCC"] = true,
							["ShowWhen"] = 3,
							["Type"] = "cooldown",
						}, -- [9]
						{
							["Conditions"] = {
								[1] = {
									["Level"] = 35,
									["Operator"] = "<=",
									["Type"] = "HEALTH",
									["Unit"] = "target",
								},
								[2] = {
									["AndOr"] = "OR",
									["Name"] = "응징의 격노",
									["Operator"] = ">",
									["Type"] = "BUFFDUR",
								},
								["n"] = 2,
							},
							["Enabled"] = true,
							["Events"] = {
								[1] = {
									["Animation"] = "ACTVTNGLOW",
									["Event"] = "WCSP",
									["OnConditionConditions"] = {
										[1] = {
											["Name"] = "천벌의 망치",
											["Type"] = "SPELLCD",
										},
										["n"] = 1,
									},
									["Type"] = "Animations",
								},
								["n"] = 1,
							},
							["Name"] = "천벌의 망치",
							["RangeCheck"] = true,
							["ShowTimer"] = true,
							["ShowTimerText"] = true,
							["ShowTimerTextnoOCC"] = true,
							["ShowWhen"] = 3,
							["Type"] = "cooldown",
						}, -- [10]
					},
					["Point"] = {
						["y"] = 150,
					},
					["Rows"] = 2,
					["Scale"] = 1,
				}, -- [1]
			},
			["Locked"] = true,
			["Version"] = 72332,
		},
		["언땅에죽기 - 줄진"] = {
			["Groups"] = {
				{
					["GUID"] = "TMW:group:1Knv4Gm6OLJo",
					["Icons"] = {
						{
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
						}, -- [1]
						{
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
						}, -- [2]
						{
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
						}, -- [3]
						{
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
						}, -- [4]
						{
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
						}, -- [5]
						{
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
						}, -- [6]
						{
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
						}, -- [7]
						{
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
						}, -- [8]
						{
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
						}, -- [9]
						{
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
						}, -- [10]
						{
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
						}, -- [11]
						{
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
						}, -- [12]
						{
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
						}, -- [13]
						{
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
						}, -- [14]
					},
				}, -- [1]
				{
					["Icons"] = {
						{
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
						}, -- [1]
						{
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
						}, -- [2]
						{
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
						}, -- [3]
						{
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
						}, -- [4]
						{
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
						}, -- [5]
						{
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
						}, -- [6]
						{
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
						}, -- [7]
						{
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
						}, -- [8]
						{
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
						}, -- [9]
						{
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
						}, -- [10]
						{
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
						}, -- [11]
						{
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
						}, -- [12]
						{
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
						}, -- [13]
						{
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
						}, -- [14]
					},
				}, -- [2]
				{
					["Icons"] = {
						{
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
						}, -- [1]
						{
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
						}, -- [2]
						{
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
						}, -- [3]
						{
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
						}, -- [4]
						{
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
						}, -- [5]
						{
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
						}, -- [6]
						{
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
						}, -- [7]
						{
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
						}, -- [8]
						{
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
						}, -- [9]
						{
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
						}, -- [10]
						{
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
						}, -- [11]
						{
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
						}, -- [12]
						{
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
						}, -- [13]
						{
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
						}, -- [14]
						{
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
						}, -- [15]
						{
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
						}, -- [16]
					},
				}, -- [3]
			},
			["Locked"] = true,
			["Version"] = 90701,
		},
		["자동수리로봇 - 아즈샤라"] = {
			["Groups"] = {
				{
					["Columns"] = 8,
					["GUID"] = "TMW:group:1Vw8U=u0rM8e",
					["Icons"] = {
						{
							["Enabled"] = true,
							["Events"] = {
								[1] = {
									["Animation"] = "ACTVTNGLOW",
									["Event"] = "OnCondition",
									["OnConditionConditions"] = {
										[1] = {
											["Name"] = "화염 충격",
											["Type"] = "SPELLCD",
										},
										["n"] = 1,
									},
									["Type"] = "Animations",
								},
								["n"] = 1,
							},
							["ManaCheck"] = true,
							["Name"] = "화염 충격",
							["RangeCheck"] = true,
							["ShowTimer"] = true,
							["ShowTimerText"] = true,
							["States"] = {
								{
								}, -- [1]
								{
									["Alpha"] = 1,
								}, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
							["Type"] = "cooldown",
						}, -- [1]
						{
							["Conditions"] = {
								[1] = {
									["BitFlags"] = {
										[262] = true,
									},
									["Type"] = "UNITSPEC",
								},
								["n"] = 1,
							},
							["Enabled"] = true,
							["Events"] = {
								[1] = {
									["Animation"] = "ACTVTNGLOW",
									["Event"] = "WCSP",
									["OnConditionConditions"] = {
										[1] = {
											["Name"] = "용암 폭발",
											["Type"] = "OVERLAYED",
										},
										["n"] = 1,
									},
									["Type"] = "Animations",
								},
								[2] = {
									["Animation"] = "ACTVTNGLOW",
									["Event"] = "OnCondition",
									["OnConditionConditions"] = {
										[1] = {
											["Level"] = 1,
											["Name"] = "용암 폭발",
											["Operator"] = "<",
											["Type"] = "SPELLCD",
										},
										["n"] = 1,
									},
									["Type"] = "Animations",
								},
								["n"] = 2,
							},
							["ManaCheck"] = true,
							["Name"] = "용암 폭발",
							["RangeCheck"] = true,
							["ShowTimer"] = true,
							["ShowTimerText"] = true,
							["States"] = {
								{
								}, -- [1]
								{
									["Alpha"] = 0.5,
								}, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
							["Type"] = "cooldown",
						}, -- [2]
						{
							["Conditions"] = {
								[1] = {
									["BitFlags"] = {
										[262] = true,
									},
									["Type"] = "UNITSPEC",
								},
								[2] = {
									["Name"] = "정기 작렬",
									["Type"] = "TALENTLEARNED",
								},
								["n"] = 2,
							},
							["Enabled"] = true,
							["Events"] = {
								[1] = {
									["Animation"] = "ACTVTNGLOW",
									["Event"] = "WCSP",
									["OnConditionConditions"] = {
										[1] = {
											["Level"] = 1,
											["Name"] = "정기 작렬",
											["Operator"] = "<",
											["Type"] = "SPELLCD",
										},
										["n"] = 1,
									},
									["Type"] = "Animations",
								},
								["n"] = 1,
							},
							["ManaCheck"] = true,
							["Name"] = "정기 작렬",
							["RangeCheck"] = true,
							["ShowTimer"] = true,
							["ShowTimerText"] = true,
							["States"] = {
								{
								}, -- [1]
								{
									["Alpha"] = 1,
								}, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
							["Type"] = "cooldown",
						}, -- [3]
						{
							["Conditions"] = {
								[1] = {
									["BitFlags"] = {
										[262] = true,
									},
									["Type"] = "UNITSPEC",
								},
								[2] = {
									["BitFlags"] = 8,
									["Type"] = "COVENANT",
								},
								["n"] = 2,
							},
							["Enabled"] = true,
							["Events"] = {
								[1] = {
									["Animation"] = "ACTVTNGLOW",
									["Event"] = "WCSP",
									["OnConditionConditions"] = {
										[1] = {
											["Level"] = 1,
											["Name"] = "태고의 파도",
											["Operator"] = "<",
											["Type"] = "SPELLCD",
										},
										["n"] = 1,
									},
									["Type"] = "Animations",
								},
								["n"] = 1,
							},
							["ManaCheck"] = true,
							["Name"] = "태고의 파도",
							["RangeCheck"] = true,
							["ShowTimer"] = true,
							["ShowTimerText"] = true,
							["States"] = {
								{
								}, -- [1]
								{
									["Alpha"] = 1,
								}, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
							["Type"] = "cooldown",
						}, -- [4]
						{
							["CustomTex"] = "폭풍수호자",
							["Enabled"] = true,
							["Icons"] = {
								"TMW:icon:1WbMmzd=xeOa", -- [1]
								"TMW:icon:1WbMmzdxX1mW", -- [2]
							},
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
							["Type"] = "meta",
						}, -- [5]
						{
							["Enabled"] = true,
							["Icons"] = {
								"TMW:icon:1Wc=ckjeNeqk", -- [1]
								"TMW:icon:1Wc=ckjcGDed", -- [2]
								"TMW:icon:1WZlLE1i97ae", -- [3]
								"TMW:icon:1WZkiretgpiL", -- [4]
							},
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
							["Type"] = "meta",
						}, -- [6]
						{
							["Conditions"] = {
								[1] = {
									["Name"] = "13",
									["Type"] = "ITEMSPELL",
								},
								["n"] = 1,
							},
							["Enabled"] = true,
							["Events"] = {
								[1] = {
									["Animation"] = "ACTVTNGLOW",
									["Event"] = "WCSP",
									["OnConditionConditions"] = {
										[1] = {
											["Level"] = 1,
											["Name"] = "13",
											["Operator"] = "<",
											["Type"] = "ITEMCD",
										},
										["n"] = 1,
									},
									["Type"] = "Animations",
								},
								["n"] = 1,
							},
							["Name"] = "13",
							["OnlyEquipped"] = true,
							["OnlyInBags"] = true,
							["SettingsPerView"] = {
								["icon"] = {
									["Texts"] = {
										"", -- [1]
									},
								},
							},
							["ShowTimer"] = true,
							["ShowTimerText"] = true,
							["States"] = {
								{
								}, -- [1]
								{
									["Alpha"] = 1,
								}, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
							["Type"] = "item",
						}, -- [7]
						{
							["Enabled"] = true,
							["Events"] = {
								[1] = {
									["Animation"] = "ACTVTNGLOW",
									["Event"] = "OnCondition",
									["OnConditionConditions"] = {
										[1] = {
											["Name"] = "날카로운 바람",
											["Type"] = "SPELLCD",
										},
										["n"] = 1,
									},
									["Type"] = "Animations",
								},
								["n"] = 1,
							},
							["Name"] = "날카로운 바람",
							["ShowTimer"] = true,
							["ShowTimerText"] = true,
							["States"] = {
								{
								}, -- [1]
								{
									["Alpha"] = 1,
								}, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
							["Type"] = "cooldown",
						}, -- [8]
						{
							["Conditions"] = {
								[1] = {
									["BitFlags"] = {
										[262] = true,
									},
									["Type"] = "UNITSPEC",
								},
								["n"] = 1,
							},
							["Enabled"] = true,
							["Events"] = {
								[1] = {
									["Animation"] = "ACTVTNGLOW",
									["Event"] = "WCSP",
									["OnConditionConditions"] = {
										[1] = {
											["Name"] = "대지 충격",
											["Type"] = "MANAUSABLE",
										},
										["n"] = 1,
									},
									["Type"] = "Animations",
								},
								["n"] = 1,
							},
							["ManaCheck"] = true,
							["Name"] = "대지 충격",
							["RangeCheck"] = true,
							["States"] = {
								{
								}, -- [1]
								{
									["Alpha"] = 1,
								}, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
							["Type"] = "cooldown",
						}, -- [9]
						{
							["Conditions"] = {
								[1] = {
									["BitFlags"] = {
										[262] = true,
									},
									["Type"] = "UNITSPEC",
								},
								["n"] = 1,
							},
							["Enabled"] = true,
							["Events"] = {
								[1] = {
									["Animation"] = "ACTVTNGLOW",
									["Event"] = "WCSP",
									["OnConditionConditions"] = {
										[1] = {
											["Name"] = "지진",
											["Type"] = "MANAUSABLE",
										},
										["n"] = 1,
									},
									["Type"] = "Animations",
								},
								["n"] = 1,
							},
							["ManaCheck"] = true,
							["Name"] = "지진",
							["States"] = {
								{
								}, -- [1]
								{
									["Alpha"] = 1,
								}, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
							["Type"] = "cooldown",
						}, -- [10]
						{
							["Conditions"] = {
								[1] = {
									["BitFlags"] = {
										[262] = true,
									},
									["Type"] = "UNITSPEC",
								},
								[2] = {
									["Name"] = "원소의 대가",
									["Type"] = "TALENTLEARNED",
								},
								["n"] = 2,
							},
							["Enabled"] = true,
							["Events"] = {
								[1] = {
									["Animation"] = "ACTVTNGLOW",
									["Event"] = "WCSP",
									["OnlyShown"] = true,
									["Type"] = "Animations",
								},
								["n"] = 1,
							},
							["Name"] = "원소의 대가",
							["ShowTimer"] = true,
							["ShowTimerText"] = true,
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
							["Type"] = "buff",
						}, -- [11]
						{
							["Enabled"] = true,
							["Icons"] = {
								"TMW:icon:1Wc=ckjaTxaM", -- [1]
								"TMW:icon:1Wc=ckjYbf8s", -- [2]
							},
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
							["Type"] = "meta",
						}, -- [12]
						{
							["Conditions"] = {
								[1] = {
									["BitFlags"] = {
										[262] = true,
									},
									["Type"] = "UNITSPEC",
								},
								["n"] = 1,
							},
							["Enabled"] = true,
							["Events"] = {
								[1] = {
									["Animation"] = "ACTVTNGLOW",
									["Event"] = "OnCondition",
									["OnConditionConditions"] = {
										[1] = {
											["Name"] = "천둥폭풍",
											["Type"] = "SPELLCD",
										},
										["n"] = 1,
									},
									["Type"] = "Animations",
								},
								["n"] = 1,
							},
							["Name"] = "천둥폭풍",
							["ShowTimer"] = true,
							["ShowTimerText"] = true,
							["States"] = {
								{
								}, -- [1]
								{
									["Alpha"] = 1,
								}, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
							["Type"] = "cooldown",
						}, -- [13]
						{
							["CustomTex"] = "대지의 정령",
							["Enabled"] = true,
							["Icons"] = {
								"TMW:icon:1Wc=ckjgJB4T", -- [1]
								"TMW:icon:1Wa2EQwAEu49", -- [2]
								"TMW:icon:1Wa2EPbLR=O0", -- [3]
							},
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
							["Type"] = "meta",
						}, -- [14]
						{
							["Conditions"] = {
								[1] = {
									["Name"] = "14",
									["Type"] = "ITEMSPELL",
								},
								["n"] = 1,
							},
							["Enabled"] = true,
							["Events"] = {
								[1] = {
									["Animation"] = "ACTVTNGLOW",
									["Event"] = "WCSP",
									["OnConditionConditions"] = {
										[1] = {
											["Level"] = 1,
											["Name"] = "14",
											["Operator"] = "<",
											["Type"] = "ITEMCD",
										},
										["n"] = 1,
									},
									["Type"] = "Animations",
								},
								["n"] = 1,
							},
							["Name"] = "14",
							["OnlyEquipped"] = true,
							["OnlyInBags"] = true,
							["ShowTimer"] = true,
							["ShowTimerText"] = true,
							["States"] = {
								{
								}, -- [1]
								{
									["Alpha"] = 1,
								}, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
							["Type"] = "item",
						}, -- [15]
						{
							["Conditions"] = {
								[1] = {
									["BitFlags"] = {
										[262] = true,
									},
									["Type"] = "UNITSPEC",
								},
								["n"] = 1,
							},
							["Enabled"] = true,
							["Events"] = {
								[1] = {
									["Animation"] = "ACTVTNGLOW",
									["Event"] = "OnCondition",
									["OnConditionConditions"] = {
										[1] = {
											["Name"] = "영혼 정화",
											["Type"] = "SPELLCD",
										},
										["n"] = 1,
									},
									["Type"] = "Animations",
								},
								["n"] = 1,
							},
							["Name"] = "영혼 정화",
							["ShowTimer"] = true,
							["ShowTimerText"] = true,
							["States"] = {
								{
								}, -- [1]
								{
									["Alpha"] = 1,
								}, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
							["Type"] = "cooldown",
						}, -- [16]
						{
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
						}, -- [17]
						{
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
						}, -- [18]
						{
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
						}, -- [19]
						{
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
						}, -- [20]
						{
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
						}, -- [21]
						{
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
						}, -- [22]
						{
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
						}, -- [23]
						{
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
						}, -- [24]
					},
					["Locked"] = true,
					["Name"] = "main",
					["Point"] = {
						["x"] = 5.587934922071707e-05,
						["y"] = -139.9997651173488,
					},
					["Rows"] = 2,
					["Scale"] = 1.2,
				}, -- [1]
				{
					["Columns"] = 8,
					["GUID"] = "TMW:group:1WZkirerHTeI",
					["Icons"] = {
						{
							["Conditions"] = {
								[1] = {
									["BitFlags"] = {
										[262] = true,
									},
									["Type"] = "UNITSPEC",
								},
								["n"] = 1,
							},
							["Enabled"] = true,
							["Events"] = {
								[1] = {
									["Animation"] = "ACTVTNGLOW",
									["Event"] = "WCSP",
									["OnConditionConditions"] = {
										[1] = {
											["Level"] = 1,
											["Name"] = "불의 정령",
											["Operator"] = "<",
											["Type"] = "SPELLCD",
										},
										[2] = {
											["Level"] = 1,
											["Name"] = "폭풍의 정령",
											["Operator"] = "<",
											["Type"] = "SPELLCD",
										},
										["n"] = 2,
									},
									["Type"] = "Animations",
								},
								["n"] = 1,
							},
							["FakeHidden"] = true,
							["GUID"] = "TMW:icon:1WZkiretgpiL",
							["ManaCheck"] = true,
							["Name"] = "불의 정령; 폭풍의 정령",
							["ShowTimer"] = true,
							["ShowTimerText"] = true,
							["States"] = {
								{
								}, -- [1]
								{
									["Alpha"] = 1,
								}, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
							["Type"] = "cooldown",
						}, -- [1]
						{
							["Conditions"] = {
								[1] = {
									["BitFlags"] = {
										[262] = true,
									},
									["Type"] = "UNITSPEC",
								},
								["n"] = 1,
							},
							["Enabled"] = true,
							["Events"] = {
								[1] = {
									["Animation"] = "ACTVTNGLOW",
									["Event"] = "WCSP",
									["OnlyShown"] = true,
									["Type"] = "Animations",
								},
								["n"] = 1,
							},
							["FakeHidden"] = true,
							["GUID"] = "TMW:icon:1WZlLE1i97ae",
							["ICDType"] = "spellcast",
							["Name"] = "불의 정령: 30; 폭풍의 정령: 30",
							["ShowTimer"] = true,
							["ShowTimerText"] = true,
							["States"] = {
								{
									["Alpha"] = 0,
								}, -- [1]
								{
									["Alpha"] = 1,
								}, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
							["Type"] = "icd",
						}, -- [2]
						{
							["Enabled"] = true,
							["Events"] = {
								[1] = {
									["Animation"] = "ACTVTNGLOW",
									["Event"] = "OnCondition",
									["OnConditionConditions"] = {
										[1] = {
											["Name"] = "대지의 정령",
											["Type"] = "SPELLCD",
										},
										["n"] = 1,
									},
									["Type"] = "Animations",
								},
								["n"] = 1,
							},
							["FakeHidden"] = true,
							["GUID"] = "TMW:icon:1Wa2EPbLR=O0",
							["ManaCheck"] = true,
							["Name"] = "대지의 정령",
							["ShowTimer"] = true,
							["ShowTimerText"] = true,
							["States"] = {
								{
								}, -- [1]
								{
									["Alpha"] = 1,
								}, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
							["Type"] = "cooldown",
						}, -- [3]
						{
							["Enabled"] = true,
							["Events"] = {
								[1] = {
									["Animation"] = "ACTVTNGLOW",
									["Event"] = "WCSP",
									["OnlyShown"] = true,
									["Type"] = "Animations",
								},
								["n"] = 1,
							},
							["FakeHidden"] = true,
							["GUID"] = "TMW:icon:1Wa2EQwAEu49",
							["ICDType"] = "spellcast",
							["Name"] = "대지의 정령: 60",
							["ShowTimer"] = true,
							["ShowTimerText"] = true,
							["States"] = {
								{
									["Alpha"] = 0,
								}, -- [1]
								{
									["Alpha"] = 1,
								}, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
							["Type"] = "icd",
						}, -- [4]
						{
							["Conditions"] = {
								[1] = {
									["BitFlags"] = {
										[262] = true,
									},
									["Type"] = "UNITSPEC",
								},
								[2] = {
									["Name"] = "폭풍수호자",
									["Type"] = "TALENTLEARNED",
								},
								["n"] = 2,
							},
							["Enabled"] = true,
							["Events"] = {
								[1] = {
									["Animation"] = "ACTVTNGLOW",
									["Event"] = "WCSP",
									["OnConditionConditions"] = {
										[1] = {
											["Level"] = 1,
											["Name"] = "폭풍수호자",
											["Operator"] = "<",
											["Type"] = "SPELLCD",
										},
										["n"] = 1,
									},
									["Type"] = "Animations",
								},
								["n"] = 1,
							},
							["FakeHidden"] = true,
							["GUID"] = "TMW:icon:1WbMmzdxX1mW",
							["Name"] = "폭풍수호자",
							["ShowTimer"] = true,
							["ShowTimerText"] = true,
							["States"] = {
								{
								}, -- [1]
								{
									["Alpha"] = 1,
								}, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
							["Type"] = "cooldown",
						}, -- [5]
						{
							["Conditions"] = {
								[1] = {
									["BitFlags"] = {
										[262] = true,
									},
									["Type"] = "UNITSPEC",
								},
								[2] = {
									["Name"] = "폭풍수호자",
									["Type"] = "TALENTLEARNED",
								},
								["n"] = 2,
							},
							["Enabled"] = true,
							["Events"] = {
								[1] = {
									["Animation"] = "ACTVTNGLOW",
									["Event"] = "WCSP",
									["OnlyShown"] = true,
									["Type"] = "Animations",
								},
								["n"] = 1,
							},
							["FakeHidden"] = true,
							["GUID"] = "TMW:icon:1WbMmzd=xeOa",
							["Name"] = "폭풍수호자",
							["ShowTimer"] = true,
							["ShowTimerText"] = true,
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
							["Type"] = "buff",
						}, -- [6]
						{
							["Conditions"] = {
								[1] = {
									["BitFlags"] = 8,
									["Type"] = "COVENANT",
								},
								["n"] = 1,
							},
							["Enabled"] = true,
							["Events"] = {
								[1] = {
									["Animation"] = "ACTVTNGLOW",
									["Event"] = "OnCondition",
									["OnConditionConditions"] = {
										[1] = {
											["Level"] = 1,
											["Name"] = "살덩이창조",
											["Operator"] = "<",
											["Type"] = "SPELLCD",
										},
										["n"] = 1,
									},
									["Type"] = "Animations",
								},
								["n"] = 1,
							},
							["FakeHidden"] = true,
							["GUID"] = "TMW:icon:1Wc=ckjYbf8s",
							["Name"] = "살덩이창조",
							["ShowTimer"] = true,
							["ShowTimerText"] = true,
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
							["Type"] = "cooldown",
						}, -- [7]
						{
							["Conditions"] = {
								[1] = {
									["BitFlags"] = 8,
									["Type"] = "COVENANT",
								},
								[2] = {
									["Name"] = "살덩이창조",
									["Operator"] = ">",
									["Type"] = "BUFFDUR",
								},
								["n"] = 2,
							},
							["Enabled"] = true,
							["Events"] = {
								[1] = {
									["Animation"] = "ACTVTNGLOW",
									["Event"] = "WCSP",
									["OnlyShown"] = true,
									["Type"] = "Animations",
								},
								["n"] = 1,
							},
							["FakeHidden"] = true,
							["GUID"] = "TMW:icon:1Wc=ckjaTxaM",
							["Name"] = "살덩이창조",
							["ShowTimer"] = true,
							["ShowTimerText"] = true,
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
							["Type"] = "cooldown",
						}, -- [8]
						{
							["Conditions"] = {
								[1] = {
									["BitFlags"] = {
										[262] = true,
									},
									["Type"] = "UNITSPEC",
								},
								[2] = {
									["Name"] = "원시의 정령술사",
									["Type"] = "TALENTLEARNED",
								},
								[3] = {
									["Icon"] = "TMW:icon:1WZlLE1i97ae",
									["Type"] = "ICON",
									["Unit"] = "pet:원시 불의 정령",
								},
								[4] = {
									["Name"] = "유성",
									["Type"] = "SPELLCD",
								},
								["n"] = 4,
							},
							["Enabled"] = true,
							["Events"] = {
								[1] = {
									["Animation"] = "ACTVTNGLOW",
									["Event"] = "WCSP",
									["OnlyShown"] = true,
									["Type"] = "Animations",
								},
								["n"] = 1,
							},
							["FakeHidden"] = true,
							["GUID"] = "TMW:icon:1Wc=ckjcGDed",
							["Name"] = "유성",
							["RangeCheck"] = true,
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
							["Type"] = "cooldown",
						}, -- [9]
						{
							["Conditions"] = {
								[1] = {
									["BitFlags"] = {
										[262] = true,
									},
									["Type"] = "UNITSPEC",
								},
								[2] = {
									["Name"] = "원시의 정령술사",
									["Type"] = "TALENTLEARNED",
								},
								[3] = {
									["Name"] = "폭풍의 정령",
									["Type"] = "TALENTLEARNED",
								},
								[4] = {
									["Icon"] = "TMW:icon:1WZlLE1i97ae",
									["Type"] = "ICON",
								},
								[5] = {
									["Name"] = "폭풍의 눈",
									["Type"] = "SPELLCD",
								},
								["n"] = 5,
							},
							["Enabled"] = true,
							["Events"] = {
								[1] = {
									["Animation"] = "ACTVTNGLOW",
									["Event"] = "WCSP",
									["OnlyShown"] = true,
									["Type"] = "Animations",
								},
								["n"] = 1,
							},
							["FakeHidden"] = true,
							["GUID"] = "TMW:icon:1Wc=ckjeNeqk",
							["Name"] = "폭풍의 눈",
							["RangeCheck"] = true,
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
							["Type"] = "cooldown",
						}, -- [10]
						{
							["Conditions"] = {
								[1] = {
									["BitFlags"] = {
										[262] = true,
									},
									["Type"] = "UNITSPEC",
								},
								[2] = {
									["Name"] = "원시의 정령술사",
									["Type"] = "TALENTLEARNED",
								},
								[3] = {
									["Icon"] = "TMW:icon:1Wa2EQwAEu49",
									["Type"] = "ICON",
									["Unit"] = "pet:원시 대지의 정령",
								},
								[4] = {
									["Name"] = "파쇄",
									["Type"] = "SPELLCD",
								},
								["n"] = 4,
							},
							["Enabled"] = true,
							["Events"] = {
								[1] = {
									["Animation"] = "ACTVTNGLOW",
									["Event"] = "WCSP",
									["OnlyShown"] = true,
									["Type"] = "Animations",
								},
								["n"] = 1,
							},
							["FakeHidden"] = true,
							["GUID"] = "TMW:icon:1Wc=ckjgJB4T",
							["Name"] = "파쇄",
							["RangeCheck"] = true,
							["ShowTimer"] = true,
							["ShowTimerText"] = true,
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
							["Type"] = "cooldown",
						}, -- [11]
						{
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
						}, -- [12]
						{
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
						}, -- [13]
						{
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
						}, -- [14]
						{
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
						}, -- [15]
						{
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
						}, -- [16]
					},
					["Locked"] = true,
					["Name"] = "meta",
					["Point"] = {
						["x"] = -5.155807029282927e-06,
						["y"] = -250,
					},
					["Rows"] = 2,
					["Scale"] = 1.2,
				}, -- [2]
				{
					["Icons"] = {
						{
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
						}, -- [1]
						{
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
						}, -- [2]
						{
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
						}, -- [3]
						{
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
						}, -- [4]
						{
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
						}, -- [5]
						{
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
						}, -- [6]
						{
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
						}, -- [7]
						{
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
						}, -- [8]
						{
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
						}, -- [9]
						{
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
						}, -- [10]
						{
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
						}, -- [11]
						{
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
						}, -- [12]
						{
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
						}, -- [13]
						{
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
						}, -- [14]
						{
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
						}, -- [15]
						{
							["States"] = {
								{
								}, -- [1]
								nil, -- [2]
								{
								}, -- [3]
								{
								}, -- [4]
							},
						}, -- [16]
					},
				}, -- [3]
			},
			["Locked"] = true,
			["NumGroups"] = 2,
			["Version"] = 90701,
		},
	},
}

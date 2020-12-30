
TellMeWhenDB = {
	["Version"] = 90301,
	["global"] = {
		["HelpSettings"] = {
			["CNDT_ANDOR_FIRSTSEE"] = true,
			["CNDT_PARENTHESES_FIRSTSEE"] = true,
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
							["Events"] = {
								[1] = {
									["Animation"] = "ACTVTNGLOW",
									["Event"] = "OnFinish",
									["Type"] = "Animations",
								},
								["n"] = 1,
							},
							["Name"] = "연타 공격",
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
						}, -- [1]
						{
							["Enabled"] = true,
							["Events"] = {
								[1] = {
									["Animation"] = "ACTVTNGLOW",
									["Event"] = "OnFinish",
									["Type"] = "Animations",
								},
								["n"] = 1,
							},
							["Name"] = "정조준",
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
							["Enabled"] = true,
							["Name"] = "교묘한 사격",
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
						}, -- [3]
						{
							["Enabled"] = true,
							["Name"] = "정밀 사격",
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
							["Enabled"] = true,
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
						}, -- [5]
						{
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
						}, -- [6]
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
							["ManaCheck"] = true,
							["Name"] = "마무리 사격",
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
					},
					["Locked"] = true,
					["Point"] = {
						["point"] = "BOTTOM",
						["relativePoint"] = "BOTTOM",
						["x"] = 0.0001686889037078655,
						["y"] = 170,
					},
					["Scale"] = 1.3,
				}, -- [1]
			},
			["Locked"] = true,
			["Version"] = 90301,
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
				}, -- [1]
			},
			["Locked"] = true,
			["Version"] = 72332,
		},
	},
}


TellMeWhenDB = {
	["global"] = {
		["TextLayouts"] = {
			["icon1"] = {
				{
				}, -- [1]
				{
				}, -- [2]
			},
			["bar2"] = {
				{
				}, -- [1]
				{
				}, -- [2]
			},
		},
		["HelpSettings"] = {
			["CNDT_ANDOR_FIRSTSEE"] = true,
			["SUG_FIRSTHELP"] = true,
			["SCROLLBAR_DROPDOWN"] = true,
			["CNDT_PARENTHESES_FIRSTSEE"] = true,
			["SIMPLEGSTAB"] = true,
		},
		["AuraCache"] = {
			[52372] = 1,
			[55095] = 1,
			[52373] = 1,
			[51714] = 2,
			[1604] = 1,
			[81141] = 2,
			[48778] = 2,
			[158300] = 2,
			[53570] = 1,
			[55078] = 1,
			[20572] = 2,
			[50421] = 2,
		},
	},
	["Version"] = 72332,
	["profileKeys"] = {
		["버징기 - 줄진"] = "버징기 - 줄진",
		["김롯리 - 줄진"] = "김롯리 - 줄진",
		["김곱충 - 줄진"] = "김곱충 - 줄진",
		["언땅에죽기 - 줄진"] = "언땅에죽기 - 줄진",
		["나라잃은토템 - 줄진"] = "나라잃은토템 - 줄진",
	},
	["profiles"] = {
		["버징기 - 줄진"] = {
			["Locked"] = true,
			["Groups"] = {
				{
					["GUID"] = "TMW:group:1KZ_USSmSYm4",
					["Point"] = {
						["y"] = 150,
					},
					["Scale"] = 1,
					["Rows"] = 2,
					["Icons"] = {
						{
							["Enabled"] = true,
							["ShowTimer"] = true,
							["Name"] = "퇴마술",
							["ShowTimerTextnoOCC"] = true,
							["RangeCheck"] = true,
							["ShowWhen"] = 3,
							["Type"] = "cooldown",
							["ShowTimerText"] = true,
						}, -- [1]
						{
							["Enabled"] = true,
							["ShowTimer"] = true,
							["Name"] = "심판",
							["ShowTimerTextnoOCC"] = true,
							["RangeCheck"] = true,
							["ShowWhen"] = 3,
							["Type"] = "cooldown",
							["ShowTimerText"] = true,
						}, -- [2]
						{
							["Enabled"] = true,
							["ShowTimer"] = true,
							["Name"] = "성전사의 일격",
							["ShowTimerTextnoOCC"] = true,
							["RangeCheck"] = true,
							["ShowWhen"] = 3,
							["Type"] = "cooldown",
							["ShowTimerText"] = true,
						}, -- [3]
						{
							["Enabled"] = true,
							["ShowTimer"] = true,
							["Name"] = "정의의 망치",
							["ShowTimerTextnoOCC"] = true,
							["RangeCheck"] = true,
							["ShowWhen"] = 3,
							["Type"] = "cooldown",
							["ShowTimerText"] = true,
						}, -- [4]
						nil, -- [5]
						{
							["Enabled"] = true,
							["ShowTimer"] = true,
							["Name"] = "응징의 격노",
							["ShowTimerTextnoOCC"] = true,
							["Type"] = "cooldown",
							["ShowWhen"] = 3,
							["ShowTimerText"] = true,
							["Events"] = {
								{
									["Type"] = "Animations",
									["OnConditionConditions"] = {
										{
											["Name"] = "응징의 격노",
											["Type"] = "SPELLCD",
										}, -- [1]
										["n"] = 1,
									},
									["Event"] = "WCSP",
									["Animation"] = "ACTVTNGLOW",
								}, -- [1]
								["n"] = 1,
							},
						}, -- [6]
						{
							["Enabled"] = true,
							["ShowTimer"] = true,
							["ShowTimerTextnoOCC"] = true,
							["RangeCheck"] = true,
							["Name"] = "빛의 무기",
							["Type"] = "cooldown",
							["ShowWhen"] = 3,
							["ShowTimerText"] = true,
							["Events"] = {
								{
									["Type"] = "Animations",
									["OnConditionConditions"] = {
										{
											["Name"] = "사형 선고",
											["Type"] = "SPELLCD",
										}, -- [1]
										["n"] = 1,
									},
									["Event"] = "WCSP",
									["Animation"] = "ACTVTNGLOW",
								}, -- [1]
								["n"] = 1,
							},
						}, -- [7]
						{
							["Enabled"] = true,
							["ShowTimer"] = true,
							["ShowTimerTextnoOCC"] = true,
							["RangeCheck"] = true,
							["Name"] = "기사단의 선고",
							["Type"] = "cooldown",
							["ShowTimerText"] = true,
							["ShowWhen"] = 3,
							["Events"] = {
								{
									["Type"] = "Animations",
									["OnConditionConditions"] = {
										{
											["Type"] = "HOLY_POWER",
											["Level"] = 5,
										}, -- [1]
										{
											["Type"] = "BUFFDUR",
											["Name"] = "신성한 목적",
											["PrtsBefore"] = 1,
											["AndOr"] = "OR",
											["Operator"] = ">",
										}, -- [2]
										{
											["Type"] = "BUFFDUR",
											["Name"] = "신성한 목적",
											["Level"] = 4,
											["PrtsAfter"] = 1,
											["Operator"] = "<=",
										}, -- [3]
										["n"] = 3,
									},
									["Event"] = "WCSP",
									["Animation"] = "ACTVTNGLOW",
								}, -- [1]
								["n"] = 1,
							},
							["ManaCheck"] = true,
						}, -- [8]
						{
							["Enabled"] = true,
							["ShowTimer"] = true,
							["ShowTimerTextnoOCC"] = true,
							["Name"] = "천상의 폭풍",
							["Type"] = "cooldown",
							["ShowTimerText"] = true,
							["ShowWhen"] = 3,
							["Events"] = {
								{
									["Type"] = "Animations",
									["OnConditionConditions"] = {
										{
											["Type"] = "BUFFDUR",
											["AndOr"] = "OR",
											["Name"] = "최후의 선고",
											["Operator"] = ">",
										}, -- [1]
										{
											["PrtsBefore"] = 1,
											["Type"] = "BUFFDUR",
											["Name"] = "천상의 십자군",
											["Operator"] = ">",
										}, -- [2]
										{
											["Type"] = "BUFFDUR",
											["Name"] = "천상의 십자군",
											["Level"] = 4,
											["PrtsAfter"] = 1,
											["Operator"] = "<=",
										}, -- [3]
										["n"] = 3,
									},
									["Event"] = "WCSP",
									["Animation"] = "ACTVTNGLOW",
								}, -- [1]
								["n"] = 1,
							},
							["ManaCheck"] = true,
						}, -- [9]
						{
							["Enabled"] = true,
							["ShowTimer"] = true,
							["ShowTimerTextnoOCC"] = true,
							["RangeCheck"] = true,
							["Name"] = "천벌의 망치",
							["Type"] = "cooldown",
							["ShowTimerText"] = true,
							["Conditions"] = {
								{
									["Unit"] = "target",
									["Level"] = 35,
									["Type"] = "HEALTH",
									["Operator"] = "<=",
								}, -- [1]
								{
									["Type"] = "BUFFDUR",
									["AndOr"] = "OR",
									["Name"] = "응징의 격노",
									["Operator"] = ">",
								}, -- [2]
								["n"] = 2,
							},
							["ShowWhen"] = 3,
							["Events"] = {
								{
									["Type"] = "Animations",
									["OnConditionConditions"] = {
										{
											["Name"] = "천벌의 망치",
											["Type"] = "SPELLCD",
										}, -- [1]
										["n"] = 1,
									},
									["Event"] = "WCSP",
									["Animation"] = "ACTVTNGLOW",
								}, -- [1]
								["n"] = 1,
							},
						}, -- [10]
					},
					["Columns"] = 5,
				}, -- [1]
			},
			["Version"] = 72332,
		},
		["김롯리 - 줄진"] = {
			["Locked"] = true,
			["Groups"] = {
				{
					["GUID"] = "TMW:group:1KVT4j1ngk6G",
				}, -- [1]
			},
			["Version"] = 72101,
		},
		["김곱충 - 줄진"] = {
			["Locked"] = true,
			["Groups"] = {
				{
					["GUID"] = "TMW:group:1KVT4j1qpPCp",
				}, -- [1]
			},
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
		["나라잃은토템 - 줄진"] = {
			["Locked"] = true,
			["Groups"] = {
				{
					["GUID"] = "TMW:group:1KVT4jbFJJvh",
				}, -- [1]
			},
			["Version"] = 72101,
		},
	},
}

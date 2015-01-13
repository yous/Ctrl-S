
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
	},
	["Version"] = 72218,
	["profileKeys"] = {
		["나라잃은토템 - 줄진"] = "나라잃은토템 - 줄진",
		["버징기 - 줄진"] = "버징기 - 줄진",
		["김롯리 - 줄진"] = "김롯리 - 줄진",
		["김곱충 - 줄진"] = "김곱충 - 줄진",
	},
	["profiles"] = {
		["나라잃은토템 - 줄진"] = {
			["Locked"] = true,
			["Groups"] = {
				{
					["GUID"] = "TMW:group:1KVT4jbFJJvh",
				}, -- [1]
			},
			["Version"] = 72101,
		},
		["버징기 - 줄진"] = {
			["Groups"] = {
				{
					["GUID"] = "TMW:group:1KZ_USSmSYm4",
					["Point"] = {
						["y"] = -100,
					},
					["Scale"] = 1.5,
					["Rows"] = 2,
					["Columns"] = 5,
					["Icons"] = {
						{
							["ShowTimer"] = true,
							["Type"] = "cooldown",
							["ShowTimerText"] = true,
							["ShowTimerTextnoOCC"] = true,
							["Name"] = "퇴마술",
							["Enabled"] = true,
							["ShowWhen"] = 3,
						}, -- [1]
						{
							["ShowTimer"] = true,
							["Type"] = "cooldown",
							["ShowTimerText"] = true,
							["ShowTimerTextnoOCC"] = true,
							["Name"] = "심판",
							["Enabled"] = true,
							["ShowWhen"] = 3,
						}, -- [2]
						{
							["ShowTimer"] = true,
							["Type"] = "cooldown",
							["ShowTimerText"] = true,
							["ShowTimerTextnoOCC"] = true,
							["Name"] = "성전사의 일격",
							["Enabled"] = true,
							["ShowWhen"] = 3,
						}, -- [3]
						{
							["ShowTimer"] = true,
							["Type"] = "cooldown",
							["ShowTimerText"] = true,
							["ShowTimerTextnoOCC"] = true,
							["Name"] = "정의의 망치",
							["Enabled"] = true,
							["ShowWhen"] = 3,
						}, -- [4]
						nil, -- [5]
						{
							["ShowTimer"] = true,
							["Type"] = "cooldown",
							["ShowTimerText"] = true,
							["ShowTimerTextnoOCC"] = true,
							["Name"] = "응징의 격노",
							["Enabled"] = true,
							["Events"] = {
								{
									["Type"] = "Animations",
									["Animation"] = "ACTVTNGLOW",
									["Event"] = "WCSP",
									["OnConditionConditions"] = {
										{
											["Type"] = "SPELLCD",
											["Name"] = "응징의 격노",
										}, -- [1]
										["n"] = 1,
									},
								}, -- [1]
								["n"] = 1,
							},
							["ShowWhen"] = 3,
						}, -- [6]
						{
							["ShowTimer"] = true,
							["Type"] = "cooldown",
							["ShowTimerText"] = true,
							["ShowTimerTextnoOCC"] = true,
							["Name"] = "빛의 무기",
							["Enabled"] = true,
							["Events"] = {
								{
									["Type"] = "Animations",
									["Animation"] = "ACTVTNGLOW",
									["Event"] = "WCSP",
									["OnConditionConditions"] = {
										{
											["Type"] = "SPELLCD",
											["Name"] = "사형 선고",
										}, -- [1]
										["n"] = 1,
									},
								}, -- [1]
								["n"] = 1,
							},
							["ShowWhen"] = 3,
						}, -- [7]
						{
							["ShowTimer"] = true,
							["Type"] = "cooldown",
							["ShowTimerText"] = true,
							["ShowTimerTextnoOCC"] = true,
							["Name"] = "기사단의 선고",
							["Events"] = {
								{
									["Type"] = "Animations",
									["Animation"] = "ACTVTNGLOW",
									["Event"] = "WCSP",
									["OnConditionConditions"] = {
										{
											["Type"] = "HOLY_POWER",
											["Level"] = 5,
										}, -- [1]
										{
											["Type"] = "BUFFDUR",
											["Operator"] = ">",
											["Name"] = "신성한 목적",
											["PrtsBefore"] = 1,
											["AndOr"] = "OR",
										}, -- [2]
										{
											["Type"] = "BUFFDUR",
											["PrtsAfter"] = 1,
											["Operator"] = "<=",
											["Name"] = "신성한 목적",
											["Level"] = 3,
										}, -- [3]
										["n"] = 3,
									},
								}, -- [1]
								["n"] = 1,
							},
							["ShowWhen"] = 3,
							["Enabled"] = true,
							["ManaCheck"] = true,
						}, -- [8]
						{
							["ShowTimer"] = true,
							["Type"] = "cooldown",
							["ShowTimerText"] = true,
							["ShowTimerTextnoOCC"] = true,
							["Name"] = "천상의 폭풍",
							["Events"] = {
								{
									["Type"] = "Animations",
									["Animation"] = "ACTVTNGLOW",
									["Event"] = "WCSP",
									["OnConditionConditions"] = {
										{
											["Type"] = "BUFFDUR",
											["Operator"] = ">",
											["Name"] = "최후의 선고",
											["AndOr"] = "OR",
										}, -- [1]
										{
											["Type"] = "BUFFDUR",
											["Operator"] = ">",
											["Name"] = "천상의 십자군",
											["PrtsBefore"] = 1,
										}, -- [2]
										{
											["Type"] = "STANCE",
											["PrtsAfter"] = 1,
											["Name"] = "정의의 문장",
											["AndOr"] = "OR",
										}, -- [3]
										["n"] = 3,
									},
								}, -- [1]
								["n"] = 1,
							},
							["ShowWhen"] = 3,
							["Enabled"] = true,
							["ManaCheck"] = true,
						}, -- [9]
						{
							["ShowTimer"] = true,
							["Type"] = "cooldown",
							["Conditions"] = {
								{
									["Type"] = "HEALTH",
									["Operator"] = "<=",
									["Unit"] = "target",
									["Level"] = 35,
								}, -- [1]
								{
									["Type"] = "BUFFDUR",
									["Operator"] = ">",
									["Name"] = "응징의 격노",
									["AndOr"] = "OR",
								}, -- [2]
								["n"] = 2,
							},
							["ShowTimerText"] = true,
							["ShowTimerTextnoOCC"] = true,
							["Name"] = "천벌의 망치",
							["Events"] = {
								{
									["Type"] = "Animations",
									["Animation"] = "ACTVTNGLOW",
									["Event"] = "WCSP",
									["OnConditionConditions"] = {
										{
											["Type"] = "SPELLCD",
											["Name"] = "천벌의 망치",
										}, -- [1]
										["n"] = 1,
									},
								}, -- [1]
								["n"] = 1,
							},
							["ShowWhen"] = 3,
							["Enabled"] = true,
						}, -- [10]
					},
				}, -- [1]
			},
			["Locked"] = true,
			["Version"] = 72218,
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
			["Version"] = 72101,
		},
	},
}

local addonName, addonTable = ...
local uiAddonName = "Storm, Earth, and Fire"

local LSM = LibStub("LibSharedMedia-3.0")

local DB = addonTable.DB

--[====[ Interface Options ]====]

local config = {}

do
	local options
	function config:AceConfig3Options()
		if options then return options end

		options = {
			name = uiAddonName,
			type = "group",
			get = function(info) return DB[info[#info]] end,
			set = function(info, val) DB:SetOverlay(info[#info], val) end,
			args = {
				version = {
					name = "v1.0.3\nDisplays information about your summoned Storm, Earth, and Fire spirits.\n",
					type = "description",
					order = 0,
				},
				configMode = {
					name = "Enable config mode",
					type = "toggle",
					width = "full",
					order = 1,
				},
				growDown = {
					name = "Grow frames down",
					type = "toggle",
					width = "full",
					desc = "Frames stack down from the anchor when checked, or up when unchecked.",
					order = 2,
				},
				highlightMouseover = {
					name = "Highlight on target mouseover",
					type = "toggle",
					width = "full",
					desc = "Highlight the spirit frame when the target is moused over",
					order = 3,
				},
				healthBar = {
					name = "Target health bar",
					type = "group",
					inline = true,
					order = 4,
					args = {
						showTargetHealthBar = {
							name = "Show target health bar",
							type = "toggle",
							desc = "Show health bar for spirit targets",
							order = 1,
						},
						showHealthBarText = {
							name = "Show health bar text",
							type = "toggle",
							desc = "Show text on health bars",
							order = 2,
						},
						desc = {
							name = "The health bar will only work if the target has a valid unit id. It must be your focus, target, mouseover, or the target of one of your raid/party members. Otherwise the bar will appear dimmed.",
							type = "description",
							order = 3,
						}
					},
				},
				deathSound = {
					name = "Death Sound",
					type = "group",
					inline = true,
					order = 5,
					args = {
						soundDesc = {
							name = "Play a sound when a spirit dies:",
							type = "description",
							order = 1,
						},
						deathSound = {
							name = "Sound",
							desc = "Sound to play when a spirit dies",
							type = "select",
							order = 2,
							dialogControl = "LSM30_Sound",
							values = LSM:HashTable("sound"),
						},
						playDeathSoundOnMaster = {
							name = "Play sound when muted",
							desc = "Play sound even when sound effects are turned off",
							type = "toggle",
							order = 3,
						},
					},
				},
				targetSound = {
					name = "Target Sound",
					type = "group",
					inline = true,
					order = 6,
					args = {
						soundDesc = {
							name = "Play a sound when you target a spirit's target:",
							type = "description",
							order = 1,
						},
						targetSound = {
							name = "Sound",
							desc = "Sound to play when you target a spirit's target",
							type = "select",
							order = 2,
							dialogControl = "LSM30_Sound",
							values = LSM:HashTable("sound"),
						},
						playTargetSoundOnMaster = {
							name = "Play sound when muted",
							desc = "Play sound even when sound effects are turned off",
							type = "toggle",
							order = 3,
						},
						playTargetSoundOnCast = {
							name = "Play sound on cast",
							desc = "Play sound when summoning a spirit on your current target",
							type = "toggle",
							order = 4,
						},
					},
				},
			},
		}

		return options
	end
end

LibStub("AceConfig-3.0"):RegisterOptionsTable(uiAddonName, function() return config:AceConfig3Options() end)
local optionsFrame = LibStub("AceConfigDialog-3.0"):AddToBlizOptions(uiAddonName)
optionsFrame.obj:SetCallback("default", function()
	DB:ResetToDefaults();
	LibStub("AceConfigRegistry-3.0"):NotifyChange(uiAddonName)
end)
optionsFrame.obj:SetCallback("okay", function() DB:MergeOverlay() end)
optionsFrame.obj:SetCallback("cancel", function() DB:ClearOverlay() end)

--[====[ Console config ]====]

local console = {}
addonTable.configConsole = console

function console:ProcessCommand(tokens, positions, msg)
	table.remove(tokens, 1)
	table.remove(positions, 1)
	if #tokens == 0 then
		InterfaceOptionsFrame_OpenToCategory(optionsFrame)
	else
		local ok, err = self:handleConfigMsg(tokens, positions, msg)
		if not ok then
			if err then
				print(addonTable.printHeader.." |cffff0000error|r: " .. err)
			else
				print(addonTable.printHeader.." config usage:")
				print("    config list - view all config keys and values")
				print("    config <key> - view value for <key>")
				print("    config <key> <value> - set <key> to <value>")
			end
		end
	end
end

do
	local configTypes = {
		configMode="bool", growDown="bool", playDeathSoundOnMaster="bool",
		deathSound="string", highlightMouseover="bool",
		targetSound="string", playTargetSoundOnMaster="bool", playTargetSoundOnCast="bool",
		showTargetHealthBar="bool", showHealthBarText="bool",
	}
	local configKeys = {}
	for key in pairs(configTypes) do
		table.insert(configKeys, key)
	end
	table.sort(configKeys)
	function console:handleConfigMsg(tokens, positions, msg)
		if tokens[1] == "list" then
			if #tokens ~= 1 then
				return false
			end
			print(addonTable.printHeader.." config:")
			for _, key in ipairs(configKeys) do
				print("    " .. key .. " - " .. tostring(DB[key]))
			end
			return true
		end
		if #tokens == 1 then
			local key = tokens[1]:lower()
			local ok = false
			for _, v in ipairs(configKeys) do
				if key == v:lower() then
					key = v
					ok = true
					break
				end
			end
			if ok then
				print(addonTable.printHeader.." config: " .. key .. " - " .. tostring(DB[key]))
				return true
			end
			return false, "unknown key " .. key
		elseif #tokens > 1 then
			local key, value = tokens[1]:lower(), msg:sub(positions[2]):gsub("%s+$", "", 1)
			local typ
			for k, t in pairs(configTypes) do
				if key == k:lower() then
					key = k
					typ = t
					break
				end
			end
			if typ == "bool" then
				if value:lower() == "true" then
					DB[key] = true
				elseif value:lower() == "false" then
					DB[key] = false
				else
					return false, "config key " .. key .. " is a boolean"
				end
			elseif typ == "string" then
				DB[key] = value
			else
				return false, "unknown key " .. key
			end
			return true
		end
		return false
	end
end

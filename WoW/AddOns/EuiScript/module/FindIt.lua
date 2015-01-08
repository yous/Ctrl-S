------------
-- FindIt --
------------
-- Find achievements, spells and cached items
-- easily from chat commands.
-- Feedback, questions, adys.wh+findit@gmail.com
-- Modify by eui.cc at 2013/05/09
-- VERSION = "1.10.0"
local E, L, V, P, G, _ = unpack(ElvUI);
local FindIt = CreateFrame("Frame")
E.FindIt = FindIt

function FindIt:Print(...)
	local id, link = ...
	E.Options.args.FindIt.args.result.values[link] = link
end

FindIt.achievement = {
	name = "Achievement",
	max = 10000,
	getInfo = function(self, id)
		if pcall(GetAchievementInfo, id) then
			local name = select(2, GetAchievementInfo(id))
			return name, GetAchievementLink(id)
		end
	end,
}

FindIt.currency = {
	name = "Currency",
	max = 1000,
	getInfo = function(self, id)
		local name = GetCurrencyInfo(id)
		local link = GetCurrencyLink(id)
		return name, link
	end,
}

FindIt.dungeon = {
	name = "Dungeon",
	max = 1000,
	getInfo = function(self, id)
		local name = GetLFGDungeonInfo(id)
		if name then
			return name, ("|cffffff00%s|r"):format(name)
		end
	end,
}

FindIt.faction = {
	name = "Faction",
	max = 2000,
	getInfo = function(self, id)
		local name = GetFactionInfoByID(id)
		if name then
			return name, ("|cffffff00%s|r"):format(name)
		end
	end,
}

FindIt.item = {
	name = "Item",
	max = 75000,
	getInfo = function(self, id)
		local name, link = GetItemInfo(id)
		return name, link
	end,
}

FindIt.spell = {
	name = "Spell",
	max = 150000,
	getInfo = function(self, id)
		local name = GetSpellInfo(id)
		if name then
			local link =  ("|cff71d5ff|Hspell:%i|h[%s]|h|r"):format(id, name)
			return name, link
		end
	end,
}

local function findrange(obj, first, last)
	local ret = {}
	local name, link
	local id = first
	local i = 1
	if first > last then
		i = -1
	end

	for id = first, last, i do
		name, link = obj:getInfo(id)

		if name then
			table.insert(ret, { id = id, link = link })
		end
	end
	return ret
end

local function findname(obj, arg)
	local ret = {}
	local name, link
	arg = arg:lower()
	for id = 1, obj.max do
		name, link = obj:getInfo(id)
		name = (name or ""):lower()
		if name == arg then
			table.insert(ret, { id = id, link = link })
		elseif name:match(arg) then
			table.insert(ret, { id = id, link = link })
		end
	end
	return ret
end

function FindIt:FindObject(ftype, msg)
	if not msg or msg == "" then return self:Print("Usage: /find"..ftype.." (id|[min-max]|name) - /findit for help" ) end
	local obj = FindIt[ftype]
	found = {}
	
	if msg:match("%d+%-%d+") then
		local first, last = msg:match("(%d+)%-(%d+)")
		found = findrange(obj, first, last)
	elseif tonumber(msg) then
		local name, link = obj:getInfo(msg)
		if name then
			found = { { id = tonumber(msg), link = link } }
		end
	else
		found = findname(obj, msg)
	end
	
	for k, v in pairs(found) do
		self:Print(obj.name .. " #" .. v.id, v.link)
	end
	local amt = #found
end
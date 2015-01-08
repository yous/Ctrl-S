-- Version: 1.0.8b
-- Author: Wowhead
-- Title: Wowhead Garrison Timer
-- modify by eui
local E = unpack(ElvUI)
local GT = E:NewModule("GarrisonTimer", "AceEvent-3.0", "AceTimer-3.0")

local localeMapping = {
    ["enUS"] = {
        ["hr"] = "(%d+) hr",
        ["min"] = "(%d+) min",
        ["sec"] = "(%d+) sec"
    },
    ["zhCN"] = {
        ["hr"] = "(%d+)小时",
        ["min"] = "(%d+)分",
        ["sec"] = "(%d+)秒"
    },
    ["koKR"] = {
        ["hr"] = "(%d+)시간",
        ["min"] = "(%d+)분",
        ["sec"] = "(%d+)초"
    }
}

local function timeStringToMinutes(str)
    local time = 0;
    local l = GetLocale();

    if localeMapping[l] == nil then
        return 0;
    end

    local hours = string.match(str, localeMapping[l].hr);
    if hours then
        hours = tonumber(string.match(hours, '(%d+)'));

        if hours > 0 then
            time = time + (hours * 60);
        end
    end

    local minutes = string.match(str, localeMapping[l].min);
    if minutes then
        minutes = tonumber(string.match(minutes, '(%d+)'));

        if minutes > 0 then
            time = time + minutes;
        end
    end

    local seconds = string.match(str, localeMapping[l].sec);
    if seconds then
        seconds = tonumber(string.match(seconds, '(%d+)'));

        if seconds > 0 and time == 0 then
            time = 1;
        end
    end

    return time;
end

local function getMissionTimers()
    local missionStr = '';
    local missions = C_Garrison.GetInProgressMissions();

    for i = 1, #missions do
        local time = timeStringToMinutes(missions[i].timeLeft);
        if time > 0 then
            local length = string.len(missionStr);
         -- local str = missions[i].missionID .. ':' .. time;
			local str = missions[i].name .. ':' .. time;

            missionStr = missionStr .. str .. ',';
        end
    end
	
	if missionStr == '' then missionStr = 'NONE,'; end
	
    return string.sub(missionStr, 1, -2);
end

local function getOrderTimers()
    local orderStr = '';
	local buildings = C_Garrison.GetBuildings();

    for i = 1, #buildings do
        local buildingID = buildings[i].buildingID;
        if (buildingID) then
            local name, texture, shipmentCapacity, shipmentsReady, shipmentsTotal, creationTime, duration, timeLeftString, itemName, itemIcon, itemQuality, itemID = C_Garrison.GetLandingPageShipmentInfo(buildingID);
            if timeLeftString then
                local time = timeStringToMinutes(timeLeftString);

                local shipmentsPending = shipmentsTotal - shipmentsReady - 1;
                if shipmentsPending > 0 then
                    time = time + (shipmentsPending * 240);
                end

                if time > 0 then
                    local length = string.len(orderStr);
                    local str = buildingID .. ':' .. time;

                    if (string.len(str) + length) <= 60 then
                        orderStr = orderStr .. str .. ',';
                    end
                end
            end
        end
    end

    return string.sub(orderStr, 1, -2);
end

function GT:WriteData(event)
	if UnitLevel('player') < 91 then return; end
	
	if event ~= 'PLAYER_LOGOUT' then
		E.global.gtData[E.myname..'-'..E.myrealm] = getMissionTimers()
	end
	E.global.gtTime[E.myname..'-'..E.myrealm] = date('%Y/%m/%d %H:%M:%S')
end

local function OnUpdate()
	if UnitLevel('player') < 91 then return; end
	
	E.global.gtData[E.myname..'-'..E.myrealm] = getMissionTimers()
	E.global.gtTime[E.myname..'-'..E.myrealm] = date('%Y/%m/%d %H:%M:%S')
end	

function GT:Initialize()
	if not E.global.gtData then E.global.gtData = {} end
	if not E.global.gtTime then E.global.gtTime = {} end
	
	self:RegisterEvent("PLAYER_LOGOUT", "WriteData")
	self:RegisterEvent("PLAYER_QUITING", "WriteData")
	self:RegisterEvent("PLAYER_ENTERING_WORLD", "WriteData")
	self:ScheduleTimer(OnUpdate, 1)
	self:ScheduleRepeatingTimer(OnUpdate, 15)	
end

E:RegisterModule(GT:GetName())
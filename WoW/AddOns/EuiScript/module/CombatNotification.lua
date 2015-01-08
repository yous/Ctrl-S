local E, LL, DF = unpack(ElvUI)
local upper = string.upper

local GetNextChar = function(word,num)
	local c = word:byte(num)
	local shift
	if not c then return "",num end
		if (c > 0 and c <= 127) then
			shift = 1
		elseif (c >= 192 and c <= 223) then
			shift = 2
		elseif (c >= 224 and c <= 239) then
			shift = 3
		elseif (c >= 240 and c <= 247) then
			shift = 4
		end
	return word:sub(num,num+shift-1),(num+shift)
end

local updaterun = CreateFrame("Frame")

local flowingframe = CreateFrame("Frame",nil,UIParent)
	flowingframe:SetFrameStrata("HIGH")
	flowingframe:SetPoint("CENTER",E.UIParent,0,136)
	flowingframe:SetHeight(64)
	flowingframe:SetScript("OnUpdate", FadingFrame_OnUpdate)
	flowingframe:Hide()
	flowingframe.fadeInTime = 0
	flowingframe.holdTime = 1
	flowingframe.fadeOutTime = .3
	
local flowingtext = flowingframe:CreateFontString(nil,"OVERLAY")
	flowingtext:SetPoint("Left")
	flowingtext:FontTemplate(nil, 20, 'OUTLINE')
	flowingtext:SetShadowOffset(0,0)
	flowingtext:SetJustifyH("LEFT")
	
local rightchar = flowingframe:CreateFontString(nil,"OVERLAY")
	rightchar:SetPoint("LEFT",flowingtext,"RIGHT")
	rightchar:FontTemplate(nil, 50, 'OUTLINE')
	rightchar:SetShadowOffset(0,0)
	rightchar:SetJustifyH("LEFT")

local count,len,step,word,stringE,a

local speed = .03333

local nextstep = function()
	a,step = GetNextChar (word,step)
	flowingtext:SetText(stringE)
	stringE = stringE..a
	a = upper(a)
	rightchar:SetText(a)
end

local updatestring = function(self,t)
	count = count - t
		if count < 0 then
			if step > len then 
				self:Hide()
				flowingtext:SetText(stringE)
				FadingFrame_Show(flowingframe)
				rightchar:SetText("")
				word = ""
			else 
				nextstep()
				FadingFrame_Show(flowingframe)
				count = speed
			end
		end
end

updaterun:SetScript("OnUpdate",updatestring)
updaterun:Hide()

E.EuiAlertRun = function(f,r,g,b)
	flowingframe:Hide()
	updaterun:Hide()
	
		flowingtext:SetText(f)
		local l = flowingtext:GetWidth()
		
	local color1 = r or 1
	local color2 = g or 1
	local color3 = b or 1
	
	flowingtext:SetTextColor(color1*.95,color2*.95,color3*.95)
	rightchar:SetTextColor(color1,color2,color3)
	
	word = f
	len = f:len()
	step = 1
	count = speed
	stringE = ""
	a = ""
	
		flowingtext:SetText("")
		flowingframe:SetWidth(l)
		
	rightchar:SetText("")
	FadingFrame_Show(flowingframe)
	updaterun:Show()
end

local CombatNotification = CreateFrame ("Frame")
local L = {}
local _,localizedName1 = GetWorldPVPAreaInfo(1)
local _,localizedName2 = GetWorldPVPAreaInfo(2)

if(GetLocale()=="zhCN") then
	L.INFO_WOWTIME_TIP = "即将在15分钟内开始"
	L.need = " 有奖励包包了!!!"
	L.Tank = "<坦克>"
	L.Healer = "<治疗>"
	L.DPS = "<输出>"
	L.dungeon = "5H随机本"
elseif (GetLocale()=="koKR") then
	L.INFO_WOWTIME_TIP = "15분 이내에 시작됩니다"
	L.need = " 보상 가방!!!"
	L.Tank = "<탱크>"
	L.Healer = "<힐러>"
	L.DPS = "<딜러>"
	L.dungeon = "5인 LFG"
elseif (GetLocale()=="enUS") then
	L.INFO_WOWTIME_TIP = "will start within 15 minute"
	L.need = " reward bags!"
	L.Tank = "<Tank>"
	L.Healer = "<Healer>"
	L.DPS = "<DPS>"
	L.dungeon = "5 man LFG"
end

if E.db["euiscript"].combatnoti == true then
	CombatNotification:RegisterEvent("PLAYER_REGEN_ENABLED")
	CombatNotification:RegisterEvent("PLAYER_REGEN_DISABLED")
	CombatNotification:SetScript("OnEvent", function (self,event)
		if (UnitIsDead("player")) then return end
		if event == "PLAYER_REGEN_ENABLED" then
			E.EuiAlertRun(E.db["euiscript"].combatnoti_leaving,0.1,1,0.1)
		elseif event == "PLAYER_REGEN_DISABLED" then
			E.EuiAlertRun(E.db["euiscript"].combatnoti_entering,1,0.1,0.1)
		end	
	end)
end

local int = 1

local clocks_update = function(self,t)
	if E.db["euiscript"].wgtimenoti == 'NONE' then return end
	int = int - t
	if int > 0 then return end
	local INFO_WOWTIME_TIP = L.INFO_WOWTIME_TIP
	
	int = 1
	local _,_,_,canQueue1,wgtime1 = GetWorldPVPAreaInfo(1)
	local _,_,_,canQueue2,wgtime2 = GetWorldPVPAreaInfo(2)
	local canSend = (IsInGuild() and E.db["euiscript"].wgtimenoti == 'GUILD') or (IsInGroup() and E.db["euiscript"].wgtimenoti == 'PARTY') or (IsInRaid() and E.db["euiscript"].wgtimenoti == 'RAID')
	local isActive = 0
	if canQueue1 == false and wgtime1 == 900 then
		isActive = 1;
		INFO_WOWTIME_TIP = localizedName1.. INFO_WOWTIME_TIP
	end
	if canQueue2 == false and wgtime2 == 900 then
		isActive = 2;
		INFO_WOWTIME_TIP = localizedName2.. INFO_WOWTIME_TIP
	end
	if isActive > 0 then
		E.EuiAlertRun (INFO_WOWTIME_TIP)
		if canSend then SendChatMessage('EUI:'.. INFO_WOWTIME_TIP, E.db["euiscript"].wgtimenoti, nil, nil) end
	end
end

CombatNotification:SetScript("OnUpdate",clocks_update)

local f = CreateFrame("Frame")
f:RegisterEvent("ZONE_CHANGED_NEW_AREA")
	
function f:lfgMsg()
	local str = ''
	if E.db["euiscript"].lfgnoti == 'NONE' then return end
	local name = GetLFGDungeonInfo(462);
	if not name then name = ''; end
	local canSend = (IsInGuild() and E.db["euiscript"].lfgnoti == 'GUILD') or (IsInGroup() and E.db["euiscript"].lfgnoti == 'PARTY') or (IsInRaid() and E.db["euiscript"].lfgnoti == 'RAID')
	local eligible, forTank, forHealer, forDamage, itemCount, money, xp = GetLFGRoleShortageRewards(462, 1)
	if eligible and (itemCount > 0) then
		if forTank then str = str.. L.Tank end
		if forHealer then str = str.. L.Healer end
		if forDamage then str = str.. L.DPS end
		E.EuiAlertRun(name.. str.. L.need)
		if canSend then SendChatMessage('EUI:'.. name.. str.. L.need, E.db["euiscript"].lfgnoti, nil, nil) end
		str = ""
		E:ScheduleTimer(f.lfgMsg, random(300, 600))
	else
		E:ScheduleTimer(f.lfgMsg, random(1, 10))
	end
end

--Title: QSAlert
--Author: smcn
--X-Curse-Packaged-Version: v1.1.0-60000
local alertedItems = { }
local function AlertCheck(bag)
	local alert
	alertedItems = alertedItems or { }
	for slot = 1, GetContainerNumSlots(bag) do
		local _, questID, isActive = GetContainerItemQuestInfo(bag, slot)
		local itemID = GetContainerItemID(bag, slot)
		local link = GetContainerItemLink(bag, slot)
		if questID then
			local questCompleted = IsQuestFlaggedCompleted(questID)
			if not (isActive or alertedItems[itemID] or questCompleted) then
				alert = link
				alertedItems[itemID] = questID
			end
		end
	end
	if alert then
		PlaySoundFile([[Sound\Interface\LevelUp.wav]], "Master")
		E:Print(alert..LL['have a quest'])
	end
end

local QSAlert = CreateFrame("Frame")
QSAlert:RegisterEvent("PLAYER_ENTERING_WORLD")
QSAlert:RegisterEvent("BAG_UPDATE")
QSAlert:SetScript("OnEvent", function(self, event, ...)
	if not E.db["euiscript"].QSAlert then return end
	if event == "PLAYER_ENTERING_WORLD" then
		for bag = 0, 4 do
			AlertCheck(bag)
		end
	elseif event == "BAG_UPDATE" then
		local bag = ...
		AlertCheck(bag)
	end	
end)
----End of QSAlert

E:ScheduleTimer(f.lfgMsg, 10);
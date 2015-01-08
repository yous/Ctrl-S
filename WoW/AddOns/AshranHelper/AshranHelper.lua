--
--  AshranHelper 
--  
--

local myFrame=CreateFrame("Frame")

-- need to localize keywords...
local defaultInviteKeywords={"inv", "invite"}
local defaultEventKeywords={"event", "events"}

local updateTimer = 0
local playCounter = 0
local ashranAreaID = 978;

local i18nAshran = "ashran";
local i18nBrokenBones = "Broken Bones"
local isInAshran = false;

function initVariables()
	-- simple way to localize names for non-English clients
	i18nAshran = GetMapNameByID(ashranAreaID):lower() -- "ashran";
	if (i18nAshran == nil) then 
		i18nAshran = "ashran" 
	end

	i18nBrokenBones = GetItemInfo(118043) -- "Broken Bones"
	if (i18nBrokenBones == nil) then
		i18nBrokenBones = "Broken Bones";
	end
end

function ashPrint(...) 
	print("|cFF00FF00AshranHelper|r: " .. ...)
end

function eventHandler(self,e,...) 
	local arg1 = ...

	if (e == "ADDON_LOADED" and arg1 == "AshranHelper") then
		ashPrint("Use /ashranhelper or /ash for more info")
		initVariables()

		if (AshranHelper == nil) then 
			AshranHelper = {}
			AshranHelper["InviteEnabled"] = false
			AshranHelper["EventEnabled"] = false
			AshranHelper["InviteCounter"] = 0
			AshranHelper["BoneCounter"] = 0
			AshranHelper["InviteKeywords"] = defaultInviteKeywords
			AshranHelper["EventKeywords"] = defaultEventKeywords
		end
	end

	if (e == "ZONE_CHANGED_NEW_AREA") then
		SetMapToCurrentZone()
		local areaid = GetCurrentMapAreaID()

		if (areaid == ashranAreaID) then
			isInAshran = true;
			-- print auto-invite status when we enter Ashran
			if (AshranHelper["InviteEnabled"] or AshranHelper["EventEnabled"]) then
				ashPrint("invite is active and will invite when you are in a raid group")
			else
				ashPrint("auto-invite is not active (do /ashranhelper auto to activate)")
			end
		else
			if (isInAshran) then
				if (AshranHelper["InviteEnabled"]) then
					ashPrint("You have left Ashran and auto-invite is no longer active")
				end
				isInAshran = false
			end
		end
	end

	if (e == "CHAT_MSG_CHANNEL" or e == "CHAT_MSG_WHISPER" or e == "CHAT_MSG_SAY") then
		local message,sender,_,_,_,_,_,_,chName,_,_,id = ...

		message = message:lower()

		-- look for messages in General - Ashran, but only if in raid and we have free spots
		-- 
		-- the triggers are a bit kludgy, but should be good enough. For auto-invite, look for 
		-- "inv" or "invite" at the beginning of the message. For event invite, look for "event" or
		-- "events" anywhere in the message.  
		if (IsInRaid() and GetNumGroupMembers() < 40) then
			if (chName:lower():find(i18nAshran) or e == "CHAT_MSG_WHISPER" or e == "CHAT_MSG_SAY") then
				local isAskingForEvent = false
				local isAskingForInvite = false
				local firstWord;

				for _,t in ipairs(AshranHelper["EventKeywords"]) 
				do 
					if (message:find(t) ) then 
						isAskingForEvent = true
						break 
					end 
				end
				firstWord = message:match("(%S+).*")
				if(firstWord ~= nil) then
					for _,t in ipairs(AshranHelper["InviteKeywords"]) 
					do 
						if (t == firstWord) then 
							isAskingForInvite = true
							break 
						end 
					end 
				end
				if (AshranHelper["InviteEnabled"] and isAskingForInvite and isAskingForEvent == false) then
					InviteUnit(sender) 							
					AshranHelper["InviteCounter"] = AshranHelper["InviteCounter"] + 1
				elseif (AshranHelper["EventEnabled"] and isAskingForEvent) then
					InviteUnit(sender) 							
					AshranHelper["InviteCounter"] = AshranHelper["InviteCounter"] + 1
				end
			end
		end
	end

	if (e == "GET_ITEM_INFO_RECEIVED") then
		-- just assume we got this because we asked for Broken Bones earlier...
		if(GetItemInfo(118043)) then
			i18nBrokenBones = GetItemInfo(118043) 
		end
	end
end

-- 
--  Filter out the spammy Broken Bones loot messages
--
function lootFilter(self, event, msg) 
	if (msg ~= nil and i18nBrokenBones ~= nil and msg:find(i18nBrokenBones)) then
		AshranHelper["BoneCounter"] = AshranHelper["BoneCounter"] + 1
		return true
	end
	return false
end

-- 
-- ugly but working way to detect ashran queue, play a sound when ready to enter
--
function uiUpdate(self, elapsed) 
	updateTimer = updateTimer + elapsed
	if (updateTimer > 2) then
		for i=1, MAX_WORLD_PVP_QUEUES do
		    local queueStatus, zone = GetWorldPVPQueueStatus(i)   
			
			if (zone ~= nil and i18nAshran ~= nil and zone:lower() == i18nAshran) then
			   	if(queueStatus == "confirm") then
			   		if (playCounter == 0) then 
						PlaySoundFile("sound\\interface\\levelup2.ogg", "Master")
					end
					playCounter = playCounter + 1
				else
					playCounter = 0
			   end
			end
		end

		updateTimer = 0
	end
end

--
-- print auto-invite status
--
function inviteStatus()
	if (AshranHelper["InviteEnabled"]) then 
		ashPrint("auto-invite is currently Enabled") 
	else 
		ashPrint("auto-invite is currently Disabled") 
	end 
	if (AshranHelper["EventEnabled"]) then 
		ashPrint("event invite is currently Enabled") 
	else 
		ashPrint("event invite is currently Disabled") 
	end 
end

function keywordString(k)
	local s = ""
	local count = 0
	for _,t in ipairs(k) 
	do
		if (count > 0) then
			s = s .. ",";
		end
		count = count + 1
		s = s .. "|cFFFFFF00" .. t .. "|r"
	end

	return s
end

--
-- basic slash command 
--
function slashCommand(arg)
	if (arg == "auto") then
		AshranHelper["InviteEnabled"] = not AshranHelper["InviteEnabled"] 
		AshranHelper["EventEnabled"] = false
		inviteStatus()
	elseif (arg == "event") then
		AshranHelper["EventEnabled"] = not AshranHelper["EventEnabled"] 
		AshranHelper["InviteEnabled"] = false
		inviteStatus()
	elseif (arg == "keywords") then
		ashPrint("Invite keywords: " .. keywordString(AshranHelper["InviteKeywords"]))
		ashPrint("Event keywords: " .. keywordString(AshranHelper["EventKeywords"]))
	else
		ashPrint(AshranHelper["BoneCounter"] .. " " .. i18nBrokenBones .. " spam suppressed and " .. AshranHelper["InviteCounter"] .. " invites sent")
		inviteStatus()
		ashPrint ("To enable or disable auto-invite, use")
		ashPrint ("|cFFFFFF00/ashranhelper auto|r")
		ashPrint ("To enable or disable event invite, use")
		ashPrint ("|cFFFFFF00/ashranhelper event|r")	
	end
end

myFrame:SetScript("OnEvent",eventHandler);
myFrame:RegisterEvent("ZONE_CHANGED_NEW_AREA") 	
myFrame:RegisterEvent("CHAT_MSG_CHANNEL") 		
myFrame:RegisterEvent("CHAT_MSG_WHISPER") 
myFrame:RegisterEvent("CHAT_MSG_SAY") 
ChatFrame_AddMessageEventFilter("CHAT_MSG_LOOT", lootFilter)
myFrame:SetScript("OnUpdate", uiUpdate)
myFrame:RegisterEvent("ADDON_LOADED")
myFrame:RegisterEvent("GET_ITEM_INFO_RECEIVED")

SlashCmdList.ASHRANAUTO = slashCommand
SLASH_ASHRANAUTO1, SLASH_ASHRANAUTO2 = "/ashranhelper", "/ash"


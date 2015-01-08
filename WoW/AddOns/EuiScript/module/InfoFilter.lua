local E, L, V, P, G, _ = unpack(ElvUI);
local IFSSymbols={"`"," ","~","@","#","^","*","=","|"," ","，","。","、","？","！","：","；","’","‘","“","”","【","】","『","』","《","》","<",">","（","）"} 

local cacheBlackName = {}
local twipe = table.wipe
local FriendList = {}
local runOnce = false

local fr = CreateFrame("Frame")
fr:RegisterEvent("FRIENDLIST_UPDATE")
fr:SetScript("OnEvent", function()
	local num = GetNumFriends()
	for i = 1, num do
		local n = GetFriendInfo(i)
		--add friends to safe list
		if n then
			FriendList[n] = true
		else
			if not runOnce then
				ShowFriends();
				runOnce = true;
			end
		end
	end
	local _, oon = BNGetNumFriends()
	for i = 1, oon do
		local toon = BNGetNumFriendToons(i)
		for j = 1, toon do
			local _, rName, rGame = BNGetFriendToonInfo(i, j)
			if (rGame == "WoW") then
				FriendList[rName] = true;
			end
		end
	end
end)

local function InfoFilter(IFSself, IFSevent, IFSmsg, IFSauthor, _, _, _, IFSflag, _, _, IFSchannel, _, IFSid, guid)

	if(not E.kolocale) or (not E.global.InfoFilter.enable) then
		return false;
	end
	

	if ((IFSevent == "CHAT_MSG_WHISPER" and (IFSflag == "GM" or IFSflag == 'DEV')) or UnitIsInMyGuild(IFSauthor) or UnitIsUnit(IFSauthor,"player") or UnitInRaid(IFSauthor) or UnitInParty(IFSauthor)) then 
		return false; 
	end

	if IFSchannel == '그룹의 친구' then
		return false
	end

	local trimmedPlayer = Ambiguate(IFSauthor, "none")
	if E.global.InfoFilter.filterFriend and (FriendList[IFSauthor] or FriendList[trimmedPlayer]) then
		return false
	end
	

	local Name, Server
	if (guid and tonumber(guid)) then
		_, _, _, _, _, Name, Server = GetPlayerInfoByGUID(guid)
		if Name then
			IFSauthor = Name
			if (Server and strlen(Server) > 0) then
				IFSauthor = Name.."-"..Server
			else
				IFSauthor = Name.."-"..E.myrealm
			end
		end
	end

	if E.global.InfoFilter.blackName[IFSauthor] or (Name and E.global.InfoFilter.blackName[Name]) then
		if (E.global.InfoFilter.Debug) then --debug
			DEFAULT_CHAT_FRAME:AddMessage(IFSauthor)
			DEFAULT_CHAT_FRAME:AddMessage(IFSmsg)
		end		
		return true;
	end
	

	local cacheNum = 0
	for k, v in pairs(cacheBlackName) do
		cacheNum = cacheNum + 10
	end
	if cacheNum > 200 then
		twipe(cacheBlackName)
	end
	

	if cacheBlackName[IFSauthor] and cacheBlackName[IFSauthor] > 10 then
		if (E.global.InfoFilter.Debug) then --debug
			DEFAULT_CHAT_FRAME:AddMessage(IFSauthor)
			DEFAULT_CHAT_FRAME:AddMessage(IFSmsg)
		end	
		return true;
	end


	for _, IFSsymbol in ipairs(IFSSymbols) do
		IFSmsg, a = gsub(IFSmsg, IFSsymbol, "")
	end
	
	local IFSmatch = 0;

	for IFSword, wordEnable in pairs(E.global.InfoFilter.blackList) do
		if wordEnable then
			local IFSnewString, IFSresult= gsub(IFSmsg, IFSword, "");
			if (IFSresult > 0) then
				IFSmatch = IFSmatch +1;
			end
		end
	end	
	if (IFSmatch >= E.global.InfoFilter.matchNum) then		
		if (E.global.InfoFilter.Debug) then --debug
			DEFAULT_CHAT_FRAME:AddMessage(IFSauthor)
			DEFAULT_CHAT_FRAME:AddMessage(IFSmsg)
		end

		if not cacheBlackName[IFSauthor] then
			cacheBlackName[IFSauthor] = 1;
		elseif cacheBlackName[IFSauthor] < 15 then 
			cacheBlackName[IFSauthor] = cacheBlackName[IFSauthor] + 1;
		end
		return true; 
	else
		return false;
	end
end
ChatFrame_AddMessageEventFilter("CHAT_MSG_CHANNEL",InfoFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_SAY", InfoFilter) 
ChatFrame_AddMessageEventFilter("CHAT_MSG_YELL", InfoFilter) 
ChatFrame_AddMessageEventFilter("CHAT_MSG_WHISPER", InfoFilter) 
ChatFrame_AddMessageEventFilter("CHAT_MSG_ADDON", InfoFilter) 
ChatFrame_AddMessageEventFilter("CHAT_MSG_TEXT_EMOTE", InfoFilter)

if E.global.InfoFilter.level < 1 then return; end

--good players(guildies/friends), maybe(for processing)
local badboy = CreateFrame("Frame")
local maybe, filterTable = {}, {}
local whisp = "|cFF33FF99EUI|r: You need to be level %d to whisper me."
local err = "You have reached the maximum amount of friends, remove 2 for this addon to function properly!"

do
	local L = GetLocale()
	if L == "zhTW" then
		whisp = "|cFF33FF99EUI|r: 你起碼要達到 %d 級才能密我。"
		err = "你的好友列表滿了，此插件需要你騰出2個好友空位!"
	elseif L == "koKR" then
		whisp = "|cFF33FF99EUI|r: 당신은 최소한 레벨에 도달해야합니다 %d 레벨 내가 얘기 할 수 있습니다。"
		err = "친구 목록이 가득，이 플러그인 모듈은 두 친구의 공석을 만들기 위해 당신이 필요합니다！"
	end
end

local addMsg, hookFunc
do
	-- For some reason any form of CHAT_MSG_SYSTEM filter causes nonsense world map taints, so use the next best thing
	local addFrnd = ERR_FRIEND_ADDED_S:gsub("%%s", "([^ ]+)")
	local rmvFrnd = ERR_FRIEND_REMOVED_S:gsub("%%s", "([^ ]+)")
	local info = ChatTypeInfo.SYSTEM
	hookFunc = function(f, msg, r, g, b, ...)
		-- This is a filter to remove the player added/removed from friends messages when we use it, otherwise they are left alone
		if r == info.r and g == info.g and b == info.b then
			local _, _, player = msg:find(addFrnd)
			if not player then
				_, _, player = msg:find(rmvFrnd)
			end
			if player and filterTable[player] then
				return
			end
		end
		return addMsg(f, msg, r, g, b, ...)
	end
end

badboy:RegisterEvent("PLAYER_LOGIN")
badboy:RegisterEvent("FRIENDLIST_UPDATE")
badboy:RegisterEvent("CHAT_MSG_SYSTEM")
badboy:SetScript("OnEvent", function(_, evt, msg)
	if evt == "PLAYER_LOGIN" then
		ShowFriends() --force a friends list update on login
		FriendList[UnitName("player")] = true --add ourself to safe list
		if type(E.global.InfoFilter.level) ~= "number" or E.global.InfoFilter.level < 1 then
			E.global.InfoFilter.level = -1
		end
	elseif evt == "CHAT_MSG_SYSTEM" then
		if msg == ERR_FRIEND_LIST_FULL then
			E:Print(err) --print a warning if we see a friends full message
			return
		end
	else
--[[		if not login then --run on login only
			login = true
			local num = GetNumFriends()
			for i = 1, num do
				local n = GetFriendInfo(i)
				--add friends to safe list
				if n then good[n] = true end
			end
			return
		end]]

		local num = GetNumFriends() --get total friends
		for i = 1, num do
			local player, level = GetFriendInfo(i)
			--sometimes a friend will return nil, I have no idea why, so force another update
			if not player then
				ShowFriends()
			else
				if maybe[player] then --do we need to process this person?
					RemoveFriend(player, true) --Remove player from friends list, the 2nd arg "true" is a fake arg added by request of tekkub, author of FriendsWithBenefits
					if type(level) ~= "number" then
						E:Print("Level wasn't a number, tell BadBoy author! It was:"..level)
					end
					if level < filterTable[player] then
						--lower than level 2, or a level defined by the user = bad,
						--or lower than 58 and class is a Death Knight,
						--so whisper the bad player what level they must be to whisper us
						SendChatMessage(whisp:format(filterTable[player]), "WHISPER", nil, player)
						for _, v in pairs(maybe[player]) do
							for _, p in pairs(v) do
								wipe(p) --remove player data table
							end
							wipe(v) --remove player data table
						end
					else
						FriendList[player] = true --higher = good
						--get all the frames, incase whispers are being recieved in more that one chat frame
						for _, v in pairs(maybe[player]) do
							--get all the chat lines (queued if multiple) for restoration back to the chat frame
							for _, p in pairs(v) do
								--this player is good, we must restore the whisper(s) back to chat
								if IsAddOnLoaded("WIM") then --WIM compat
									WIM.modules.WhisperEngine:CHAT_MSG_WHISPER(select(3, unpack(p)))
								elseif IsAddOnLoaded("Cellular") then --Cellular compat
									local _,_,a1,a2,_,_,_,a6,_,_,_,_,a11,a12 = unpack(p)
									Cellular:IncomingMessage(a2, a1, a6, nil, a11, a12)
								else
									ChatFrame_MessageEventHandler(unpack(p))
								end
								wipe(p) --remove player data table
							end
							wipe(v) --remove player data table
						end
					end
					wipe(maybe[player]) --remove player data table
					maybe[player] = nil --remove remaining empty table
				end
			end
		end
	end
end)

--incoming whisper filtering function
ChatFrame_AddMessageEventFilter("CHAT_MSG_WHISPER", function(...)
	local f, _, _, player, _, _, _, flag, _, _, _, _, id, guid = ...
	local trimmedPlayer = Ambiguate(player, "none")
	--don't filter if good, GM, guild member, or x-server
	if FriendList[trimmedPlayer] or trimmedPlayer:find("%-") or UnitIsInMyGuild(trimmedPlayer) then return end
	if flag == "GM" or flag == "DEV" then return end

	--RealID support, don't scan people that whisper us via their character instead of RealID
	--that aren't on our friends list, but are on our RealID list.
--[[local _, num = BNGetNumFriends()
	for i=1, num do
		local toon = BNGetNumFriendToons(i)
		for j=1, toon do
			local _, rName, rGame, rServer = BNGetFriendToonInfo(i, j)
			if rName == trimmedPlayer and rGame == "WoW" and rServer == GetRealmName() then
				good[trimmedPlayer] = true
				return
			end
		end
	end
]]
	if not addMsg then -- On-demand hook for chat filtering
		addMsg = ChatFrame1.AddMessage
		ChatFrame1.AddMessage = hookFunc
	end

	f = f:GetName()
	if not f then f = "?" end
	if f == "WIM3_HistoryChatFrame" then return end -- Ignore WIM history frame
	if not f:find("^ChatFrame%d+$") and f ~= "WIM_workerFrame" and f ~= "Cellular" then
		E:Print("ERROR, tell BadBoy author, new frame found:"..f)
		return
	end
	if IsAddOnLoaded("WIM") and f ~= "WIM_workerFrame" then return true end --WIM compat
	if IsAddOnLoaded("Cellular") and f ~= "Cellular" then return true end --Cellular compat
	if not maybe[trimmedPlayer] then maybe[trimmedPlayer] = {} end --added to maybe
	--one table per chatframe, incase we got whispers on 2+ chatframes
	if not maybe[trimmedPlayer][f] then maybe[trimmedPlayer][f] = {} end
	--one table per id, incase we got more than one whisper from a player whilst still processing
	maybe[trimmedPlayer][f][id] = {}
	for i = 1, select("#", ...) do
		--store all the chat arguments incase we need to add it back (if it's a new good guy)
		maybe[trimmedPlayer][f][id][i] = select(i, ...)
	end
	--Decide the level to be filtered
	local _, englishClass = GetPlayerInfoByGUID(guid)
	local level = (E.global.InfoFilter.level > 0) and E.global.InfoFilter.level + 1 or 2
	if englishClass == "DEATHKNIGHT" and level < 58 then level = 58 end
	--Don't try to add a player to friends several times for 1 whisper (registered to more than 1 chat frame)
	if not filterTable[trimmedPlayer] or filterTable[trimmedPlayer] ~= level then
		filterTable[trimmedPlayer] = level
		AddFriend(trimmedPlayer, true) --add player to friends, the 2nd arg "true" is a fake arg added by request of tekkub, author of FriendsWithBenefits
	end
	return true --filter everything not good (maybe) and not GM
end)

--outgoing whisper filtering function
ChatFrame_AddMessageEventFilter("CHAT_MSG_WHISPER_INFORM", function(_,_,msg,player)
	local trimmedPlayer = Ambiguate(player, "none")
	if FriendList[trimmedPlayer] then return end --Do nothing if on safe list
	if filterTable[trimmedPlayer] and msg:find("^BadBoy.*"..filterTable[trimmedPlayer]) then return true end --Filter auto-response
	FriendList[trimmedPlayer] = true --If we want to whisper someone, they're good
end)
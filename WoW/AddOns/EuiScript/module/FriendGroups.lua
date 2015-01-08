local E, L = unpack(ElvUI)
local hooks = {}
-- Title: Friend Groups
-- Notes: Add groups to your friends list
-- Author: Frunk
-- X-Curse-Packaged-Version: r28
-- modify for WOD 6.0 by eui
local function Hook(source, target, secure)
    hooks[source] = _G[source]
    if secure then
        hooksecurefunc(source, target)
    else
        _G[source] = target
    end
end


local FRIENDS_GROUP_NAME_COLOR = NORMAL_FONT_COLOR;
 
local INVITE_RESTRICTION_NO_TOONS = 0;
local INVITE_RESTRICTION_CLIENT = 1;
local INVITE_RESTRICTION_LEADER = 2;
local INVITE_RESTRICTION_FACTION = 3;
local INVITE_RESTRICTION_INFO = 4;
local INVITE_RESTRICTION_NONE = 5;

local totalScrollHeight = 0
local FriendButtons = { count = 0 }
local GroupCount = 0
local GroupTotal = {}
local GroupOnline = {}
local GroupSorted = {}

local friend_popup_menus = { "FRIEND", "FRIEND_OFFLINE", "BN_FRIEND", "BN_FRIEND_OFFLINE" }
UnitPopupButtons["FRIEND_GROUP_NEW"] = { text = L["Create new group"], dist = 0 }
UnitPopupButtons["FRIEND_GROUP_ADD"] = { text = L["Add to group"], dist = 0, nested = 1 }
UnitPopupButtons["FRIEND_GROUP_DEL"] = { text = L["Remove from group"], dist = 0, nested = 1 }
UnitPopupMenus["FRIEND_GROUP_ADD"] = { }
UnitPopupMenus["FRIEND_GROUP_DEL"] = { }

local function ClassColourCode(class)
    for k, v in pairs(LOCALIZED_CLASS_NAMES_FEMALE) do
        if class == v then
            class = k
            break
        end
    end
    local colour = RAID_CLASS_COLORS[class]
    return string.format("|cFF%02x%02x%02x", colour.r*255, colour.g*255, colour.b*255)
end

local function FriendGroups_GetTopButton(offset)
    local remaining = offset
    
    for i = 1, FriendButtons.count do
        local buttontype = FriendButtons[i].buttonType
        local buttonheight;
        if buttontype == FRIENDS_BUTTON_TYPE_WOW then
            buttonheight = FRIENDS_BUTTON_NORMAL_HEIGHT
        elseif buttontype == FRIENDS_BUTTON_TYPE_BNET then
            buttonheight = FRIENDS_BUTTON_NORMAL_HEIGHT
        else
            buttonheight = FRIENDS_BUTTON_HEADER_HEIGHT
        end
        
        if buttonheight >= remaining then
            return i - 1, remaining
        else
			remaining = remaining - buttonheight
		end
    end
    
    return 0, 0
end

local function FriendGroups_UpdateFriends()
    local scrollFrame = FriendsFrameFriendsScrollFrame;
    local offset = HybridScrollFrame_GetOffset(scrollFrame);
    local buttons = scrollFrame.buttons;
    local numButtons = #buttons;
    local numFriendButtons = FriendButtons.count;
     
    local nameText, nameColor, infoText, broadcastText; 
 
    local height;
    local usedHeight = 0;
 
    local hasTravelPass = HasTravelPass();
    local hasTravelPassButton;
    local canInvite = FriendsFrame_HasInvitePermission();
     
    FriendsFrameOfflineHeader:Hide();
    for i = 1, numButtons do
        local button = buttons[i];
        local index = offset + i;
        if index <= numFriendButtons then --and usedHeight < FRIENDS_SCROLLFRAME_HEIGHT then
            button.buttonType = FriendButtons[index].buttonType;
            button.id = FriendButtons[index].id;
			height = FRIENDS_BUTTON_NORMAL_HEIGHT;
            hasTravelPassButton = false;
            
            button.status:Show()
            button.status:SetSize(16, 16)
            button.background:Show()
            button.background:SetAlpha(1.0)
            button.info:Show()
            button.name:SetJustifyH("LEFT")
            button.text:Hide()
            
            if ( FriendButtons[index].buttonType == FRIENDS_BUTTON_TYPE_WOW ) then
                local name, level, class, area, connected, status, note = GetFriendInfo(FriendButtons[index].id);
                broadcastText = nil;
                if ( connected ) then
                    button.background:SetTexture(FRIENDS_WOW_BACKGROUND_COLOR.r, FRIENDS_WOW_BACKGROUND_COLOR.g, FRIENDS_WOW_BACKGROUND_COLOR.b, FRIENDS_WOW_BACKGROUND_COLOR.a);
                    if ( status == "" ) then
                        button.status:SetTexture(FRIENDS_TEXTURE_ONLINE);
                    elseif ( status == CHAT_FLAG_AFK ) then
                        button.status:SetTexture(FRIENDS_TEXTURE_AFK);
                    elseif ( status == CHAT_FLAG_DND ) then
                        button.status:SetTexture(FRIENDS_TEXTURE_DND);
                    end
                    
					if E.db.euiscript.FriendGroups.colour_classes then
                        name = ClassColourCode(class) .. name .. "|r"
                    end
                    nameText = name..", "..format(FRIENDS_LEVEL_TEMPLATE, level, class);
                    nameColor = FRIENDS_WOW_NAME_COLOR;
                else
                    button.background:SetTexture(FRIENDS_OFFLINE_BACKGROUND_COLOR.r, FRIENDS_OFFLINE_BACKGROUND_COLOR.g, FRIENDS_OFFLINE_BACKGROUND_COLOR.b, FRIENDS_OFFLINE_BACKGROUND_COLOR.a);
                    button.status:SetTexture(FRIENDS_TEXTURE_OFFLINE);
                    nameText = name;
                    nameColor = FRIENDS_GRAY_COLOR;
                end
                infoText = area;
                button.gameIcon:Hide();
                FriendsFrame_SummonButton_Update(button.summonButton);
            elseif ( FriendButtons[index].buttonType == FRIENDS_BUTTON_TYPE_BNET ) then
                local presenceID, presenceName, battleTag, isBattleTagPresence, toonName, toonID, client, isOnline, lastOnline, isAFK, isDND, messageText, noteText, isRIDFriend, messageTime, canSoR = BNGetFriendInfo(FriendButtons[index].id);
                broadcastText = messageText;
				-- set up player name and character name
				local characterName = toonName;
				if ( presenceName ) then
					nameText = presenceName;
					-- if no character name but we have a BattleTag, use that
					if ( isOnline and not characterName and battleTag ) then
						characterName = battleTag;
					end
				elseif ( givenName ) then
					nameText = givenName;
				else
					nameText = UNKNOWN;				
				end
				
				-- append toon
				if ( characterName ) then
					if ( client == BNET_CLIENT_WOW and CanCooperateWithToon(toonID, hasTravelPass) ) then
						local colour = E.db.euiscript.FriendGroups.colour_classes and ClassColourCode(select(8, BNGetToonInfo(toonID))) or FRIENDS_WOW_NAME_COLOR_CODE
						nameText = nameText.." "..colour.."("..characterName..")";
					else
						if ( ENABLE_COLORBLIND_MODE == "1" ) then
							characterName = characterName..CANNOT_COOPERATE_LABEL;
						end
						nameText = nameText.." "..FRIENDS_OTHER_NAME_COLOR_CODE.."("..characterName..")";
					end
				end
				
                if ( isOnline ) then
                    local _, _, _, realmName, realmID, faction, _, _, _, zoneName, _, gameText = BNGetToonInfo(toonID);
                    button.background:SetTexture(FRIENDS_BNET_BACKGROUND_COLOR.r, FRIENDS_BNET_BACKGROUND_COLOR.g, FRIENDS_BNET_BACKGROUND_COLOR.b, FRIENDS_BNET_BACKGROUND_COLOR.a);
                    if ( isAFK ) then
                        button.status:SetTexture(FRIENDS_TEXTURE_AFK);
                    elseif ( isDND ) then
                        button.status:SetTexture(FRIENDS_TEXTURE_DND);
                    else
                        button.status:SetTexture(FRIENDS_TEXTURE_ONLINE);
                    end
                    if ( client == BNET_CLIENT_WOW ) then
                        if ( not zoneName or zoneName == "" ) then
                            infoText = UNKNOWN;
                        else
                            infoText = zoneName;
                        end
                    else
                        infoText = gameText;
                    end
                    button.gameIcon:SetTexture(BNet_GetClientTexture(client));
                    nameColor = FRIENDS_BNET_NAME_COLOR;
                    button.gameIcon:Show();
                    -- travel pass
                    if ( hasTravelPass ) then
                        hasTravelPassButton = true;
                        local restriction = FriendsFrame_GetInviteRestriction(button.id, canInvite);
                        if ( restriction == INVITE_RESTRICTION_NONE ) then
                            button.travelPassButton:Enable();
                        else
                            button.travelPassButton:Disable();
                        end
                    end
                else
                    button.background:SetTexture(FRIENDS_OFFLINE_BACKGROUND_COLOR.r, FRIENDS_OFFLINE_BACKGROUND_COLOR.g, FRIENDS_OFFLINE_BACKGROUND_COLOR.b, FRIENDS_OFFLINE_BACKGROUND_COLOR.a);
                    button.status:SetTexture(FRIENDS_TEXTURE_OFFLINE);
                    nameColor = FRIENDS_GRAY_COLOR;
                    button.gameIcon:Hide();
                    if ( not lastOnline or lastOnline == 0 or time() - lastOnline >= 31104000 ) then -- 31104000 = 60 * 60 * 24 * 30 * 12
                        infoText = FRIENDS_LIST_OFFLINE;
                    else
                        infoText = string.format(BNET_LAST_ONLINE_TIME, FriendsFrame_GetLastOnline(lastOnline));
                    end
                end
                FriendsFrame_SummonButton_Update(button.summonButton);
            else    -- header
                height = FRIENDS_BUTTON_HEADER_HEIGHT;
                nameText = nil;
                
                local title;
                local group = FriendButtons[index].text
                if group == "" then
                    title = L["[no group]"]
                else
                    title = group
                end
                button.text:SetText(title)
                button.text:Show()
                
                local counts = "(" .. GroupOnline[group] .. "/" .. GroupTotal[group] .. ")"
                button.name:SetText(counts)
                button.name:SetJustifyH("RIGHT")
                button.name:Show()
                button.name:SetTextColor(FRIENDS_GROUP_NAME_COLOR.r, FRIENDS_GROUP_NAME_COLOR.g, FRIENDS_GROUP_NAME_COLOR.b)
                
                if E.db.euiscript.FriendGroups.collapsed[group] then
                    button.status:SetTexture("Interface\\Buttons\\UI-PlusButton-UP")
                else
                    button.status:SetTexture("Interface\\Buttons\\UI-MinusButton-UP")
                end
                button.status:SetSize(13, 13)
                button.info:SetText(group)
                button.info:Hide()
                button.gameIcon:Hide()
                button.background:SetTexture("Interface\\FriendsFrame\\UI-FriendsFrame-OnlineDivider")
                button.background:SetAlpha(0.4)
            end
            -- travel pass?
            if ( hasTravelPassButton ) then
                button.travelPassButton:Show();
                button.gameIcon:SetPoint("TOPRIGHT", -21, -2);
            else
                button.travelPassButton:Hide();
                button.gameIcon:SetPoint("TOPRIGHT", -2, -2);
            end
            -- selection
            if ( FriendsFrame.selectedFriendType == FriendButtons[index].buttonType and FriendsFrame.selectedFriend == FriendButtons[index].id ) then
                button:LockHighlight();
            else
                button:UnlockHighlight();
            end
            -- finish setting up button if it's not a header
            if ( nameText ) then
                button.name:SetText(nameText);
                button.name:SetTextColor(nameColor.r, nameColor.g, nameColor.b);
                button.info:SetText(infoText);
                button:Show();
            elseif FriendButtons[index].buttonType == FRIENDS_BUTTON_TYPE_HEADER then
                button:Show()
            else
                button:Hide();
            end
            -- update the tooltip if hovering over a button
            if ( FriendsTooltip.button == button ) then
                FriendsFrameTooltip_Show(button);
            end
            -- set heights
            button:SetHeight(height);
            usedHeight = usedHeight + height;
            if (GetMouseFocus() == button ) then
                FriendsFrameTooltip_Show(button);
            end
        else
            button:Hide();
        end
    end
    HybridScrollFrame_Update(scrollFrame, totalScrollHeight, usedHeight);
    if hooks["FriendsFrame_UpdateFriends"] then
        hooks["FriendsFrame_UpdateFriends"]()
    end
end

local function FillGroups(groups, note, ...)
    wipe(groups)
    local n = select('#', ...)
    for i = 1, n do
        local v = select(i, ...)
        v = strtrim(v)
        groups[v] = true
    end
    if n == 0 then
        groups[""] = true
    end
    return note
end

local function NoteAndGroups(note, groups)
    if not note then
        return FillGroups(groups, "")
    end
    if groups then
        return FillGroups(groups, strsplit("#", note))
    end
    return strsplit("#", note)
end

local function CreateNote(note, groups)
    local value = ""
    if note then
        value = note
    end
    for group in pairs(groups) do
        value = value .. "#" .. group
    end
    return value
end

local function AddGroup(note, group)
    local groups = {}
    note = NoteAndGroups(note, groups)
    groups[""] = nil --ew
    groups[group] = true
    return CreateNote(note, groups)
end

local function RemoveGroup(note, group)
    local groups = {}
    note = NoteAndGroups(note, groups)
    groups[""] = nil --ew
    groups[group] = nil
    return CreateNote(note, groups)
end

local function IncrementGroup(group, online)
    if not GroupTotal[group] then
        GroupCount = GroupCount + 1
        GroupTotal[group] = 0
        GroupOnline[group] = 0
    end
    GroupTotal[group] = GroupTotal[group] + 1
    if online then
        GroupOnline[group] = GroupOnline[group] + 1
    end
end

local function FriendGroups_Update()
    --check oqueue broadcasts
	if E.db.euiscript.FriendGroups.enable_oqueue then
		for i = 1, BNGetNumFriends() do
			local presenceID, _, _, _, _, _, _, _, _, _, _, messageText, noteText = BNGetFriendInfo(i)
			noteText = noteText or ""
			messageText = messageText or ""
			local _, group = NoteAndGroups(noteText)
			if string.match(messageText, "[%(%[]OQ[%)%]].*") and not group then
				noteText = AddGroup(noteText, "oQueue")
				BNSetFriendNote(presenceID, noteText)
				return
			end
		end
	end

    local numBNetTotal, numBNetOnline = BNGetNumFriends();
    local numBNetOffline = numBNetTotal - numBNetOnline;
    local numWoWTotal, numWoWOnline = GetNumFriends();
    local numWoWOffline = numWoWTotal - numWoWOnline;
     
    FriendsMicroButtonCount:SetText(numBNetOnline + numWoWOnline);
    if ( not FriendsListFrame:IsShown() ) then
        return;
    end
    
    wipe(FriendButtons)
    wipe(GroupTotal)
    wipe(GroupOnline)
    wipe(GroupSorted)
    GroupCount = 0
    
    local BnetFriendGroups = {}
    local WowFriendGroups = {}
    
    local buttonCount = 0
    totalScrollHeight = 0;
    
    for i = 1, numBNetTotal do
        if not BnetFriendGroups[i] then
            BnetFriendGroups[i] = {}
        end
        local _, _, _, _, _, _, _, isOnline, _, _, _, _, noteText = BNGetFriendInfo(i)
        NoteAndGroups(noteText, BnetFriendGroups[i])
        for group in pairs(BnetFriendGroups[i]) do
            IncrementGroup(group, isOnline)
            if (not E.db.euiscript.FriendGroups.hide_offline or isOnline) and not E.db.euiscript.FriendGroups.collapsed[group] then
                buttonCount = buttonCount + 1
                totalScrollHeight = totalScrollHeight + FRIENDS_BUTTON_NORMAL_HEIGHT
            end
        end
    end
    for i = 1, numWoWTotal do
        if not WowFriendGroups[i] then
            WowFriendGroups[i] = {}
        end
        local name, _, _, _, connected, _, note = GetFriendInfo(i)
        NoteAndGroups(note, WowFriendGroups[i])
        for group in pairs(WowFriendGroups[i]) do
            IncrementGroup(group, connected)
            if not E.db.euiscript.FriendGroups.collapsed[group] then
                buttonCount = buttonCount + 1
                totalScrollHeight = totalScrollHeight + FRIENDS_BUTTON_NORMAL_HEIGHT
            end
        end
    end
    
    buttonCount = buttonCount + GroupCount
    
    totalScrollHeight = totalScrollHeight + GroupCount * FRIENDS_BUTTON_HEADER_HEIGHT
    
    if buttonCount > #FriendButtons then
        for i = #FriendButtons + 1, buttonCount do
            FriendButtons[i] = {}
        end
    end
    
    for group in pairs(GroupTotal) do
        table.insert(GroupSorted, group)
    end
    table.sort(GroupSorted)
    
    if GroupSorted[1] == "" then
        table.remove(GroupSorted, 1)
        table.insert(GroupSorted, "")
    end
    
    local index = 0
    for _,group in ipairs(GroupSorted) do
        index = index + 1
        
        FriendButtons[index].buttonType = FRIENDS_BUTTON_TYPE_HEADER
        FriendButtons[index].text = group
        if not E.db.euiscript.FriendGroups.collapsed[group] then
            for i = 1, numBNetOnline do
                if BnetFriendGroups[i][group] then
                    index = index + 1
                    FriendButtons[index].buttonType = FRIENDS_BUTTON_TYPE_BNET
                    FriendButtons[index].id = i
                end
            end
            for i = 1, numWoWOnline do
                if WowFriendGroups[i][group] then
                    index = index + 1
                    FriendButtons[index].buttonType = FRIENDS_BUTTON_TYPE_WOW
                    FriendButtons[index].id = i
                end
            end
            if not E.db.euiscript.FriendGroups.hide_offline then
                for i = numBNetOnline + 1, numBNetTotal do
                    if BnetFriendGroups[i][group] then
                        index = index + 1
                        FriendButtons[index].buttonType = FRIENDS_BUTTON_TYPE_BNET
                        FriendButtons[index].id = i
                    end
                end
                for i = numWoWOnline + 1, numWoWTotal do
                    if WowFriendGroups[i][group] then
                        index = index + 1
                        FriendButtons[index].buttonType = FRIENDS_BUTTON_TYPE_WOW
                        FriendButtons[index].id = i
                    end
                end
            end
        end
    end
    FriendButtons.count = index
     
    -- selection
    local selectedFriend = 0;
    -- check that we have at least 1 friend
	if ( index > 0 ) then
		-- get friend
		if ( FriendsFrame.selectedFriendType == FRIENDS_BUTTON_TYPE_WOW ) then
			selectedFriend = GetSelectedFriend();
		elseif ( FriendsFrame.selectedFriendType == FRIENDS_BUTTON_TYPE_BNET ) then
			selectedFriend = BNGetSelectedFriend();
		end
		-- set to first in list if no friend
		if ( selectedFriend == 0 ) then
			FriendsFrame_SelectFriend(FriendButtons[1].buttonType, 1);
			selectedFriend = 1;
		end
		-- check if friend is online
		local isOnline;
		if ( FriendsFrame.selectedFriendType == FRIENDS_BUTTON_TYPE_WOW ) then
			local name, level, class, area;
			name, level, class, area, isOnline = GetFriendInfo(selectedFriend);
		elseif ( FriendsFrame.selectedFriendType == FRIENDS_BUTTON_TYPE_BNET ) then
            local presenceID, presenceName, battleTag, isBattleTagPresence, toonName, toonID, client;
			presenceID, presenceName, battleTag, isBattleTagPresence, toonName, toonID, client, isOnline = BNGetFriendInfo(selectedFriend);
			if ( not presenceName ) then
				isOnline = false;
			end
		end
		if ( isOnline ) then
			FriendsFrameSendMessageButton:Enable();
		else
			FriendsFrameSendMessageButton:Disable();
		end
	else
		FriendsFrameSendMessageButton:Disable();
	end
    FriendsFrame.selectedFriend = selectedFriend;
    FriendGroups_UpdateFriends()
end

local function FriendGroups_OnClick(self, button)
    if not self.text:IsShown() then
        hooks["FriendsFrameFriendButton_OnClick"](self, button)
        return
    end
    
    local group = self.info:GetText() or ""
    if button == "RightButton" then
        ToggleDropDownMenu(1, group, FriendGroups_Menu, "cursor", 0, 0)
    else
        E.db.euiscript.FriendGroups.collapsed[group] = not E.db.euiscript.FriendGroups.collapsed[group]
        FriendGroups_Update()
    end
end

-- when one of our new menu items is clicked
local function FriendGroups_OnFriendMenuClick(self)
	if not self.value then
        return
    end
	
    local add = strmatch(self.value, "FGROUPADD_(.+)")
    local del = strmatch(self.value, "FGROUPDEL_(.+)")
    local creating = self.value == "FRIEND_GROUP_NEW"

    if add or del or creating then
        local dropdown = UIDROPDOWNMENU_INIT_MENU
        local source = OPEN_DROPDOWNMENUS[1] and OPEN_DROPDOWNMENUS[1].which or self.owner
        if not source then source = E.Friends_Source end
		
        if source == "BN_FRIEND" or source == "BN_FRIEND_OFFLINE" then
			local note = select(13, BNGetFriendInfoByID(dropdown.presenceID))
			if creating then
				StaticPopup_Show("FRIEND_GROUP_CREATE", nil, nil, { id = dropdown.presenceID, note = note, set = BNSetFriendNote })
			else
				if add then
					note = AddGroup(note, add)
                else
                    note = RemoveGroup(note, del)
				end
				BNSetFriendNote(dropdown.presenceID, note)
			end
        elseif source == "FRIEND" or source == "FRIEND_OFFLINE" then
            for i = 1, GetNumFriends() do
                local name, _, _, _, _, _, note = GetFriendInfo(i)
                if name == dropdown.name then
					if creating then
						StaticPopup_Show("FRIEND_GROUP_CREATE", nil, nil, { id = i, note = note, set = SetFriendNotes })
					else
						if add then
							note = AddGroup(note, add)
                        else
                            note = RemoveGroup(note, del)
                        end
						SetFriendNotes(i, note)
					end
                    break
                end
            end
        end
        FriendGroups_Update()
    end
    HideDropDownMenu(1)
end

-- hide the add/remove group buttons if we're not right clicking on a friendlist item
local function FriendGroups_HideButtons()
    local dropdown = UIDROPDOWNMENU_INIT_MENU
    
    local hidden = false
    for index, value in ipairs(UnitPopupMenus[UIDROPDOWNMENU_MENU_VALUE] or UnitPopupMenus[dropdown.which]) do
        if value == "FRIEND_GROUP_ADD" or value == "FRIEND_GROUP_DEL" or value == "FRIEND_GROUP_NEW" then
            if not dropdown.friendsList then
                UnitPopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
                hidden = true
            end
        end
    end
    
    if not hidden then
        wipe(UnitPopupMenus["FRIEND_GROUP_ADD"])
        wipe(UnitPopupMenus["FRIEND_GROUP_DEL"])
        local groups = {}
        local note = nil
        
        if dropdown.presenceID then
            note = select(13, BNGetFriendInfoByID(dropdown.presenceID))
        else
            for i = 1, GetNumFriends() do
                local name, _, _, _, _, _, noteText = GetFriendInfo(i)
                if name == dropdown.name then
                    note = noteText
                    break
                end
            end
        end
        
        NoteAndGroups(note, groups)
        
        for _,group in ipairs(GroupSorted) do
            if group ~= "" and not groups[group] then
                local faux = "FGROUPADD_" .. group
                --polluting the popup buttons list
                UnitPopupButtons[faux] = { text = group, dist = 0 }
                table.insert(UnitPopupMenus["FRIEND_GROUP_ADD"], faux)
            end
        end
        for group in pairs(groups) do
            if group ~= "" then
                local faux = "FGROUPDEL_" .. group
                UnitPopupButtons[faux] = { text = group, dist = 0 }
                table.insert(UnitPopupMenus["FRIEND_GROUP_DEL"], faux)
            end
        end
    end
end

local function FriendGroups_Rename(self, old)
    local input = self.editBox:GetText()
    if input == "" then
        return
    end
    local groups = {}
    for i = 1, BNGetNumFriends() do
        local presenceID, _, _, _, _, _, _, _, _, _, _, _, noteText = BNGetFriendInfo(i)
        local note = NoteAndGroups(noteText, groups)
        if groups[old] then
            groups[old] = nil
            groups[input] = true
            note = CreateNote(note, groups)
            BNSetFriendNote(presenceID, note)
        end
    end
    for i = 1, GetNumFriends() do
        local note = select(7, GetFriendInfo(i))
        note = NoteAndGroups(note, groups)
        if groups[old] then
            groups[old] = nil
            groups[input] = true
            note = CreateNote(note, groups)
            SetFriendNotes(i, note)
        end
    end
    FriendGroups_Update()
end

local function FriendGroups_Create(self, data)
    local input = self.editBox:GetText()
    if input == "" then
        return
    end
    local note = AddGroup(data.note, input)
	data.set(data.id, note)
end

StaticPopupDialogs["FRIEND_GROUP_RENAME"] = {
    text = L["Enter new group name"],
    button1 = ACCEPT,
    button2 = CANCEL,
    hasEditBox = 1,
    OnAccept = FriendGroups_Rename,
    EditBoxOnEnterPressed = function(self)
        local parent = self:GetParent()
        FriendGroups_Rename(parent, parent.data)
        parent:Hide()
    end,
    timeout = 0,
    whileDead = 1,
    hideOnEscape = 1
}

StaticPopupDialogs["FRIEND_GROUP_CREATE"] = {
    text = L["Enter new group name"],
    button1 = ACCEPT,
    button2 = CANCEL,
    hasEditBox = 1,
    OnAccept = FriendGroups_Create,
    EditBoxOnEnterPressed = function(self)
        local parent = self:GetParent()
        FriendGroups_Create(parent, parent.data)
        parent:Hide()
    end,
    timeout = 0,
    whileDead = 1,
    hideOnEscape = 1
}

local function InviteOrGroup(clickedgroup, invite)
    local groups = {}
	for i = 1, BNGetNumFriends() do
		local presenceID, _, _, _, _, toonID, _, _, _, _, _, _, noteText = BNGetFriendInfo(i)
		local note = NoteAndGroups(noteText, groups)
		if groups[clickedgroup] then
			if invite and toonID then
				BNInviteFriend(toonID)
			elseif not invite then
                groups[clickedgroup] = nil
                note = CreateNote(note, groups)
				BNSetFriendNote(presenceID, note)
			end
		end
	end
	for i = 1, GetNumFriends() do
		local name, _, _, _, connected, _, noteText = GetFriendInfo(i)
		local note = NoteAndGroups(noteText, groups)
		if groups[clickedgroup] then
			if invite and connected then
				InviteUnit(name)
			elseif not invite then
                groups[clickedgroup] = nil
                note = CreateNote(note, groups)
				SetFriendNotes(i, note)
			end
		end
	end
end

local FriendGroups_Menu = CreateFrame("Frame", "FriendGroups_Menu")
FriendGroups_Menu.displayMode = "MENU"
local menu_items = {
    [1] = {
		{ text = "", notCheckable = true, isTitle = true },
		{ text = L["Invite all to party"], notCheckable = true, func = function(self, menu, clickedgroup) InviteOrGroup(clickedgroup, true) end },
		{ text = L["Rename group"], notCheckable = true, func = function(self, menu, clickedgroup) StaticPopup_Show("FRIEND_GROUP_RENAME", nil, nil, clickedgroup) end },
		{ text = L["Remove group"], notCheckable = true, func = function(self, menu, clickedgroup) InviteOrGroup(clickedgroup, false) end },
		{ text = L["Settings"], notCheckable = true, hasArrow = true },
	},
	[2] = {
		{ text = L["Hide all offline"], checked = function() return E.db.euiscript.FriendGroups.hide_offline end, func = function() CloseDropDownMenus() E.db.euiscript.FriendGroups.hide_offline = not E.db.euiscript.FriendGroups.hide_offline FriendGroups_Update() end },
		{ text = L["Colour names"], checked = function() return E.db.euiscript.FriendGroups.colour_classes end, func = function() CloseDropDownMenus() E.db.euiscript.FriendGroups.colour_classes = not E.db.euiscript.FriendGroups.colour_classes FriendGroups_Update() end },
		{ text = L["Enable oQueue grouping"], checked = function() return E.db.euiscript.FriendGroups.enable_oqueue end, func = function() CloseDropDownMenus() E.db.euiscript.FriendGroups.enable_oqueue = not E.db.euiscript.FriendGroups.enable_oqueue FriendGroups_Update() end },
	},
}
 
FriendGroups_Menu.initialize = function(self, level)
	if not menu_items[level] then return end
    for _, items in ipairs(menu_items[level]) do
		local info = UIDropDownMenu_CreateInfo()
		for prop, value in pairs(items) do
			info[prop] = value ~= "" and value or UIDROPDOWNMENU_MENU_VALUE ~= "" and UIDROPDOWNMENU_MENU_VALUE or "[no group]"
		end
		info.arg1 = k
		info.arg2 = UIDROPDOWNMENU_MENU_VALUE
		UIDropDownMenu_AddButton(info, level)
	end
end

local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_LOGIN")

frame:SetScript("OnEvent", function(self, event, ...)
    if not E.db.euiscript.FriendGroups.enable then return; end
	
	if event == "PLAYER_LOGIN" then
        Hook("FriendsList_Update", FriendGroups_Update, true)
        --if other addons have hooked this, we should too
        if not issecurevariable("FriendsFrame_UpdateFriends") then
            Hook("FriendsFrame_UpdateFriends", FriendGroups_UpdateFriends)
        end
        Hook("FriendsFrameFriendButton_OnClick", FriendGroups_OnClick)
        Hook("UnitPopup_OnClick", FriendGroups_OnFriendMenuClick, true)
        Hook("UnitPopup_HideButtons", FriendGroups_HideButtons, true)
        
        FriendsFrameFriendsScrollFrame.dynamic = FriendGroups_GetTopButton
        FriendsFrameFriendsScrollFrame.update = FriendGroups_UpdateFriends
		
		--add some more buttons
		FriendsFrameFriendsScrollFrame.buttons[1]:SetHeight(FRIENDS_BUTTON_HEADER_HEIGHT)
		HybridScrollFrame_CreateButtons(FriendsFrameFriendsScrollFrame, "FriendsFrameButtonTemplate")
        
        table.remove(UnitPopupMenus["BN_FRIEND"], 5) --remove target option
        
        --add our add/remove group buttons to the friend list popup menus
        for _,menu in ipairs(friend_popup_menus) do
			table.insert(UnitPopupMenus[menu], #UnitPopupMenus[menu], "INTERACT_SUBSECTION_TITLE")
			table.insert(UnitPopupMenus[menu], #UnitPopupMenus[menu], "FRIEND_GROUP_NEW")
			table.insert(UnitPopupMenus[menu], #UnitPopupMenus[menu], "FRIEND_GROUP_ADD")
            table.insert(UnitPopupMenus[menu], #UnitPopupMenus[menu], "FRIEND_GROUP_DEL")
        end
    end
end)


local addon, ns = ...;
local Addon = gsub(addon,"_Journal","");
local levelIdx,qualityIdx,classIdx,classSpecIdx,portraitIdx,modelIdx,modelHeightIdx,modelScaleIdx,abilitiesIdx,countersIdx,traitsIdx,isCollectableIdx = 1,2,3,4,5,6,7,8,9,10,11,12; -- table indexes for FollowerLocationInfoData.basics entries.
local L,D,LC,journalVisibleEntries,activeFilter={},{},{},{},{};
local tconcat,tsort = table.concat,table.sort;
local CurrentFollower,CurrentFollower_reloaded,journalCollapsedZones,FollowerLocationInfoJournalFollowerList_UpdateVisibleEntries;
local searchText,ttShown,timeout = false,false,false;
local SPECS = LEVEL_UP_SPECIALIZATION_LINK:match("%[(.*)%]");
local NUM_FILTERS = 3;
local listPrefix = LOCALE_zhCN and "&#xB7;" or "&#xA0;&#x2022;&#xA0;";
local filter_collected = nil;
local LDDM = LibStub("LibDropDownMenu");


----------------------------
--- Misc local functions ---
----------------------------
do
	local addon_short = "FLI";
	local colors = {"0099ff","00ff00","ff6060","44ffff","ffff00","ff8800","ff44ff","ffffff"};
	local function colorize(...)
		local t,c,a1 = {tostringall(...)},1,...;
		if type(a1)=="boolean" then tremove(t,1); end
		if a1~=false then
			tinsert(t,1,"|cff0099ff"..((a1==true and addon_short) or (a1=="||" and "||") or addon).."|r"..(a1~="||" and HEADER_COLON or ""));
			c=2;
		end
		for i=c, #t do
			if not t[i]:find("\124c") then
				t[i],c = "|cff"..colors[c]..t[i].."|r", c<#colors and c+1 or 1;
			end
		end
		return unpack(t);
	end
	function ns.print(...)
		print(colorize(...));
	end
	function ns.debug(...)
		ConsolePrint(date("|cff999999%X|r"),colorize(...));
	end
end

local function pairsByKeys(t, f)
	local i,a = 0,{};
	for k in pairs(t) do
		tinsert(a, k);
	end
	tsort(a, f);
	return function() -- iterator function
		i=i+1
		if a[i]~=nil then
			return a[i], t[a[i]]
		end
	end;
end

local function pairsByFields(t, f1, ...)
	local i,a = 0,{};
	for k,v in pairs(t) do
		local f = tostring(v[f1] or " ");
		for _,fn in ipairs({...})do
			if v[fn] then
				f=f..tostring(v[fn]);
			end
		end
		tinsert(a,{k,f});
	end
	tsort(a,function(b,c) return b[2]<c[2]; end);
	return function()
		i=i+1;
		if a[i]~=nil then
			return a[i][1], t[a[i][1]];
		end
	end;
end

local function Loading(active,appendMsg,opt)
	local f=FollowerLocationInfoJournalDesc.Loading;
	if(active)then
		f:Show();
		if(type(appendMsg)=="string")then
			local tbl,str = {}, (opt~="new" and f.Info:GetText() or "");
			if(opt~="nobr" and strlen(str)>0)then
				tinsert(tbl,str);
			end
			if(opt=="nobr")then
				tinsert(tbl,str..appendMsg);
			else
				tinsert(tbl,appendMsg);
			end
			f.Info:SetText(tconcat(tbl,"|n"));
		end
	else
		f:Hide();
	end
end

function CreateExternalURL(Type,Id)
	local url,Target = nil,Type=="player" and "BattleNet" or FollowerLocationInfoDB.ExternalURL;
	local uTypes = FollowerLocationInfo.ExternalURL_unsupportedTypes;
	if not (uTypes[Target] and uTypes[Target][Type]==true) then
		url = ("|c%s|Hexternalurl:%s:%s|h[%s]|h|r"):format(LC.color("quality5"),Type,Id,L["Link to"].." "..Target);
	end
	return url;
end

-----------------------
--- Search / Filter ---
-----------------------
local GetFilterText = {
	collected = function(i) return i and COLLECTED or NOT_COLLECTED; end,
	classes   = function(i) return D.classes[i][3]; end,
	classspec = function(i) return D.classSpec[i][1]; end,
	qualities = function(i) return D.qualities[i][2]; end,
	traits    = function(i) return D.traits[i].name; end,
	abilities = function(i) return D.abilities[i].name; end,
	counters  = function(i) return D.counters[i].name; end,
	others    = function(i) return L[i]; end
};

function FollowerLocationInfoJournal_UpdateFilter()
	local p,last = FollowerLocationInfoJournal.Filter,0;
	for i=1, NUM_FILTERS do
		local f,af = p["Filter"..i],activeFilter[i];
		f.Title:SetText(FILTER..(" %d/%d"):format(i,NUM_FILTERS));
		if (af) then
			f.Text:SetText( GetFilterText[af[1]](af[2]) );
			f:Show(); f.Remove:Show();
			last=i;
		elseif(i==(last+1)) then
			f.Text:SetText("");
			f:Show(); f.Remove:Hide();
		else
			f.Text:SetText("");
			f:Hide(); f.Remove:Hide();
		end
	end
	FollowerLocationInfoJournalFollowerList_UpdateVisibleEntries();
	FollowerLocationInfoJournalFollowerList_Update();
end

function FollowerLocationInfoJournal_SetFilter(filterID,filterType,filterValue)
	activeFilter[filterID]={filterType,filterValue};
	if filterType=="collected" then
		filter_collected = filterValue;
	end
	FollowerLocationInfoJournal_UpdateFilter();
end

function FollowerLocationInfoJournal_ClearFilter(self,button)
	PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON);
	if button=="RightButton" then
		wipe(activeFilter);
		filter_collected=nil;
	else
		if activeFilter[self:GetParent():GetID()][1]=="collected" then
			filter_collected=nil;
		end
		table.remove(activeFilter,self:GetParent():GetID());
	end
	FollowerLocationInfoJournal_UpdateFilter();
end

function FollowerLocationInfoJournal_SearchText(self)
	SearchBoxTemplate_OnTextChanged(self)
	searchText = self:GetText() or false;
	if(searchText~=false and strlen(searchText)==0)then
		searchText = false;
	end
	FollowerLocationInfoJournalFollowerList_UpdateVisibleEntries();
	FollowerLocationInfoJournalFollowerList_Update();
end

function FollowerLocationInfoJournal_FilterMenu(parent)
	local menus,disabled = {classes={},classspec={},qualities={},abilities={},traits={},counters={},others={}},{};
	local labelStr,labelStrDisabled,entries,cMax,page,filterID = "%s (|cff%s%s|r/|cff%s%s|r)","%s (%s/%s)",{},20,1,parent:GetParent():GetID();
	local separator={ text="", dist=0, isTitle=true, notCheckable=true, isNotRadio=true, sUninteractable=true, iconOnly=true, icon="Interface\\Common\\UI-TooltipDivider-Transparent", tCoordLeft=0, tCoordRight=1, tCoordTop=0, tCoordBottom=1, tFitDropDownSizeX=true, tSizeX=0, tSizeY=8, iconInfo={tCoordLeft=0, tCoordRight=1, tCoordTop=0, tCoordBottom=1, tFitDropDownSizeX=true, tSizeX=0, tSizeY=8} };
	local MenuFrame = _G.FollowerLocationInfo_LibDropDownMenu;
	if not MenuFrame then
		MenuFrame = LDDM.Create_DropDownMenu("FollowerLocationInfo_LibDropDownMenu",UIParent);
	end

	local function get_counter(n,i,noColor)
		local v = {};
		if(i and type(D.counter[n][i])=="table")then
			v = D.counter[n][i];
		elseif(type(D.counter[n])=="table")then
			v = D.counter[n];
		end
		if noColor then
			return v[2] or "?", v[1] or "?";
		end
		return (type(v[2])=="number" and v[2]>0) and "00ff00" or "999999", v[2] or "?", "ffee00", v[1] or "?";
	end

	local function SetFilter(self)
		FollowerLocationInfoJournal_SetFilter(unpack(self.arg1));
	end

	local active = {};
	for i=1, #activeFilter do
		if active[activeFilter[i][1]]==nil then
			active[activeFilter[i][1]]={};
		end
		active[activeFilter[i][1]][activeFilter[i][2]]=true;
	end

	-- CLASSES
	local sortedClasses = CopyTable(D.classes);
	tsort(sortedClasses,function(a,b) return a[3]<b[3]; end);
	for i,v in ipairs(sortedClasses) do
		if D.counter.class[v[1]] then
			local label = labelStr:format(
				LC.color(v[2],v[3]),
				D.counter.class[v[1]][2]>0 and "00ff00" or "999999",
				D.counter.class[v[1]][2],"ffee00",
				D.counter.class[v[1]][1]
			);
			tinsert(menus.classes,{text=label, func=SetFilter, notCheckable=true, arg1={filterID,"classes",v[1]}});
		end
	end

	-- CLASS SPECS
	for specId, specData in pairsByFields(D.classSpec,3,1)do
		if D.counter.classspec[specId] and D.counter.classspec[specId][1]>0 then
			local disabled, label = false, labelStr:format(LC.color(specData[2],specData[1]), get_counter("classspec",specId));
			if (active.classes~=nil and active.classes[specData[4]]~=true) then
				disabled,label = true,labelStrDisabled:format(specData[1], get_counter("classspec",specId,true));
			end
			tinsert(menus.classspec,{text=label, func=SetFilter, notCheckable=true, arg1={filterID,"classspec",specId}, disabled=disabled});
		end
	end

	-- Qualities
	for k,v in ipairs(D.qualities) do
		if(D.counter.qualities[v[1]])then
			local label = labelStr:format(LC.color("quality"..v[1],v[2]), get_counter("qualities",v[1]));
			tinsert(menus.qualities,{text=label, func=SetFilter, notCheckable=true, arg1={filterID,"qualities",v[1]}});
		end
	end

	-- Traits
	local lastTitle = false;
	for k,v in pairsByFields(D.traits,"category","name")do
		--if D.counter.traits[k][1]>0 then
			if lastTitle~=v.category then
				if lastTitle~=false then
					tinsert(menus.traits,{separator=true});
				end
				tinsert(menus.traits,{label=v.category, title=true});
				lastTitle=v.category;
			end
			local label = labelStr:format(v.name, get_counter("traits",k));
			tinsert(menus.traits,{text=label, icon=v.icon, func=SetFilter, notCheckable=true, arg1={filterID,"traits",k}});
		--end
	end

	-- Abilities
	for k,v in pairsByFields(D.abilities,"name") do
		if D.counter.abilities[k][1]>0 then
			local disabled,label = false,labelStr:format(v.name, get_counter("abilities",k));
			local counters = D.ability2counters[k];
			for i in pairs(counters) do
				if(active.counters~=nil and active.counters[i]~=true)then
					disabled,label = true,labelStrDisabled:format(v.name,get_counter("abilities",k,true));
				end
			end
			tinsert(menus.abilities,{text=label, icon=v.icon, func=SetFilter, notCheckable=true, arg1={filterID,"abilities",k}, disabled=disabled});
		end
	end

	-- Counters
	for k,v in pairsByFields(D.counters,"name") do
		if D.counter.counters[k][1]>0 then
			local label = labelStr:format(v.name, get_counter("counters",k));
			tinsert(menus.counters,{text=label, icon=v.icon, func=SetFilter, notCheckable=true, arg1={filterID,"counters",k}});
		end
	end

	-- other filter options
	for i,v in pairsByFields(D.otherFiltersOrder,2)do
		local label = labelStr:format(LC.color("white",v[2]),D.otherFiltersCount[v[1]][1]>0 and "00ff00" or "999999",D.otherFiltersCount[v[1]][2],"ffee00",D.otherFiltersCount[v[1]][1]);
		tinsert(menus.others,{text=label, func=SetFilter, notCheckable=true, arg1={filterID,"others",v[1]}});
	end

	-- check on empty submenus and disable it
	for i,v in pairs(menus)do
		if #menus[i]==0 then
			disabled[i]=true;
			menus[i]=nil;
		end
	end

	-- check on active filters and disable submenus
	for i=1, #activeFilter do
		if(filterID~=i)then
			disabled[activeFilter[i][1]]=true;
			menus[activeFilter[i][1]]=nil;
		end
	end

	local menuList={
		{ text = COLLECTED, func=SetFilter, arg1={filterID,"collected",true}, disabled = filter_collected==true, notCheckable=true},
		{ text = NOT_COLLECTED, func=SetFilter, arg1={filterID,"collected",false}, disabled = filter_collected==false, notCheckable=true},
		separator,
		{ text = L["Classes"], menuList=menus.classes, disabled = disabled.classes, notCheckable=true, hasArrow=true },
		{ text = SPECS, menuList=menus.classspec, disabled = disabled.classspec, notCheckable=true, hasArrow=true },
		{ text = QUALITY, menuList=menus.qualities, disabled = disabled.qualities, notCheckable=true, hasArrow=true },
		{ text = GARRISON_TRAITS, menuList=menus.traits, disabled = disabled.traits, notCheckable=true, hasArrow=true },
		{ text = ABILITIES, menuList=menus.abilities, disabled = disabled.abilities, notCheckable=true, hasArrow=true },
		{ text = L["Counters"], menuList=menus.counters, disabled = disabled.counters, notCheckable=true, hasArrow=true },
		{ text = L["Obtainable by"], menuList=menus.others, disalbed = disabled.others, notCheckable=true, hasArrow=true },
		separator,
		{text=CANCEL, notCheckable=true, isNotRadio=true, func=function() LDDM.CloseDropDownMenus(); end}
	};

	PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON);
	MenuFrame.point = "TOPLEFT";
	MenuFrame.relativePoint = "TOPRIGHT";
	LDDM.EasyMenu(menuList, MenuFrame, parent, 0, 0, "MENU");
end


--------------------------------------
--- Journal FollowerList Functions ---
--------------------------------------
function FollowerLocationInfoJournal_OnHyperlinkEnter(self,link,text,forced)
	local forceReload,ttImageSize,tt=false,300;
	-- all "garr" prefixed hyperlinks are part of a special tooltip type
	-- and doesn't work with normal GameTooltip:SetHyperlink().
	if(link:match("^garr"))then
		if(link:match("^garrfollowerability"))then
			local _,id = strsplit(HEADER_COLON,link);
			if D.build>70000000 then
				local tooltip = _G[GarrisonFollowerOptions[LE_FOLLOWER_TYPE_GARRISON_6_0 or Enum.GarrisonFollowerType.FollowerType_6_0].abilityTooltipFrame];
				tooltip:ClearAllPoints();
				if FollowerLocationInfoData.journalDocked then
					tooltip:SetPoint("LEFT", CollectionsJournal, "RIGHT", 1, 0);
				else
					tooltip:SetPoint("LEFT", FollowerLocationInfoJournalFrame, "RIGHT", -10, 0);
				end
				--tooltip:SetPoint("LEFT", self, "RIGHT", 4, 0);
				GarrisonFollowerAbilityTooltip_Show(tooltip, tonumber(id), LE_FOLLOWER_TYPE_GARRISON_6_0 or Enum.GarrisonFollowerType.FollowerType_6_0);
			else
				tt=GarrisonFollowerAbilityTooltip;
				tt:ClearAllPoints();
				if FollowerLocationInfoData.journalDocked then
					tt:SetPoint("LEFT", CollectionsJournal, "RIGHT", 1, 0);
				else
					tt:SetPoint("LEFT", FollowerLocationInfoJournalFrame, "RIGHT", -10, 0);
				end
				GarrisonFollowerAbilityTooltip_Show(tonumber(id),LE_FOLLOWER_TYPE_GARRISON_6_0 or Enum.GarrisonFollowerType.FollowerType_6_0);
			end
		end
	else
		tt=GameTooltip;
		tt:Hide(); tt:ClearLines();
		tt:SetOwner(FollowerLocationInfoJournalDesc,"ANCHOR_NONE");
		if FollowerLocationInfoData.journalDocked then
			tt:SetPoint("LEFT", CollectionsJournal, "RIGHT", 1, 0);
		else
			tt:SetPoint("LEFT", FollowerLocationInfoJournalFrame, "RIGHT", -10, 0);
		end

		if(link:match("^image"))then
			-- custom hyperlink type "image"
			local _,id,idx = strsplit(HEADER_COLON,link);
			tt:AddLine(("|TInterface\\AddOns\\FollowerLocationInfo\\media\\follower_%s_%s:%d:%d:0:0|t"):format(id,idx,ttImageSize,ttImageSize));
			forceReload=true;
		elseif(link:match("^externalurl"))then
			-- custom hyperlink type "externalurl"
			if(link:match("player"))then
				tt:AddLine(L["Link to"].." BattleNet");
			else
				tt:AddLine(L["Link to"].." "..FollowerLocationInfoDB.ExternalURL);
			end
			tt:AddLine(L["Opening a dialog popup with the web address"]);
		elseif(link:match("^tomtom"))then
			-- custom hyperlink type "tomtom"
			local _, zone, x, y, label = strsplit(HEADER_COLON,link);
			tt:AddLine("TomTom");
			if label~="-" then
				tt:AddDoubleLine(L["Label"],label);
			end

			tt:AddDoubleLine(ZONE,C_Map.GetMapInfo(zone).name);
			tt:AddDoubleLine(L["Coordinations"],x..", "..y);
			tt:AddLine(" ");
			tt:AddDoubleLine(L["Left-click"],L["Add waypoint to TomTom"]);
		else
			-- regular blizzard hyperlinks
			tt:SetHyperlink(link);
		end

		tt:Show();
	end
	if forceReload and forced~=true then
		C_Timer.After(0.2,function()
			if tt:IsShown() then
				tt:Hide();
				tt:ClearLines();
				FollowerLocationInfoJournal_OnHyperlinkEnter(self,link,text,true);
			end
		end);
	end
end

function FollowerLocationInfoJournal_OnHyperlinkLeave(self,link,text)
	ttShown=false;
	GameTooltip:Hide();
	GarrisonFollowerAbilityTooltip:Hide();
end

function FollowerLocationInfoJournal_OnHyperlinkClick(self,link,text,button)
	PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON);
	local Type = link:match("^([a-zA-Z0-9]*):");
	-- creates an modifier string with fixed order. -- [Alt][Shift][Ctrl]
	local Modifiers = (IsAltKeyDown() and "Alt" or "") .. (IsShiftKeyDown() and "Shift" or "") .. (IsControlKeyDown() and "Ctrl" or "");

	--- blizzHyperlinks & customizedHyperlinks
	-- that defines default and customized hyperlink actions on regular and FLI internal hyperlinks.
	-- [<linkType>] = true or {[<Modifier + Button>] = true}
	local customizedHyperlinks = {
		image=true,
		tomtom=true,
		achievement={LeftButton=true},
		externalurl=true
	};

	local blizzHyperlinks = {
		spell=true,
		unit=true,
		achievement=true
	};

	if customizedHyperlinks[Type]==true or (type(customizedHyperlinks[Type])=="table" and customizedHyperlinks[Type][Modifiers..button]==true) then
		if Type=="tomtom" then
			local _, zone, x, y, title = strsplit(HEADER_COLON,link);
			zone,x,y=tonumber(zone),tonumber(x)/100,tonumber(y)/100;
			if tostring(title):len()>0 then
				title = {title=title};
			else
				title = nil;
			end
			-- TomTom:AddWaypoint(<mapId>,<x>,<y>,<optionTable>)
			local uid = TomTom:AddWaypoint(zone,x,y,title);
		elseif Type=="achievement" then
			local id = tonumber(link:match("achievement:(%d+)"));
			if ( not AchievementFrame ) then
				AchievementFrame_LoadUI();
			end

			if ( not AchievementFrame:IsShown() ) then
				AchievementFrame_ToggleAchievementFrame();
				AchievementFrame_SelectAchievement(id);
			else
				if ( AchievementFrameAchievements.selection ~= id ) then
					AchievementFrame_SelectAchievement(id);
				else
					AchievementFrame_ToggleAchievementFrame();
				end
			end
		elseif Type=="externalurl" then
			local _, oType, oId, oRealm = strsplit(HEADER_COLON,link);
			StaticPopup_Show("FOLLOWERLOCATIONINFO_EXTERNALURL_DIALOG",nil,nil,{oType,oId,oRealm});
		end
		-- Type=="image" -- no action
	elseif blizzHyperlinks[Type]==true then
		SetItemRef(link,text,button,self);
	end
	-- StaticPopup_Show("FOLLOWERLOCATIONINFO_EXTERNALURL_DIALOG",nil,nil,{<Type[string]>,<Id[number|string]>});
end


--------------------------------------
--- Journal FollowerList Functions ---
--------------------------------------
function FollowerLocationInfoJournalFollowerList_UpdateVisibleEntries()
	if(not journalCollapsedZones)then
		journalCollapsedZones = {};
		for i,v in pairs(D.zoneOrder)do
			journalCollapsedZones[v] = false;
		end
		journalCollapsedZones[0.3] = true;
		journalCollapsedZones[0.4] = true;
	end

	local Zone = {};
	for i,v in pairs(D.zoneOrder)do
		Zone[v] = {};
	end

	-- filter[<classes|classspec|traits|abilities|counters|others>] = <value[number|string]>
	local filter = {};
	if #activeFilter>0 then
		for i,v in ipairs(activeFilter) do
			filter[v[1]] = v[2];
		end
	else
		filter = false;
	end

	for id, v in pairs(D.basics)do
		local add = true;

		if filter then

			if filter.collected==true and not D.collected[id] then
				add = false;
			elseif filter.collected==false and D.collected[id] then
				add = false;
			end
			if filter.classes and filter.classes~=v[classIdx] then
				add = false;
			end
			if filter.classspec and filter.classspec~=v[classSpecIdx] then
				add = false;
			end
			if filter.qualities and filter.qualities~=v[qualityIdx] then
				add = false;
			end
			if filter.abilities then
				local tmp = false;
				for i=1, #v[abilitiesIdx] do
					if filter.abilities==v[abilitiesIdx][i] then
						tmp = true;
					end
				end
				if(not tmp)then
					add = false;
				end
			end
			if filter.counters then
				local tmp = false;
				for i=1, #v[countersIdx] do
					if filter.counters==v[countersIdx][i] then
						tmp = true;
					end
				end
				if(not tmp)then
					add = false;
				end
			end
			if filter.traits then
				local tmp = false;
				for i=1, #v[traitsIdx] do
					if filter.traits==v[traitsIdx][i] then
						tmp = true;
					end
				end
				if(not tmp)then
					add = false;
				end
			end
			if filter.others and D.otherFilters[filter.others][id]~=true then
				add = false;
			end
		else
			add = true;
		end

		if type(searchText)=="string" and rawget(L,"follower_"..id)~=nil and not L["follower_"..id]:lower():match(searchText:lower()) then
			add = false;
		end

		if(add)then
			local zone,from = 0.4,0;
			if(not v[isCollectableIdx])then
				zone = 0.3; -- recruitable follower by Lunarfall Inn / Frostwall Tavern
				from = 1;
			elseif(D.descriptions[id])then
				zone = D.descriptions[id].zone; -- zone id is part of the description
				from = 2;
				if(D.zone2zoneGroup[zone])then
					zone = D.zone2zoneGroup[zone];
					from = 3;
				end
			end
			tinsert(Zone[zone],id);
		end
	end

	local entries = {};
	for _,zoneID in pairs(D.zoneOrder)do
		if(#Zone[zoneID]>0)then
			tinsert(entries,{zoneID, D.zoneNames[zoneID], journalCollapsedZones[zoneID], #Zone[zoneID]});
			if(not journalCollapsedZones[zoneID])then
				for i,v in ipairs(Zone[zoneID])do
					tinsert(entries,v);
				end
			end
		end
	end

	journalVisibleEntries = entries;
end

function FollowerLocationInfoJournalFollowerList_Update()
	if(not FollowerLocationInfoJournal:IsVisible())then return end
	local self = FollowerLocationInfoJournalFollowerList;

	local cGroups = {};
	local nButtons,nEntries,button,index,id=#self.buttons,#journalVisibleEntries;

	-- Update scroll frame
	if ( not FauxScrollFrame_Update(self, nEntries, nButtons, self.buttonHeight,nil,nil,nil,nil,nil,nil,true ) ) then
		self.ScrollBar:SetValue(0);
	end

	local offset = FauxScrollFrame_GetOffset(self);

	for i=1, nButtons do
		button = self.buttons[i];
		index = offset + i;

		if index<=nEntries then
			id = journalVisibleEntries[index];

			button.collected:Hide();
			button.notCollectable:Hide();
			button.buyable:Hide();
			button.followerID:Hide();
			button.tooltip=nil;
			button.selected:Hide();

			if(type(id)=="table")then
				button.zoneToggle.id=id[1];
				button.zoneToggle:SetNormalTexture("Interface\\Buttons\\UI-"..(not id[3] and "Minus" or "Plus").."Button-Up");
				if id[4]==0 then
					button.zone:SetText("|cff888888"..L[id[2]].."|r");
					button.zoneToggle:Disable();
				else
					button.zone:SetText(L[id[2]]);
					button.zoneToggle:Enable();
				end
				button.zoneToggle:Show();
				button.zone:Show();
				if(button.portrait)then
					button.portrait:Hide();
				end
				button.name:Hide();
				button.quality:Hide();
				button.background:Hide();
				button:Disable();
			else
				if(button.portrait)then
					GarrisonFollowerPortrait_Set(button.portrait,D.basics[id][portraitIdx]);
				end

				button.id = id;
				local name = LC.color(D.classes[D.basics[id][classIdx]][2],L["follower_"..id]);
				button.name:SetText(name);
				button.tooltip={name};

				if (D.basics[id][qualityIdx]) then
					local q = D.basics[id][qualityIdx];
					local c = ITEM_QUALITY_COLORS[q];
					tinsert(button.tooltip,("%s: %s%s|r"):format(QUALITY,c.hex, _G[("ITEM_QUALITY%d_DESC"):format(q)]));
					button.quality:SetVertexColor(c.r, c.g, c.b);
				end

				-- check collected status
				if(D.collected[id])then
					button.collected:Show();
				end

				-- check collect group membership
				if ((D.descriptions[id]) and D.descriptions[id].collectGroup) then
					if(D.collected[id])then
						tinsert(button.tooltip,"|cff00bb00"..L["This follower is member of a collect group and already collected."].."|r");
					else
						local collected = false;
						for i,v in ipairs(D.descriptions[id].collectGroup)do
							if D.collected[v] then
								collected=true;
							end
						end
						if (collected) then
							--button.notCollectable:Show();
							button.buyable:Show();
							tinsert(button.tooltip,"|cffff8800"..L["This follower is member of a collect group."].." "..L["The quest row is completed. Now, this follower is buyable from a npc in your garrison."].."|r");
						else
							tinsert(button.tooltip,"|cffffcc00"..L["This follower is member of a collect group."].." "..L["You can obtain one of it by quest row. Later, the other followers are buyable from a npc in your garrison."].."|r");
						end
					end
				end

				button.followerID:SetText("ID: "..id);
				if (FollowerLocationInfoDB.ShowFollowerID) then
					button.followerID:Show();
					tinsert(button.tooltip,"|cffbbbbbb"..L["FollowerID"]..CHAT_HEADER_SUFFIX..id.."|r");
				end

				button.zoneToggle:Hide();
				button.zone:Hide();
				if(button.portrait)then
					button.portrait:Show();
				end
				button.name:Show();
				button.quality:Show();
				button.background:Show();
				if(self.selected == id)then
					button.selected:Show();
				end

				button:Enable();
			end
			button:Show();
		else
			button:Hide();
		end
	end
end

function FollowerLocationInfoJournalFollowerList_OnVerticalScroll(self,offset)
	FauxScrollFrame_OnVerticalScroll(self, offset, self.buttonHeight, FollowerLocationInfoJournalFollowerList_Update);
end

function FollowerLocationInfoJournalFollowerList_OnLoad(self)
	self.ScrollBar:SetPoint("TOPLEFT", self, "TOPRIGHT", 8, -16);
	self.ScrollBar:SetPoint("BOTTOMLEFT", self, "BOTTOMRIGHT", 8, 16);
	self.offset = 0;
	self.buttonHeight = 33;

	local maxButtons = 12;
	if FollowerLocationInfoData.journalDocked then
		maxButtons = 13;
	end

	self.buttons = {};
	for i=1, maxButtons do
		self.buttons[i] = CreateFrame("Button",nil,self,"FollowerLocationInfoJournalFollowerList_ButtonTemplate");
		if(i==1)then
			self.buttons[i]:SetPoint("TOP", self, "TOP", 0, 0);
		else
			self.buttons[i]:SetPoint("TOP", self.buttons[i-1], "BOTTOM", 0, -1);
		end
	end
end

function FollowerLocationInfoJournal_ToggleZone(zoneID)
	if(rawget(D.zoneNames,zoneID))then
		journalCollapsedZones[zoneID] = not journalCollapsedZones[zoneID];
	end
	local scroll = FollowerLocationInfoJournalFollowerList;
	local offset = HybridScrollFrame_GetOffset(scroll);
	FollowerLocationInfoJournalFollowerList_UpdateVisibleEntries();
	FollowerLocationInfoJournalFollowerList_Update();
end


---------------------------------------------------
--- Journal Follower Card&Description Functions ---
---------------------------------------------------
function FollowerLocationInfoJournalFollowerCard_Update()
	local id = CurrentFollower;
	local data = FollowerLocationInfoJournalFollowerCard.Data;
	local model = FollowerLocationInfoJournalFollowerCard.model;
	local link;

	if id then
		link = CreateExternalURL("gf",id) or "|n";
	else
		link = CreateExternalURL("player",UnitName("player")) or "|n";
	end

	local html = "<html><body>"..
				 "<h1>|c%1$s%2$s|r</h1>"..
				 "<p>|c%1$s%3$s|r</p>"..
				 "<p>"..link.."</p>"..
				 ((LOCALE_zhCN or LOCALE_zhTW) and "<p>|n</p>" or "<p>|n</p><br/>")..
				 "<h3>|cffffcc00"..LEVEL..":|r %4$s</h3>"..
				 "<p>|n</p>"..
				 "<h3>|cffffcc00"..QUALITY..":|r %5$s</h3>"..
				 "<p>|n</p>"..
				 "<h3>|cffffcc00"..ABILITIES.."/"..GARRISON_TRAITS..":|r</h3>"..
				 "%6$s"..
				 "</body></html>";

	if(id)then
		local basic = D.basics[id];
		local abilitiesStr = "";
		if(#basic[abilitiesIdx]>0 or #basic[traitsIdx]>0)then
			local Abs = {};
			for i,v in ipairs(basic[abilitiesIdx])do
				if D.abilities[v] then
					abilitiesStr = abilitiesStr .. "<h3>|T" .. D.abilities[v].icon .. ":0|t " .. D.abilities[v].link.."</h3>";
				else
					tinsert(D.errors,"ability-"..v.."-missing");
				end
			end
			for i,v in ipairs(basic[traitsIdx])do
				if D.traits[v] then
					abilitiesStr = abilitiesStr .. "<h3>|T" .. D.traits[v].icon .. ":0|t " .. D.traits[v].link.."</h3>";
				else
					tinsert(D.errors,"triat-"..v.."-missing");
				end
			end
		end

		-- is it really possible? error report on comment #225 looks like an empty D.classSpec[basic[classSpecIdx]]
		if D.classSpec[basic[classSpecIdx]]==nil then
			local v = C_Garrison.GetFollowerInfo(id);
			local class = gsub(v.classAtlas,"GarrMission_ClassIcon%-",""):lower();
			D.classSpec[basic[classSpecIdx]]={
				C_Garrison.GetFollowerClassSpecName(id), -- localized class specialization name
				class, -- englsh class name
				LOCALIZED_CLASS_NAMES_MALE[class:upper()], -- localized class name
				D.ClassName2ID[v.class] -- class id
			};
		end

		data:SetText(html:format(
			LC.color(D.classes[basic[classIdx]][2]),
			L["follower_"..id],
			D.classSpec[basic[classSpecIdx]][1],
			basic[levelIdx],
			LC.color("quality"..basic[qualityIdx],_G["ITEM_QUALITY"..basic[qualityIdx].."_DESC"]),
			abilitiesStr
		));
		model:SetDisplayInfo(basic[modelIdx]);

		data:Show();
		model:Show();

	elseif( true )then

		local quality = 6;
		local _,class,classID = UnitClass("player"); -- 6
		local classSpec = GetSpecialization(); -- 2
		if classID and classSpec and D.playerSpec[classID][classSpec] and D.classSpec[D.playerSpec[classID][classSpec]] then
			classSpec = D.classSpec[D.playerSpec[classID][classSpec]][1];
		else
			--[=[
			ns.print(
				classID,
				classSpec,
				D.playerSpec[classID][classSpec],
				D.classSpec[D.playerSpec[classID][classSpec]]
			);
			--]=]
			classSpec = UNKNOWN;
		end

		local abilities = {};
		for i,v in ipairs({GetProfessions()}) do
			if i<=3 then
				local name, icon = GetProfessionInfo(v);
				if name and D.playerTraits[name] and D.traits[D.playerTraits[name]] then
					local v = D.traits[D.playerTraits[name]];
					tinsert(abilities,"|T" .. v.icon .. ":0|t " .. v.link);
				end
			end
		end

		data:SetText(html:format(
			LC.color(class),
			UnitName("player"),
			classSpec,
			UnitLevel("player"),
			LC.color("quality"..quality,_G["ITEM_QUALITY"..quality.."_DESC"]),
			#abilities>0 and "<h3>"..tconcat(abilities,", ").."</h3>" or ""
		));
		model:SetUnit("player");

		data:Show();
		model:Show();
	else
		data:Hide();
		model:Hide();
	end
end

local h1,h2,h3,lnk,a = "<h1>%s</h1><p>|TInterface\\AddOns\\FollowerLocationInfo\\media\\%s:9:356:0:8:128:16:0:24:0:16|t</p>","<h2>%s</h2><p>|TInterface\\AddOns\\FollowerLocationInfo\\media\\%s:9:256:0:8:128:16:24:64:0:16|t</p>","<h3>%s</h3>","|c%s|H%s|h[%s]|h|r","<a href='%s'>%s</a>";
local p,pl,pr,br,img = "<p>%s</p>","<p align='left'>%s</p>","<p align='right'>%s</p>","<br/>","|cFF33aaff|Himage:%1$s:%2$s|h[Image? %2$d]|h|r";
local checked = " |TInterface\\Buttons\\UI-CheckBox-Check:14:14:0:0:32:32:3:29:3:29|t";
local stateColor = {[0]="ff0000","ff9900","04ff07","ffffff"};
local SharedElements,AddDescription = {},{};

SharedElements["Garrison building"]=function(_,id)
	local glvl = C_Garrison.GetGarrisonInfo(LE_GARRISON_TYPE_6_0 or Enum.GarrisonType.Type_6_0);
	local result,state,Name,Lvl,name,lvl,_= {},0;
	_,name,_,_,_,lvl = C_Garrison.GetBuildingInfo(id);
	if glvl~=nil and  glvl>0 then
		for i,v in ipairs(C_Garrison.GetBuildings(LE_GARRISON_TYPE_6_0 or Enum.GarrisonType.Type_6_0))do
			_,Name,_,_,_,Lvl = C_Garrison.GetBuildingInfo(v.buildingID);
			if(v.buildingID==id) or (name==Name)then
				state = 1;
				if(Lvl>=lvl)then
					state = 2;
				end
				break;
			end
		end
	end

	return	name,
			LEVEL .." ".. lvl .. (lvl<3 and " " .. L["or higher"] or ""),
			CreateExternalURL("b",id),
			{state=state,current=Lvl};
end;

SharedElements["Brawler's Guild"]=function(_, factionId, rank)
	local k, friendRep, friendMaxRep, friendName, _, _, friendTextLevel, friendThreshold, nextFriendThreshold = GetFriendshipReputation(factionId);
	if k~=nil then
		local state,standingNum = 0,tonumber(friendTextLevel:match("(%d+)"));
		if standingNum then
			state = 1;
			if standingNum>=rank then
				state = 2;
			end
		end
		return	friendName,
				RANK .. " " .. rank,
				CreateExternalURL("f",factionId),
				{state=state,current=("%s ( %d / %d )"):format(friendTextLevel,friendRep-friendThreshold,nextFriendThreshold)}
	end
	return SharedElements.Reputation(_, factionId, rank); -- [1691] Brawler's guild (Season 2) was changed to normal faction...
end

SharedElements.Professions=function(_,id,skillNeed)
	local state, current, Name, icon, skillLevel, maxSkillLevel=0, L["Not learned"];
	local name,_,icon = GetSpellInfo(id);
	local p = {GetProfessions()};
	for i=1,#p do
		if p[i] then
			Name, icon, skillLevel, maxSkillLevel = GetProfessionInfo(p[i]);
			if(name==Name)then
				state = 1;
				current = skillLevel.."/"..maxSkillLevel;
				if(skillLevel>=skillNeed)then
					state = 2;
				end
				break;
			end
		end
	end
	return	name,
			SKILL.." "..skillNeed,
			nil, -- CreateExternalURL("p",),
			{state=state,current=current};
end;

SharedElements.Reputation=function(_,id,standingNum)
	local name, _, standingID, barMin, barMax, barValue, _, _, _, _, hasRep, _, _, _, hasBonusRepGain, canBeLFGBonus = GetFactionInfoByID(id);
	local standingColor,chk,current = "red","",("%s ( %d / %d )"):format(_G["FACTION_STANDING_LABEL"..standingID],barValue-barMin,barMax);
	local state = 0;
	if standingID then
		state = 1;
		if standingID>=standingNum then
			state = 2;
		end
	end
	return	name,
			_G["FACTION_STANDING_LABEL"..standingNum],
			CreateExternalURL("f",id),
			{state=state,current=current};
end;

-- SharedElements.Friendship=function(_,id,standingNum) end;

SharedElements.Location=function(zoneId,coordX,coordY,customStr,tomtomLabel)
	local location,position,tomtom = "";

	if(type(coordX)=="number" and type(coordY)=="number")then
		position = ("%1.1f, %1.1f"):format(coordX,coordY);
		if TomTom and TomTom.AddWaypoint then
			tomtom = ("|cff33aaff|Htomtom:%d:%1.2f:%1.2f:%s|h[%s]|h|r"):format(zoneId,coordX,coordY,tomtomLabel or "",L["Add waypoint to TomTom"]);
		end
	end

	if(type(customStr)=="table") and (SharedElements[customStr[1]])then
		customStr = SharedElements[customStr[1]](unpack(customStr));
	elseif(type(customStr)=="string")then
		customStr = L[customStr];
	end

	if(position or customStr)then
		location = " @ " .. (position or customStr) .. ((position and customStr) and " ("..customStr..")" or "");
	end

	return C_Map.GetMapInfo(zoneId).name .. location, tomtom;
end;

SharedElements.Outpost=function(_,zone,option)
	local op,outpost = {},D.Outpost[zone][option];

	tinsert(op,L[outpost[1]]);

	local location,tomtom = SharedElements.Location(zone,outpost[2],outpost[3],nil,L[outpost[1]]);
	tinsert(op,location);
	if tomtom then
		tinsert(op,tomtom);
	end
	return tconcat(op,"|n"..listPrefix);
end

SharedElements.Images=function(followerId,imageTable,delimiter)
	local images,faction = {};
	for _,image in ipairs(imageTable)do
		if(type(image)=="table")then
			faction = (image[3]~=true and "") or (D.faction==1 and "a") or "h";
			tinsert(images,("|cFF55FFFF|Himage:%s:%s|h[%s]|h|r"):format(followerId..faction,image[1],L[image[2]]));
		end
	end
	return tconcat(images,delimiter);
end;

function AddDescription.Location(Desc)
	local locations = {};
	for i=2, #Desc do
		location = {};
		if(type(Desc[i])=="string")then
			tinsert(location,L[Desc[i]]);
		else
			local v = Desc[i];
			if(v[4])then
				tinsert(location,L[v[4]]);
			end
			local coords, tomtom = SharedElements.Location(v[1],v[2],v[3],nil,v[4]~=nil and L[v[4]]);
			tinsert(location,coords);
			if tomtom then
				tinsert(location,tomtom);
			end
			if(type(v.Images)=="table")then
				tinsert(location,SharedElements.Images(CurrentFollower,v.Images," "));
			end
		end
		tinsert(locations,tconcat(location,"|n"..listPrefix));
	end
	return p:format(tconcat(locations,"|n|n"));
end

function AddDescription.Quests(Desc)
	Loading(true,L["Collecting quest data... (%d entries)"]:format(#Desc-1),"new");
	local quests,doRetry = {},false;
	for i=2, #Desc do
		local quest,v,coord,index,zone,npc = {},Desc[i],"","","","";
		Loading(true,L["Query data (questId: %d)..."]:format(v[1]));
		if(type(v[1])=="number")then
			-- true=completed, number=inQuestLog, nil=open/notInLog
			index = (GetQuestLogIndexByID or C_QuestLog.GetLogIndexForQuestID)(v[1]);
			if(index and index>0)then
				D.QuestName[v[1]] = (GetQuestLogTitle or C_QuestLog.GetTitleForLogIndex)(index);
			end

			if(type(D.QuestName[v[1]])=="string")then
				tinsert(quest,lnk:format("ffffcc00", ("quest:%d:%d"):format(v[1],v[2]), D.QuestName[v[1]]));
			else
				doRetry = true;
			end
		end
		if(not doRetry and type(v[3])=="number")then
			if(v[3]<1)then
				local objId = gsub(tostring(v[3]),"^0%.","");
				if(rawget(L,"object_"..objId))then
					tinsert(quest,L["object_"..objId]);
				end
				--tinsert(quest,D.ObjectName[v[3]]);
			elseif(v[3]>=1)then
				if(type(D.NpcName[v[3]])=="string")then
					tinsert(quest,D.NpcName[v[3]]);
				else
					doRetry = true;
				end
			end
		end
		if(not doRetry)then
			local location, tomtom = SharedElements.Location(v[4],v[5],v[6],(type(v[5])=="table" or type(v[5])=="string") and v[5] or nil, (v[3] and D.NpcName[v[3]] or nil))
			tinsert(quest,location);
			if tomtom then
				tinsert(quest,tomtom);
			end

			local link = CreateExternalURL("q",v[1]);
			if link then tinsert(quest,link); end

			if(type(v.Images)=="table")then
				tinsert(quest,SharedElements.Images(CurrentFollower,v.Images," "));
			end

			local status = STATUS..CHAT_HEADER_SUFFIX.."|cff%s%s|r";
			if(index and index>0)then
				tinsert(quest,status:format("ffee00",L["In your Questlog"]));
			elseif C_QuestLog.IsQuestFlaggedCompleted(v[1]) then
				tinsert(quest,status:format("00aa00",AUCTION_TIME_LEFT0)..checked);
			else
				tinsert(quest,status:format("04ff07",L["Open"]));
			end

			tinsert(quests,tconcat(quest,"|n"..listPrefix));
			Loading(true,checked,"nobr");
		end
	end
	if #quests>0 then
		return p:format(tconcat(quests,"|n|n")), Desc[1]=="Events" and EVENTS_LABEL or QUESTS_LABEL,doRetry;
	end
	return nil,nil,doRetry;
end
AddDescription.Events = AddDescription.Quests;

function AddDescription.Missions(Desc)
	local cnt={};
	for i=2, #Desc do
		if (type(Desc[i])=="number") then
			-- garrmission:<missionid> does not work with blizzards GameTooltip:SetHyperlink().
			-- tinsert(cnt,p:format( C_Garrison.GetMissionLink(Desc[i]) ));
			local missionData,numMaxFollower = {C_Garrison.GetMissionName(Desc[i])},GARRISON_MISSION_TOOLTIP_NUM_REQUIRED_FOLLOWERS;
			if (C_Garrison.GetFollowerTypeByMissionID(Desc[i])==LE_FOLLOWER_TYPE_SHIPYARD_6_2)then
				numMaxFollower=GARRISON_SHIPYARD_MISSION_TOOLTIP_NUM_REQUIRED_FOLLOWERS;
			end
			tinsert(missionData,""..listPrefix..numMaxFollower:format(C_Garrison.GetMissionMaxFollowers(Desc[i])));
			local link = CreateExternalURL("m",Desc[i]);
			if link then tinsert(missionData,listPrefix..link); end
			local rewardList,rewards = C_Garrison.GetMissionRewardInfo(Desc[i]),{};
			if rewardList then
				for _,reward in pairs(rewardList)do
					local name,link,_,_,_,_,_,_,_,icon = GetItemInfo(reward.itemID);
					local hlink = CreateExternalURL("i",reward.itemID);
					if link and icon then
						tinsert(rewards,
							("|T%s:14:14:0:0:64:64:4:56:4:56|t %s"):format(icon,link) ..
							(hlink~=nil and "|n"..listPrefix..hlink or "")
						);
					else
						--print("Error:", "Mission reward item not found.", "itemID:"..reward.itemID,"missionID:"..Desc[i]);
					end
				end
			end
			if(#rewards>0)then
				tinsert(missionData,"|n"..REWARDS..":|n"..tconcat(rewards,"|n"));
			end
			tinsert(cnt,p:format(tconcat(missionData,"|n")));
		end
	end
	return cnt, GARRISON_MISSIONS;
end

function AddDescription.Description(Desc)
	return p:format(L[Desc[2]]), DESCRIPTION;
end

function AddDescription.Images(Desc)
	return pr:format("|cffa0a0a0"..L["(mouse over to show image)"].."|r") .. pl:format(SharedElements.Images(CurrentFollower,Desc,"|n"));
end

function AddDescription.Merchant(Desc)
	Loading(true,L["Collection vendor data..."],"new");
	local merchants,doRetry = {},false;
	for i=2, #Desc do
		Loading(true,L["Query data (npcID: %d)..."]:format(Desc[i][1]));
		local merchant = {};
		local name = D.NpcName[Desc[i][1]];
		if(name)then
			tinsert(merchant,name);
			local location, tomtom = SharedElements.Location(Desc[i][2],Desc[i][3],Desc[i][4],(type(Desc[i][3])=="table" or type(Desc[i][3])=="string") and Desc[i][3] or nil,name);
			tinsert(merchant,location);
			if tomtom then
				tinsert(merchant,tomtom);
			end
			local link = CreateExternalURL("n",Desc[i][1]);
			if link then tinsert(merchant,link); end
			tinsert(merchants,tconcat(merchant,"|n"..listPrefix));
			Loading(true,checked,"nobr");
		else
			doRetry = true;
		end
	end
	if(#merchants>0)then
		return p:format(tconcat(merchants,"|n|n")), MERCHANT,doRetry;
	end
	return nil,nil,doRetry;
end

function AddDescription.Npc(Desc)
	Loading(true,L["Query data (npcID: %d)..."]:format(Desc[2]));
	local name,npc,doRetry = D.NpcName[Desc[2]],false;
	if(name)then
		npc = {};
		tinsert(npc,name);
		if(D.NpcTitle[Desc[2]])then
			--title = D.NpcTitle[Desc[2]];
			tinsert(npc,UNIT_NAME_PLAYER_TITLE..CHAT_HEADER_SUFFIX..D.NpcTitle[Desc[2]]);
		end

		local location, tomtom = SharedElements.Location(Desc[3],Desc[4],Desc[5],(type(Desc[4])=="table" or type(Desc[4])=="string") and Desc[4] or nil,name);
		tinsert(npc,location);
		if tomtom then
			tinsert(npc,tomtom);
		end

		local link = CreateExternalURL("n",Desc[1]);
		if link then tinsert(npc,link); end

		Loading(true,checked,"nobr");
	else
		doRetry = true;
	end
	if npc then
		return p:format(tconcat(npc,"|n"..listPrefix)), L["NPC"],doRetry;
	end
	return nil,nil,doRetry;
end

function AddDescription.Spell(Desc)
	local hlink = CreateExternalURL("s",Desc[2]);
	return p:format(
		"|T"..GetSpellTexture(Desc[2])..":14:14:0:0|t "..GetSpellLink(Desc[2])..
		(hlink~=nil and "|n"..listPrefix..hlink or "")
	), SPELLS;
end

function AddDescription.Items(Desc)
	local items = {};
	for i=2, #Desc do
		local item = {};
		local v,name,link,icon,coords,_ = Desc[i];
		name,link,_,_,_,_,_,_,_,icon = GetItemInfo(v[1]);
		if v.id~=nil and v.id~=CurrentFollower then
			link = false;
		end
		if link then
			tinsert(item, ("|T%s:0|t %s"):format(icon,link));

			if(v[2] and v[3] and v[4])then
				local location, tomtom = SharedElements.Location(v[2],v[3],v[4],nil,name);
				tinsert(item,location);
				if tomtom then
					tinsert(item,tomtom);
				end
			end

			local link = CreateExternalURL("i",Desc[i][1]);
			if link then tinsert(item,link); end

			if(type(v.Images)=="table")then
				tinsert(item,SharedElements.Images(CurrentFollower,v.Images," "));
			end
			tinsert(items,tconcat(item,"|n"..listPrefix));
		end
	end
	if #items>0 then
		return p:format(tconcat(items,"|n|n")), #Desc>2 and ITEMS or HELPFRAME_ITEM_TITLE;
	end
end

function AddDescription.Requirements(Desc)
	local reqs = {};
	local titles = {["Garrison building"]=L["Garrison building"],Professions=TRADE_SKILLS,Reputation=REPUTATION,["Brawler's Guild"]=L["Brawler's Guild"]};
	for i=2, #Desc do
		local req,v = {},Desc[i];
		if(type(v)=="table" and SharedElements[v[1]])then
			if v[1]=="Garrison building" or v[1]=="Professions" or v[1]=="Reputation" or v[1]=="Brawler's Guild" then
				local name, need, url, data = SharedElements[v[1]](unpack(v));
				local state1 = data.state>=1 and 2 or 0;
				tinsert(req,titles[v[1]]..HEADER_COLON);
				if v[1]=="Reputation" or v[1]=="Brawler's Guild" then
					tinsert(req,name);
				else
					tinsert(req,("|cff%s%s|r"):format(stateColor[state1],name) .. (state1==2 and checked or ""));
				end
				tinsert(req,("|cff%s%s|r"):format(stateColor[data.state],need) .. (data.state==2 and checked or ""));
				if(data.state==1 and data.current)then
					tinsert(req,("|cff888888%s %s|r"):format(CURRENT_PET,data.current));
				end
				tinsert(req,url);
			else
				local titles = {Outpost=L["Outpost building"]}
				local result = {SharedElements[v[1]](unpack(v))};
				if #result>0 then
					if(titles[v[1]])then
						tinsert(req,titles[v[1]]..HEADER_COLON);
					end
					for x=1, #result do
						if(type(result[x])=="string")then
							tinsert(req,result[x]);
						end
					end
				end
			end
		elseif v[1]=="Unlock" then
			local color, chk = "yellow","";
			if(C_QuestLog.IsQuestFlaggedCompleted(v[2]))then
				color, chk = "green", checked;
			end
			tinsert(req, LC.color(color, L[v[3]])..chk);
		elseif(type(v)=="string")then
			tinsert(req,L[v]);
		end
		tinsert(reqs,tconcat(req,"|n"..listPrefix));
	end
	return p:format(tconcat(reqs,"|n|n"));
end

function AddDescription.Achievements(Desc)
	local achievements = {};
	for i=2, #Desc do
		local achievement,link = {},GetAchievementLink(Desc[i]);
		if link then
			local _, name, points, completed, _, _, _, description, _, icon, rewardText, isGuild, wasEarnedByMe, earnedBy = GetAchievementInfo(Desc[i]);
			local cat,catId = {},GetAchievementCategory(Desc[i]);
			tinsert(achievement,link);

			for i=1, 3 do
				local Name,parentId,flag = GetCategoryInfo(catId);
				Name = gsub(Name,"&","&amp;");
				tinsert(cat,1,Name);
				if parentId<0 then break end
				catId=parentId;
			end
			tinsert(achievement,tconcat(cat," &#xBB; "));

			local link = CreateExternalURL("a",Desc[i]);
			if link then tinsert(achievement,link); end

			local status = ("|cff%s%s|r"):format("04ff07",L["Open"]);
			if completed and wasEarnedByMe then
				status = ("|cff%s%s|r"):format("00aa00",AUCTION_TIME_LEFT0)..checked;
			end
			tinsert(achievement,STATUS..CHAT_HEADER_SUFFIX..status);

			tinsert(achievements,
				"|T"..icon..":32:32:0:0:32:32:0:32:0:32|t|n" ..
				tconcat(achievement,"|n"..listPrefix));
		end
	end
	if #achievements>0 then
		return p:format(tconcat(achievements,"|n|n")), ACHIEVEMENTS;
	end
end

function AddDescription.Price(Desc)
	local sum,doRetry = {},false;
	for i=2, #Desc do
		local price = {};
		if Desc[i][1] == "Gold" then
			tinsert(price,BONUS_ROLL_REWARD_MONEY);
			tinsert(price,GetCoinTextureString(Desc[i][2]));
		elseif Desc[i][1] == "Currency" then
			local name,icon,_
			if GetCurrencyInfo then
				name,_,icon = GetCurrencyInfo(Desc[i][2]);
			elseif C_CurrencyInfo.GetCurrencyInfo then
				local info = C_CurrencyInfo.GetCurrencyInfo(Desc[i][2]); -- added with shadowlands
				name,icon = info.name,info.iconFileID;
			end
			local link = (GetCurrencyLink or C_CurrencyInfo.GetCurrencyLink)(Desc[i][2],Desc[i][3]);
			if name and icon then
				tinsert(price,link or name);
				tinsert(price,("%s |T%s:0|t"):format(Desc[i][3],icon));
				local link = CreateExternalURL("c",Desc[i][2]);
				if link then tinsert(price,link); end
			end
		elseif Desc[i][1] == "Item" then
			local name,link,_,_,_,_,_,_,_,icon = GetItemInfo(Desc[i][2]);
			if name and icon then
				tinsert(price,link);
				tinsert(price,("%s |T%s:0|t"):format(Desc[i][3],icon));
				local link = CreateExternalURL("i",Desc[i][2]);
				if link then tinsert(price,link); end
			else
				doRetry = true;
			end
		end
		tinsert(sum,tconcat(price,"|n"..listPrefix));
	end
	if #sum>0 then
		return p:format(tconcat(sum,"|n|n")), AUCTION_PRICE,doRetry;
	end
	return nil,nil,doRetry;
end

function AddDescription.AllParts(html,Desc)
	local doRetry,delimiter=false,"";
	for I=1, #Desc do
		if AddDescription[Desc[I][1]] then
			local htmlPart,title,problems = AddDescription[Desc[I][1]](Desc[I]);
			if not title then
				title = L[Desc[I][1]];
			end
			if htmlPart then
				if type(htmlPart)=="table" then
					htmlPart = tconcat(htmlPart,delimiter);
				end
				tinsert(html, h2:format(title,"blue") .. htmlPart .. br);
			end
			if problems then
				doRetry = true;
			end
		end
	end
	return doRetry;
end

function FollowerLocationInfoJournalFollowerDesc_Update()
	local P = FollowerLocationInfoJournalDesc;
	if not P:IsVisible() then return end

	Loading(true,L["Init description generator..."],"new");
	P.html:Hide();

	local id,html,doRetry,title = CurrentFollower,{},false;
	local Desc = false;

	if(id and D.descriptions[id] and #D.descriptions[id]>0)then
		Desc = D.descriptions[id];
	elseif(id and D.basics[id][isCollectableIdx]==false)then
		Desc = D.descriptions[0];
	end

	if Desc then
		if Desc.collectGroup then
			local members,collected = {},0;
			for i=1, #Desc.collectGroup do
				if D.collected[Desc.collectGroup[i]] then
					collected = Desc.collectGroup[i];
				end
			end
			for i,v in ipairs(Desc.collectGroup) do
				local color, chk = "eeff00", "";
				if(collected==v)then
					color, chk = "00ff00", checked;
				elseif(collected~=0)then
					color = "888888";
				end
				tinsert(members,("|cff%s%s|r"):format(color,L["follower_"..v])..chk);
			end
			tinsert(html,
				h2:format(L["Collect group"],"blue")
				..
				p:format(
					L["You can only obtain one follower from this group with the quest row"]..HEADER_COLON
					..
					"|n".. listPrefix .. tconcat(members,"|n".. listPrefix)
				)
				..
				br
			);
		end

		local showAlt=false;
		if Desc.alternative then
			local tVisible = type(Desc.alternative.visible);
			if (tVisible=="boolean" and Desc.alternative.visible) then
				showAlt=2;
			elseif (tVisible=="table"
				and (Desc.alternative.visible[1]=="quest" and C_QuestLog.IsQuestFlaggedCompleted(Desc.alternative.visible[2]))
				-- or ??
			) then
				showAlt=1;
			end
		end
		if showAlt==1 then
			tinsert(html, h1:format(L["Alternative way available"],"green") .. ( Desc.alternative.text~=nil and p:format(L[Desc.alternative.text])..br or "" ) );
			doRetry = AddDescription.AllParts(html,Desc.alternative) or doRetry;
			tinsert(html, h1:format(L["Original way"],"red") );
		end
		doRetry = AddDescription.AllParts(html,Desc) or doRetry;
		if showAlt==2 then
			tinsert(html, h1:format(L["Alternative way available"],"green") .. ( Desc.alternative.text~=nil and p:format(L[Desc.alternative.text])..br or "" ) );
			doRetry = AddDescription.AllParts(html,Desc.alternative) or doRetry;
		end
	elseif(id)then
		tinsert(html,"error");
	else
		local collectBy = {};
		local follower= function(label,num)
			return ("%s: |cff%s%d|r / |cff%s%d|r"):format(
				label,
				num[2]>0 and "00ff00" or "aaaaaa",
				num[2],
				"eeee00",
				num[1]
			);
		end
		for i,v in pairsByFields(D.otherFiltersOrder,2)do
			local num = D.otherFiltersCount[v[1]];
			if not (v[1]=="Reputation" or v[1]=="Garrison building" or v[1]=="Outpost") then
				tinsert(collectBy,follower(v[2],num));
			end
		end
		local section = h2..p..br;
		html = {
			section:format(
				L["Usage"],
				"blue",
				L["Select a follower to see the description..."]
			),
			section:format(
				GARRISON_FOLLOWERS,
				"blue",
				follower(COLLECTED,D.counter.collectables)
				.."|n"..
				follower(L["Recruited"],D.counter.recruitables)
			),
			section:format(
				L["Obtainable by"],
				"blue",
				tconcat(collectBy,"|n")
			),
			section:format(
				GAME_VERSION_LABEL,
				"blue",
				"Core = "..D.Version.Core.."|n"..
				D.Version.Data
			),
			--section:format(L["Chat commands"],"/fli "..L["or"] .. "/followerlocationinfo"),
			--[[
			section:format(L["Thanks"],
				"ditex2009 ruRU locales (horde)|n"..
				"Shooshpan ruRU locales (horde)|n"..
				"michaelselehov ruRU locales (alliance)|n"..
				"jerry99spkk zhTW locales (alliance)|n"..
				"BNSSNB zhTW locales (alliance)|n"..
				"ananhaid zhCN locales (alliance &amp; horde)|n"..
				"and the nice community :)"
			)
			--]]
		};
	end

	if doRetry then
		C_Timer.After(1.4,FollowerLocationInfoJournalFollowerDesc_Update);
		return;
	else
		P.html:SetText("<html><body>"..tconcat(html,"").."<br /></body></html>");
		Loading(false);
		P.html:Show();
	end

	if not CurrentFollower_reloaded then
		CurrentFollower_reloaded = true;
		C_Timer.After(0.2,FollowerLocationInfoJournalFollowerDesc_Update);
	end
end

function FollowerLocationInfoJournal_ShowFollower(self)
	if not (self and self.id) then return end

	CurrentFollower_reloaded = nil;
	if CurrentFollower~=self.id then
		CurrentFollower = self.id;
	else
		CurrentFollower = nil;
	end

	for i,v in ipairs(self:GetParent().buttons) do
		v.selected:Hide();
	end
	if CurrentFollower then
		self.selected:Show();
	end
	FollowerLocationInfoJournalFollowerList.selected = CurrentFollower;

	FollowerLocationInfoJournalDesc:SetHorizontalScroll(0);
	FollowerLocationInfoJournalDesc:SetVerticalScroll(0);

	FollowerLocationInfoJournalFollowerCard_Update();
	FollowerLocationInfoJournalFollowerDesc_Update();
end

function FollowerLocationInfoJournalFollowerDesc_OnLoad(self) end


-------------------------------
--- Journal Frame Functions ---
-------------------------------
function FollowerLocationInfoJournal_OnUpdate()
end

function FollowerLocationInfoJournal_OnShow(self)
	if(not D.counter.recruitable)then
		-- D.counter can create later on slower connections.
		-- need a little timeout.
		if not timeout then
			C_Timer.After(2, function() FollowerLocationInfoJournal_OnShow(self) end);
			timeout=true;
		end
		return;
	end
	timeout=false;

	FollowerLocationInfoJournalFollowerList_Update();

	FollowerLocationInfoJournalFollowerCard_Update();
	FollowerLocationInfoJournalFollowerDesc_Update();

	self.counters.Collectables.Count:SetText(D.counter.collectables[2].."/"..D.counter.collectables[1]);
	self.counters.Recruitables.Count:SetText(D.counter.recruitables[2].."/"..D.counter.recruitables[1]);
	self.counters:Show();
end

function FollowerLocationInfoJournal_OnHide()
	FollowerLocationInfoJournalCounters:Hide();
end

function FollowerLocationInfoJournal_OnEvent(self,event) end

function FollowerLocationInfoJournal_OnLoad(self)
	D,L = FollowerLocationInfoData,FollowerLocationInfoData.Locale;
	LC = FollowerLocationInfo.LibColors;

	self.counters = FollowerLocationInfoJournalCounters;
	self.counters:SetParent(self);

	-- prevent errors if user open the journal first time in session while in combat. fallback to standalone mode.
	if FollowerLocationInfoData.journalDocked and InCombatLockdown() then
		FollowerLocationInfoData.journalDocked = false;
		ns.print(L["You have opened the collections journal first time this session while you are in combat. FLI fallback into standalone mode to prevent error messages. Don't worry this is temporary."]);
	end

	if FollowerLocationInfoData.journalDocked then
		local label = addon;
		if true then label = "FLI"; end

		local portraitFrame = CreateFrame("Frame","FollowerLocationInfoJournalPortraitFrame",UIParent,"PortraitFrameTemplate");
		portraitFrame:SetParent(CollectionsJournal);
		portraitFrame:SetAllPoints();
		portraitFrame:Hide();
		SetPortraitToTexture(portraitFrame.portrait, "Interface\\Icons\\Achievement_GarrisonFollower_Rare");
		portraitFrame.TitleText:SetText(Addon);
		self.Tab = FollowerLocationInfo.SecureTabs:Add(CollectionsJournal, portraitFrame, label);

		self:SetParent(portraitFrame);
		self:SetPoint("TOPLEFT", 0, -60);
		self:SetPoint("BOTTOMRIGHT");
		self:Show();

		self.counters:SetPoint("TOPLEFT",CollectionsJournal,"TOPLEFT", 65, -33);
		self.Options:SetPoint("TOPRIGHT",CollectionsJournal,"TOPRIGHT",-6,-26);
	else
		self:SetParent(FollowerLocationInfoJournalFrame);
		self:SetPoint("TOPLEFT",FollowerLocationInfoJournalFrame.HeaderBar,"BOTTOMLEFT",0,-3);
		self:SetPoint("RIGHT",FollowerLocationInfoJournalFrame.HeaderBar,"RIGHT",0,0);
		self:SetPoint("BOTTOM",-30,32);
		self.counters:SetPoint("TOPLEFT",FollowerLocationInfoJournalFrame,"TOPLEFT", 72, -10);
		self.Options:SetPoint("RIGHT",FollowerLocationInfoJournalFrame.HeaderBar,"RIGHT",-18,0);
		for key,val in pairs(self)do
			if tostring(key):match("Inset$") then
				val.InsetBorder:Hide();
				if val.InsetShadow then
					val.InsetShadow:Show();
				end
			end
		end
		self.FollowerList.ScrollBarTop:Hide();
		self.FollowerList.ScrollBarMiddle:Hide();
		self.FollowerList.ScrollBarBottom:Hide();
		self.FollowerDesc.ScrollBarTop:Hide();
		self.FollowerDesc.ScrollBarMiddle:Hide();
		self.FollowerDesc.ScrollBarBottom:Hide();

		UIPanelWindows["FollowerLocationInfoJournalFrame"] = { area = "left", pushable = 0, whileDead = 1, width = 830};
	end

	self.counters.Collectables.Label:SetText(COLLECTED);
	self.counters.Recruitables.Label:SetText(L["Recruited"]);

	FollowerLocationInfoJournal_UpdateFilter();

	self.FollowerDesc.ScrollBar.trackBG:Hide();
	self.FollowerDesc.ScrollBar:SetPoint("TOPLEFT",self.FollowerDesc,"TOPRIGHT",4,-12);
	self.FollowerDesc.ScrollBar:SetPoint("BOTTOMLEFT",self.FollowerDesc,"BOTTOMRIGHT",4,11);

	self:RegisterEvent("PLAYER_ENTERING_WORLD");
	self:RegisterEvent("GARRISON_FOLLOWER_LIST_UPDATE");
end

function FollowerLocationInfoJournalPortraitFrame_OnShow(self)
	self:SetParent(CollectionJournal);
	self:SetAllPoints();
end


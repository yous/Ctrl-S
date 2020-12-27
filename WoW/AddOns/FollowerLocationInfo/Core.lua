
FollowerLocationInfoDB = {};
local addon, ns = ...;

local D = FollowerLocationInfoData;
local L = D.Locale;
local levelIdx,qualityIdx,classIdx,classSpecIdx,portraitIdx,modelIdx,modelHeightIdx,modelScaleIdx,abilitiesIdx,countersIdx,traitsIdx,isCollectableIdx = 1,2,3,4,5,6,7,8,9,10,11,12; -- table indexes for FollowerLocationInfoData.basics entries.
local UpdateCallbacks,UpdateLock,isLoaded=false,false,false;
local garrLevel,MenuFrame,MenuList = 0;
local LDDM = LibStub("LibDropDownMenu");

BINDING_HEADER_FOLLOWERLOCATIONINFO		= "FollowerLocationInfo";
BINDING_NAME_TOGGLEFOLLOWERLOCATIONINFO	= L["Toggle FollowerLocationInfo Journal"];
--StaticPopupDialogs["FOLLOWERLOCATIONINFO_EXTERNALURL_DIALOG"].text = L["URL"];

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

local function count(t,v,d)
	if(t[v]==nil)then t[v]=0; end
	t[v]=t[v]+d;
end

function ns.GetLinkData(link)
	assert(type(link)=="string","argument #1 must be a string, got "..type(link));
	local tt,data,reg,_ = FollowerLocationInfo_Tooltip,{};

	local retry = function()
		local link = tt.nextLinks[1];
		tremove(tt.nextLinks,1);
		ns.GetLinkData(link);
	end

	if(tt.nextLinks==nil)then
		tt.nextLinks = {};
		tt.retry = 0;
	end

	if(tt.currentLink)then
		tinsert(tt.nextLinks,link);
		tt.retry = tt.retry+1;
		if(tt.retry==1)then
			C_Timer.After(0.314159, retry);
		end
		return false;
	end

	tt.currentLink=link;

	tt:Hide();
	tt:SetOwner(UIParent,"ANCHOR_LEFT");
	tt:ClearLines();
	tt:SetHyperlink(link);
	tt:Show();
	for _,v in pairs({tt:GetRegions()}) do
		if v and v:GetObjectType()=="FontString" and v:GetText() then
			tinsert(data,v:GetText());
		end
	end
	tt:ClearLines();
	tt:Hide();

	tt.currentLink = nil;

	if(#tt.nextLinks>0)then
		C_Timer.After(0.314159, retry);
	end

	return data, line;
end

local function UpdateFollowers()
	if UpdateLock==true then return; end

	-- sometimes blizzards functions returning data from wrong faction.
	-- 99% chance on characters without own garrison. (too high for a bug)
	-- 1% chance on characters with garrisons. (maybe a bug)
	local followerTestInfo,dataFaction = C_Garrison.GetFollowerInfo(34);
	if followerTestInfo.displayIDs and followerTestInfo.displayIDs[1] then
		dataFaction = followerTestInfo.displayIDs[1].id==55047;
	elseif followerTestInfo.displayID then
		dataFaction = followerTestInfo.displayID==55047;
	end
	dataFaction = dataFaction and "Alliance" or "Horde";
	local blizz = {};
	local pLevel = UnitLevel("player");
	garrLevel = (garrLevel>0 and garrLevel) or C_Garrison.GetGarrisonInfo(LE_GARRISON_TYPE_6_0 or Enum.GarrisonType.Type_6_0) or 0;

	-- Sometimes PLAYER_ENTERING_WORLD aren't late enough to get some data from blizz.
	if pLevel>=90 and garrLevel==0 then
		C_Timer.After(6,function()
			UpdateFollowers();
		end);
		return;
	end

	UpdateLock = true;

	wipe(D.unknown);
	wipe(D.collected);
	wipe(D.collectGroups);

	--- reset all counter
	D.counter.blizz=0;
	D.counter.collectables[2]=0;
	D.counter.recruitables[2]=0;

	-- reset all collected counter
	for _,k in ipairs({"class","classspec","abilities","counters","traits"})do
		for K,v in pairs(D.counter[k])do
			D.counter[k][K][2]=0;
		end
	end
	for i in pairs(D.otherFiltersCount)do
		D.otherFiltersCount[i][2]=0;
	end
	---

	for id, data in pairs(D.basics)do
		if(#data[abilitiesIdx]>0 or #data[traitsIdx]>0)then
			local basicIds = {};
			for i=1, #data[abilitiesIdx] do
				basicIds[data[abilitiesIdx][i]] = true;
			end
			for i=1, #data[traitsIdx] do
				basicIds[data[traitsIdx][i]] = true;
			end
			for _,a in ipairs(C_Garrison.GetFollowerAbilities(id) or {}) do
				if basicIds[a.id] and a.name then
					local n = a.isTrait and "traits" or "abilities";
					if D[n][a.id]==nil then
						a.link = C_Garrison.GetFollowerAbilityLink(a.id); -- missing link from C_Garrison.GetFollowerAbilities()
						D[n][a.id]=a;
						if D.counter[n][a.id]==nil then
							D.counter[n][a.id]={data[isCollectableIdx] and 1 or 0,0};
						end
					end
					if n~="traits" and a.counters then
						for I,b in pairs(a.counters) do
							if D.counters[I]==nil then
								D.counters[I] = b;
								if data[isCollectableIdx] and D.counter.counters[I]==nil then
									D.counter.counters[I] = {data[isCollectableIdx] and 1 or 0,0};
								end
							end
							if D.ability2counters[a.id]==nil then
								D.ability2counters[a.id] = {};
							end
							D.ability2counters[a.id][I]=true;
							if D.counters2ability[I]==nil then
								D.counters2ability[I] = {};
							end
							D.counters2ability[I][a.id]=true;
						end
					end
				end
			end
		end

		if D.classSpec[data[classSpecIdx]]==nil then
			local v = C_Garrison.GetFollowerInfo(id);
			local class = gsub(v.classAtlas,"GarrMission_ClassIcon%-",""):lower();
			D.classSpec[data[classSpecIdx]]={
				C_Garrison.GetFollowerClassSpecName(id), -- localized class specialization name
				class, -- englsh class name
				LOCALIZED_CLASS_NAMES_MALE[class:upper()], -- localized class name
				D.ClassName2ID[class] -- class id
			};
		end

		if D.counter.classspec[data[classSpecIdx]]==nil then
			D.counter.classspec[data[classSpecIdx]] = {data[isCollectableIdx] and 1 or 0,0};
		end

		if(D.descriptions[id])then
			if(D.descriptions[id].collectGroup)then
				D.collectGroups[D.descriptions[id]] = D.collected[id]==true;
			end
		end

		count(D.counter,data[isCollectableIdx] and "collectable" or "recruitable",1);
	end

	-- add demonhunter class specs
	if D.classSpec[63]==nil then
		local id = 498;
		local v = C_Garrison.GetFollowerInfo(id);
		local class = gsub(v.classAtlas,"GarrMission_ClassIcon%-",""):lower();
		D.classSpec[63]={
			C_Garrison.GetFollowerClassSpecName(id), -- localized class specialization name
			class, -- englsh class name
			LOCALIZED_CLASS_NAMES_MALE[class:upper()], -- localized class name
			D.ClassName2ID[class] -- class id
		};
	end
	if D.classSpec[64]==nil then
		local id = 722;
		local v = C_Garrison.GetFollowerInfo(id);
		local class = gsub(v.classAtlas,"GarrMission_ClassIcon%-",""):lower();
		D.classSpec[64]={
			C_Garrison.GetFollowerClassSpecName(id), -- localized class specialization name
			class, -- englsh class name
			LOCALIZED_CLASS_NAMES_MALE[class:upper()], -- localized class name
			D.ClassName2ID[class] -- class id
		};
	end

	if dataFaction==D.Faction then
		blizz = C_Garrison.GetFollowers(LE_FOLLOWER_TYPE_GARRISON_6_0 or Enum.GarrisonFollowerType.FollowerType_6_0) or {};
		D.counter.blizz=#blizz;
	end

	if(#blizz>0) then
		for i,v in ipairs(blizz)do
			local id = tonumber(v.garrFollowerID or v.followerID);
			local b = D.basics[id];
			local isCollectable = b[isCollectableIdx];
			v.class = gsub(v.classAtlas,"GarrMission_ClassIcon%-",""):lower();

			D.collected[id] = v.isCollected or nil;

			if(isCollectable and v.isCollected)then
				for _,I in ipairs(b[abilitiesIdx])do
					count(D.counter.abilities[I],2,1);
				end
				for _,I in ipairs(b[countersIdx])do
					count(D.counter.counters[I],2,1);
				end
				for _,I in ipairs(b[traitsIdx])do
					count(D.counter.traits[I],2,1);
				end
				count(D.counter.class[D.ClassName2ID[v.class]],2,1);
				count(D.counter.classspec[v.classSpec],2,1);
				count(D.counter.qualities[b[qualityIdx]],2,1);
				if D.descriptions[id] then
					for _,obj in ipairs(D.descriptions[id])do
						if(obj[1]=="Requirements")then
							for i=2, #obj do
								local subObj = obj[i];
								if(D.otherFilters[subObj[1]] and D.otherFilters[subObj[1]][id])then
									count(D.otherFiltersCount[subObj[1]],2,1);
								end
							end
						elseif(D.otherFilters[obj[1]] and D.otherFilters[obj[1]][id])then
							count(D.otherFiltersCount[obj[1]],2,1);
						end
					end
				end
				count(D.counter.collectables,2,1);
			elseif not isCollectable then
				count(D.counter.recruitables,2,1);
			end

			if not b then
				local t={abilities={},counters={},traits={}};
				for _,a in ipairs(C_Garrison.GetFollowerAbilities(id) or {}) do
					if a.name then
						local n = a.isTrait and "traits" or "abilities";
						tinsert(t[n],a.id);
						a.link = C_Garrison.GetFollowerAbilityLink(a.id);
						if D[n][a.id]==nil then
							D[n][a.id]=a;
						end
						if D.counter[n][a.id]==nil then
							D.counter[n][a.id]={1,v.isCollected and 1 or 0};
						end
						if n~="traits" and a.counters then
							for I,b in pairs(a.counters) do
								if D.counters[I]==nil then
									D.counters[I] = b;
								end
								if D.ability2counters[a.id]==nil then
									D.ability2counters[a.id] = {};
								end
								D.ability2counters[a.id][I]=true;
								if D.counters2ability[I]==nil then
									D.counters2ability[I] = {};
								end
								D.counters2ability[I][a.id]=true;
								if isCollectable and D.counter.counters[I]==nil then
									D.counter.counters[I] = {1,v.isCollected and 1 or 0};
								end
							end
						end
					end
				end

				D.basics[id] = {
					v.level,
					v.quality,
					0, --v.class,
					v.classSpec,
					v.portraitIconID,
					v.displayID or (v.displayIDs and v.displayIDs[1].id) or 0,
					v.displayHeight,
					v.displayScale,
					t.abilities,
					t.counters,
					t.traits,
					(not collectable[i])
				};
				tinsert(D.unknown,id);
				count(D.counter,"unknown",1,1);
			end

			if not rawget(L,"follower_"..id) then
				L["follower_"..id] = v.name;
			end
		end

		D.counter.unknown = #D.unknown;
	end

	if(UpdateCallbacks)then
		for _,func in pairs(UpdateCallbacks)do
			func();
		end
	end

	UpdateLock = false;
end

local function CheckAndLoadJournal()
	if(not FollowerLocationInfoJournal)then
		local _,_,_,_,status = GetAddOnInfo(addon.."_Journal");
		if status~="MISSING" then
			EnableAddOn(addon.."_Journal");
		end
		LoadAddOn(addon.."_Journal");
		if( not FollowerLocationInfoJournal)then
			FollowerLocationInfo_ShowInfoBox("journal not loadable");
			return false;
		end
	end
	return true;
end

local function CreateMenuList()
	local MenuFrame = _G.FollowerLocationInfo_LibDropDownMenu;
	local db = FollowerLocationInfoDB;
	local separator={ text="", dist=0, isTitle=true, notCheckable=true, isNotRadio=true, sUninteractable=true, iconOnly=true, icon="Interface\\Common\\UI-TooltipDivider-Transparent", tCoordLeft=0, tCoordRight=1, tCoordTop=0, tCoordBottom=1, tFitDropDownSizeX=true, tSizeX=0, tSizeY=8, iconInfo={tCoordLeft=0, tCoordRight=1, tCoordTop=0, tCoordBottom=1, tFitDropDownSizeX=true, tSizeX=0, tSizeY=8} };

	local function CheckFunc(self)
		return db[self.arg1];
	end

	local function SetFunc(self)
		db[self.arg1] = not db[self.arg1];
		LDDM.UIDropDownMenu_Refresh(MenuFrame,nil,2);
		ns.LDB_Update();
	end

	local function CheckExternalURL(self)
		return db.ExternalURL==self.arg1;
	end

	local function SetExternalURL(self)
		db.ExternalURL=self.arg1;
		LDDM.UIDropDownMenu_Refresh(MenuFrame,nil,2);
		if FollowerLocationInfoJournal then
			FollowerLocationInfoJournalFollowerCard_Update();
			FollowerLocationInfoJournalFollowerDesc_Update();
		end
	end

	local extURL = {};
	for k,v in pairs(ns.ExternalURLValues)do
		tinsert(extURL,{text=L[v], arg1=k, checked=CheckExternalURL, func=SetExternalURL, isNotRadio=false, keepShownOnClick=1});
	end

	MenuList = {
		{text="DataBroker", isTitle=true, isNotRadio=true, notCheckable=true},
		{
			text=L["Show minimap button"], tooltipTitle=L["Minimap"], tooltipText=L["Show/Hide minimap button"], keepShownOnClick=1, isNotRadio=true,
			checked=function() return db.LDBi_Enabled; end,
			func=function() FollowerLocationInfo_MinimapButton(); end
		},
		{text=L["Broker button text"], tooltipTitle=L["Broker button text"], tooltipText=L["Choose what you want to look on broker button"], hasArrow=true, isNotRadio=true, notCheckable=true, menuList={
			{text=L["Your coordinates"], isNotRadio=true, keepShownOnClick=1, arg1="LDB_PlayerCoords", checked=CheckFunc, func=SetFunc},
			{text=L["Collected followers"], isNotRadio=true, keepShownOnClick=1, arg1="LDB_NumFollowers", checked=CheckFunc, func=SetFunc},
			{text=L["Target coordinates"], isNotRadio=true, keepShownOnClick=1, arg1="LDB_TargetCoords", checked=CheckFunc, func=SetFunc}
		}},
		separator,
		{text="Journal", isTitle=true, notCheckable=true, isNotRadio=true },
		{text=L["Favorite website"], tooltipTitle=L["Favorite website"], tooltipText=L["Choose your favorite website for further informations"], hasArrow=true, notCheckable=true, isNotRadio=true, menuList=extURL},
		{
			text=L["Standalone mode"], isNotRadio=true, keepShownOnClick=1,
			tooltipTitle=L["Standalone mode"], tooltipText=table.concat({L["Display the journal like garrison report with own window"],"|cffff0000"..L["Needs UI reload!"].."|r","|cffff8800"..L["Will be automatically reload your ui while your are not in combat..."].."|r"},"|n"),
			checked = function() return db.standalone; end,
			func = function()
				db.standalone = not db.standalone;
				if not InCombatLockdown() then C_UI.Reload(); end
			end
		},
		{
			text=L["Show FollowerID"], tooltipTitle=L["FollowerID"], tooltipText=L["Show followerIDs in follower list"], keepShownOnClick=1, isNotRadio=true,
			checked = function() return db.ShowFollowerID; end,
			func=function()
				db.ShowFollowerID = not db.ShowFollowerID;
				if FollowerLocationInfoJournal then
					FollowerLocationInfoJournalFollowerList_Update();
				end
			end
		},
		--[[
		separator,
		{ text="Tracker.", isTitle=true },
		{
			text=L[ "Show coordination frame"], tooltipTitle={L[ "Coordination frame"], tooltipText=L[ "Show the coordinates frame"],
			dbType="bool", keyName="ShowCoordsFrame",
			event=function()
				if (db.ShowCoordsFrame) then
					FollowerLocationInfoCoordFrame:Show();
				else
					FollowerLocationInfoCoordFrame:Hide();
				end
			end
		},
		--]]
		separator,
		{text=CANCEL, notCheckable=true, isNotRadio=true, func=function() LDDM.CloseDropDownMenus(); end}
	};

end

--[=[ some global accessable functions ]=]
function FollowerLocationInfo_RegisterUpdateCallback(func)
	if(not UpdateCallbacks)then UpdateCallbacks={}; end
	local funcID = tostring(func);
	if(not UpdateCallbacks[funcID])then
		UpdateCallbacks[funcID] = func;
	end
end

function FollowerLocationInfo_UnregisterUpdateCallback(func)
	if(not UpdateCallbacks)then return end
	local funcID = tostring(func);
	if(UpdateCallback[funcID])then
		UpdateCallbacks[funcID] = nil;
	end
end

function FollowerLocationInfo_OptionMenu(parent,point,relativePoint)
	local MenuFrame = _G.FollowerLocationInfo_LibDropDownMenu;
	if not MenuFrame then
		MenuFrame = LDDM.Create_DropDownMenu("FollowerLocationInfo_LibDropDownMenu",UIParent);
	end

	if not MenuList then
		CreateMenuList();
	end

	MenuFrame.point = point or "TOPLEFT";
	MenuFrame.relativePoint = relativePoint or "BOTTOMLEFT";

	PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON);
	LDDM.EasyMenu(MenuList, MenuFrame, parent, 0, 0, "MENU");
end

--- InfoBox
-- Display an frame for infomation and error messages
-- @params:
-- msg - a string that must be match to an error message entry from table infoBoxErrors.
local infoBoxErrors = {
	["journal not loadable"] = L["LoadError-FollowerLocationInfo_Journal"]
}
function FollowerLocationInfo_ShowInfoBox(msg)
	local self = FollowerLocationInfo;
	local smallbr,br,deco = "<p>|n</p>","<br />","<p>|TInterface\\AddOns\\FollowerLocationInfo\\media\\%s:15:320:0:12:128:16:24:64:1:16|t</p>";
	local message,errorMessage = {},{"<h2>|TInterface\\DialogFrame\\UI-Dialog-Icon-AlertNew:0|t Houston, we have a problem!</h2>",deco:format("red")};

	if(infoBoxErrors[msg])then
		message = errorMessage;
		tinsert(message,"<h3>"..infoBoxErrors[msg].."</h3>");
	else
		message = errorMessage;
		tinsert(message,"<h3>"..msg.."</h3>");
	end

	self.InfoBox:SetText("<html><body>"..smallbr..table.concat(message,"")..smallbr.."</body></html>");
	self.msg = msg;

	local height = self.InfoBox:GetContentHeight()+40;
	self:SetHeight( height>460 and 460 or height );

	self:Show();
end

--[=[ Tooltip functions ]=]
function FollowerLocationInfoTooltip_OnEnter(self)
	if (self.tooltip) then
		GameTooltip:SetOwner(self,"ANCHOR_RIGHT");
		if (type(self.tooltip)=="string") then
			GameTooltip:SetText(self.tooltip);
		elseif (type(self.tooltip)=="table") and (#self.tooltip>0) then
			GameTooltip:SetText(self.tooltip[1]);
			for i=2, #self.tooltip do
				GameTooltip:AddLine(self.tooltip[i],1,1,1,1);
			end
		end
		GameTooltip:Show();
	end
end

function FollowerLocationInfoTooltip_OnLeave(self)
	GameTooltip:Hide();
end

--[=[ Frame functions ]=]
function FollowerLocationInfo_ToggleJournal()
	if FollowerLocationInfoData.journalDocked then
		if(not CollectionsJournal)then
			LoadAddOn("Blizzard_Collections");
		end

		if not CheckAndLoadJournal() then
			return;
		end

		local parentShown,journalShow = CollectionsJournal:IsShown(), not FollowerLocationInfoJournal:IsVisible();
		if not parentShown or (parentShown and not journalShow) then
			ToggleCollectionsJournal();
		end
		if journalShow then
			FollowerLocationInfo.SecureTabs:Select(FollowerLocationInfoJournal.Tab);
		end
	else
		if not CheckAndLoadJournal() then
			return;
		end
		ToggleFrame(FollowerLocationInfoJournalFrame);
		if FollowerLocationInfoJournalFrame:IsShown() then
			FollowerLocationInfoJournal:Show();
		end
	end
end

function FollowerLocationInfo_OnEvent(self,event,arg1)
	if event=="ADDON_LOADED" and arg1==addon then
		-- check config
		if (FollowerLocationInfoDB==nil) then
			FollowerLocationInfoDB={};
		end
		for key,val in pairs({
			-- LDB Options
			LDB_PlayerCoords = false,
			LDB_TargetCoords = false,
			LDB_NumFollowers = true,
			LDBi_Enabled = true,

			-- FLI Options
			ShowFollowerID = true,
			ExternalURL = "WoWHead",
			standalone = false,

			-- FLI Tracker options
			--HideInCombat = true,
			--LockedInCombat = true,
			--CoordsFrame Options
			--ShowCoordsFrame = true,
			--CoordsFrameTarget = false,
			--TargetMark = false,
			--CoordsFrame_HideInCombat = true,
			--CoordsFrame_LockedInCombat = true
		}) do
			if (FollowerLocationInfoDB[key]==nil) then
				FollowerLocationInfoDB[key]=val;
			end
		end

		if FollowerLocationInfoDB.Minimap~=nil and FollowerLocationInfoDB.Minimap.enabled~=nil then
			FollowerLocationInfoDB.LDBi_Enabled = FollowerLocationInfoDB.Minimap.enabled;
			FollowerLocationInfoDB.Minimap = nil;
		end

		-- check data cache
		if (FollowerLocationInfoCache==nil) then
			FollowerLocationInfoCache={};
		end

		--- Clear name caches on changed cvar "textLocale"
		if (FollowerLocationInfoCache.Locale~=D.locale) then
			FollowerLocationInfoCache.Locale=D.locale;
			FollowerLocationInfoCache.questNames = {};
			FollowerLocationInfoCache.npcNames = {};
			FollowerLocationInfoCache.objectNames = {};
			FollowerLocationInfoCache.npcTitles = {};
		end

		if (FollowerLocationInfoCache.questNames==nil) then
			FollowerLocationInfoCache.questNames = {};
		end

		if (FollowerLocationInfoCache.npcNames==nil) then
			FollowerLocationInfoCache.npcNames = {};
		end

		if (FollowerLocationInfoCache.npcTitles==nil) then
			FollowerLocationInfoCache.npcTitles = {};
		end

		if (FollowerLocationInfoCache.objectNames==nil) then
			FollowerLocationInfoCache.objectNames = {};
		end

		FollowerLocationInfoData.journalDocked = not FollowerLocationInfoDB.standalone;

		ns.LDB_Init();

		for i,v in pairs(D.otherFilters)do
			tinsert(D.otherFiltersOrder,{i,L[i]});
		end

		D.Version = {Core="1.6.2-release",Data=""};

		local _,title = GetAddOnInfo(addon.."_Data");
		if title then
			if IsAddOnLoaded(addon.."_Data") then
				DisableAddOn(addon.."_Data");
			end
			self.error = "FollowerLocationInfo_Data are deprecated. Please uninstall it.";
		end

		isLoaded=true;

		ns.print("AddOn loaded...");
	elseif event=="ADDON_LOADED" and arg1=="Blizzard_GarrisonUI" then
		GarrisonMissionFrame:HookScript("OnHide",function()
			UpdateFollowers();
		end);
	elseif event=="ADDON_LOADED" and arg1=="Blizzard_Collections" and FollowerLocationInfoData.journalDocked then
		LoadAddOn("FollowerLocationInfo_Journal");
	elseif isLoaded then
		self.ExternalURL_unsupportedTypes = ns.ExternalURL_unsupportedTypes;
		if event=="PLAYER_ENTERING_WORLD" then
			C_Timer.After(4,function()
				UpdateFollowers();
			end);
			self:UnregisterEvent(event);
		elseif event=="GARRISON_FOLLOWER_LIST_UPDATE" and not ((GarrisonMissionFrame and GarrisonMissionFrame:IsShown()) or (GarrisonShipyardFrame and GarrisonShipyardFrame:IsShown())) then
			UpdateFollowers();
		end
	end
	if event=="PLAYER_ENTERING_WORLD" then
		C_Timer.After(5,function()
			if FollowerLocationInfo:IsShown() then return end
			if not isLoaded then
			elseif self.error~=nil then
				FollowerLocationInfo_ShowInfoBox(self.error);
				self.error=nil;
			end
		end);
		self:UnregisterEvent(event);
	end
end

function FollowerLocationInfo_OnHide(self)
	self.msg = nil;
end

function FollowerLocationInfo_OnLoad(self)
	-- library access for journals
	self.LibColors = LibStub("LibColors-1.0");
	self.SecureTabs = LibStub("SecureTabs-2.0");

	self:SetScale(0.8);
	tinsert(UISpecialFrames, self:GetName());

	self:RegisterEvent("ADDON_LOADED");
	self:RegisterEvent("PLAYER_ENTERING_WORLD");
	self:RegisterEvent("GARRISON_FOLLOWER_LIST_UPDATE");
end

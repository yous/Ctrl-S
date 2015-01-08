local E, L, V, P, G, _ = unpack(ElvUI); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB
local K = E:NewModule('SLAB', 'AceEvent-3.0')

local BINDS_COMMAND = {
	["MOVEANDSTEER"] = 1,
	["MOVEFORWARD"] = 2,
	["MOVEBACKWARD"] = 3,
	["TURNLEFT"] = 4,
	["TURNRIGHT"] = 5,
	["STRAFELEFT"] = 6,
	["STRAFERIGHT"] = 7,
	["JUMP"] = 8,
	["SITORSTAND"] = 9,
	["TOGGLESHEATH"] = 10,
	["TOGGLEAUTORUN"] = 11,
	["PITCHUP"] = 12,
	["PITCHDOWN"] = 13,
	["TOGGLERUN"] = 14,
	["FOLLOWTARGET"] = 15,
	["OPENCHAT"] = 16,
	["OPENCHATSLASH"] = 17,
	["CHATPAGEUP"] = 18,
	["CHATPAGEDOWN"] = 19,
	["CHATBOTTOM"] = 20,
	["REPLY"] = 21,
	["REPLY2"] = 22,
	["COMBATLOGPAGEUP"] = 23,
	["COMBATLOGPAGEDOWN"] = 24,
	["COMBATLOGBOTTOM"] = 25,
	["ACTIONBUTTON1"] = 26,
	["ACTIONBUTTON2"] = 27,
	["ACTIONBUTTON3"] = 28,
	["ACTIONBUTTON4"] = 29,
	["ACTIONBUTTON5"] = 30,
	["ACTIONBUTTON6"] = 31,
	["ACTIONBUTTON7"] = 32,
	["ACTIONBUTTON8"] = 33,
	["ACTIONBUTTON9"] = 34,
	["ACTIONBUTTON10"] = 35,
	["ACTIONBUTTON11"] = 36,
	["ACTIONBUTTON12"] = 37,
	["SHAPESHIFTBUTTON1"] = 38,
	["SHAPESHIFTBUTTON2"] = 39,
	["SHAPESHIFTBUTTON3"] = 40,
	["SHAPESHIFTBUTTON4"] = 41,
	["SHAPESHIFTBUTTON5"] = 42,
	["SHAPESHIFTBUTTON6"] = 43,
	["SHAPESHIFTBUTTON7"] = 44,
	["SHAPESHIFTBUTTON8"] = 45,
	["SHAPESHIFTBUTTON9"] = 46,
	["SHAPESHIFTBUTTON10"] = 47,
	["BONUSACTIONBUTTON1"] = 48,
	["BONUSACTIONBUTTON2"] = 49,
	["BONUSACTIONBUTTON3"] = 50,
	["BONUSACTIONBUTTON4"] = 51,
	["BONUSACTIONBUTTON5"] = 52,
	["BONUSACTIONBUTTON6"] = 53,
	["BONUSACTIONBUTTON7"] = 54,
	["BONUSACTIONBUTTON8"] = 55,
	["BONUSACTIONBUTTON9"] = 56,
	["BONUSACTIONBUTTON10"] = 57,
	["ACTIONPAGE1"] = 58,
	["ACTIONPAGE2"] = 59,
	["ACTIONPAGE3"] = 60,
	["ACTIONPAGE4"] = 61,
	["ACTIONPAGE5"] = 62,
	["ACTIONPAGE6"] = 63,
	["PREVIOUSACTIONPAGE"] = 64,
	["NEXTACTIONPAGE"] = 65,
	["TOGGLEACTIONBARLOCK"] = 66,
	["TOGGLEAUTOSELFCAST"] = 67,
	["MULTICASTSUMMONBUTTON1"] = 68,
	["MULTICASTACTIONBUTTON1"] = 69,
	["MULTICASTACTIONBUTTON2"] = 70,
	["MULTICASTACTIONBUTTON3"] = 71,
	["MULTICASTACTIONBUTTON4"] = 72,
	["MULTICASTSUMMONBUTTON2"] = 73,
	["MULTICASTACTIONBUTTON5"] = 74,
	["MULTICASTACTIONBUTTON6"] = 75,
	["MULTICASTACTIONBUTTON7"] = 76,
	["MULTICASTACTIONBUTTON8"] = 77,
	["MULTICASTSUMMONBUTTON3"] = 78,
	["MULTICASTACTIONBUTTON9"] = 79,
	["MULTICASTACTIONBUTTON10"] = 80,
	["MULTICASTACTIONBUTTON11"] = 81,
	["MULTICASTACTIONBUTTON12"] = 82,
	["MULTICASTRECALLBUTTON1"] = 83,
	["TARGETNEARESTENEMY"] = 84,
	["TARGETPREVIOUSENEMY"] = 85,
	["TARGETNEARESTFRIEND"] = 86,
	["TARGETPREVIOUSFRIEND"] = 87,
	["TARGETNEARESTENEMYPLAYER"] = 88,
	["TARGETPREVIOUSENEMYPLAYER"] = 89,
	["TARGETNEARESTFRIENDPLAYER"] = 90,
	["TARGETPREVIOUSFRIENDPLAYER"] = 91,
	["TARGETSELF"] = 92,
	["TARGETPARTYMEMBER1"] = 93,
	["TARGETPARTYMEMBER2"] = 94,
	["TARGETPARTYMEMBER3"] = 95,
	["TARGETPARTYMEMBER4"] = 96,
	["TARGETPET"] = 97,
	["TARGETPARTYPET1"] = 98,
	["TARGETPARTYPET2"] = 99,
	["TARGETPARTYPET3"] = 100,
	["TARGETPARTYPET4"] = 101,
	["TARGETLASTHOSTILE"] = 102,
	["TARGETLASTTARGET"] = 103,
	["NAMEPLATES"] = 104,
	["FRIENDNAMEPLATES"] = 105,
	["ALLNAMEPLATES"] = 106,
	["INTERACTMOUSEOVER"] = 107,
	["INTERACTTARGET"] = 108,
	["ASSISTTARGET"] = 109,
	["ATTACKTARGET"] = 110,
	["STARTATTACK"] = 111,
	["PETATTACK"] = 112,
	["FOCUSTARGET"] = 113,
	["TARGETFOCUS"] = 114,
	["TARGETMOUSEOVER"] = 115,
	["TARGETTALKER"] = 116,
	["TOGGLECHARACTER0"] = 117,
	["TOGGLEBACKPACK"] = 118,
	["TOGGLEBAG1"] = 119,
	["TOGGLEBAG2"] = 120,
	["TOGGLEBAG3"] = 121,
	["TOGGLEBAG4"] = 122,
	["OPENALLBAGS"] = 123,
	["TOGGLEKEYRING"] = 124,
	["TOGGLESPELLBOOK"] = 125,
	["TOGGLEPROFESSIONBOOK"] = 126,
	["TOGGLEPETBOOK"] = 127,
	["TOGGLEINSCRIPTION"] = 128,
	["TOGGLETALENTS"] = 129,
	["TOGGLECHARACTER4"] = 130,
	["TOGGLECHARACTER3"] = 131,
	["TOGGLECHARACTER2"] = 132,
	["TOGGLEQUESTLOG"] = 133,
	["TOGGLEGAMEMENU"] = 134,
	["TOGGLEMINIMAP"] = 135,
	["TOGGLEWORLDMAP"] = 136,
	["TOGGLEWORLDMAPSIZE"] = 137,
	["TOGGLESOCIAL"] = 138,
	["TOGGLEFRIENDSTAB"] = 139,
	["TOGGLEWHOTAB"] = 140,
	["TOGGLEGUILDTAB"] = 141,
	["TOGGLECHATTAB"] = 142,
	["TOGGLERAIDTAB"] = 143,
	["TOGGLELFGPARENT"] = 144,
	["TOGGLELFRPARENT"] = 145,
	["TOGGLEWORLDSTATESCORES"] = 146,
	["TOGGLEBATTLEFIELDMINIMAP"] = 147,
	["TOGGLEMINIMAPROTATION"] = 148,
	["TOGGLECHANNELPULLOUT"] = 149,
	["TOGGLEACHIEVEMENT"] = 150,
	["TOGGLESTATISTICS"] = 151,
	["TOGGLECURRENCY"] = 152,
	["STOPCASTING"] = 153,
	["STOPATTACK"] = 154,
	["DISMOUNT"] = 155,
	["MINIMAPZOOMIN"] = 156,
	["MINIMAPZOOMOUT"] = 157,
	["TOGGLEMUSIC"] = 158,
	["TOGGLESOUND"] = 159,
	["MASTERVOLUMEUP"] = 160,
	["MASTERVOLUMEDOWN"] = 161,
	["TOGGLESELFMUTE"] = 162,
	["TOGGLEUI"] = 163,
	["TOGGLEFPS"] = 164,
	["SCREENSHOT"] = 165,
	["TOGGLESTATS"] = 166,
	["TOGGLETRIS"] = 167,
	["TOGGLEPORTALS"] = 168,
	["TOGGLECOLLISION"] = 169,
	["TOGGLECOLLISIONDISPLAY"] = 170,
	["TOGGLEPLAYERBOUNDS"] = 171,
	["TOGGLEPERFORMANCEDISPLAY"] = 172,
	["TOGGLEPERFORMANCEPAUSE"] = 173,
	["TOGGLEPERFORMANCEVALUES"] = 174,
	["RESETPERFORMANCEVALUES"] = 175,
	["TOGGLEANIMKITDISPLAY"] = 176,
	["TOGGLECOMMENTATOR"] = 177,
	["NEXTVIEW"] = 178,
	["PREVVIEW"] = 179,
	["CAMERAZOOMIN"] = 180,
	["CAMERAZOOMOUT"] = 181,
	["SETVIEW1"] = 182,
	["SETVIEW2"] = 183,
	["SETVIEW3"] = 184,
	["SETVIEW4"] = 185,
	["SETVIEW5"] = 186,
	["SAVEVIEW1"] = 187,
	["SAVEVIEW2"] = 188,
	["SAVEVIEW3"] = 189,
	["SAVEVIEW4"] = 190,
	["SAVEVIEW5"] = 191,
	["RESETVIEW1"] = 192,
	["RESETVIEW2"] = 193,
	["RESETVIEW3"] = 194,
	["RESETVIEW4"] = 195,
	["RESETVIEW5"] = 196,
	["FLIPCAMERAYAW"] = 197,
	["MULTIACTIONBAR1BUTTON1"] = 198,
	["MULTIACTIONBAR1BUTTON2"] = 199,
	["MULTIACTIONBAR1BUTTON3"] = 200,
	["MULTIACTIONBAR1BUTTON4"] = 201,
	["MULTIACTIONBAR1BUTTON5"] = 202,
	["MULTIACTIONBAR1BUTTON6"] = 203,
	["MULTIACTIONBAR1BUTTON7"] = 204,
	["MULTIACTIONBAR1BUTTON8"] = 205,
	["MULTIACTIONBAR1BUTTON9"] = 206,
	["MULTIACTIONBAR1BUTTON10"] = 207,
	["MULTIACTIONBAR1BUTTON11"] = 208,
	["MULTIACTIONBAR1BUTTON12"] = 209,
	["MULTIACTIONBAR2BUTTON1"] = 210,
	["MULTIACTIONBAR2BUTTON2"] = 211,
	["MULTIACTIONBAR2BUTTON3"] = 212,
	["MULTIACTIONBAR2BUTTON4"] = 213,
	["MULTIACTIONBAR2BUTTON5"] = 214,
	["MULTIACTIONBAR2BUTTON6"] = 215,
	["MULTIACTIONBAR2BUTTON7"] = 216,
	["MULTIACTIONBAR2BUTTON8"] = 217,
	["MULTIACTIONBAR2BUTTON9"] = 218,
	["MULTIACTIONBAR2BUTTON10"] = 219,
	["MULTIACTIONBAR2BUTTON11"] = 220,
	["MULTIACTIONBAR2BUTTON12"] = 221,
	["MULTIACTIONBAR3BUTTON1"] = 222,
	["MULTIACTIONBAR3BUTTON2"] = 223,
	["MULTIACTIONBAR3BUTTON3"] = 224,
	["MULTIACTIONBAR3BUTTON4"] = 225,
	["MULTIACTIONBAR3BUTTON5"] = 226,
	["MULTIACTIONBAR3BUTTON6"] = 227,
	["MULTIACTIONBAR3BUTTON7"] = 228,
	["MULTIACTIONBAR3BUTTON8"] = 229,
	["MULTIACTIONBAR3BUTTON9"] = 230,
	["MULTIACTIONBAR3BUTTON10"] = 231,
	["MULTIACTIONBAR3BUTTON11"] = 232,
	["MULTIACTIONBAR3BUTTON12"] = 233,
	["MULTIACTIONBAR4BUTTON1"] = 234,
	["MULTIACTIONBAR4BUTTON2"] = 235,
	["MULTIACTIONBAR4BUTTON3"] = 236,
	["MULTIACTIONBAR4BUTTON4"] = 237,
	["MULTIACTIONBAR4BUTTON5"] = 238,
	["MULTIACTIONBAR4BUTTON6"] = 239,
	["MULTIACTIONBAR4BUTTON7"] = 240,
	["MULTIACTIONBAR4BUTTON8"] = 241,
	["MULTIACTIONBAR4BUTTON9"] = 242,
	["MULTIACTIONBAR4BUTTON10"] = 243,
	["MULTIACTIONBAR4BUTTON11"] = 244,
	["MULTIACTIONBAR4BUTTON12"] = 245,
	["RAIDTARGET1"] = 246,
	["RAIDTARGET2"] = 247,
	["RAIDTARGET3"] = 248,
	["RAIDTARGET4"] = 249,
	["RAIDTARGET5"] = 250,
	["RAIDTARGET6"] = 251,
	["RAIDTARGET7"] = 252,
	["RAIDTARGET8"] = 253,
	["RAIDTARGETNONE"] = 254,
	["VEHICLEEXIT"] = 255,
	["VEHICLEPREVSEAT"] = 256,
	["VEHICLENEXTSEAT"] = 257,
	["VEHICLEAIMUP"] = 258,
	["VEHICLEAIMDOWN"] = 259,
	["VEHICLEAIMINCREMENT"] = 260,
	["VEHICLEAIMDECREMENT"] = 261,
	["VEHICLECAMERAZOOMIN"] = 262,
	["VEHICLECAMERAZOOMOUT"] = 263,
	["TURNORACTION"] = 264,
	["CAMERAORSELECTORMOVE"] = 265,
	["ITUNES_PLAYPAUSE"] = 266,
	["ITUNES_NEXTTRACK"] = 267,
	["ITUNES_BACKTRACK"] = 268,
	["ITUNES_VOLUMEUP"] = 269,
	["ITUNES_VOLUMEDOWN"] = 270,
	["MOVIE_RECORDING_STARTSTOP"] = 271,
	["MOVIE_RECORDING_CANCEL"] = 272,
	["MOVIE_RECORDING_COMPRESS"] = 273,
	["MOVIE_RECORDING_GUI"] = 274,
	["HEADER_MOVEMENT"] = 275,
	["HEADER_CHAT"] = 276,
	["HEADER_ACTIONBAR"] = 277 ,
	["HEADER_MULTICASTFUNCTIONS"] = 278,
	["HEADER_BLANK"] = 279,
	["HEADER_BLANK2"] = 280,
	["HEADER_BLANK3"] = 281,
	["HEADER_TARGETING"] = 282,
	["HEADER_INTERFACE"] = 283,
	["HEADER_MISC"] = 284,
	["HEADER_CAMERA"] = 285,
	["HEADER_MULTIACTIONBAR"] = 286,
	["HEADER_BLANK4"] = 287,
	["HEADER_BLANK5"] = 288,
	["HEADER_BLANK6"] = 289,
	["HEADER_RAID_TARGET"] = 290,
	["HEADER_VEHICLE"] = 291,
	["HEADER_ITUNES_REMOTE"] = 292,
	["HEADER_MOVIE_RECORDING_SECTION"] = 293,
	["TOGGLEENCOUNTERJOURNAL"] = 294,
	["TARGETNEAREST"] = 295,
	["TARGETPREVIOUS"] = 296,
}

function TableToString(_t)  
    local szRet = "{"  
    function doT2S(_i, _v)  
        if "number" == type(_i) then  
            szRet = szRet .. "[" .. _i .. "] = "  
            if "number" == type(_v) then  
                szRet = szRet .. _v .. ","  
            elseif "string" == type(_v) then  
                szRet = szRet .. '"' .. _v .. '"' .. ","  
            elseif "table" == type(_v) then  
                szRet = szRet .. TableToString(_v) .. ","  
            else  
                szRet = szRet .. "nil,"  
            end  
        elseif "string" == type(_i) then  
            szRet = szRet .. '["' .. _i .. '"] = '  
            if "number" == type(_v) then  
                szRet = szRet .. _v .. ","  
            elseif "string" == type(_v) then  
                szRet = szRet .. '"' .. _v .. '"' .. ","  
            elseif "table" == type(_v) then  
                szRet = szRet .. TableToString(_v) .. ","  
            else  
                szRet = szRet .. "nil,"  
            end  
        end  
    end  
    table.foreach(_t, doT2S)  
    szRet = szRet .. "}"  
	szRet = gsub(szRet, "\n", "0xFF")
    return szRet 
end 

function StringToTable(lua)  
    local t = type(lua)  
    if t == "nil" or lua == "" then  
        return nil  
    elseif t == "number" or t == "string" or t == "boolean" then
        lua = tostring(lua)  
    else  
        E:Print("Can not load!")
    end  
    lua = "return " .. lua  
    local func = loadstring(lua)  
    if func == nil then  
        return nil  
    end  
    return func()  
end

local function ReadMacroInfo(id)
	local name, icon, text = GetMacroInfo(id)
	local macro = {}
	macro.id = id
	macro.name = name
	macro.icon = icon and gsub(icon, "Interface\\Icons\\", "") or "INV_MISC_QUESTIONMARK";
	macro.text = text
	
	return macro
end

local function SearchOrCreateMacro(macro)
	if not macro then return end
	if GetMacroInfo(macro.id) then
		EditMacro(macro.id, macro.name, (macro.icon), gsub(macro.text, "0xFF", "\n"))
		return macro.id
	else
		return CreateMacro(macro.name, (macro.icon), gsub(macro.text, "0xFF", "\n"), macro.id > 36 and 1 or 0)
	end
end	

local function GetBindingInfo(id)
	local command, key1, key2 = GetBinding(id)
	local com = BINDS_COMMAND[command]
	
	if not com then com = '0xFFFF' end
	local bind = {}
	bind.command = com
	bind.key1 = key1
	bind.key2 = key2
	
	if bind.key1 then
		return bind
	else
		return nil
	end
end

local function ConvertCommand(command)
	for k, v in pairs(BINDS_COMMAND) do
		if v == command then
			return k
		end
	end
end

local function ScanCompanion(subtype, id)
	for _, companionsType in pairs({"CRITTER", "MOUNT"}) do
		for i = 1, GetNumCompanions(subtype) do
			local _,_,spellId = GetCompanionInfo(subtype, i)
			if spellId == id then return i end
		end
	end
end

function K:ScanActionbar()
	local db = {}
	db.bind = {}

	local currentSpec = GetSpecialization() 
	local mytalent = currentSpec and select(2, GetSpecializationInfo(currentSpec)) or NONE 
	
	db.desc = E.myname.. '/'.. E.myclass.. '/'.. mytalent.. '/'.. date()
	E.Options.args.actionbar.args.layoutsave.args.desc.name = db.desc
	
	for i = 1, 120 do
		local actionType, id, subType = GetActionInfo(i);
		if actionType then
			if not db[i] then db[i] = {} end
			db[i].actionType = actionType
			db[i].id = id
			db[i].subType = subType
		end
		if actionType == 'macro' then
			db[i].macro = ReadMacroInfo(id)
		end		
	end
	
	for i = 1, GetNumBindings() do
		db.bind[i] = GetBindingInfo(i)
	end
	
	return db
end

local replaceSpellID = {
	[102355] = 770, --¾«Áé³æÈº = ¾«ÁéÖ®»ð
	[77767] = 56641, --ÑÛ¾µÉßÉä»÷ = ÎÈ¹ÌÉä»÷
}	

function K:WriteActionbar(db)
	if not db then return end
	
	for k = 1, 120 do
		if db[k] then
			local v = db[k]
			if v.actionType == 'spell' or v.actionType == 'flyout' then
				if GetSpellInfo(v.id) or GetFlyoutInfo(v.id) then	
					for i = 1, 1024 do
						local isOk, spellType, spellId = pcall(GetSpellBookItemInfo, i, BOOKTYPE_SPELL)
						if isOk and spellId and ((spellId == v.id) or (GetSpellInfo(spellId) == GetSpellInfo(v.id)) or (replaceSpellID[v.id] == spellId)) then
							PickupSpellBookItem(i, BOOKTYPE_SPELL);
							PlaceAction(k);
							ClearCursor();
						end
					end
				end
			elseif v.actionType == 'companion' then
				if GetSpellInfo(v.id) then
					local newid = ScanCompanion(v.subType, v.id)
					if newid then
						PickupCompanion(v.subType, newid)
						PlaceAction(k)
						ClearCursor()
					end
				end
			elseif v.actionType == 'macro' then
				PickupMacro(SearchOrCreateMacro(v.macro))
				PlaceAction(k);
				ClearCursor();
			elseif v.actionType == 'item' then
				PickupItem(v.id)
				PlaceAction(k);
				ClearCursor();
			elseif v.actionType == 'equipmentset' then
				PickupEquipmentSet(v.id)
				PlaceAction(k);
				ClearCursor();
			elseif v.actionType == 'petaction' or v.actionType == 'futurespell' or v.actionType == 'notfound' then
				PickupAction(v.id)
				PlaceAction(k);
				ClearCursor();			
			end
		end
	end
	
	for i = 1, 120 do --Clear other button
		if not db[i] then
			if GetActionInfo(i) then
				PickupAction(i)
				ClearCursor()
			end
		end
	end
	
	for k, v in pairs(db.bind) do
		local command = ConvertCommand(v.command)
		if command and command ~= '0xFFFF' then
			if v.key1 then
				SetBinding(v.key1, command, 1)
			end
			if v.key2 then
				SetBinding(v.key2, command, 1)
			end
		end
	end
	SaveBindings(GetCurrentBindingSet())
	
	E:Print(L["Actionbar layout load success!"])
end

local function CreateSLABFrame()
	local frame = CreateFrame("Frame", "EuiSLAB", E.UIParent)
	frame:SetTemplate("Default")
	frame:Size(500, 600)
	frame:SetFrameStrata("DIALOG")
	frame:Point("CENTER")
	frame:Hide()
	
	frame.Title = frame:CreateFontString(nil, 'OVERLAY')
	frame.Title:FontTemplate(nil, 17, nil)
	frame.Title:Point("TOP", 0, -10)
	frame.Title:SetText("EUI ".. L["Actionbar Layout Save and Load"])
	
	frame.Load = CreateFrame("Button", nil, frame, "UIPanelButtonTemplate")
	frame.Load:StripTextures()
	frame.Load:SetTemplate("Default", true)
	frame.Load:Size(110, 25)
	frame.Load:Point("BOTTOMLEFT", 20, 10)
	frame.Load:SetText(L["Load Actionbar Layout"])
	frame.Load:SetScript("OnClick", function()
		local DB = StringToTable(frame.editBox:GetText())
		K:WriteActionbar(DB);
		if DB and DB.desc then E.Options.args.actionbar.args.layoutsave.args.desc.name = DB.desc end
		frame:Hide();
	end)
	E.Skins:HandleButton(frame.Load, true)
	
	frame.close = CreateFrame("Button", nil, frame, "UIPanelButtonTemplate")
	frame.close:StripTextures()
	frame.close:SetTemplate("Default", true)
	frame.close:Size(110, 25)
	frame.close:Point("BOTTOMRIGHT", -20, 10)
	frame.close:SetText(CLOSE)
	frame.close:SetScript("OnClick", function() frame:Hide();frame.editBox:SetText(''); end)
	E.Skins:HandleButton(frame.close, true)	
	
	local scrollArea = CreateFrame("ScrollFrame", "EuiSLABScrollArea", frame, "UIPanelScrollFrameTemplate")
	scrollArea:Point("TOPLEFT", frame, "TOPLEFT", 8, -50)
	scrollArea:Point("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -30, 50)
	E.Skins:HandleScrollBar(scrollArea)

	local editBox = CreateFrame("EditBox", nil, frame)
	editBox:SetMultiLine(true)
	editBox:SetMaxLetters(99999)
	editBox:EnableMouse(true)
	editBox:SetAutoFocus(true)
	editBox:SetFontObject(ChatFontNormal)
	editBox:Width(scrollArea:GetWidth())
	editBox:Height(200)
	scrollArea:SetScrollChild(editBox)
	frame.editBox = editBox
end

function K:OutputStr()
	if not EuiSLAB then CreateSLABFrame(); end
	
	local db = K:ScanActionbar();
	EuiSLAB.Load:Hide();
	EuiSLAB.editBox:SetText(TableToString(db));
	EuiSLAB.editBox:HighlightText(0);
	EuiSLAB:Show();
end

function K:InputStr()
	if not EuiSLAB then CreateSLABFrame(); end
	
	EuiSLAB.Load:Show();
	EuiSLAB.editBox:SetText('');
	EuiSLAB:Show();
end

function K:DeleteDB()
	E.db.euiscript.key = nil
	E.Options.args.actionbar.args.layoutsave.args.desc.name = NONE
	E:Print(L["Actionbar layout db is delete!"])
end

local function LoadOpt()
	--Create Options
	E.Options.args.actionbar.args.layoutsave = {
		order = 30,
		type = "group",
		name = L["Actionbar Layout Save and Load"],
		disabled = function() return not E:GetModule("SLAB") end,
		guiInline = true,
		args = {
			desc = {
				order = 0,
				type = 'description',
				name = E.db.euiscript.key and E.db.euiscript.key.desc or NONE,
				desc = '',
			},
			save = {
				order = 1,
				name = L["Save Actionbar Layout"],
				type = 'execute',
				func = function() E.db.euiscript.key = E:GetModule("SLAB"):ScanActionbar(); end,
			},
			write = {
				order = 2,
				name = L["Load Actionbar Layout"],
				type = 'execute',
				func = function() E:GetModule("SLAB"):WriteActionbar(E.db.euiscript.key); end,
			},
			deletedb = {
				type = 'execute',
				name = L["Delete Actionbar Layout DB"],
				order = 3,
				func = function() E:GetModule("SLAB"):DeleteDB(); end,
			},
			output = {
				order = 4,
				name = L["Output Actionbar layout"],
				type = 'execute',
				func = function() E:GetModule("SLAB"):OutputStr(); E:ToggleConfig() end,
			},
			input = {
				order = 5,
				name = L["Input Actionbar layout"],
				type = 'execute',
				func = function() E:GetModule("SLAB"):InputStr(); E:ToggleConfig() end,
			},
		},
	}
end

function K:ADDON_LOADED(event, addon)
	if addon == 'ElvUI_Config' then
		LoadOpt()
		self:UnregisterEvent('ADDON_LOADED')
	end
end

function K:Initialize()
	self:RegisterEvent("ADDON_LOADED")
end

E:RegisterModule(K:GetName());
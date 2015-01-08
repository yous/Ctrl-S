----------------------------------------------------------
--								Thank Author: Slizen	--
--				     2011/04/29 zhTW Billy				--
--  http://home.gamer.com.tw/home.php?owner=billy6719	--
----------------------------------------------------------
local E = unpack(ElvUI) -- Import Functions/Constants, Config, Locales
if E.db.euiscript.embedfocuser1 == 'none' then return; end

local modifier = E.db.euiscript.embedfocuser1 or "shift" -- "shift" , "alt" , "ctrl"  --와 키보드 변경
local mouseButton = E.db.euiscript.embedfocuser2 or "1" -- "1" = 좌측, "2" = 우측, "3" = 중간, "4" and "5" --와 마우스를 변경

local function SetFocusHotkey(frame)
	if not frame then return; end
	frame:SetAttribute(modifier.."-type"..mouseButton,"focus")
end

local function CreateFrame_Hook(type, name, parent, template)
	if template == "SecureUnitButtonTemplate" then
		SetFocusHotkey(_G[name])
	end
end

hooksecurefunc("CreateFrame", CreateFrame_Hook)

-- Keybinding override so that models can be shift/alt/ctrl+clicked
local f = CreateFrame("CheckButton", "FocuserButton", UIParent, "SecureActionButtonTemplate")
f:SetAttribute("type1","macro")
f:SetAttribute("macrotext","/focus mouseover")
SetOverrideBindingClick(FocuserButton,true,modifier.."-BUTTON"..mouseButton,"FocuserButton")

-- Set the keybindings on the default unit frames since we won't get any CreateFrame notification about them
local duf = {
	ElvUF_Player,
	ElvUF_Pet,	
	ElvUF_Target,
	ElvUF_Targettarget,
	PlayerFrame,
	PetFrame,
	PartyMemberFrame1,
	PartyMemberFrame2,
	PartyMemberFrame3,
	PartyMemberFrame4,
	PartyMemberFrame1PetFrame,
	PartyMemberFrame2PetFrame,
	PartyMemberFrame3PetFrame,
	PartyMemberFrame4PetFrame,
	TargetFrame,
	TargetofTargetFrame,
}

for i,frame in pairs(duf) do
	SetFocusHotkey(frame)
end
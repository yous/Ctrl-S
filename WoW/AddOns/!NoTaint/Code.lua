--[[--------------------------------------------
Deal with StaticPopup_Show()
/run StaticPopup_Show('PARTY_INVITE',"test") 
----------------------------------------------]]
do
    local function hook()
        PlayerTalentFrame_Toggle = function() 
            if ( not PlayerTalentFrame:IsShown() ) then 
                ShowUIPanel(PlayerTalentFrame); 
                TalentMicroButtonAlert:Hide(); 
            else 
                PlayerTalentFrame_Close(); 
            end 
        end

        for i=1, 10 do
            local tab = _G["PlayerTalentFrameTab"..i];
            if not tab then break end
            tab:SetScript("PreClick", function()
                --print("PreClicked")
                for index = 1, STATICPOPUP_NUMDIALOGS, 1 do
                    local frame = _G["StaticPopup"..index];
                    if(not issecurevariable(frame, "which")) then
                        local info = StaticPopupDialogs[frame.which];
                        if frame:IsShown() and info and not issecurevariable(info, "OnCancel") then
                            info.OnCancel()
                        end
                        frame:Hide()
                        frame.which = nil
                    end
                end
            end)
        end
    end

    if(IsAddOnLoaded("Blizzard_TalentUI")) then
        hook()
    else
        local f = CreateFrame("Frame")
        f:RegisterEvent("ADDON_LOADED")
        f:SetScript("OnEvent", function(self, event, addon)
            if(addon=="Blizzard_TalentUI")then
                self:UnregisterEvent("ADDON_LOADED")
                hook()
            end             
        end)
    end
end

--[[--------------------------------------------
Deal with UIFrameFlash & UIFrameFade
/run UIFrameFlash(PlayerFrame, 1,1, -1,true,0,0,"test")
----------------------------------------------]]
do
    local L
    if GetLocale()=="zhTW" or GetLocale()=="koKR" then
        L = {
            ADE_PREVENT = "!NoTaint차단UIFrameFade전환.",
            FLASH_FAILED = "당신의 플러그인UIFrameFlash，특성을 전환하지 못할 수도 있습니다 ，해당 코드를 수정하십시오 。",
        }
    else
        L = {
            FADE_PREVENT = "Call of UIFrameFade is prevented by !NoTaint.",
            FLASH_FAILED = "AddOn calls UIFrameFlash, you may not be able to switch talent.",
        }
    end

    hooksecurefunc("UIFrameFlash", function (frame, fadeInTime, fadeOutTime, flashDuration, showWhenDone, flashInHoldTime, flashOutHoldTime, syncId)
        if ( frame ) then
            if not issecurevariable(frame, "syncId") or not issecurevariable(frame, "fadeInTime") or not issecurevariable(frame, "flashTimer") then
                --error(L.FLASH_FAILED)
                --UIFrameFlashStop(frame)
                --frameFlashManager:SetScript("OnUpdate", nil)
            end
        end
    end)
end


--[[-------------------------------------------------------------------
 http://bbs.ngacn.cc/read.php?tid=5901398

/run StaticPopup_Show('PARTY_INVITE',"a") 
----------------------------------------------------------------------]]

--[[

for k,v in pairs(frame) do
    if not issecurevariable(frame, k) then frame[k] = nil end
end

tab:HookScript("OnClick", function()
    testObj(PlayerTalentGroup)
end)

hooksecurefunc("UIFrameFade", function (frame, fadeInfo)
	if (not frame) then
		return;
	end
    if not issecurevariable(frame, "fadeInfo") then
        UIFrameFadeRemoveFrame(frame)
        if UICoreFrameFade then 
            UICoreFrameFade(frame, fadeInfo)
        else
            error(L.FADE_PREVENT)
        end
    end
end)

hooksecurefunc("UIFrameFlash", function(frame, ...)
    --table.wipe(FLASHFRAMES) --this line will cause taint, aslo tDeleteItem(FLASHFRAMES, frame);
    frame.syncId = nil
    UICoreFrameFlash(frame, ...)
end)

hooksecurefunc("UIFrameFlashStop", function(frame)
    UICoreFrameFlashStop(frame)
end)
]]
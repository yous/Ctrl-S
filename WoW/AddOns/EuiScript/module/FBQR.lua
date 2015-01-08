local E = unpack(ElvUI) -- Import Functions/Constants, Config, Locales
local qrcodeText, qrcodeText2

local instanceT = {
	-- [557] = "http://wow.178.com",								
	[477] = "http://wow.tuwan.com/58200/",		
	[457] = "http://wow.tuwan.com/48401_8/",		
}

local function init()
    for y=1,50 do
        for x=1,50 do
            local f = CreateFrame("Frame", "qr" .. x .. "_" .. y, EuiQRCodesFrame.viewFrame);
            f:SetWidth(4);
            f:SetHeight(4);
            f.texture = f:CreateTexture();
            f.texture:SetAllPoints(f);
            f.texture:SetTexture(0, 0, 0);
            f:SetPoint("BOTTOMLEFT", 4 + (y * 4), 8 + ((35 - x) * 4));
            f:Hide();
        end
    end
--	EuiQRCodesFrame:SetTemplate("Transparent")
	EuiQRCodesFrame.viewFrame:ClearAllPoints()
	EuiQRCodesFrame.viewFrame:SetPoint("CENTER", EuiQRCodesFrame, "CENTER", 0, 0)
	EuiQRCodesFrame.viewFrame:SetScript('OnMouseDown', function(self)
		if not ChatFrame1EditBox:IsShown() then
			ChatFrame1EditBox:Show();
		end
		ChatFrame1EditBox:Insert(instanceT[EncounterJournal.instanceID]);
		ChatFrame1EditBox:HighlightText(0);
		ChatFrame1EditBox:SetFocus();
	end)
end

local function reset()
    for y=1,50 do
        for x=1,50 do
            _G["qr"..x.."_"..y]:Hide();
        end
    end
end

local function qrgen(str)
    local a, t = qrcode(str);
    reset();
	EuiQRCodesFrame.viewFrame:SetWidth((#t * 4) + 16);
    EuiQRCodesFrame.viewFrame:SetHeight((#t * 4) + 16);

    for y = 1, #t do
        for x = 1, #t[1] do
            if (t[y][x] < 0) then
                _G["qr"..x.."_"..y]:Hide();
                _G["qr"..x.."_"..y]:SetPoint("BOTTOMLEFT", 4 + (y * 4), 8 + ((#t - x) * 4));
            else
                _G["qr"..x.."_"..y]:Show();
                _G["qr"..x.."_"..y]:SetPoint("BOTTOMLEFT", 4 + (y * 4), 8 + ((#t - x) * 4));
            end
        end
    end
end
	
local function drawQRCodes(url,text)
	qrgen(url)
	qrcodeText:SetText(string.format("%s 해적 스캔", text))
	qrcodeText2:SetText("채팅 입력 창에 URL을 복사합니다")
end

local function creatQRInfo()
	local instanceID = EncounterJournal.instanceID
	if instanceT[instanceID] then
		EuiQRCodesFrame:Show();
		drawQRCodes(instanceT[instanceID],EJ_GetInstanceInfo(instanceID));
	else
		EuiQRCodesFrame:Hide();
	end
end

local function EuiQRCodesFrameUpdate()
	if EncounterJournalNavBarButton2 and EncounterJournalNavBarButton2:IsShown() then
		creatQRInfo();
	end
end

local function BigFootQRCodes_Initialize()
	EuiQRCodesFrame:SetFrameLevel(EncounterJournal:GetFrameLevel());
	EuiQRCodesFrame:SetPoint("BOTTOMLEFT",EncounterJournalEncounterFrameInstanceFrameMapButton,"TOPLEFT", 76, 2);
	EuiQRCodesFrame:SetParent(EncounterJournalEncounterFrameInstanceFrame)
	EuiQRCodesFrame:StripTextures()
	qrcodeText = EuiQRCodesFrame.viewFrame:CreateFontString(nil, 'OVERLAY', 'GameFontNormal')
	qrcodeText:SetPoint('TOP', EuiQRCodesFrame.viewFrame, 'BOTTOM', 0, -4)
	qrcodeText2 = EuiQRCodesFrame.viewFrame:CreateFontString(nil, 'OVERLAY', 'GameFontNormal')
	qrcodeText2:SetPoint('BOTTOM', EuiQRCodesFrame.viewFrame, 'TOP', 0, 4)
	
	hooksecurefunc("EncounterJournal_DisplayInstance",function ()
		EuiQRCodesFrameUpdate()
	end)
end

do
	if IsAddOnLoaded("Blizzard_EncounterJournal") then
		BigFootQRCodes_Initialize()
	else
		local f = CreateFrame("Frame")
		f:RegisterEvent("ADDON_LOADED")
		f:SetScript("OnEvent", function(_,event,...)
			if event=="ADDON_LOADED" and select(1,...) == "Blizzard_EncounterJournal" then
				init()
				BigFootQRCodes_Initialize()
				f:UnregisterEvent("ADDON_LOADED")
				f = nil;
			end
		end)
	end
end

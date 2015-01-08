local E, L, DF = unpack(select(2, ...)); --Engine
local CH = E:GetModule('Chat')

local ChatEmote = {}
E.ChatEmote = ChatEmote
ChatEmote.Config = {
	iconSize = 24,
	enableEmoteInput = true,
}
-- enUS by 이모티콘
if (GetLocale() == "zhCN") then
	ChatEmote.tipstr = "点击打开聊天表情框" --Click to open emoticon frame
elseif (GetLocale() == "koKR") then
	ChatEmote.tipstr = "이모티콘 버튼" --Click to open emoticon frame
else
	ChatEmote.tipstr = "Click to open emoticon frame"
end
local customEmoteStartIndex = 9

local emotes = {
	{"{별}",	[=[Interface\TargetingFrame\UI-RaidTargetingIcon_1]=]},
	{"{둥글}",	[=[Interface\TargetingFrame\UI-RaidTargetingIcon_2]=]},
	{"{다이아}",	[=[Interface\TargetingFrame\UI-RaidTargetingIcon_3]=]},
	{"{역삼}",	[=[Interface\TargetingFrame\UI-RaidTargetingIcon_4]=]},
	{"{달}",	[=[Interface\TargetingFrame\UI-RaidTargetingIcon_5]=]},
	{"{네모}",	[=[Interface\TargetingFrame\UI-RaidTargetingIcon_6]=]},
	{"{엑스}",	[=[Interface\TargetingFrame\UI-RaidTargetingIcon_7]=]},
	{"{해골}",	[=[Interface\TargetingFrame\UI-RaidTargetingIcon_8]=]},
	{"{천사}",	[=[Interface\Addons\ElvUI\modules\chat\icon\Angel]=]}, --Angel
	{"{성난}",	[=[Interface\Addons\ElvUI\modules\chat\icon\Angry]=]}, --Angry

	{"{웃다}",	[=[Interface\Addons\ElvUI\modules\chat\icon\Biglaugh]=]}, --Biglaugh
	{"{박수 갈채하다}",	[=[Interface\Addons\ElvUI\modules\chat\icon\Clap]=]}, --Clap
	{"{시원한}",	[=[Interface\Addons\ElvUI\modules\chat\icon\Cool]=]}, --Cool
	{"{울어}",	[=[Interface\Addons\ElvUI\modules\chat\icon\Cry]=]}, --Cry
	{"{귀여운}",	[=[Interface\Addons\ElvUI\modules\chat\icon\Cutie]=]}, --Cutie
	{"{경멸}",	[=[Interface\Addons\ElvUI\modules\chat\icon\Despise]=]}, --Despise
	{"{꿈}",	[=[Interface\Addons\ElvUI\modules\chat\icon\Dreamsmile]=]}, --Dreamsmile
	{"{어색한}",	[=[Interface\Addons\ElvUI\modules\chat\icon\Embarrass]=]}, --Embarrass
	{"{악}",	[=[Interface\Addons\ElvUI\modules\chat\icon\Evil]=]}, --Evil
	{"{흥분한}",	[=[Interface\Addons\ElvUI\modules\chat\icon\Excited]=]}, --Excited

	{"{Faint}",	[=[Interface\Addons\ElvUI\modules\chat\icon\Faint]=]}, --Faint
	{"{싸우다}",	[=[Interface\Addons\ElvUI\modules\chat\icon\Fight]=]}, --Fight
	{"{독감}",	[=[Interface\Addons\ElvUI\modules\chat\icon\Flu]=]}, --Flu
	{"{고정}",	[=[Interface\Addons\ElvUI\modules\chat\icon\Freeze]=]}, --Freeze
	{"{눈살을 찌푸리다}",	[=[Interface\Addons\ElvUI\modules\chat\icon\Frown]=]}, --Frown
	{"{인사하다}",	[=[Interface\Addons\ElvUI\modules\chat\icon\Greet]=]}, --Greet
	{"{얼굴을 찌푸림}",	[=[Interface\Addons\ElvUI\modules\chat\icon\Grimace]=]}, --Grimace
	{"{으르렁 거리는 소리}",	[=[Interface\Addons\ElvUI\modules\chat\icon\Growl]=]}, --Growl
	{"{행복한}",	[=[Interface\Addons\ElvUI\modules\chat\icon\Happy]=]}, --Happy
	{"{심장}",	[=[Interface\Addons\ElvUI\modules\chat\icon\Heart]=]}, --Heart

	{"{공포}",	[=[Interface\Addons\ElvUI\modules\chat\icon\Horror]=]}, --Horror
	{"{아픈}",	[=[Interface\Addons\ElvUI\modules\chat\icon\Ill]=]}, --Ill
	{"{순진한}",	[=[Interface\Addons\ElvUI\modules\chat\icon\Innocent]=]}, --Innocent
	{"{노력}",	[=[Interface\Addons\ElvUI\modules\chat\icon\Kongfu]=]}, --Kongfu
	{"{사랑}",	[=[Interface\Addons\ElvUI\modules\chat\icon\Love]=]}, --Love
	{"{편지}",	[=[Interface\Addons\ElvUI\modules\chat\icon\Mail]=]}, --Mail
	{"{메이크업}",	[=[Interface\Addons\ElvUI\modules\chat\icon\Makeup]=]}, --Makeup
	{"{마리오}",	[=[Interface\Addons\ElvUI\modules\chat\icon\Mario]=]}, --Mario
	{"{명상}",	[=[Interface\Addons\ElvUI\modules\chat\icon\Meditate]=]}, --Meditate
	{"{비참}",	[=[Interface\Addons\ElvUI\modules\chat\icon\Miserable]=]}, --Miserable

	{"{좋아요}",	[=[Interface\Addons\ElvUI\modules\chat\icon\Okay]=]}, --Okay
	{"{예쁜}",	[=[Interface\Addons\ElvUI\modules\chat\icon\Pretty]=]}, --Pretty
	{"{침을 뱉다}",	[=[Interface\Addons\ElvUI\modules\chat\icon\Puke]=]}, --Puke
	{"{악수하다}",	[=[Interface\Addons\ElvUI\modules\chat\icon\Shake]=]}, --Shake
	{"{소리 지르다}",	[=[Interface\Addons\ElvUI\modules\chat\icon\Shout]=]}, --Shout
	{"{입닥쳐}",	[=[Interface\Addons\ElvUI\modules\chat\icon\Shuuuu]=]}, --Shuuuu
	{"{수줍음}",	[=[Interface\Addons\ElvUI\modules\chat\icon\Shy]=]}, --Shy
	{"{수면}",	[=[Interface\Addons\ElvUI\modules\chat\icon\Sleep]=]}, --Sleep
	{"{미소}",	[=[Interface\Addons\ElvUI\modules\chat\icon\Smile]=]}, --Smile
	{"{놀랐지}",	[=[Interface\Addons\ElvUI\modules\chat\icon\Suprise]=]}, --Suprise

	{"{Surrender}",	[=[Interface\Addons\ElvUI\modules\chat\icon\Surrender]=]}, --Surrender
	{"{땀}",	[=[Interface\Addons\ElvUI\modules\chat\icon\Sweat]=]}, --Sweat
	{"{Tear}",	[=[Interface\Addons\ElvUI\modules\chat\icon\Tear]=]}, --Tear
	{"{눈물}",	[=[Interface\Addons\ElvUI\modules\chat\icon\Tears]=]}, --Tears
	{"{생각}",	[=[Interface\Addons\ElvUI\modules\chat\icon\Think]=]}, --Think
	{"{킥킥 웃음}",	[=[Interface\Addons\ElvUI\modules\chat\icon\Titter]=]}, --Titter
	{"{추악한}",	[=[Interface\Addons\ElvUI\modules\chat\icon\Ugly]=]}, --Ugly
	{"{승리}",	[=[Interface\Addons\ElvUI\modules\chat\icon\Victory]=]}, --Victory
	{"{지원자}",	[=[Interface\Addons\ElvUI\modules\chat\icon\Volunteer]=]}, --Volunteer
	{"{불만}",	[=[Interface\Addons\ElvUI\modules\chat\icon\Wronged]=]}, --Wronged
}

CH.emotes = emotes

local ShowEmoteTableButton
local EmoteTableFrame

local function CreateEmoteTableFrame()
	EmoteTableFrame = CreateFrame("Frame", "EmoteTableFrame", UIParent)
	EmoteTableFrame:SetTemplate("Default")
	EmoteTableFrame:SetWidth((ChatEmote.Config.iconSize+2) * 12+4)
	EmoteTableFrame:SetHeight((ChatEmote.Config.iconSize+2) * 5+4)
	EmoteTableFrame:SetPoint("BOTTOMLEFT", LeftChatPanel, "TOPLEFT", 0, E:Scale(2))
	EmoteTableFrame:Hide()
	EmoteTableFrame:SetFrameStrata("DIALOG")

	local icon, row, col
	row = 1
	col = 1
	for i=1,#emotes do 
		text = emotes[i][1]
		texture = emotes[i][2]
		icon = CreateFrame("Frame", format("IconButton%d",i), EmoteTableFrame)
		icon:SetWidth(ChatEmote.Config.iconSize)
		icon:SetHeight(ChatEmote.Config.iconSize)
		icon.text = text
		icon.texture = icon:CreateTexture(nil,"ARTWORK")
		icon.texture:SetTexture(texture)
		icon.texture:SetAllPoints(icon)
		icon:Show()
		icon:SetPoint("TOPLEFT", (col-1)*(ChatEmote.Config.iconSize+2)+2, -(row-1)*(ChatEmote.Config.iconSize+2)-2)
		icon:SetScript("OnMouseUp", ChatEmote.EmoteIconMouseUp)
		icon:EnableMouse(true)
		col = col + 1 
		if (col>12) then
			row = row + 1
			col = 1
		end
	end
end

function ChatEmote.ToggleEmoteTable()
	if (not EmoteTableFrame) then CreateEmoteTableFrame() end
	if (EmoteTableFrame:IsShown()) then
		EmoteTableFrame:Hide()
	else
		EmoteTableFrame:Show()
	end

end

function ChatEmote.EmoteIconMouseUp(frame, button)
	if (button == "LeftButton") then
		local ChatFrameEditBox = ChatEdit_ChooseBoxForSend()
		if (not ChatFrameEditBox:IsShown()) then
			ChatEdit_ActivateChat(ChatFrameEditBox)
		end
		ChatFrameEditBox:Insert(frame.text)
	end
	ChatEmote.ToggleEmoteTable()
end

function CH:LoadChatEmote()
	if not E.db.chat.emotionIcons then return end
	CH.ChatEmote = ChatEmote
	
	if not E.kolocale then return; end
	
	CreateEmoteTableFrame()
	local cf = _G["ChatFrame1"]
	if E.db["euiscript"].chatbar ~= true then
		local button = CreateFrame("Button", format("ShowEmoteTableButton"), LeftChatPanel)
		button:SetPoint("RIGHT", LeftChatTab, "RIGHT", E.db["euiscript"].statreport and -26 or -6, 0)
		button:Size(16)
	--	button:SetTemplate("Transparent",true)

		button:SetNormalTexture("Interface\\AddOns\\ElvUI\\modules\\chat\\icon\\Smile")
		button:SetHighlightTexture("Interface\\AddOns\\ElvUI\\modules\\chat\\icon\\Smile-Highlight")

		button:SetScript("OnMouseUp", function(self, btn)
			CH.ChatEmote.ToggleEmoteTable()
		end)

		button:SetScript("OnEnter", function(self)
		--	self:SetTemplate("ClassColor", E["media"].glowTex)
			GameTooltip:SetOwner(self, 'ANCHOR_TOP', 0, 6)
			GameTooltip:AddLine(CH.ChatEmote.tipstr)
			GameTooltip:Show()
		end)
		button:SetScript("OnLeave", function(self)
			GameTooltip:Hide()
		--	self:SetTemplate("Transparent")
		end)	
		
		ShowEmoteTableButton = button
	end
end


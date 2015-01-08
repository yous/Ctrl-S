local E = unpack(ElvUI) -- Import Functions/Constants, Config, Locales
if E.db["euiscript"].bossnotes ~= true then return end


local BossData = {
	["아킨둔 "] = {
		{ ["name"] = "아킨둔 수호자", ["text"] = "",},
		{ ["name"] = "영혼술사 니아미", ["text"] = ".",},
		{ ["name"] = "아자켈", ["text"] = "",},
		{ ["name"] = "테론고르", ["text"] = "'",},
	},
	["어둠달 지하묘지"] = {
		{ ["name"] = "새다나 블러드퓨리", ["text"] = "",},
		{ ["name"] = "날리쉬", ["text"] = "'",},
		{ ["name"] = "해골아귀", ["text"] = "'",},
		{ ["name"] = "넬쥴", ["text"] = "'",},
	},	
	["파멸철로 정비소 "] = {
		{ ["name"] = "로켓스파크와 보르카", ["name1"] = "", ["name2"] = "", ["text"] = "",},
		{ ["name"] = "니트로그 썬더타워", ["text"] = "",},
		{ ["name"] = "군주 토브라", ["text"] = "",},
	},
	["상록숲"] = {
		{ ["name"] = "마른껍질", ["text"] = "B",},
		{ ["name"] = "고대 수호자", ["name1"] = "", ["name2"] = "", ["name3"] = "", ["text"] = "",},
		{ ["name"] = "대마법사 솔", ["text"] = "",},
		{ ["name"] = "제리타크", ["text"] = "",},
		{ ["name"] = "알누", ["text"] = "",},		
	},
	["피망치 잿가루 광산"] = {
		{ ["name"] = "용암주먹", ["text"] = "",},
		{ ["name"] = "노예감시자 크러쉬토", ["text"] = "",},
		{ ["name"] = "롤탈", ["text"] = "",},
		{ ["name"] = "구그로크", ["text"] = "",},		
	},	
	["강철 선착장"] = {
		{ ["name"] = "살점분리자 녹가르", ["text"] = "",},
		{ ["name"] = "파멸철로 집행자", ["text"] = "",},
		{ ["name"] = "오시르", ["text"] = ".",},
		{ ["name"] = "스컬록", ["text"] = ".",},
	},
	["검은바위 첨탑 상층 "] = {
		{ ["name"] = "금속술사 고라샨", ["text"] = "优",},
		{ ["name"] = "카이락", ["text"] = "",},
		{ ["name"] = "사령관 탈베크", ["text"] = "",},
		{ ["name"] = "괴수의 새끼", ["text"] = "",},
		{ ["name"] = "폭군 격노날개", ["text"] = "",},		
	},	
}

SLASH_BOSS1 = "/boss"
SLASH_BOSS2 = "/BOSS"
SlashCmdList["BOSS"] = function(input)
	local bossname = UnitName("target")
	if bossname == nil then
		DEFAULT_CHAT_FRAME:AddMessage("확인BOSS목표에 대한",1,0,0)
		return
	end
	for k, v in pairs(BossData) do
		for i, info in ipairs(v) do
			if(type(info.text)=="string") then
				if (bossname == info.name) or (bossname == info.name1) or (bossname == info.name2) or (bossname == info.name3) then
					SendChatMessage(info.text, E:CheckChat());
					return;
				end
			end
		end
	end
	DEFAULT_CHAT_FRAME:AddMessage("BOSS는 이러한 데이터입니다",1,0,0);
end
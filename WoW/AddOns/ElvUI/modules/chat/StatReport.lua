local E, _, V, P, G, _ = unpack(select(2, ...)); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB
local CH = E:GetModule('Chat')

local MyData = {}; 
local L = {}
if (GetLocale() == "zhCN") then
	------个人属性通报
	L.StatReport_Strings_COMMA 		= ",";
	L.StatReport_Strings_END			= "。";
	L.StatReport_Strings_LV 			= "等级";
	L.StatReport_Strings_CLASS 		= "职业";
	L.StatReport_Strings_HP 			= "生命";
	L.StatReport_Strings_MP 			= "法力";
	L.StatReport_Strings_TALENT 		= "天赋";
	L.StatReport_Strings_STR 			= "力量";
	L.StatReport_Strings_AGI 			= "敏捷";
	L.StatReport_Strings_STA 			= "耐力";
	L.StatReport_Strings_INT 			= "智力";
	L.StatReport_Strings_SPI 			= "精神";
	L.StatReport_Strings_AP 			= "强度";
	L.StatReport_Strings_HIT 			= "命中";
	L.StatReport_Strings_CRIT			= "爆击";
	L.StatReport_Strings_MST			= "精通";
	L.StatReport_Strings_EXPER		= "精准";
	L.StatReport_Strings_SSP			= "法伤";
	L.StatReport_Strings_SHP			= "治疗";
	L.StatReport_Strings_HASTE		= "急速";
	L.StatReport_Strings_SMR			= "5秒战斗回蓝";
	L.StatReport_Strings_ARMOR		= "护甲";
	L.StatReport_Strings_DEF			= "防御";
	L.StatReport_Strings_DODGE		= "躲闪";
	L.StatReport_Strings_PARRY		= "招架";
	L.StatReport_Strings_BLOCK		= "格挡";
	L.StatReport_Strings_CRDEF		= "PvP韧性";
	L.StatReport_Strings_CRPP			= "PvP强度";
	L.StatReport_Strings_NONE			= "无";
	L.StatReport_Strings_ILVL			= "(当前)装备等级";
	L.StatReport_Strings_MRPEN		= "护甲穿透";
	L.EUI_StatReport					= "EUI属性通报";
elseif (GetLocale() == "koKR") then
	L.StatReport_Strings_COMMA 		= ",";
	L.StatReport_Strings_END			= "。";
	L.StatReport_Strings_LV 			= "레벨";
	L.StatReport_Strings_CLASS 		= "직업";
	L.StatReport_Strings_HP 			= "생명력";
	L.StatReport_Strings_MP 			= "마나";
	L.StatReport_Strings_TALENT 		= "특성";
	L.StatReport_Strings_STR 			= "힘";
	L.StatReport_Strings_AGI 			= "민첩";
	L.StatReport_Strings_STA 			= "내구도";
	L.StatReport_Strings_INT 			= "지능";
	L.StatReport_Strings_SPI 			= "정신력";
	L.StatReport_Strings_AP 			= "전투력";
	L.StatReport_Strings_HIT 			= "적중률";
	L.StatReport_Strings_CRIT			= "극대화";
	L.StatReport_Strings_MST			= "특화";
	L.StatReport_Strings_EXPER		= "숙련";
	L.StatReport_Strings_SSP			= "주문력";
	L.StatReport_Strings_SHP			= "주문력";
	L.StatReport_Strings_HASTE		= "가속";
	L.StatReport_Strings_SMR			= "MP5";
	L.StatReport_Strings_ARMOR		= "갑옷";
	L.StatReport_Strings_DEF			= "Def";
	L.StatReport_Strings_DODGE		= "회피율";
	L.StatReport_Strings_PARRY		= "무기막기";
	L.StatReport_Strings_BLOCK		= "방패막기";
	L.StatReport_Strings_CRDEF		= "PvP탄력";
	L.StatReport_Strings_CRPP			= "PvPCR";
	L.StatReport_Strings_NONE			= "None";
	L.StatReport_Strings_ILVL			= "(현재) 레벨";
	L.StatReport_Strings_MRPEN		= "방어력 관통";
	L.EUI_StatReport					= "EUI 상태 보고서";
else
	L.StatReport_Strings_COMMA 		= ", ";
	L.StatReport_Strings_END			= ".";
	L.StatReport_Strings_LV 			= "Lvl";
	L.StatReport_Strings_CLASS 		= "Class";
	L.StatReport_Strings_HP 			= "HP";
	L.StatReport_Strings_MP 			= "Mana";
	L.StatReport_Strings_TALENT 		= "Talent";
	L.StatReport_Strings_STR 			= "Str";
	L.StatReport_Strings_AGI 			= "Agi";
	L.StatReport_Strings_STA 			= "Sta";
	L.StatReport_Strings_INT 			= "Int";
	L.StatReport_Strings_SPI 			= "Spi";
	L.StatReport_Strings_AP 			= "AP";
	L.StatReport_Strings_HIT 			= "HR";
	L.StatReport_Strings_CRIT			= "Crit";
	L.StatReport_Strings_EXPER		= "Exp";
	L.StatReport_Strings_SSP			= "Bonus Dam";
	L.StatReport_Strings_SHP			= "Bonus Heal";
	L.StatReport_Strings_HASTE		= "Haste";
	L.StatReport_Strings_SMR			= "MP5";
	L.StatReport_Strings_ARMOR		= "Armor";
	L.StatReport_Strings_DEF			= "Def";
	L.StatReport_Strings_DODGE		= "Dodge";
	L.StatReport_Strings_PARRY		= "Parry";
	L.StatReport_Strings_BLOCK		= "Block";
	L.StatReport_Strings_CRDEF		= "PvPRes";
	L.StatReport_Strings_CRPP			= "PvPCR";
	L.StatReport_Strings_NONE			= "None";
	L.StatReport_Strings_ILVL			= "iLevel";
	L.StatReport_Strings_MRPEN		= "Penetration";
	L.EUI_StatReport					= "EUI Status Report";
end

CH.L = L
local function StatReport_GetPvPSpecText(switch)
	local text = ""; 
	if GetCombatRating(16) > 0 then
		text = text..MyData.CRDEF..L.StatReport_Strings_CRDEF;
		text = text..L.StatReport_Strings_COMMA;
	end 
	if GetCombatRating(27) > 0 then
		text = text..MyData.CRPP..L.StatReport_Strings_CRPP; 
		text = text..L.StatReport_Strings_COMMA;
	end 
	if switch or GetCombatRating(16) > 0 or GetCombatRating(27) > 0 then
		text = text..MyData.HP..L.StatReport_Strings_HP;
		text = text..L.StatReport_Strings_COMMA;
	end
	
	return text;
end 

local function StatReport_GetSpellText() 
	local text = ""; 
	text = text..StatReport_GetPvPSpecText(); 
	if GetCombatRating(20) > 0 then
		text = text..MyData.SHASTE..L.StatReport_Strings_HASTE;
		text = text..L.StatReport_Strings_COMMA;
	end 
	if GetCombatRating(8) > 0 then
		text = text..MyData.SHIT..L.StatReport_Strings_HIT;
		text = text..L.StatReport_Strings_COMMA;
	end
	text = text..MyData.SCRIT..L.StatReport_Strings_CRIT;
	text = text..L.StatReport_Strings_COMMA;
	text = text..MyData.SSP..L.StatReport_Strings_SSP;

	return text;
end 

local function StatReport_GetHealText() 
	local text = ""; text = text..StatReport_GetPvPSpecText();
	if GetCombatRating(20) > 0 then
		text = text..MyData.SHASTE..L.StatReport_Strings_HASTE;
		text = text..L.StatReport_Strings_COMMA;
	end 
	text = text..MyData.SCRIT..L.StatReport_Strings_CRIT; 
	text = text..L.StatReport_Strings_COMMA; 
	text = text..MyData.SPI..L.StatReport_Strings_SPI;
	text = text..L.StatReport_Strings_COMMA;
	text = text..MyData.SHP..L.StatReport_Strings_SHP;
	
	return text;
end 

local function StatReport_GetSpellAndHealText()
	local text = ""; 
	text = text..StatReport_GetPvPSpecText(); 
	if GetCombatRating(20) > 0 then
		text = text..MyData.SHASTE..L.StatReport_Strings_HASTE;
		text = text..L.StatReport_Strings_COMMA;
	end 
	if GetCombatRating(8) > 0 then
		text = text..MyData.SHIT..L.StatReport_Strings_HIT;
		text = text..L.StatReport_Strings_COMMA;
	end 
	text = text..MyData.SCRIT..L.StatReport_Strings_CRIT;
	text = text..L.StatReport_Strings_COMMA; 
	text = text..MyData.SPI..L.StatReport_Strings_SPI;
	text = text..L.StatReport_Strings_COMMA;
	text = text..MyData.SSP..L.StatReport_Strings_SSP;
	text = text..L.StatReport_Strings_COMMA; 
	text = text..MyData.SHP..L.StatReport_Strings_SHP;

	return text;
end 

local function StatReport_GetMeleeText() 
	local text = ""; text = text..StatReport_GetPvPSpecText();
	if GetCombatRating(18) > 0 then
		text = text..MyData.MHASTE..L.StatReport_Strings_HASTE;
		text = text..L.StatReport_Strings_COMMA;
	end 
	if GetCombatRating(6) > 0 then
	text = text..MyData.MHIT..L.StatReport_Strings_HIT;
	text = text..L.StatReport_Strings_COMMA;
	end
	if GetCombatRating(9) > 0 then
	text = text..MyData.MCRIT..L.StatReport_Strings_CRIT;
	text = text..L.StatReport_Strings_COMMA;
	end 
	if GetCombatRating(24) > 0 then
	text = text..MyData.MEXPER..L.StatReport_Strings_EXPER;
	text = text..L.StatReport_Strings_COMMA;
	end 
	text = text..MyData.MAP..L.StatReport_Strings_AP;
	return text; 
end 

local function StatReport_GetRangedText()
	local text = "";
	text = text..StatReport_GetPvPSpecText();
	if GetCombatRating(19) > 0 then
	text = text..MyData.RHASTE..L.StatReport_Strings_HASTE;
	text = text..L.StatReport_Strings_COMMA;
	end
	if GetCombatRating(7) > 0 then
	text = text..MyData.RHIT..L.StatReport_Strings_HIT;
	text = text..L.StatReport_Strings_COMMA;
	end 
	if GetCombatRating(10) > 0 then
	text = text..MyData.RCRIT..L.StatReport_Strings_CRIT;
	text = text..L.StatReport_Strings_COMMA;
	end
	if GetCombatRating(24) > 0 then
	text = text..MyData.REXPER..L.StatReport_Strings_EXPER;
	text = text..L.StatReport_Strings_COMMA;
	end 
	text = text..MyData.RAP..L.StatReport_Strings_AP;
	
	return text;
end 

local function StatReport_GetTankText(rHaste)
	local text = ""; 
	text = text..StatReport_GetPvPSpecText(1);
	text = text..MyData.DODGE..L.StatReport_Strings_DODGE;
	text = text..L.StatReport_Strings_COMMA;
	if GetCombatRating(6) > 0 then
	text = text..MyData.MHIT..L.StatReport_Strings_HIT;
	text = text..L.StatReport_Strings_COMMA;
	end 
	if GetCombatRating(24) > 0 then
	text = text..MyData.MEXPER..L.StatReport_Strings_EXPER;
	text = text..L.StatReport_Strings_COMMA;
	end 
	if (rHaste and GetCombatRating(18) > 0) then
	text = text..MyData.MHASTE..L.StatReport_Strings_HASTE;
	text = text..L.StatReport_Strings_COMMA;
	end 
	if (MyData.CLASS_EN ~= "DRUID") then
	text = text..MyData.PARRY..L.StatReport_Strings_PARRY;
	text = text..L.StatReport_Strings_COMMA;
	end 
	if (MyData.CLASS_EN == "WARRIOR" or MyData.CLASS_EN == "PALADIN") then
	text = text..MyData.BLOCK..L.StatReport_Strings_BLOCK; 
	text = text..L.StatReport_Strings_COMMA;
	end 
	text = text..MyData.ARMOR..L.StatReport_Strings_ARMOR;

	return text;
end 

local function StatReport_TalentData() 
	local curT = GetSpecialization() 
	local tname,duties 
	if curT then
		_, tname, _, _, _, duties = GetSpecializationInfo(curT)
	end
	local TalentStat = duties and _G[duties];

	return tname, TalentStat;
end 

local function StatReport_UnitAttackPower()
	local base, posBuff, negBuff = UnitAttackPower("player"); 
	
	return floor(base + posBuff + negBuff);
end 

local function StatReport_UnitRangedAttackPower() 
	local base, posBuff, negBuff = UnitRangedAttackPower("player");

	return floor(base + posBuff + negBuff);
end 

local function StatReport_UnitArmor()
	local base, effectiveArmor, armor, posBuff, negBuff = UnitArmor("player");

	return format("%s(%.1f%%)", floor(base + posBuff + negBuff),PaperDollFrame_GetArmorReduction(effectiveArmor, MyData.LV));
end 

local function StatReport_GetSpellBonusDamage() 
	local SSP = GetSpellBonusDamage(2); 
	for i=3, 7 do
		SSP = min(SSP, GetSpellBonusDamage(i));
	end 
	return floor(SSP);
end 

local function StatReport_GetSpellCritChance() 
	local SCRIT = GetSpellCritChance(2);
	for i=3, 7 do 
		SCRIT = min(SCRIT, GetSpellCritChance(i));
	end

	return format("%s(%.1f%%)", GetCombatRating(11),SCRIT);
end 

local function StatReport_UpdateMyData()
	MyData.Name = UnitName("player"); 
	MyData.LV = UnitLevel("player");
	MyData.CLASS, MyData.CLASS_EN = UnitClass("player");
	MyData.HP = UnitHealthMax("player"); 
	MyData.TKEY, MyData.TDATA = StatReport_TalentData(); 
	local sysLv,curLv = GetAverageItemLevel(); 
	
	if curLv then MyData.ILVL = floor(curLv); end
	if GearScore_GetScore then 
		MyData.GS = GearScore_GetScore(UnitName("player"), "player") or GS_Data[GetRealmName()].Players[UnitName("player")].GearScore or 0;
	end; 
	
	MyData.STR = UnitStat("player", 1); 
	MyData.AGI = UnitStat("player", 2);
	MyData.STA = UnitStat("player", 3);
	MyData.INT = UnitStat("player", 4);
	MyData.SPI = UnitStat("player", 5);
	
	if MyData.LV >=80 then MyData.MST = GetMasteryEffect(); end 
	MyData.MEXPER = format("%s(%.1f%%)", GetCombatRating(24),select(1,GetExpertise()));
	MyData.MHASTE = format("%s(%.1f%%)", GetCombatRating(18),GetMeleeHaste()); 
	MyData.MHIT = format("%s(%.1f%%)", GetCombatRating(6),GetCombatRatingBonus(6) + GetHitModifier()); 
	MyData.MCRIT = format("%s(%.1f%%)", GetCombatRating(9),GetCritChance()); 
	MyData.MAP = StatReport_UnitAttackPower(); 
	MyData.REXPER = format("%s(%.1f%%)", GetCombatRating(24),select(3,GetExpertise()));
	MyData.RHASTE = format("%s(%.1f%%)", GetCombatRating(19),GetRangedHaste()); 
	MyData.RHIT = format("%s(%.1f%%)", GetCombatRating(7),GetCombatRatingBonus(7) + GetHitModifier());
	MyData.RCRIT = format("%s(%.1f%%)", GetCombatRating(10),GetRangedCritChance()); 
	MyData.RAP = StatReport_UnitRangedAttackPower();
	MyData.SHASTE = format("%s(%.1f%%)", GetCombatRating(20),UnitSpellHaste("player"));
	MyData.SHIT = format("%s(%.1f%%)", GetCombatRating(8),GetCombatRatingBonus(8) + GetSpellHitModifier());
	MyData.SCRIT = StatReport_GetSpellCritChance();
	MyData.SSP = StatReport_GetSpellBonusDamage();
	MyData.SHP = GetSpellBonusHealing();
	
	local _, casting = GetManaRegen(); 
	if casting then MyData.SMR = floor(casting*5); end 
	MyData.ARMOR = StatReport_UnitArmor(); 
	MyData.DODGE = format("%s(%.1f%%)", GetCombatRating(3),GetDodgeChance());
	MyData.PARRY = format("%s(%.1f%%)", GetCombatRating(4),GetParryChance());
	MyData.BLOCK = format("%s(%.1f%%)", GetCombatRating(5),GetBlockChance());
	MyData.CRDEF = format("%s(%.1f%%)", GetCombatRating(16),GetCombatRatingBonus(16) + GetModResilienceDamageReduction());
	MyData.CRPP = format("%s(%.1f%%)", GetCombatRating(27),GetCombatRatingBonus(27));
end
	
function CH:SendReport(self,button) 
	StatReport_UpdateMyData();
	
	local msg = L.EUI_StatReport..': ';
	msg = msg..MyData.CLASS;
	msg = msg..L.StatReport_Strings_COMMA; 
	if MyData.ILVL then
		msg = msg..L.StatReport_Strings_ILVL..MyData.ILVL;
		msg = msg..L.StatReport_Strings_COMMA;
	end
	if MyData.GS then
		msg = msg.." GS:"..MyData.GS;
		msg = msg..L.StatReport_Strings_COMMA;
	end
	if MyData.TKEY and MyData.TDATA then
		msg = msg..L.StatReport_Strings_TALENT..":"..MyData.TKEY.."("..MyData.TDATA..")";
		msg = msg..L.StatReport_Strings_COMMA;
	end
	if MyData.LV >=80 then 
		msg = msg..format("%.1f%%", MyData.MST)..L.StatReport_Strings_MST; msg = msg..L.StatReport_Strings_COMMA;
	end 
	if MyData.CLASS_EN == "MAGE" or MyData.CLASS_EN == "WARLOCK" then
		msg = msg..StatReport_GetSpellText(); 
	end
	if MyData.CLASS_EN == "ROGUE" then
		msg = msg..StatReport_GetMeleeText();
	end 
	if MyData.CLASS_EN == "HUNTER" then
		msg = msg..StatReport_GetRangedText();
	end
	if MyData.CLASS_EN == "DRUID" then
		if MyData.TKEY == select(2,GetSpecializationInfo(1)) then
			msg = msg..StatReport_GetSpellText();
		elseif MyData.TKEY == select(2,GetSpecializationInfo(3)) then
			msg = msg..StatReport_GetTankText();
		elseif MyData.TKEY == select(2,GetSpecializationInfo(4)) then
			msg = msg..StatReport_GetHealText();
		else
			msg = msg..StatReport_GetMeleeText();
		end
	end
	if MyData.CLASS_EN == "SHAMAN" then
		if MyData.TKEY == select(2,GetSpecializationInfo(1)) then
			msg = msg..StatReport_GetSpellText();
		elseif MyData.TKEY == select(2,GetSpecializationInfo(3)) then
			msg = msg..StatReport_GetHealText();
		else
			msg = msg..StatReport_GetMeleeText();
		end
	end
	if MyData.CLASS_EN == "PALADIN" then
		if MyData.TKEY == select(2,GetSpecializationInfo(1)) then
			msg = msg..StatReport_GetHealText();
		elseif MyData.TKEY == select(2,GetSpecializationInfo(2)) then
			msg = msg..StatReport_GetTankText(1);
		else
			msg = msg..StatReport_GetMeleeText();
		end
	end
	if MyData.CLASS_EN == "PRIEST" then
		if MyData.TKEY == select(2,GetSpecializationInfo(1)) then
			msg = msg..StatReport_GetSpellAndHealText();
		elseif MyData.TKEY == select(2,GetSpecializationInfo(2)) then
			msg = msg..StatReport_GetHealText();
		else
			msg = msg..StatReport_GetSpellText();
		end
	end
	if MyData.CLASS_EN == "WARRIOR" then
		if MyData.TKEY == select(2,GetSpecializationInfo(3)) then 
			msg = msg..StatReport_GetTankText(); 
		else
			msg = msg..StatReport_GetMeleeText();
		end
	end
	if MyData.CLASS_EN == "DEATHKNIGHT" then
		if MyData.TKEY == select(2,GetSpecializationInfo(1)) then
			msg = msg..StatReport_GetTankText();
		else 
			msg = msg..StatReport_GetMeleeText();
		end
	end 
	if MyData.CLASS_EN == "MONK" then
		if MyData.TKEY == select(2,GetSpecializationInfo(1)) then
			msg = msg..StatReport_GetTankText(); 
		elseif MyData.TKEY == select(2,GetSpecializationInfo(2)) then
			msg = msg..StatReport_GetHealText(); 
		else
			msg = msg..StatReport_GetMeleeText();
		end
	end
	msg = msg..L.StatReport_Strings_END;
	
	if ChatFrame1EditBox:IsShown() then
		ChatFrame1EditBox:Insert(msg);
	else
		local ExistMSG = ChatFrame1EditBox:GetText() or "";
		ChatFrame1EditBox:SetText(ExistMSG..msg);
		ChatEdit_SendText(ChatFrame1EditBox);
		ChatFrame1EditBox:SetText("");
		ChatFrame1EditBox:Hide();
	end	
end 

function CH:LoadStatReport()
	if E.db["euiscript"].statreport ~= true then return end
	if E.db["euiscript"].chatbar ~= true then
		local statreport = CreateFrame("Button", "EuiStatReport", LeftChatPanel)
		statreport:Size(16)
		statreport:Point("RIGHT", LeftChatTab, "RIGHT", -6, 0)
		statreport:SetNormalTexture("Interface\\AddOns\\ElvUI\\media\\textures\\report")
		statreport:SetHighlightTexture("Interface\\AddOns\\ElvUI\\media\\textures\\report-Highlight")

		statreport:SetScript("OnMouseUp", function(self) CH:SendReport() end)

		statreport:SetScript("OnEnter", function(self) 
			GameTooltip:SetOwner(self, 'ANCHOR_TOP', 0, 6)
			GameTooltip:AddLine(L.INFO_DURABILITY_TIP)
			GameTooltip:Show() 
		end)
		statreport:SetScript("OnLeave", function(self)
			GameTooltip:Hide()
		end)
	end
end
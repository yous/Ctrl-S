local E, L, V, P, G = unpack(select(2, ...)); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB
local TT = E:NewModule('Tooltip', 'AceTimer-3.0', 'AceHook-3.0', 'AceEvent-3.0')
local rc = LibStub("LibRangeCheck-2.0")
local ItemUpgradeInfo = LibStub("LibItemUpgradeInfo-1.0")

local S_ITEM_LEVEL = ITEM_LEVEL:gsub( "%%d", "(%%d+)" )
local playerGUID = UnitGUID("player")
local _G = getfenv(0)
local GameTooltip, GameTooltipStatusBar = _G["GameTooltip"], _G["GameTooltipStatusBar"]
local find, format = string.find, string.format
local floor = math.floor
local twipe, tinsert, tconcat = table.wipe, table.insert, table.concat

local targetList, inspectCache = {}, {}
local NIL_COLOR = { r=1, g=1, b=1 }
local TAPPED_COLOR = { r=.6, g=.6, b=.6 }
local AFK_LABEL = " |cffFFFFFF[|r|cffFF0000"..L["AFK"].."|r|cffFFFFFF]|r"
local DND_LABEL = " |cffFFFFFF[|r|cffFFFF00"..L["DND"].."|r|cffFFFFFF]|r"

local tooltips = {
	GameTooltip,
	ItemRefTooltip,
	ItemRefShoppingTooltip1,
	ItemRefShoppingTooltip2,
	ItemRefShoppingTooltip3,
	AutoCompleteBox,
	FriendsTooltip,
	ConsolidatedBuffsTooltip,
	ShoppingTooltip1,
	ShoppingTooltip2,
	ShoppingTooltip3,
	WorldMapTooltip,
	WorldMapCompareTooltip1,
	WorldMapCompareTooltip2,
	WorldMapCompareTooltip3,
	DropDownList1MenuBackdrop,
	DropDownList2MenuBackdrop,
	DropDownList3MenuBackdrop,
	BNToastFrame
}

--- PVP Item Detect ---
local function IsPVPItem(link)
	local itemStats = GetItemStats(link)

	for stat in pairs(itemStats) do
		if (stat == 'ITEM_MOD_RESILIENCE_RATING_SHORT') or (stat == 'ITEM_MOD_PVP_POWER_SHORT') then
			return true
		end
	end

	return false
end

local classification = {
	worldboss = format("|cffAF5050 %s|r", BOSS),
	rareelite = format("|cffAF5050+ %s|r", ITEM_QUALITY3_DESC),
	elite = "|cffAF5050+|r",
	rare = format("|cffAF5050 %s|r", ITEM_QUALITY3_DESC)
}

local SlotName = {
	"Head","Neck","Shoulder","Back","Chest","Wrist",
	"Hands","Waist","Legs","Feet","Finger0","Finger1",
	"Trinket0","Trinket1","MainHand","SecondaryHand"
}

--All this does is increase the spacing between tooltips when you compare items
function TT:GameTooltip_ShowCompareItem(tt, shift)
	if ( not tt ) then
		tt = GameTooltip;
	end
	local item, link = tt:GetItem();
	if ( not link ) then
		return;
	end
	
	local shoppingTooltip1, shoppingTooltip2, shoppingTooltip3 = unpack(tt.shoppingTooltips);

	local item1 = nil;
	local item2 = nil;
	local item3 = nil;
	local side = "left";
	if ( shoppingTooltip1:SetHyperlinkCompareItem(link, 1, shift, tt) ) then
		item1 = true;
	end
	if ( shoppingTooltip2:SetHyperlinkCompareItem(link, 2, shift, tt) ) then
		item2 = true;
	end
	if ( shoppingTooltip3:SetHyperlinkCompareItem(link, 3, shift, tt) ) then
		item3 = true;
	end

	-- find correct side
	local rightDist = 0;
	local leftPos = tt:GetLeft();
	local rightPos = tt:GetRight();
	if ( not rightPos ) then
		rightPos = 0;
	end
	if ( not leftPos ) then
		leftPos = 0;
	end

	rightDist = GetScreenWidth() - rightPos;

	if (leftPos and (rightDist < leftPos)) then
		side = "left";
	else
		side = "right";
	end

	-- see if we should slide the tooltip
	if ( tt:GetAnchorType() and tt:GetAnchorType() ~= "ANCHOR_PRESERVE" ) then
		local totalWidth = 0;
		if ( item1  ) then
			totalWidth = totalWidth + shoppingTooltip1:GetWidth();
		end
		if ( item2  ) then
			totalWidth = totalWidth + shoppingTooltip2:GetWidth();
		end
		if ( item3  ) then
			totalWidth = totalWidth + shoppingTooltip3:GetWidth();
		end

		if ( (side == "left") and (totalWidth > leftPos) ) then
			tt:SetAnchorType(tt:GetAnchorType(), (totalWidth - leftPos), 0);
		elseif ( (side == "right") and (rightPos + totalWidth) >  GetScreenWidth() ) then
			tt:SetAnchorType(tt:GetAnchorType(), -((rightPos + totalWidth) - GetScreenWidth()), 0);
		end
	end

	-- anchor the compare tooltips
	if ( item3 ) then
		shoppingTooltip3:SetOwner(tt, "ANCHOR_NONE");
		shoppingTooltip3:ClearAllPoints();
		if ( side and side == "left" ) then
			shoppingTooltip3:SetPoint("TOPRIGHT", tt, "TOPLEFT", -2, -10);
		else
			shoppingTooltip3:SetPoint("TOPLEFT", tt, "TOPRIGHT", 2, -10);
		end
		shoppingTooltip3:SetHyperlinkCompareItem(link, 3, shift, tt);
		shoppingTooltip3:Show();
	end
	
	if ( item1 ) then
		if( item3 ) then
			shoppingTooltip1:SetOwner(shoppingTooltip3, "ANCHOR_NONE");
		else
			shoppingTooltip1:SetOwner(tt, "ANCHOR_NONE");
		end
		shoppingTooltip1:ClearAllPoints();
		if ( side and side == "left" ) then
			if( item3 ) then
				shoppingTooltip1:SetPoint("TOPRIGHT", shoppingTooltip3, "TOPLEFT", -2, 0);
			else
				shoppingTooltip1:SetPoint("TOPRIGHT", tt, "TOPLEFT", -2, -10);
			end
		else
			if( item3 ) then
				shoppingTooltip1:SetPoint("TOPLEFT", shoppingTooltip3, "TOPRIGHT", 2, 0);
			else
				shoppingTooltip1:SetPoint("TOPLEFT", tt, "TOPRIGHT", 2, -10);
			end
		end
		shoppingTooltip1:SetHyperlinkCompareItem(link, 1, shift, tt);
		shoppingTooltip1:Show();

		if ( item2 ) then
			shoppingTooltip2:SetOwner(shoppingTooltip1, "ANCHOR_NONE");
			shoppingTooltip2:ClearAllPoints();
			if ( side and side == "left" ) then
				shoppingTooltip2:SetPoint("TOPRIGHT", shoppingTooltip1, "TOPLEFT", -2, 0);
			else
				shoppingTooltip2:SetPoint("TOPLEFT", shoppingTooltip1, "TOPRIGHT", 2, 0);
			end
			shoppingTooltip2:SetHyperlinkCompareItem(link, 2, shift, tt);
			shoppingTooltip2:Show();
		end
	end
end

function TT:GameTooltip_SetDefaultAnchor(tt, parent)
	if E.private.tooltip.enable ~= true then return end
	if(tt:GetAnchorType() ~= "ANCHOR_NONE") then return end	
	if InCombatLockdown() and self.db.visibility.combat then
		tt:Hide()
		return
	end

	if(parent) then
		if(self.db.cursorAnchor) then
			tt:SetOwner(parent, "ANCHOR_CURSOR_RIGHT", self.db.offsetX, self.db.offsetY)
			if(not GameTooltipStatusBar.anchoredToTop) then
				GameTooltipStatusBar:ClearAllPoints()
				GameTooltipStatusBar:SetPoint("BOTTOMLEFT", GameTooltip, "TOPLEFT", E.Border, (E.Spacing * 3))
				GameTooltipStatusBar:SetPoint("BOTTOMRIGHT", GameTooltip, "TOPRIGHT", -E.Border, (E.Spacing * 3))
				GameTooltipStatusBar.text:Point("CENTER", GameTooltipStatusBar, 0, 3)
				GameTooltipStatusBar.anchoredToTop = true
			end			
			return
		else
			tt:SetOwner(parent, "ANCHOR_NONE")
			tt:ClearAllPoints()
			if(GameTooltipStatusBar.anchoredToTop) then
				GameTooltipStatusBar:ClearAllPoints()
				GameTooltipStatusBar:SetPoint("TOPLEFT", GameTooltip, "BOTTOMLEFT", E.Border, -(E.Spacing * 3))
				GameTooltipStatusBar:SetPoint("TOPRIGHT", GameTooltip, "BOTTOMRIGHT", -E.Border, -(E.Spacing * 3))
				GameTooltipStatusBar.text:Point("CENTER", GameTooltipStatusBar, 0, -3)
				GameTooltipStatusBar.anchoredToTop = nil
			end				
		end
	end

	if(not E:HasMoverBeenMoved('TooltipMover')) then
		if ElvUI_ContainerFrame and ElvUI_ContainerFrame:IsShown() then
			tt:SetPoint('BOTTOMRIGHT', ElvUI_ContainerFrame, 'TOPRIGHT', 0, 18)	
		elseif RightChatPanel:GetAlpha() == 1 and RightChatPanel:IsShown() then
			tt:SetPoint('BOTTOMRIGHT', RightChatPanel, 'TOPRIGHT', 0, 18)		
		else
			tt:SetPoint('BOTTOMRIGHT', RightChatPanel, 'BOTTOMRIGHT', 0, 18)
		end
	else
		local point = E:GetScreenQuadrant(TooltipMover)
		if point == "TOPLEFT" then
			tt:SetPoint("TOPLEFT", TooltipMover, "BOTTOMLEFT", 1, -4)
		elseif point == "TOPRIGHT" then
			tt:SetPoint("TOPRIGHT", TooltipMover, "BOTTOMRIGHT", -1, -4)
		elseif point == "BOTTOMLEFT" or point == "LEFT" then
			tt:SetPoint("BOTTOMLEFT", TooltipMover, "TOPLEFT", 1, 18)
		else
			tt:SetPoint("BOTTOMRIGHT", TooltipMover, "TOPRIGHT", -1, 18)
		end
	end
end

function TT:GetItemLvL(unit)
	local total, item, boa, pvp = 0, 15, 0, 0 --装备总数默认15件，双持职业就+1
	local ulvl = UnitLevel(unit)
	local not2hand
	local findItem = 0
	
	for i = 1, #SlotName do
		local slotLink = GetInventoryItemLink(unit, GetInventorySlotInfo(("%sSlot"):format(SlotName[i])))
		if (slotLink ~= nil) then
			local _, _, quality, ilvl, _, _, _, _,ItemEquipLoc = GetItemInfo(slotLink)
			if ilvl ~= nil then
				if quality == 7 then
					boa = boa + 1
				elseif IsPVPItem(slotLink) then
					pvp = pvp + 1
				end
				total = total + ItemUpgradeInfo:GetUpgradedItemLevel(slotLink)
			end

			if ((SlotName[i] == 'SecondaryHand') or (SlotName[i] == 'MainHand' and ItemEquipLoc ~= "INVTYPE_2HWEAPON" and ItemEquipLoc ~= "INVTYPE_RANGED" and ItemEquipLoc ~= "INVTYPE_RANGEDRIGHT")) and not not2hand then
				item = item + 1
				not2hand = true
			end	
			findItem = findItem + 1
		end
	end

	if (total < 1 or findItem < 15) then
		return
	end
	
	return ('%.1f'):format(total / item), boa, pvp;
end

function TT:RemoveTrashLines(tt)
	for i=3, tt:NumLines() do
		local tiptext = _G["GameTooltipTextLeft"..i]
		local linetext = tiptext:GetText()

		if(linetext:find(PVP) or linetext:find(FACTION_ALLIANCE) or linetext:find(FACTION_HORDE)) then
			tiptext:SetText(nil)
			tiptext:Hide()
		end
	end
end

function TT:GetLevelLine(tt, offset)
	for i=offset, tt:NumLines() do
		local tipText = _G["GameTooltipTextLeft"..i]
		if(tipText:GetText() and tipText:GetText():find(LEVEL)) then
			return tipText
		end
	end
end

function TT:GetTalentSpec(unit, isPlayer)
	local spec
	if(isPlayer) then
		spec = GetSpecialization()
	else
		spec = GetInspectSpecialization(unit)
	end
	if(spec ~= nil and spec > 0) then
		if(not isPlayer) then 
			local role = GetSpecializationRoleByID(spec);
			if(role ~= nil) then
				local _, name = GetSpecializationInfoByID(spec);
				return name
			end
		else
			local _, name = GetSpecializationInfo(spec)

			return name
		end
	end
end

function TT:INSPECT_READY(event, GUID)
	if(self.lastGUID ~= GUID) then return end
	
	local unit = "mouseover"

	if(UnitExists(unit)) then
		local itemLevel, boa, pvp = self:GetItemLvL(unit)
		local talentName = self:GetTalentSpec(unit)
		inspectCache[GUID] = {time = GetTime()}

		if(talentName) then
			inspectCache[GUID].talent = talentName
		end

		if(itemLevel) then
			inspectCache[GUID].itemLevel = itemLevel
			inspectCache[GUID].boa = boa
			inspectCache[GUID].pvp = pvp
		end

		GameTooltip:SetUnit(unit)
	end
	self:UnregisterEvent("INSPECT_READY")
end

function TT:ShowInspectInfo(tt, unit, level, r, g, b, numTries)
	local canInspect = CanInspect(unit)
	if(not canInspect or level < 10 or numTries > 1) then return end
	
	local GUID = UnitGUID(unit)
	if(GUID == playerGUID) then
		tt:AddDoubleLine(L["Current Talent"]..":", self:GetTalentSpec(unit, true), nil, nil, nil, r, g, b)
		tt:AddDoubleLine(L["AvgItemLvl"]..":", floor(select(2, GetAverageItemLevel())), nil, nil, nil, 1, 1, 1)		
	elseif(inspectCache[GUID]) then
		local talent = inspectCache[GUID].talent
		local boa = inspectCache[GUID].boa or 0
		local pvp = inspectCache[GUID].pvp or 0
		local itemLevel = inspectCache[GUID].itemLevel

		if(((GetTime() - inspectCache[GUID].time) > 180) or not talent or not itemLevel) then
			inspectCache[GUID] = nil

			return self:ShowInspectInfo(tt, unit, level, r, g, b, numTries + 1)
		end

		tt:AddDoubleLine(L["Current Talent"]..":", talent, nil, nil, nil, r, g, b)
		local levelstr = tostring(itemLevel)
		if boa and boa > 0 then levelstr = levelstr.. "|cffe6cc80(".. boa.. " BOA)|r" end
		if pvp and pvp > 0 then levelstr = levelstr.. "|cffa335ee(".. pvp.. " PVP)|r" end
		tt:AddDoubleLine(L["AvgItemLvl"]..":", levelstr, nil, nil, nil, 1, 1, 1)
	else
		if(not canInspect) or (InspectFrame and InspectFrame:IsShown()) then return end
		self.lastGUID = GUID
		NotifyInspect(unit)
		self:RegisterEvent("INSPECT_READY")
	end
end

local function RGB(r, g, b)
	return string.format("%02x%02x%02x", r*255, g*255, b*255);	
end

local function GetRangeColorText(minRange, maxRange)
	local color, text;
	if (minRange) then
		if (minRange > 100) then
			maxRange = nil;
		end		
		
		if (maxRange) then
			local tmpText = format("%d-%d %s", minRange, maxRange, L["Yard"]);		
	
			if ( maxRange <= 5) then
				color = RGB(0.9, 0.9, 0.9);
			elseif (maxRange <= 20) then
				color = RGB(0.055, 0.875, 0.825);
			elseif (maxRange <= 30) then
				color = RGB(0.035, 0.865, 0.0);
			elseif (minRange >= 40) then
				color = RGB(0.9, 0.055, 0.075);
			else
				color = RGB(1.0, 0.82, 0);
			end
			
			text = format("|cff%s%s|r", color, tmpText);
		end
	end
	
	return text;
end

local ReactionName = {'Hated','Hostile','Unfriendly','Neutral','Friendly','Honored','Revered','Exalted'}

function TT:GameTooltip_OnTooltipSetUnit(tt)
	local unit = select(2, tt:GetUnit())
	if((tt:GetOwner() ~= UIParent) and self.db.visibility.unitFrames ~= 'NONE') then 
		local modifier = self.db.visibility.unitFrames
		
		if(modifier == 'ALL' or not ((modifier == 'SHIFT' and IsShiftKeyDown()) or (modifier == 'CTRL' and IsControlKeyDown()) or (modifier == 'ALT' and IsAltKeyDown()))) then
			tt:Hide() 
			return
		end
	end

	if(not unit) then
		local GMF = GetMouseFocus()
		if(GMF and GMF:GetAttribute("unit")) then
			unit = GMF:GetAttribute("unit")
		end
		if(not unit or not UnitExists(unit)) then
			return
		end
	end

	self:RemoveTrashLines(tt) --keep an eye on this may be buggy
	local level = UnitLevel(unit)
	local isShiftKeyDown = IsShiftKeyDown()
	
	local color
	if(UnitIsPlayer(unit)) then
		local localeClass, class = UnitClass(unit)
		local name, realm = UnitName(unit)
		local guildName, guildRankName, guildRankIndex, guildRealm = GetGuildInfo(unit)
		local pvpName = UnitPVPName(unit)
		local relationship = UnitRealmRelationship(unit);
		color = RAID_CLASS_COLORS[class]
		if not color then --fix unknow player. by eui
			color = {
				b=0.41,
				colorStr="fffff569",
				g=0.96,
				r=1
			}
		end
		
		if(self.db.playerTitles and pvpName) then
			name = pvpName
		end

		if(realm and realm ~= "") then
			local letter = realm
			if(relationship == LE_REALM_RELATION_COALESCED) then
				letter = letter..FOREIGN_SERVER_LABEL
			elseif(relationship == LE_REALM_RELATION_VIRTUAL) then
				letter = letter..INTERACTIVE_SERVER_LABEL
			end
			name = name.."-"..letter
		end

		if(UnitIsAFK(unit)) then
			name = name..AFK_LABEL
		elseif(UnitIsDND(unit)) then
			name = name..DND_LABEL
		end
		
		GameTooltipTextLeft1:SetFormattedText("|c%s%s|r", color.colorStr, name)
		
		local lineOffset = 2
		if(guildName) then
			if(guildRealm and isShiftKeyDown) then
				guildName = guildName.."-"..guildRealm
			end

			if(self.db.guildRanks) then
				GameTooltipTextLeft2:SetText(("<|cff00ff10%s|r> [|cff00ff10%s|r][|cff00ff10%s|r]"):format(guildName, guildRankIndex, guildRankName))
			else
				GameTooltipTextLeft2:SetText(("<|cff00ff10%s|r>"):format(guildName))
			end
			lineOffset = 3
		end

		local levelLine = self:GetLevelLine(tt, lineOffset)
		if(levelLine) then
			local diffColor = GetQuestDifficultyColor(level)
			local race, englishRace = UnitRace(unit)
			local _, factionGroup = UnitFactionGroup(unit)
			if(factionGroup and englishRace == "Pandaren") then
				race = factionGroup.." "..race
			end	
			levelLine:SetFormattedText("|cff%02x%02x%02x%s|r %s |c%s%s|r", diffColor.r * 255, diffColor.g * 255, diffColor.b * 255, level > 0 and level or "??", race or UNKNOWN, color.colorStr, localeClass)
		end

		--High CPU usage, restricting it to shift key down only.
	--	if(self.db.inspectInfo and isShiftKeyDown) then
		if self.db.inspectInfo then --by eui
			self:ShowInspectInfo(tt, unit, level, color.r, color.g, color.b, 0)
		end		
	else
		if(UnitIsTapped(unit) and not UnitIsTappedByPlayer(unit)) then
			color = TAPPED_COLOR
		else
			Reaction = UnitReaction(unit, "player")
			if Reaction then color = FACTION_BAR_COLORS[Reaction] end
			if color then GameTooltip:AddDoubleLine(L["Reactions"]..':', format("|cff%02x%02x%02x%s|r", color.r * 255, color.g * 255, color.b * 255, L[ReactionName[Reaction]])) end
		end
		
		local levelLine = self:GetLevelLine(tt, 2)
		if(levelLine) then
			local isPetWild, isPetCompanion = UnitIsWildBattlePet(unit), UnitIsBattlePetCompanion(unit);
			local creatureClassification = UnitClassification(unit)
			local creatureType = UnitCreatureType(unit)
			local pvpFlag = ""
			local diffColor
			if(isPetWild or isPetCompanion) then
				level = UnitBattlePetLevel(unit)
				
				local teamLevel = C_PetJournal.GetPetTeamAverageLevel();
				if(teamLevel) then
					diffColor = GetRelativeDifficultyColor(teamLevel, level); 
				else
					diffColor = GetQuestDifficultyColor(level)
				end
			else
				diffColor = GetQuestDifficultyColor(level)
			end
	
			if(UnitIsPVP(unit)) then
				pvpFlag = format(" (%s)", PVP)
			end

			levelLine:SetFormattedText("|cff%02x%02x%02x%s|r%s %s%s", diffColor.r * 255, diffColor.g * 255, diffColor.b * 255, level > 0 and level or "??", classification[creatureClassification] or "", creatureType or "", pvpFlag)
		end
	end

	local unitTarget = unit.."target"
	if(self.db.targetInfo and unit ~= "player" and UnitExists(unitTarget)) then
		local targetColor
		if(UnitIsPlayer(unitTarget) and not UnitHasVehicleUI(unitTarget)) then
			targetColor = RAID_CLASS_COLORS[select(2, UnitClass(unitTarget))]
		else
			targetColor = FACTION_BAR_COLORS[UnitReaction(unitTarget, "player")]	
		end

		GameTooltip:AddDoubleLine(format("%s:", TARGET), format("|cff%02x%02x%02x%s|r", targetColor.r * 255, targetColor.g * 255, targetColor.b * 255, UnitName(unitTarget)))
	end

	--High CPU usage.
	if(self.db.targetInfo and IsInGroup()) then
		for i = 1, GetNumGroupMembers() do
			local groupUnit = (IsInRaid() and "raid"..i or "party"..i);
			if (UnitIsUnit(groupUnit.."target", unit)) and (not UnitIsUnit(groupUnit,"player")) then
				local _, class = UnitClass(groupUnit);
				tinsert(targetList, format("|c%s%s|r", RAID_CLASS_COLORS[class].colorStr, UnitName(groupUnit)))
			end
		end
		local numList = #targetList
		if (numList > 0) then
			GameTooltip:AddLine(format("%s (|cffffffff%d|r): %s", L['Targeted By:'], numList, tconcat(targetList, ", ")), nil, nil, nil, true);
			twipe(targetList);
		end	
	end
	
	-- Range line by eui
	if E.db.tooltip.range and UnitExists(unit) and unit ~= "player" and rc then
		local minRange, maxRange = rc:getRange(unit)
		if maxRange then
			local text = GetRangeColorText(minRange, maxRange)
			GameTooltip:AddDoubleLine(L["Range"]..":", text)
		else
			GameTooltip:AddDoubleLine(L["Range"]..":", '80+')
		end
	end		

	if(color) then
		GameTooltipStatusBar:SetStatusBarColor(color.r, color.g, color.b)
	else
		GameTooltipStatusBar:SetStatusBarColor(0.6, 0.6, 0.6)
	end
end

function TT:GameTooltipStatusBar_OnValueChanged(tt, value)
	if not value or not self.db.healthBar.text or not tt.text then return end
	local unit = select(2, tt:GetParent():GetUnit())
	if(not unit) then
		local GMF = GetMouseFocus()
		if(GMF and GMF:GetAttribute("unit")) then
			unit = GMF:GetAttribute("unit")
		end
	end

	local min, max = tt:GetMinMaxValues()
	if(value > 0 and max == 1) then
		tt.text:SetText(format("%d%%", floor(value * 100)))
		tt:SetStatusBarColor(TAPPED_COLOR.r, TAPPED_COLOR.g, TAPPED_COLOR.b) --most effeciant?
	elseif(value == 0 or (unit and UnitIsDeadOrGhost(unit))) then
		tt.text:SetText(DEAD)
	else
		tt.text:SetText(E:ShortValue(value).." / "..E:ShortValue(max))
	end
end

function TT:GameTooltip_OnTooltipCleared(tt)
	tt.itemCleared = nil
end

function TT:GameTooltip_OnTooltipSetItem(tt)
	if not tt.itemCleared then
		local item, link = tt:GetItem()
		local num = GetItemCount(link)
		local numall = GetItemCount(link,true)
		local left = " "
		local right = " "
		local bankCount = " "

		if link ~= nil and self.db.spellID then
			left = (("|cFFCA3C3C%s|r %s"):format(ID, link)):match(":(%w+)")
		end

		if self.db.itemCount == "BAGS_ONLY" then
			right = ("|cFFCA3C3C%s|r %d"):format(L['Count'], num)
		elseif self.db.itemCount == "BANK_ONLY" then
			bankCount = ("|cFFCA3C3C%s|r %d"):format(L['Bank'],(numall - num))
		elseif self.db.itemCount == "BOTH" then
			right = ("|cFFCA3C3C%s|r %d"):format(L['Count'], num)
			bankCount = ("|cFFCA3C3C%s|r %d"):format(L['Bank'],(numall - num))
		end

		if left ~= " " or right ~= " " then
			tt:AddLine(" ")
			tt:AddDoubleLine(left, right)
		end
		if bankCount ~= " " then
			tt:AddDoubleLine(" ", bankCount)
		end

		tt.itemCleared = true
	end
end

function TT:GameTooltip_ShowStatusBar(tt, min, max, value, text)
	local statusBar = _G[tt:GetName().."StatusBar"..tt.shownStatusBars];
	if statusBar and not statusBar.skinned then
		statusBar:StripTextures()
		statusBar:SetStatusBarTexture(E['media'].normTex)
		statusBar:CreateBackdrop('Default')
		statusBar.skinned = true;
	end
end

function TT:SetStyle(tt)
--	tt:SetTemplate("Transparent")
	tt:SetTemplate(E.db.tooltip.transparent and "notrans" or "Transparent")
end

function TT:MODIFIER_STATE_CHANGED(event, key)
	if((key == "LSHIFT" or key == "RSHIFT") and UnitExists("mouseover")) then
		GameTooltip:SetUnit('mouseover')
	end
end

function TT:SetUnitAura(tt, unit, index, filter)
	local _, _, _, _, _, _, _, caster, _, _, id = UnitAura(unit, index, filter)
	local showIt = false
	if id and self.db.spellID then
		if caster and UnitClass(caster) then
			local name = UnitName(caster)
			local _, class = UnitClass(caster)
			local color = RAID_CLASS_COLORS[class]
			tt:AddDoubleLine(("|cFFCA3C3C%s|r %d"):format(ID, id), format("|c%s%s|r", color.colorStr, name))
		else
			tt:AddLine(("|cFFCA3C3C%s|r %d"):format(ID, id))
		end
		showIt = true
	end
	if id and self.db.mountinfo then
		-- Version: 2.1
		-- Author: Yafis
		-- Title: MountInfo
		-- 本地化：by Eui老中医
		for i = 1, C_MountJournal.GetNumMounts() do
			local creatureName, spellID, icon, active, isUsable, sourceType, isFavorite, isFactionSpecific, faction, hideOnChar, isCollected = C_MountJournal.GetMountInfo(i)
			if spellID == id then
				local creatureDisplayID, descriptionText, sourceText, isSelfMount = C_MountJournal.GetMountInfoExtra(i)
				tt:AddLine(' ')
				tt:AddLine(L["Mount Info"], 1, 1, 1)
				tt:AddLine(sourceText, 1, 1, 1)						
				if isCollected then
					tt:AddLine(L["Mount Info haved"], GREEN_FONT_COLOR.r, GREEN_FONT_COLOR.g, GREEN_FONT_COLOR.b)
				else
					tt:AddLine(L["Mount Info not haved"], RED_FONT_COLOR.r, RED_FONT_COLOR.g, RED_FONT_COLOR.b)
				end
			end
		end	
		showIt = true		
		--MountInfo end
	end
	if showIt then tt:Show() end
end

function TT:SetConsolidatedUnitAura(tt, unit, index)
	local name = GetRaidBuffTrayAuraInfo(index)
	local _, _, _, _, _, _, _, caster, _, _, id = UnitAura(unit, name)
	if id and self.db.spellID then
		if caster and UnitClass(caster) then
			local name = UnitName(caster)
			local _, class = UnitClass(caster)
			local color = RAID_CLASS_COLORS[class]
			tt:AddDoubleLine(("|cFFCA3C3C%s|r %d"):format(ID, id), format("|c%s%s|r", color.colorStr, name))
		else
			tt:AddLine(("|cFFCA3C3C%s|r %d"):format(ID, id))
		end

		tt:Show()
	end	
end

function TT:GameTooltip_OnTooltipSetSpell(tt)
	local id = select(3, tt:GetSpell())
	if not id or not self.db.spellID then return end

	local displayString = ("|cFFCA3C3C%s|r %d"):format(ID, id)
	local lines = tt:NumLines()
	local isFound
	for i= 1, lines do
		local line = _G[("GameTooltipTextLeft%d"):format(i)]
		if line and line:GetText() and line:GetText():find(displayString) then
			isFound = true;
			break
		end
	end
	
	if not isFound then
		tt:AddLine(displayString)
		tt:Show()
	end
end

function TT:SetItemRef(link, text, button, chatFrame)
	if find(link,"^spell:") and self.db.spellID then
		local id = string.sub(link,7)
		ItemRefTooltip:AddLine(("|cFFCA3C3C%s|r %d"):format(ID, id))
		ItemRefTooltip:Show()
	end
end

function TT:RepositionBNET(frame, point, anchor, anchorPoint, xOffset, yOffset)
	if anchor ~= BNETMover then
		BNToastFrame:ClearAllPoints()
		BNToastFrame:Point('TOPLEFT', BNETMover, 'TOPLEFT');
	end
end

function TT:CheckBackdropColor()
	local r, g, b = GameTooltip:GetBackdropColor()
	r = E:Round(r, 1)
	g = E:Round(g, 1)
	b = E:Round(b, 1)
	local red, green, blue, alpha = unpack(E.media.backdropfadecolor)

	if(r ~= red or g ~= green or b ~= blue) then
		GameTooltip:SetBackdropColor(red, green, blue, alpha)
	end
end

function TT:Initialize()
	self.db = E.db.tooltip

	BNToastFrame:Point('TOPRIGHT', MMHolder, 'BOTTOMRIGHT', 0, -10);
	E:CreateMover(BNToastFrame, 'BNETMover', L['BNet Frame'])
	self:SecureHook(BNToastFrame, "SetPoint", "RepositionBNET")

	if E.private.tooltip.enable ~= true then return end
	E.Tooltip = TT

	GameTooltipStatusBar:Height(self.db.healthBar.height)
	GameTooltipStatusBar:SetStatusBarTexture(E["media"].normTex)
	GameTooltipStatusBar:CreateBackdrop('Transparent')
	GameTooltipStatusBar:SetScript("OnValueChanged", self.OnValueChanged)
	GameTooltipStatusBar:ClearAllPoints()
	GameTooltipStatusBar:SetPoint("TOPLEFT", GameTooltip, "BOTTOMLEFT", E.Border, -(E.Spacing * 3))
	GameTooltipStatusBar:SetPoint("TOPRIGHT", GameTooltip, "BOTTOMRIGHT", -E.Border, -(E.Spacing * 3))		
	GameTooltipStatusBar.text = GameTooltipStatusBar:CreateFontString(nil, "OVERLAY")
	GameTooltipStatusBar.text:Point("CENTER", GameTooltipStatusBar, 0, -3)
	GameTooltipStatusBar.text:FontTemplate(E.LSM:Fetch("font", self.db.healthBar.font), self.db.healthBar.fontSize, "OUTLINE")
	
	local GameTooltipAnchor = CreateFrame('Frame', 'GameTooltipAnchor', E.UIParent)
	GameTooltipAnchor:Point('BOTTOMRIGHT', E.UIParent, 'BOTTOMRIGHT')
	GameTooltipAnchor:Size(130, 20)
	GameTooltipAnchor:SetFrameLevel(GameTooltipAnchor:GetFrameLevel() + 50)
	E:CreateMover(GameTooltipAnchor, 'TooltipMover', L['Tooltip'])
	
	self:SecureHook('GameTooltip_SetDefaultAnchor')
	self:SecureHook('GameTooltip_ShowStatusBar')
	self:SecureHook("SetItemRef")
--	self:SecureHook("GameTooltip_ShowCompareItem")
	self:SecureHook(GameTooltip, "SetUnitAura")
	self:SecureHook(GameTooltip, "SetUnitBuff", "SetUnitAura")
	self:SecureHook(GameTooltip, "SetUnitDebuff", "SetUnitAura")
	self:SecureHook(GameTooltip, "SetUnitConsolidatedBuff", "SetConsolidatedUnitAura")
	self:HookScript(GameTooltip, "OnTooltipSetSpell", "GameTooltip_OnTooltipSetSpell")
	self:HookScript(GameTooltip, 'OnTooltipCleared', 'GameTooltip_OnTooltipCleared')
	self:HookScript(GameTooltip, 'OnTooltipSetItem', 'GameTooltip_OnTooltipSetItem')
	self:HookScript(GameTooltip, 'OnTooltipSetUnit', 'GameTooltip_OnTooltipSetUnit')
	self:HookScript(GameTooltipStatusBar, 'OnValueChanged', 'GameTooltipStatusBar_OnValueChanged')
	self:HookScript(GameTooltip, "OnSizeChanged", "CheckBackdropColor")
	
	self:RegisterEvent("MODIFIER_STATE_CHANGED")
	self:RegisterEvent("CURSOR_UPDATE", "CheckBackdropColor")
	E.Skins:HandleCloseButton(ItemRefCloseButton)
	for _, tt in pairs(tooltips) do
		self:HookScript(tt, 'OnShow', 'SetStyle')
	end
end

E:RegisterModule(TT:GetName())
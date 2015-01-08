local E, L, V, P, G, _ = unpack(select(2, ...)); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB, Localize Underscore
local DT = E:GetModule('DataTexts')
local LO = E:GetModule('Layout');

local function Click(self, button)
	if button == 'LeftButton' then
		local chattype = "SAY"
		if IsInRaid() then
			chattype = "RAID"
		elseif IsInGroup() then
			chattype = "PARTY"
		end
		local targetStr, current = '', '';
		if UnitName('target') then
			targetStr = UnitName('target').. '@ '
			current = E:GetFormattedText('CURRENT_PERCENT', UnitHealth('target'), UnitHealthMax('target'))
		end
		local msg = targetStr.. GetRealZoneText()..": ".. self.loc.. " - ".. current;
		if ChatFrame1EditBox:IsShown() then
			ChatFrame1EditBox:Insert(msg);
		else
			SendChatMessage(msg, chattype)
		end
	elseif button == 'RightButton' then
		ToggleFrame(WorldMapFrame)
	end
end

local function OnEnter(self)
	DT:SetupTooltip(self)

	DT.tooltip:AddDoubleLine(L["Left button:"], L["Send player's coord to chatframe"], 0.69, 0.31, 0.31,0.84, 0.75, 0.65)
	DT.tooltip:AddDoubleLine(L["Right button:"], L["Open world map"], 0.69, 0.31, 0.31,0.84, 0.75, 0.65)
	
	DT.tooltip:Show()
end

local function OnLeave(self)
	DT.tooltip:Hide()
end

local function Update(self, elapsed)
	if(self.elapsed and self.elapsed > 0.2) then
		local x,y = GetPlayerMapPosition("player")
		
		x = math.floor(100 * x)
		y = math.floor(100 * y)

		if x == 0 and y == 0 then
			self.loc = '??, ??'
		else
			self.loc = x.. ', '.. y
		end
		self.text:SetText(E:RGBToHex(LO:GetLocTextColor()).. self.loc.. '|r')

		self.elapsed = 0
	else
		self.elapsed = (self.elapsed or 0) + elapsed
	end	
end

local function OnEvent(self)
	self.text:SetText("?, ?")
end

--[[
	DT:RegisterDatatext(name, events, eventFunc, updateFunc, clickFunc, onEnterFunc, onLeaveFunc)
	
	name - name of the datatext (required)
	events - must be a table with string values of event names to register 
	eventFunc - function that gets fired when an event gets triggered
	updateFunc - onUpdate script target function
	click - function to fire when clicking the datatext
	onEnterFunc - function to fire OnEnter
	onLeaveFunc - function to fire OnLeave, if not provided one will be set for you that hides the tooltip.
]]
DT:RegisterDatatext('E_Coord', {'PLAYER_ENTER_WORLD'}, OnEvent, Update, Click, OnEnter, OnLeave)
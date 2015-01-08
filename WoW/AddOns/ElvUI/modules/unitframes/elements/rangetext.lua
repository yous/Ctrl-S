local E, L, V, P, G, _ = unpack(select(2, ...)); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB, Localize Underscore
local UF = E:GetModule('UnitFrames');
local RC = LibStub("LibRangeCheck-2.0")

function UF:Construct_Tapped(frame)
	local tapped = frame:CreateFontString(nil, 'OVERLAY')
	UF:Configure_FontString(tapped)

	return tapped
end

function UF:ConstructTargetRange(frame)
	local R = CreateFrame("Frame", nil, frame)
	R.rcText = R:CreateFontString(nil, 'OVERLAY')
	UF:Configure_FontString(R.rcText)
	
	R:SetScript("OnUpdate", function(self, elapsed)
		if(self.elapsed and self.elapsed > 0.2) then
			UF:UpdateTargetRange(frame)
			
			self.elapsed = 0
		else
			self.elapsed = (self.elapsed or 0) + elapsed
		end	
	end)
	
	return R
end

function UF:ConstructFocusRange(frame)
	local R = CreateFrame("Frame", nil, frame)
	R.rcText = R:CreateFontString(nil, 'OVERLAY')
	UF:Configure_FontString(R.rcText)
	
	R:SetScript("OnUpdate", function(self, elapsed)
		if(self.elapsed and self.elapsed > 0.2) then
			UF:UpdateFocusRange(frame)
			
			self.elapsed = 0
		else
			self.elapsed = (self.elapsed or 0) + elapsed
		end	
	end)
	
	return R
end

local function UpdateRange(frameType)
	local rcText
	if not UnitName(frameType) then
		rcText = ''
	else
		local minRange, maxRange = RC:getRange(frameType)
		if maxRange then
			rcText = minRange.. '-'.. maxRange
		else
			rcText = '80-?'
		end
	end	
	
	return rcText
end

function UF:UpdateTargetRange(frame)
	local rcText = UpdateRange('target')
	frame.RangeText.rcText:SetText(rcText)
end

function UF:UpdateFocusRange(frame)
	local rcText = UpdateRange('focus')
	frame.RangeText.rcText:SetText(rcText)
end
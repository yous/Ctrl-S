local E, L = unpack(ElvUI)

local function CreateBulkieBulkButton()
	-- create button
	local button = CreateFrame('Button', 'EuiBulkButton', GarrisonCapacitiveDisplayFrame, "OptionsButtonTemplate");
	button:SetPoint("RIGHT", GarrisonCapacitiveDisplayFrame.StartWorkOrderButton, "LEFT", -10, 0);
	button:SetWidth(160);
	button:SetHeight(22);
	button:SetText(L["Queue To Max"]);
	
	-- register events
	button:RegisterEvent("SHIPMENT_CRAFTER_OPENED");
	button:RegisterEvent("SHIPMENT_CRAFTER_CLOSED");
	button:RegisterEvent("SHIPMENT_CRAFTER_INFO");
	
	-- set handlers for frame events
	button:SetScript ("OnEvent", function (self, event, ...)
		if self[event] then
			self[event] (self, ...)
		end
	end)
	
	-- set the click handler
	button:SetScript('OnClick', function(self)
		button.elapsed = 0
		button:SetScript("OnUpdate", function (self, elapsed)
			self.elapsed = self.elapsed + elapsed;
			if self.elapsed > 0.33 then
				self.elapsed = 0;
				C_Garrison.RequestShipmentCreation();
				if self.maxShipments == C_Garrison.GetNumPendingShipments() then
					self:SetScript("OnUpdate", nil);
					button:Disable();
				end
			end
		end)
	end)

	function button:SHIPMENT_CRAFTER_OPENED(containerID)
		self:SetScript("OnUpdate", nil);
	end

	function button:SHIPMENT_CRAFTER_CLOSED()
		self:SetScript("OnUpdate", nil);
	end

	function button:SHIPMENT_CRAFTER_INFO (success, _, maxShipments, plotID)
		self.maxShipments = maxShipments;
		if self.maxShipments == C_Garrison.GetNumPendingShipments() then
			button:Disable();
		else
			button:Enable();
		end
	end	
end

local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, addon)
	if addon == 'Blizzard_GarrisonUI' then
		CreateBulkieBulkButton()
		f:UnregisterEvent("ADDON_LOADED")
	end
end)
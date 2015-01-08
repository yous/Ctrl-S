local Libra = LibStub("Libra")
local Type, Version = "Utils", 1
if Libra:GetModuleVersion(Type) >= Version then return end

Libra.modules[Type] = Libra.modules[Type] or {}

local object = Libra.modules[Type]
object.api = object.api or {}
object.frame = object.frame or CreateFrame("Frame")
object.connectedRealms = object.connectedRealms or {}
object.connectedRealmsSorted = object.connectedRealmsSorted or {}

object.frame:RegisterEvent("PLAYER_LOGIN")
object.frame:SetScript("OnEvent", function(self, event, ...)
	object[event](object, ...)
	self:UnregisterEvent(event)
end)

function object:PLAYER_LOGIN()
	local _, realm = UnitFullName("player")
	self.myRealm = realm
	self.connectedRealmsSorted = GetAutoCompleteRealms() or {}
	for i, v in ipairs(self.connectedRealmsSorted) do
		self.connectedRealms[v] = true
		if v == self.myRealm then
			tremove(self.connectedRealmsSorted, i)
		end
	end
	sort(self.connectedRealmsSorted)
	tinsert(self.connectedRealmsSorted, 1, self.myRealm)
end

function object.api:IsConnectedRealm(realm, includeOwn)
	if not realm then return end
	realm = realm:gsub("[ -]", "")
	return (realm ~= object.myRealm or includeOwn) and object.connectedRealms[realm]
end

function object.api:GetConnectedRealms()
	return object.connectedRealmsSorted
end

Libra:RegisterMethods(object.api)

Libra:RegisterModule(Type, Version)
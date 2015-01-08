local addonName, addonTable = ...

--[[
Setting a value in the DB that matches the existing default will remove the
key from the saved variables.

A few "values" in the DB are actually functions that cannot be used as saved
variables:

- DB:Initialize()
    Intended to be called after ADDON_LOADED, before anything accesses the DB.

- DB:SetDefaults(table)
    Sets the default values to `table`.

    Triggers callbacks for any affected keys.

- DB:ResetToDefaults()
    Clears all saved values back to their defaults.
    This includes wiping values that have no entry in the defaults table.
    This also wipes any overlay values.

    Callbacks for all affected values will be fired.

- DB:RegisterCallback(ident, key, func)
    Calls func(key, oldValue, newValue) every time the key in the DB changes.
    This is not called if the key is assigned its existing value.

    The `ident` value is to allow multiple callbacks for the key.

- DB:UnregisterCallback(ident, key)
    Unregisters the callback for `key` with the given `ident`.

Any callbacks present when the database loads are called immediately, even if
the new value is `nil`. The oldValue is the current default, or `nil`.

A few more functions provide a so-called "overlay" functionality. These are
values that take precedence over the regular DB values, but are not stored in
SavedVariables.

- DB:SetOverlay(key, value)
    Sets the overlay value for key. This value is returned for any access of
    key, until either a new overlay is set, the overlay is merged, or the
    overlay is cleared.

    Setting an overlay value of `nil` does not clear the overlay, it simply
    causes accesses for this key to return `nil`.

    As with normal DB values, this triggers callbacks.

- DB:ClearOverlay(...)
    Clears the overlay values for the specified keys, or all overlay values if
    nothing is specified.

    Any appropriate callbacks are triggered.

- DB:MergeOverlay()
    Merges the overlay values into the real DB and clears the overlay. No
    callbacks are triggered.
]]

local defaults = {}
local overlay = {}
local overlayNil = {} -- singleton to represent nil overlay values

local funcs = {}
local callbacks = LibStub("CallbackHandler-1.0"):New(funcs)
local registeredCallbacks = {}
function callbacks:OnUsed(target, eventname)
	registeredCallbacks[eventname] = true
end
function callbacks.OnUnused(target, eventname)
	registeredCallbacks[eventname] = nil
end

local init

function funcs:Initialize()
	if not init then
		error("Initialize() can only be called once", 2)
	end
	if select(2, IsAddOnLoaded(addonName)) == nil then
		error("Initialize() cannot be called until ADDON_LOADED", 2)
	end
	init()
	init = nil
end
function funcs:SetDefaults(table)
	local oldDefaults = defaults
	defaults = table

	for key in pairs(registeredCallbacks) do
		if init or (overlay[key] == nil and StormEarthAndFireDB[key] == nil) then
			local v, ov = defaults[key], oldDefaults[key]
			if v ~= ov then
				callbacks:Fire(key, ov, v)
			end
		end
	end
end
function funcs:ResetToDefaults()
	if init then
		error("ResetToDefaults() cannot be called before Initialize()", 2)
	end

	for k, v in pairs(StormEarthAndFireDB) do
		StormEarthAndFireDB[k] = nil
		if overlay[k] == nil then
			local nv = defaults[k]
			if nv then
				callbacks:Fire(k, v, nv)
			end
		end
	end

	self:ClearOverlay()
end
function funcs:SetOverlay(key, value)
	local ov = self[key]
	overlay[key] = (value == nil and overlayNil or value)

	if value ~= ov then
		callbacks:Fire(key, ov, value)
	end
end
function funcs:ClearOverlay(...)
	if select('#', ...) > 0 then
		-- clear the requested values
		for i = 1, select('#', ...) do
			local key = select(i, ...)
			local ov = overlay[key]
			if ov == overlayNil then ov = nil end
			overlay[key] = nil
			local nv = self[key]
			if ov ~= nv then
				callbacks:Fire(key, ov, nv)
			end
		end
	else
		-- clear everything
		for key, ov in pairs(overlay) do
			if ov == overlayNil then ov = nil end
			overlay[key] = nil
			local nv = self[key]
			if ov ~= nv then
				callbacks:Fire(key, ov, nv)
			end
		end
	end
end
function funcs:MergeOverlay()
	if init then
		error("MergeOverlay() cannot be called before Initialize()", 2)
	end

	for k, v in pairs(overlay) do
		if v == overlayNil then v = nil end
		if v == defaults[k] then
			StormEarthAndFireDB[k] = nil
		else
			StormEarthAndFireDB[k] = v
		end
		overlay[k] = nil
	end
end

-- wrap the CallbackHandler functions so they're called with :
for _, v in ipairs({"RegisterCallback", "UnregisterCallback", "UnregisterAllCallbacks"}) do
	local func = funcs[v]
	assert(func ~= nil)
	funcs[v] = function(self, ...)
		return func(...)
	end
end

addonTable.DB = setmetatable({}, {
	__index = function(t, key)
		local v = funcs[key]
		if v == nil then v = overlay[key] end
		if v == nil then v = defaults[key] end
		if v == overlayNil then v = nil end
		return v
	end,
	__newindex = function(t, key, value)
		if funcs[key] then
			error("The key " .. key .. " is reserved", 2)
		end
		error("Saved variables have not yet been loaded", 2)
	end
})

function init()
	local function errorhandler(...)
		return geterrorhandler()(...)
	end


	StormEarthAndFireDB = StormEarthAndFireDB or {}
	setmetatable(addonTable.DB, {
		__index = function(t, key)
			local v = funcs[key]
			if v == nil then v = overlay[key] end
			if v == nil then v = StormEarthAndFireDB[key] end
			if v == nil then v = defaults[key] end
			if v == overlayNil then v = nil end
			return v
		end,
		__newindex = function(t, key, value)
			if funcs[key] then
				error("The key " .. key .. " is reserved", 2)
			end
			local oldValue = StormEarthAndFireDB[key]
			if oldValue == nil then oldValue = defaults[key] end
			if value == defaults[key] then
				StormEarthAndFireDB[key] = nil
			else
				StormEarthAndFireDB[key] = value
			end
			if overlay[key] == nil and oldValue ~= value then
				callbacks:Fire(key, oldValue, value)
			end
		end
	})
	for key in pairs(registeredCallbacks) do
		callbacks:Fire(key, nil, addonTable.DB[key])
	end
end

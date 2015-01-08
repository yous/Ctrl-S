local E, L, V, P, G, _ = unpack(select(2, ...)); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB, Localize Underscore

--Global Settings
G['general'] = {
	["autoScale"] = true,
	["eyefinity"] = false,
	['newFuncShown'] = true,
}
G['bags'] = {}
G['classtimer'] = {}

G["nameplate"] = {}

G['unitframe'] = {
	['aurafilters'] = {},
	['buffwatch'] = {},
}
G.gtData = {};
G.gtTime = {};
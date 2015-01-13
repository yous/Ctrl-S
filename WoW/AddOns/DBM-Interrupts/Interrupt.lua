local mod = DBM:NewMod("Interrupt Cooldowns", "DBM-Interrupts")
mod:SetRevision("Revision 5.4.3")
mod:RegisterEvents("SPELL_CAST_SUCCESS")
mod:SetZone(DBM_DISABLE_ZONE_DETECTION)

function mod:SPELL_CAST_SUCCESS(args)
    Spells = {
        MindFreeze={      "MFreeze",    47528,   15},
        Strangulate={     "Strangle",   47476,   60},
        SkullBash={       "SkullB",     106839,  15},
        SolarBeam={       "SolarB",     78675,   60},
        CounterShot={     "CounterSh",  147362,  24},
        SilencingShot={   "SilenceS",   34490,   24},
        CounterSpell={    "CounterSp",  2139,    24},
        AvengersShield={  "AvengShld",  31935,   15},
        Rebuke={          "Rebuke",     96231,   15},
        Silence={         "Silence",    15487,   45},
        WindShear={       "WindShr",    57994,   12},
        SpellLock={       "SpellLk",    19647,   24},
        OpticalBlast={    "OptBlast",   115782,  24},
        Pummel={          "Pummel",     6552,    15},
        SpearHandStrike={ "SHStrike",   116705,  15},
    }
    
    for key, value in pairs(Spells) do
        Name            = Spells[key][1]
        ID              = Spells[key][2]
        Duration        = Spells[key][3]
        _, _, SpellIcon = GetSpellInfo(args.spellId)

        if args.spellId == ID then
            DBM.Bars:CreateBar(Duration, Name.."-"..args.sourceName, SpellIcon)
            end
        end
	end
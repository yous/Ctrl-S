# Deadly Boss Mods Core

## [9.0.15-7-g6e71144](https://github.com/DeadlyBossMods/DeadlyBossMods/tree/6e7114426ea59ca91c50aabf8fcfcdfd6f9a8a56) (2020-12-30)
[Full Changelog](https://github.com/DeadlyBossMods/DeadlyBossMods/compare/9.0.15...6e7114426ea59ca91c50aabf8fcfcdfd6f9a8a56) [Previous Releases](https://github.com/DeadlyBossMods/DeadlyBossMods/releases)

- Changed icon elect feature to also initiate two backups, in case the higher revision in raid turns icon marking off. Too often guilds have this thing where they have everyone turn options off except like one person, but that one person doesn't keep mods up to date so they end up with no icons being set during fights. Now, DBM will permit up to 3 assists with highet revision in raid to set icons, provided they still have at minimum, the latest release revision. This might introduce rare cases where icon conflicts occur if an alpha uses different icons than a release version, which is what elect feature set to solve in first place, but I feel like this middle ground is needed because the no icon at all issue happens more often than icon conflicts.  
- Fix a cosmetic bug  
- Fix expected stacks for sire  
- Changed countdown default for lady. Timers not reliable enough for that default.  
    Added extra check to altimor because of one user report of phase 2 and 3 triggering at same time?  
    Fixed artificer glyph duration on normal (and LFR?)  
- Fixed bug with chain slam double counting  
- remove old debug  
- Bump alpha  

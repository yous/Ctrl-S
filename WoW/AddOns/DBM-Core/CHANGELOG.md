# Deadly Boss Mods Core

## [9.0.20](https://github.com/DeadlyBossMods/DeadlyBossMods/tree/9.0.20) (2021-02-16)
[Full Changelog](https://github.com/DeadlyBossMods/DeadlyBossMods/compare/9.0.19...9.0.20) [Previous Releases](https://github.com/DeadlyBossMods/DeadlyBossMods/releases)

- Prep new core  
- add dancing fever count  
- Additional robustness in ase another situation happens, the scheduled event actually finishes BEFORE the real phase change event does. Just in general this hard check should resolve any changes at all of double phase increases  
- Tweaks to phase change code just in case double phase increase is being triggered  
- Switch Xymox to use encounter event spell and no longer rely on localized yells  
- Bump the guild combat versions so that old versions of DBM won't parse bugged ones from users who don't have out of date filter built in  
- Don't warn Crescendo on normal and LFR  
- Port classic fix to retail  
- Don't senc guild combat events if DBM is out of date, that way the one asshole in guild running a 6 month old DBM doesn't spam guild with bugged boss pulls for people not in raid.  
- Fix typo. (#509)  
- Couple sire LFR timer fixes  
- Fix two possible conditions of #508  
- Disable yell (#507)  
    SendChatMessage is protected since 8.2.5 while outdoors  
- Update koKR (#505)  
- Fixed accidental npc arg getting in phase 2 string  
- Attempt to fix some new generals quirks with heartrend  
    Fixed some LFR timer bugs on council of blood  
- artifcer should work correctly in russian now  
- Localized mod names in Russian (#504)  
- support RU translated adds trigger on sire  
- Add count for Glyph of Descruction (#503)  
- Fixed initiall feeding time timer on normal and LFR, it was too slow.  
    Very minor micro second tweaks to other timers. Effectively though LFR is 100% identical to normal so no real fixes needed.  
- Update localization.cn.lua (#501)  
    * Update localization.cn.lua  
    * Update localization.cn.lua  
    Co-authored-by: Mini Dragon <projecteurs@gmail.com>  
- Fix additional cases of stasis trap timers starting in wrong difficulty (#502)  
    Its handled properly on combat start and spell cast, but not phase change.  
- CD is flagged for Tank|Healer, make the warn flagged for that too. (#500)  
    * CD is flagged for Tank|Healer, make the warn flagged for that too.  
    * Update GrandProctorBeryllia.lua  
    Co-authored-by: Adam <MysticalOS@users.noreply.github.com>  
- Bad debug print (#499)  
- Profile fix, not showing message for missing sounds (#498)  
- Update koKR (#497)  
    Co-authored-by: QartemisT <QartemisT@gmail.com>  
    Co-authored-by: Adam <MysticalOS@users.noreply.github.com>  
- Update zhTW (Core) (#496)  
- Update zhTW (GUI) (#495)  
- Throttle SolitaryPrey  
- Pull timer message (#494)  
- Check if frame is nil, and don't run (#492)  
    This prevents any nil issues with GetRight, GetWidth etc.  
- Editor messed with quotes  
- add more debug  
- Increased aggregation time window for lost confidencce on devos  
- Add more validation to bad timer passing  
- Revert "Simple hack to kill off bar slide animation for good. Not gonna remove all the code sine it's being rewritten anyways, this just applies the noanim (simple) timer style hack that removes it just for that theme, to both themes now."  
- Fix another error that luacheck seemingly forgot to report last time  
- Fix bad copypaste  
- Few miner timer fixes  
- Simple hack to kill off bar slide animation for good. Not gonna remove all the code sine it's being rewritten anyways, this just applies the noanim (simple) timer style hack that removes it just for that theme, to both themes now.  
- Remove BigBrother support (Fixes #481) (#482)  
- Fix name bug on Valinor. outdoor bosses can't assume player is in the raid  
- bump alpha  

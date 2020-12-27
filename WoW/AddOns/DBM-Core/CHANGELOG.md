# Deadly Boss Mods Core

## [9.0.14-7-g09f7e0a](https://github.com/DeadlyBossMods/DeadlyBossMods/tree/09f7e0add4f641c3d74a75fece0641d48a5688df) (2020-12-27)
[Full Changelog](https://github.com/DeadlyBossMods/DeadlyBossMods/compare/9.0.14...09f7e0add4f641c3d74a75fece0641d48a5688df) [Previous Releases](https://github.com/DeadlyBossMods/DeadlyBossMods/releases)

- Enabled the bfa mod available alerts  
    Performed some slight refactoring onf auto logging to resolve some issues with logs not starting for M+ do to fact that when player enters dungeon, it's still a Mythic-0. DBM will now run log check function on all loading screen changes, if difficulty index becomes 8 in any of them (ie the keystone ui reload occurs  
- This probably actually uses more cpu, but a hell of a lot better to look at. Probably should have QartemisT review. It tests fine  
- Prevent kael mod from engaging if he gets stuck on boss health frames after victory  
- Fixed a bug that's been there a LONG time that showed a random "nil" message when showing range frame in n instance  
- Fix  
- Fix ember blast countdown on mythic, apparently tooltips lie  
- Bump alpha  

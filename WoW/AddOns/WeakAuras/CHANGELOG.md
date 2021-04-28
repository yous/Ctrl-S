# [3.3.0](https://github.com/WeakAuras/WeakAuras2/tree/3.3.0) (2021-04-24)

[Full Changelog](https://github.com/WeakAuras/WeakAuras2/compare/3.2.3...3.3.0)

## Highlights

 - Support for The Burning Crusade Classic
- First steps for nested groups. Don't get excited yet.
- Add WeakAuras Import UI for pushed auras from Wago. (Wago side support coming soonish)
- Bug fixes as always 

## Commits

InfusOnWoW (8):

- Fix nameAll if everything is a empty string
- Fix ModelPicker CancelClose
- Conditions: Fix Copy change to all auras error
- Conditions: Fix missign tooltip on property combobox
- Fix UnitIsVisible check on raid roster changes
- Classic: Add Other to the potential raid roles
- Fix scamCheck to ignore empty custom functions
- Fix WeakAuras.prettyPrint to print more than one argument

NilkemoryaOryhara (3):

- Add most TBC 1s cast time drums to not reset swing timer (#3022)
- TBC/Classic bomb and grenade additions (#3008)
- Swing timer fixes

ResultsMayVary (1):

- Update AuraEnvironment.lua

Stanzilla (51):

- Remove `PickupInventoryItem` from block list
- Update WeakAurasModelPaths from wow.tools
- Update WeakAurasModelPaths from wow.tools
- Update bug_report.yml
- Update bug_report.yml
- Update bug_report.yml
- Update bug_report.yml
- Update bug_report.yml
- Update bug_report.yml
- Update bug_report.yml
- Update bug_report.yml
- Delete bug_report.md
- Update bug_report.yml
- Update bug_report.yml
- Update bug_report.yml
- Remove spaces from subsections in packager commands
- remove TODO to see if this breaks the packager
- comment cleanup
- Switch to LF instead of CRLF since WoW is cross platform
- Add StyLua config
- Fix logic check and use `not IsRetail` instead of Classic/TBC
- Add TODOs for temp bc hacks
- CI: touch up wow.tools script
- CI: Cleanup and send tag to WowI as well
- Use our LibRangeCheck-2.0 fork until original is updated
- Add WOW_PROJECT_BURNING_CRUSADE_CLASSIC to .luacheckrc
- Update IsFlavor() functions for new BC build changes
- Update version check for latest BC build
- CI: Publish BC to CurseForge as well
- CI: only skip packager zip creation when not on a tag
- CI: zip packager zip creation and use the action for it
- CI: Upload the zip directly
- Enable PLAYER_FOCUS_CHANGED logic in BC
- Change Prototypes check to not isRetail
- Convert all `not classic` checks to `is retail` checks
- Add hack for WOW_PROJECT_ID being the same as Classic part 2
- Fix packager logic for Classic libs part 2
- Fix packager logic for Classic libs
- Add hack for WOW_PROJECT_ID being the same as Classic
- Load Classic specific libs from the TOC instead of the XML so the packager can handle the BC check
- Use normal .pkgmeta for BC
- WOW_PROJECT_ID is "2" for BC
- Fix typo
- Fix packager logic
- Add vscode folder to gitignore
- Fix typo in PR CI
- Add WOW_PROJECT_BC to .luacheckrc
- Use the beta build CI for BC for now
- Initial support for BC
- Keep the old issue template around until we are accepted into the new issue system test
- try the new GitHub issue template

Vardex (11):

- Prepare TexturePicker for nested
- Prepare ModelPicker for nested
- Prepare AuraBar options for nested
- Prepare MoverSizer for nested
- Prepare ConditionOptions for nested
- Prepare CommonOptions for Nested
- Replace ApplyToDataOrChildData with Traverse
- Icon Options + Icon Picker: Prepare for nested
- Make ClearAndUpdateOptions work for nested
- Prepare AuthorOptions for nested
- Add function that iterate over all childrens recursively

mrbuds (37):

- add _HEAL_ABSORBED CLEU suffix
- update classic toc to 11307
- fix WeakAuras.UnitChannelInfo on classic
- Add WeakAuras Import UI (#3031)
- fix usage of LibClassicSpellActionCount-1.0 for bc
- fixes more wow version test
- fix issues with WOW_PROJECT_BURNING_CRUSADE_CLASSIC not defined on classic/retail
- fix WeakAuras.UnitCastingInfo
- make WeakAuras.UnitChannelInfo not check WoW version on each call
- make intendedWoWProject use a specific vallue for TBC if not loaded on TBC
- fix classic or bc logic in a few places
- fix time formatting
- steady shot doesn't reset ranged swing timer
- fix LibRangeCheck-2.0 packaging better
- fix LibRangeCheck-2.0 packaging
- update pull_request.yml for bc
- update build-beta.yml
- use .pkgmeta-bc
- typo
- fix wrongTargetMessage logic
- more neutral message
- fix wrongTargetMessage for tbc
- fix CorrectSpellName for tbc
- combat log events return correct spellid now
- reset swing timer on shoots & don't reset on dense dynamite
- UnitCastingInfo & UnitChannelInfo doesn't return "notInterruptible"
- more trigger fixes
- Disable triggers made for retail
- fix load conditions
- fix models
- no vehicle on tbc
- set Types.lua for BC
- fix combat log trigger
- fix scanForLoadsImpl
- use tbc wowhead link
- fix some lua errors
- Weapon Enchant trigger: update on PLAYER_EQUIPMENT_CHANGED for classic/tbc

nullKomplex (1):

- Add additional forbidden functions.


# PR Description — QA Audit and Functional Improvements

## Summary

This branch contains a QA-oriented improvement pass on the project **JeuDePolution / Nature’s Last Stand**.

The objective of this work was not to redesign the full game, but to stabilize and improve several visible and important parts of the player experience, especially for testing, demonstration and presentation purposes.

The work was done on a dedicated branch in order to keep the original project structure intact while making the improvements traceable and reviewable.

## Main improvements

### 1. Main menu improvements
- stabilized the main menu logic
- added / restored a working **Instructions** panel
- fixed the **Back** button inside the instructions panel
- improved menu navigation before starting the game

### 2. Pause menu improvements
- extended the pause menu
- added:
  - `Settings`
  - `Main Menu`
- stabilized the pause menu logic
- corrected node paths and scene signal issues

### 3. Functional audio settings
- created separated audio buses:
  - `Master`
  - `Music`
  - `SFX`
- assigned audio players to the correct bus
- made `MusicSlider` functional
- made `SFXSlider` functional
- added `Mute / Unmute`
- connected the settings panel to real audio changes

### 4. End screen improvements
- added a **Replay** button on the death screen
- added a **Replay** button on the win screen
- improved replay flow for testing and user experience

### 5. Documentation
- added / updated:
  - `QA_AUDIT.md`
  - `USER_GUIDE.md`
  - `DEVELOPER_GUIDE.md`
  - `README.md`

## Main files affected

### Menu / navigation
- `scene/menu.tscn`
- `scene/Menu/menu.gd`

### Pause / settings
- `scene/pause_menu.tscn`
- `pause_menu.gd`

### End screens
- `scene/DeathScreen/death_screen.tscn`
- `scene/DeathScreen/death_screen.gd`
- `scene/WinScreen/win_screen.tscn`
- `scene/WinScreen/win_screen.gd`

### Audio
- `scene/menu.tscn`
- `scene/music_player.tscn`
- `scene/sound_manager.tscn`
- `scene/Player/player.tscn`
- `scene/PolArea/polution_area.tscn`
- `scene/Station/station.tscn`
- `scene/hospital.tscn`
- `scene/DeathScreen/death_screen.tscn`
- `scene/WinScreen/win_screen.tscn`
- `default_bus_layout.tres` or project audio bus configuration

### Documentation
- `QA_AUDIT.md`
- `USER_GUIDE.md`
- `DEVELOPER_GUIDE.md`
- `README.md`

## How to test

1. Open the project with **Godot 4**
2. Launch the game from the main scene
3. Check the main menu:
   - `Play`
   - `Instructions`
   - `Back`
   - `Quit`
4. Start the game
5. Press `Esc` and check the pause menu:
   - `Continue`
   - `Settings`
   - `Main Menu`
   - `Quit`
6. Open `Settings`
7. Test:
   - `MusicSlider`
   - `SFXSlider`
   - `Mute / Unmute`
   - `Back`
8. Trigger a death screen and test `Replay`
9. Trigger a win screen and test `Replay`

## Expected impact

These changes improve:
- navigation clarity
- player onboarding
- pause menu usability
- audio control
- replayability after end screens
- general project readability for presentation and review

## Notes

This branch was built as a QA / polishing pass and should be compared against the latest shared version before final integration, in order to check for possible conflicts on scenes that may also have been modified in parallel.
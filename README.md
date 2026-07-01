# Combat Tracker

A lightweight World of Warcraft addon that tracks combat statistics and provides detailed fight analysis.

## Description

Combat Tracker monitors your combat encounters and records detailed statistics for each fight. It tracks damage dealt, healing done, deaths, kills, and combat duration, giving you insight into your combat performance throughout your play session.

## Features

- 🎯 **Real-time Combat Detection**: Instantly notifies when entering or leaving combat
- 📊 **Detailed Combat Statistics**: Tracks damage, healing, kills, deaths, and duration for each fight
- 📈 **Session Analytics**: View aggregate statistics across all fights in your session
- 💬 **Chat Notifications**: Clean, color-coded messages in your chat window
- ⌨️ **Slash Commands**: Easy access to session statistics via `/ct` commands
- 🎮 **Multi-Version Support**: Compatible with both Retail and Classic WoW
- ⚡ **Lightweight**: Minimal performance impact with efficient event handling

## Installation

### Manual Installation

1. Download the latest release
2. Extract the `CombatTracker` folder
3. Place it in your WoW AddOns directory:
   - **Retail**: `World of Warcraft\_retail_\Interface\AddOns\`
   - **Classic**: `World of Warcraft\_classic_\Interface\AddOns\`
4. Restart WoW or reload your UI (`/reload`)

## Usage

### Automatic Fight Tracking

The addon works automatically once installed. After each combat encounter, you'll see a summary:

- **On Login/Reload**: `[Combat Tracker] Addon files loaded.`
- **Combat Start**: `[Combat Tracker] Combat started`
- **Combat End**: Individual fight statistics including duration, damage, healing, deaths, and kills

### Slash Commands

- `/ct` - Display available commands
- `/ct sessionstats` - Show aggregate statistics for all fights in the current session

### Combat Statistics Tracked

Each fight records:
- **Duration**: How long the combat lasted (in seconds)
- **Damage**: Total damage you dealt during the fight
- **Healing**: Total healing you performed during the fight
- **Deaths**: Number of times you died
- **Kills**: Number of enemies you killed

### Session Summary

Use `/ct sessionstats` to view:
- Total number of fights
- Cumulative totals for damage, healing, deaths, and kills
- Average damage, healing, and duration per fight

## Compatibility

- **Retail WoW**: Interface 120001 (The War Within)
- **Classic WoW**: Interface 11508

## Development

### File Structure

```
CombatTracker/
├── Core.lua           # Core initialization and logging functions
├── Events.lua         # Event registration and handling
├── Combat.lua         # Combat tracking and statistics logic
├── Commands.lua       # Slash command handling
└── CombatTracker.toc  # Addon metadata
```

### Events Used

- `ADDON_LOADED` - Fires when the addon is loaded
- `PLAYER_REGEN_DISABLED` - Fires when entering combat
- `PLAYER_REGEN_ENABLED` - Fires when leaving combat
- `COMBAT_LOG_EVENT_UNFILTERED` - Fires for all combat log events (used to track damage, healing, deaths, and kills)

### Architecture

The addon uses a modular architecture:
- **Core.lua**: Defines the main `CombatTracker` table, session data structure, and logging functions (`LogMessage`, `LogCurrentFight`, `LogSessionStats`, `LogSummary`)
- **Events.lua**: Registers WoW events and routes them to appropriate handler functions
- **Combat.lua**: Implements combat logic including `StartCombat`, `EndCombat`, and `HandleCombatLogEvent`
- **Commands.lua**: Defines slash commands for user interaction

## Future Enhancements

Potential features for future versions:
- SavedVariables for persistent data across sessions
- Configurable notification styles
- More detailed combat log analysis (specific abilities, targets)
- Export functionality for fight data
- Graphical UI for statistics viewing

## Author

**Beforeguard**

## Version

1.0.0

## License

Feel free to modify and distribute this addon as needed.

---

*For bugs, suggestions, or contributions, please open an issue or pull request on the repository.*

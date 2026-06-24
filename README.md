# Combat Tracker

A lightweight World of Warcraft addon that tracks and logs combat state changes in real-time.

## Description

Combat Tracker is a minimal addon that monitors when you enter and exit combat, providing clear chat notifications for combat state changes. Perfect for players who want to be more aware of their combat status or developers who need a foundation for combat-related addons.

## Features

- 🎯 **Real-time Combat Detection**: Instantly notifies when entering or leaving combat
- 💬 **Chat Notifications**: Clean, color-coded messages in your chat window
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

The addon works automatically once installed. You'll see the following messages:

- **On Login/Reload**: `[Combat Tracker] Addon files loaded.` (in green)
- **Entering Combat**: `[Combat Tracker] Entered combat.` (in green)
- **Leaving Combat**: `[Combat Tracker] Left combat.` (in green)

No commands or configuration needed—it just works!

## Compatibility

- **Retail WoW**: Interface 120001 (The War Within)
- **Classic WoW**: Interface 11508

## Development

### File Structure

```
CombatTracker/
├── CombatTracker.lua  # Main addon logic
└── CombatTracker.toc  # Addon metadata
```

### Events Used

- `ADDON_LOADED` - Fires when the addon is loaded
- `PLAYER_REGEN_DISABLED` - Fires when entering combat
- `PLAYER_REGEN_ENABLED` - Fires when leaving combat

## Future Enhancements

Potential features for future versions:
- Combat duration tracking
- Combat statistics (time in combat, number of engagements)
- Configurable notification styles
- SavedVariables for persistent data
- Slash commands for configuration

## Author

**Beforeguard**

## Version

1.0.0

## License

Feel free to modify and distribute this addon as needed.

---

*For bugs, suggestions, or contributions, please open an issue or pull request on the repository.*

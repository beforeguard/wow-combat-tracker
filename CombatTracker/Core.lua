local addonName = ...

CombatTracker = {}

CombatTracker.session = {
    fights = {},
}

CombatTracker.inCombat = false

function CombatTracker:LogMessage(text)
    print("|cff00ff00[Combat Tracker]|r " .. text)
end

function CombatTracker.LogSummary()
    if not CombatTracker.currentFight then
        CombatTracker:LogMessage("No combat data available.")
        return
    end

    local fight = CombatTracker.currentFight
    CombatTracker:LogMessage(
        string.format(
            "Duration: %.2f seconds, Damage: %d, Healing: %d, Deaths: %d, Kills: %d",
            fight.duration,
            fight.damage,
            fight.healing,
            fight.deaths,
            fight.kills
        )
    )
    CombatTracker:LogMessage(
        string.format("Total fights this session: %d", #CombatTracker.session.fights))
end
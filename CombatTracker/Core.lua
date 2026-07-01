local addonName = ...

CombatTracker = {}

CombatTracker.session = {
    fights = {},
}

CombatTracker.inCombat = false

function CombatTracker:LogMessage(text)
    print("|cff00ff00[Combat Tracker]|r " .. text)
end

-- Log the current fight details
function CombatTracker.LogCurrentFight()
    if not CombatTracker.currentFight then
        CombatTracker:LogMessage("No combat data available.")
        return
    end

    local fight = CombatTracker.currentFight
    CombatTracker:LogMessage("=== Current Fight ===")
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
end

-- Log session-wide statistics
function CombatTracker.LogSessionStats()
    local totalFights = #CombatTracker.session.fights
    
    if totalFights == 0 then
        CombatTracker:LogMessage("No fights recorded this session.")
        return
    end
    
    local totals = {duration = 0, damage = 0, healing = 0, deaths = 0, kills = 0}
    
    for _, fight in ipairs(CombatTracker.session.fights) do
        totals.duration = totals.duration + fight.duration
        totals.damage = totals.damage + fight.damage
        totals.healing = totals.healing + fight.healing
        totals.deaths = totals.deaths + fight.deaths
        totals.kills = totals.kills + fight.kills
    end
    
    CombatTracker:LogMessage("=== Session Summary ===")
    CombatTracker:LogMessage(string.format("Total Fights: %d", totalFights))
    CombatTracker:LogMessage(
        string.format(
            "Totals - Damage: %d, Healing: %d, Deaths: %d, Kills: %d",
            totals.damage,
            totals.healing,
            totals.deaths,
            totals.kills
        )
    )
    CombatTracker:LogMessage(
        string.format(
            "Averages - Damage: %.0f, Healing: %.0f, Duration: %.2fs",
            totals.damage / totalFights,
            totals.healing / totalFights,
            totals.duration / totalFights
        )
    )
end

-- Keep this as a convenience wrapper, or call both separately
function CombatTracker.LogSummary()
    CombatTracker.LogCurrentFight()
    CombatTracker.LogSessionStats()
end
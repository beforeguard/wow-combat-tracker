local addonName = ...

CombatTracker = {}

CombatTracker.inCombat = false

function CombatTracker:LogMessage(text)
    print("|cff00ff00[Combat Tracker]|r " .. text)
end

function CombatTracker:StartCombat()
    self.inCombat = true
    CombatTracker:LogMessage("Entered combat.")
end

function CombatTracker:EndCombat()
    self.inCombat = false
        CombatTracker:LogMessage("Exited combat.")
end
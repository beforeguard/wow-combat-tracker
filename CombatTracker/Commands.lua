SLASH_COMBATTRACKER1 = "/ct"

SlashCmdList["COMBATTRACKER"] =
    function(msg)
        if msg == "sessionstats" then
            CombatTracker:LogSessionStats()
        else
            CombatTracker:LogMessage("Commands:")
            CombatTracker:LogMessage("/ct sessionstats")
        end
    end

local frame = CreateFrame("Frame")

frame:RegisterEvent("ADDON_LOADED")
frame:RegisterEvent("PLAYER_REGEN_DISABLED")
frame:RegisterEvent("PLAYER_REGEN_ENABLED")
frame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")

frame:SetScript("OnEvent", function(self, event, ...)
    if event == "ADDON_LOADED" and arg1 == addonName then
        CombatTracker:LogMessage("Addon files loaded.")
    elseif event == "PLAYER_REGEN_DISABLED" then
        CombatTracker:StartCombat()
    elseif event == "PLAYER_REGEN_ENABLED" then
        CombatTracker:EndCombat()
    elseif event == "COMBAT_LOG_EVENT_UNFILTERED" then
        CombatTracker:HandleCombatLogEvent(...)
    end
end)
local addonName = ...

local function logMessage(text)
    print("|cff00ff00[Combat Tracker]|r " .. text)
end

local frame = CreateFrame("Frame")
frame:RegisterEvent("ADDON_LOADED")
frame:RegisterEvent("PLAYER_REGEN_DISABLED")
frame:RegisterEvent("PLAYER_REGEN_ENABLED")

frame:SetScript("OnEvent", function(_, event, arg1)
    if event == "ADDON_LOADED" and arg1 == addonName then
        logMessage("Addon files loaded.")
    elseif event == "PLAYER_REGEN_DISABLED" then
        logMessage("Entered combat.")
    elseif event == "PLAYER_REGEN_ENABLED" then
        logMessage("Left combat.")
    end
end)
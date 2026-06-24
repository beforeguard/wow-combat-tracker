local addonName = ...

local function logMessage(text)
    print("|cff00ff00[Combat Tracker]|r " .. text)
end

local frame = CreateFrame("Frame")
frame:RegisterEvent("ADDON_LOADED")

frame:SetScript("OnEvent", function(_, event, loadedAddonName)
    if event == "ADDON_LOADED" and loadedAddonName == addonName then
        logMessage("Addon files loaded.")
    end
end)
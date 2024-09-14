-- Addon is initially enabled
local isEnabled = true

local function formatNumber(num)
    if num >= 1000000 then
        return string.format("%.1fM", num / 1000000)
    elseif num >= 1000 then
        return string.format("%.1fK", num / 1000)
    else
        return tostring(num)
    end
end

local function printPlayerStats()
    local numScores = GetNumBattlefieldScores()
    for i = 1, numScores do
        local name, killingBlows, _, _, honorGained, _, _, _, _, damageDone, healingDone = GetBattlefieldScore(i)
        if name == UnitName("player") then
            print("Your stats for this match:")
            print("Killing blows: " .. killingBlows)
            print("Honor gained: " .. honorGained)
            print("Damage done: " .. formatNumber(damageDone))
            print("Healing done: " .. formatNumber(healingDone))
            break
        end
    end
end

-- Create a frame to listen for the PVP_MATCH_COMPLETE event
local frame = CreateFrame("Frame")
frame:RegisterEvent("PVP_MATCH_COMPLETE")
frame:SetScript("OnEvent", function(self, event, ...)
    if isEnabled and event == "PVP_MATCH_COMPLETE" then
        C_Timer.After(1, function()
            printPlayerStats()
            Screenshot()
        end)
    end
end)

-- Define the slash commands
SLASH_SBG1 = "/sbg"
SLASH_SBG2 = "/scoreboardscreenshot"
SlashCmdList["SBG"] = function(msg)
    isEnabled = not isEnabled -- Toggle the addon
    print("Scoreboard Screenshot is now", isEnabled and "Enabled" or "Disabled")
end

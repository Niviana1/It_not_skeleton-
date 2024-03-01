local OrionLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Orion/main/source'))()
local Window = OrionLib:MakeWindow({Name = "Main", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

local mainTab = Window:MakeTab({Name = "Main", Icon = "rbxassetid://4483345998", PremiumOnly = false})

local buttons = {"Button 1", "Button 2", "Button 3"}

local scriptUrls = {
    'https://raw.githubusercontent.com/Vcsk/RobloxScripts/main/HitboxExpander.lua',
    'https://raw.githubusercontent.com/PABLOSleuth2/Scripts1/main/RobloxScripts/TEST/aimbot_v2.lua',
    'https://raw.githubusercontent.com/Niviana1/Personal-exploit-/main/Mobilefly.lua'
}

for i, buttonName in ipairs(buttons) do
    mainTab:AddButton({
        Name = buttonName,
        Callback = function()
            loadstring(game:HttpGet(scriptUrls[i]))()
        end
    })
end

OrionLib:Init()

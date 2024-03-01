local OrionLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Orion/main/source'))()
local Window = OrionLib:MakeWindow({Name = "Main", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

-- Main Tab
local mainTab = Window:MakeTab({Name = "Main", Icon = "rbxassetid://4483345998", PremiumOnly = false})

local mainButtons = {"Expander", "Aimbot", "Mobile Fly"}
local mainScriptUrls = {
    'https://raw.githubusercontent.com/Vcsk/RobloxScripts/main/HitboxExpander.lua',
    'https://raw.githubusercontent.com/PABLOSleuth2/Scripts1/main/RobloxScripts/TEST/aimbot_v2.lua',
    'https://raw.githubusercontent.com/Niviana1/Personal-exploit-/main/Mobilefly.lua'
}

for i, buttonName in ipairs(mainButtons) do
    mainTab:AddButton({
        Name = buttonName,
        Callback = function()
            loadstring(game:HttpGet(mainScriptUrls[i]))()
        end
    })
end

-- Prison Life Tab
local prisonLifeTab = Window:MakeTab({Name = "Prison Life", Icon = "rbxassetid://4483345998", PremiumOnly = false})

local prisonLifeButtons = {"Admin 1", "Admin 2", "Admin 3", "Admin 4"}
local prisonLifeScriptUrls = {
    'https://raw.githubusercontent.com/H17S32/Tiger_Admin/main/TigeradminREVAMP.txt',
    'https://pastebin.com/raw/1RvgFtcx',
    'https://pastebin.com/raw/KeCtc8B5',
    'https://pastebin.com/raw/A7timJWF'
}

for i, buttonName in ipairs(prisonLifeButtons) do
    prisonLifeTab:AddButton({
        Name = buttonName,
        Callback = function()
            loadstring(game:HttpGet(prisonLifeScriptUrls[i]))()
        end
    })
end

OrionLib:Init()

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

-- Admin Tab
local adminTab = Window:MakeTab({Name = "Admin", Icon = "rbxassetid://4483345998", PremiumOnly = false})

local adminButtons = {
    {"Infinite Yield", "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"},
    {"CMD-X", "https://raw.githubusercontent.com/CMD-X/CMD-X/master/Source"},
    {"Fates", "https://raw.githubusercontent.com/fatesc/fates-admin/main/main.lua"},
    {"Proton", "https://api.luarmor.net/files/v3/loaders/5e6e6cc1bb32fd926764d064e2c60a3b.lua"},
    {"Nameless Admin", "https://raw.githubusercontent.com/FilteringEnabled/NamelessAdmin/main/Source"},
    {"Legs Admin", "https://raw.githubusercontent.com/leg1337/legadmv2/main/legadminv2.lua"},
    {"Homebrew", "https://raw.githubusercontent.com/Syntaxx64/HomebrewAdmin/master/Main"}
}

for _, data in ipairs(adminButtons) do
    local buttonName = data[1]
    local scriptUrl = data[2]
    adminTab:AddButton({
        Name = buttonName,
        Callback = function()
            loadstring(game:HttpGet(scriptUrl, true))()
        end
    })
end

-- Prison Life Tab
local prisonLifeTab = Window:MakeTab({Name = "Prison Life", Icon = "rbxassetid://4483345998", PremiumOnly = false})
prisonLifeTab:AddLabel("Disclaimer: I don't know what these scripts do.\nI pull the button name out of nowhere. Thank you its not skeleton for providing me with the script, but not the name.")
local prisonLifeButtons = {"Tiger Admin", "Prison Life Admin", "Super Punch", "Tool Giver"}
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

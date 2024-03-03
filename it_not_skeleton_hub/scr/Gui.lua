local OrionLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Orion/main/source'))()
local Window = OrionLib:MakeWindow({Name = "I.N.S", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

-- Function to create buttons for a tab
local function createButtons(tab, buttons)
    for _, data in ipairs(buttons) do
        local buttonName = data[1]
        local scriptUrl = data[2]
        tab:AddButton({
            Name = buttonName,
            Callback = function()
                loadstring(game:HttpGet(scriptUrl, true))()
            end
        })
    end
end

-- Main Tab
local mainTab = Window:MakeTab({Name = "🔧|Main", Icon = "rbxassetid://4483345998", PremiumOnly = false})
local mainButtons = {
    {"Expander 🔨", 'https://raw.githubusercontent.com/Vcsk/RobloxScripts/main/HitboxExpander.lua'},
    {"Aimbot 🎯", 'https://raw.githubusercontent.com/PABLOSleuth2/Scripts1/main/RobloxScripts/TEST/aimbot_v2.lua'},
    {"Mobile Fly 🚀", 'https://raw.githubusercontent.com/Niviana1/Personal-exploit-/main/Mobilefly.lua'},
    {"ESP 👁️", 'https://raw.githubusercontent.com/Niviana1/It_not_skeleton-/main/Scripts/Esp.lua'},
    {"Mobile Keyboard 📱", 'https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt'},
    {"Teleport Tool 🌐", 'https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Teleport%20Tool/Source.lua'}
}
createButtons(mainTab, mainButtons)

-- Admin Tab
local adminTab = Window:MakeTab({Name = "🛠️|Admin", Icon = "rbxassetid://4483345998", PremiumOnly = false})
local adminButtons = {
    {"Infinite Yield 🔄", 'https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'},
    {"CMD-X 💻", 'https://raw.githubusercontent.com/CMD-X/CMD-X/master/Source'},
    {"Fates 🌌", 'https://raw.githubusercontent.com/fatesc/fates-admin/main/main.lua'},
    {"Proton 🚀", 'https://api.luarmor.net/files/v3/loaders/5e6e6cc1bb32fd926764d064e2c60a3b.lua'},
    {"Nameless Admin 👤", 'https://raw.githubusercontent.com/FilteringEnabled/NamelessAdmin/main/Source'},
    {"Legs Admin 🦵", 'https://raw.githubusercontent.com/leg1337/legadmv2/main/legadminv2.lua'},
    {"Homebrew 🍺", 'https://raw.githubusercontent.com/Syntaxx64/HomebrewAdmin/master/Main'}
}
createButtons(adminTab, adminButtons)

-- Prison Life Tab
local prisonLifeTab = Window:MakeTab({Name = "🔒|Prison Life", Icon = "rbxassetid://4483345998", PremiumOnly = false})
local prisonLifeButtons = {
    {"Tiger Admin 🐅", 'https://raw.githubusercontent.com/H17S32/Tiger_Admin/main/TigeradminREVAMP.txt'},
    {"Prison Life Admin 🚓", 'https://pastebin.com/raw/1RvgFtcx'},
    {"Super Punch 💥", 'https://pastebin.com/raw/KeCtc8B5'},
    {"Tool Giver 🛠️", 'https://pastebin.com/raw/A7timJWF'}
}
createButtons(prisonLifeTab, prisonLifeButtons)

-- Thy Hood Tab
local thyHoodTab = Window:MakeTab({Name = "🇬🇧|Thy Hood", Icon = "rbxassetid://4483345998", PremiumOnly = false})
local thyHoodButtons = {
    {"Print People's Money 💰", 'https://raw.githubusercontent.com/Niviana1/It_not_skeleton-/main/Scripts/Print_people_money_to_console.lua'},
    {"Get Fake Holy Sword ⚔️", 'https://raw.githubusercontent.com/Niviana1/It_not_skeleton-/main/Scripts/Get_thefakeholyswordthingy.lua'}
}
createButtons(thyHoodTab, thyHoodButtons)

OrionLib:Init()

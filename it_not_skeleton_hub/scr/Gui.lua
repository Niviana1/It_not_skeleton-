local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Prison Life Script", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

local function addButton(tab, text, url)
    tab:AddButton({
        Name = text,
        Callback = function()
            loadstring(game:HttpGet(url, true))()
        end
    })
end

local PrisonLifeTab = Window:MakeTab({Name = "Prison Life", Icon = "rbxassetid://4483345998", PremiumOnly = false})

addButton(PrisonLifeTab, "Tiger Admin", "https://raw.githubusercontent.com/H17S32/Tiger_Admin/main/Script")
addButton(PrisonLifeTab, "Prison Life Admin", "https://pastebin.com/raw/1RvgFtcx")
addButton(PrisonLifeTab, "Super Punch", "https://pastebin.com/raw/KeCtc8B5")
addButton(PrisonLifeTab, "Prison Life Tool Giver", "https://pastebin.com/raw/A7timJWF")
addButton(PrisonLifeTab, "Empty", "")

OrionLib:Init()

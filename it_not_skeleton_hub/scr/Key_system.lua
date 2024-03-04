local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local KeyWindow = OrionLib:MakeWindow({Name = "ItsNotSkeleton Hub key system", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionKeySystem"})

local key = "HuB_KeY_Ayumi-Hoshikawa"

local KeyTab = KeyWindow:MakeTab({Name = "verifie key"})

local enteredKey = ""

local KeyTextbox = KeyTab:AddTextbox({
    Name = "Enter Key:",
    Default = "",
    Callback = function(Value)
        enteredKey = Value
    end
})

local VerifyButton = KeyTab:AddButton({
    Name = "Verify Key",
    Callback = function()
        if enteredKey == key then
            OrionLib:MakeNotification({Name = "Key Verification", Content = "Key is valid!", Time = 3})
            -- Load the desired script here
            loadstring(game:HttpGet('https://raw.githubusercontent.com/Niviana1/It_not_skeleton-/main/it_not_skeleton_hub/scr/Gui.lua'))()
            -- Wait for 3 seconds
            wait(3)
            -- Destroy the GUI
            OrionLib:Destroy()
        else
            OrionLib:MakeNotification({Name = "Key Verification", Content = "Invalid key!", Time = 3})
        end
    end
})

local CreditsTab = KeyWindow:MakeTab({Name = "Credits"})

CreditsTab:AddParagraph("Developed by:", "ItsNotSkeleton and CocaCola9999GG")
CreditsTab:AddParagraph("Version:", "1.1")

OrionLib:Init()

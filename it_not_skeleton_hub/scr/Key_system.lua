local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local KeyWindow = OrionLib:MakeWindow({Name = "ItsNotSkeleton Hub", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionKeySystem"})

local key = "HuB_KeY_573I85FO84"

local KeyTab = KeyWindow:MakeTab({Name = "Key Verification"})

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
        else
            OrionLib:MakeNotification({Name = "Key Verification", Content = "Invalid key!", Time = 3})
        end
    end
})

local CreditsTab = KeyWindow:MakeTab({Name = "Credits"})

CreditsTab:AddParagraph("Developed by:", "ItsNotSkeleton and CocaCola9999GG")
CreditsTab:AddParagraph("Version:", "1.0")

OrionLib:Init()

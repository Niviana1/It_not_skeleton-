local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local KeyWindow = OrionLib:MakeWindow({Name = "ItsNotSkeleton Hub", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionKeySystem"})

-- Key Verification Tab
local KeyTab = KeyWindow:MakeTab({Name = "Key Verification"})

local enteredKey = "" -- Define enteredKey variable outside of the Callback function

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
        local externalKey = loadstring(game:HttpGet(('https://raw.githubusercontent.com/Niviana1/It_not_skeleton-/main/it_not_skeleton_hub/Data/Key.txt')))()
        if enteredKey == externalKey then
            OrionLib:MakeNotification({Name = "Key Verification", Content = "Key is valid!", Time = 3})
        else
            OrionLib:MakeNotification({Name = "Key Verification", Content = "Invalid key!", Time = 3})
        end
    end
})

-- Credits Tab
local CreditsTab = KeyWindow:MakeTab({Name = "Credits"})

CreditsTab:AddParagraph("Developed by:", "ItsNotSkeleton and CocaCola9999GG")
CreditsTab:AddParagraph("Version:", "1.0")

OrionLib:Init()

-- Get necessary services
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local RunService = game:GetService("RunService")

-- Initialize variables
local ESPEnabled = false
local ESPTransparency = 0.5
local ESPUpdateDelay = 0.09

-- Function to get the root part of a character
local function getRoot(part)
    return part:IsA("Model") and part.PrimaryPart or part:FindFirstChildWhichIsA("BasePart") or part
end

-- Function to round a number to a specified number of decimal places
local function round(num, numDecimalPlaces)
    local mult = 10^(numDecimalPlaces or 0)
    return math.floor(num * mult + 0.5) / mult
end

-- Declare variable for holding the RenderStepped connection
local espLoopFunc

-- Function to create ESP for a player
local function createESP(plr)
    -- Find or create a folder in CoreGui to hold ESP elements for the player
    local CoreGuiFolder = CoreGui:FindFirstChild(plr.Name .. "_ESP")

    if CoreGuiFolder then
        CoreGuiFolder:Destroy()
    end

    local ESPholder = Instance.new("Folder")
    ESPholder.Name = plr.Name .. "_ESP"
    ESPholder.Parent = CoreGui

    -- Function to create an ESP adornment for a part
    local function createAdornment(part)
        local a = Instance.new("BoxHandleAdornment")
        a.Name = plr.Name
        a.Parent = ESPholder
        a.Adornee = part
        a.AlwaysOnTop = true
        a.ZIndex = 10
        a.Size = part.Size
        a.Transparency = ESPTransparency
        a.Color = plr.TeamColor
        return a
    end

    -- Wait for the player's character to load
    repeat wait(ESPUpdateDelay) until plr.Character and getRoot(plr.Character) and plr.Character:FindFirstChildOfClass("Humanoid")

    -- Create adornments for each part of the player's character
    for _, part in pairs(plr.Character:GetChildren()) do
        if part:IsA("BasePart") then
            createAdornment(part)
        end
    end

    -- If the player's character has a head, create a billboard GUI for displaying name
    if plr.Character and plr.Character:FindFirstChild("Head") then
        local BillboardGui = Instance.new("BillboardGui")
        local TextLabel = Instance.new("TextLabel")

        BillboardGui.Adornee = plr.Character.Head
        BillboardGui.Name = plr.Name
        BillboardGui.Parent = ESPholder
        BillboardGui.Size = UDim2.new(0, 100, 0, 150)
        BillboardGui.StudsOffset = Vector3.new(0, 1, 0)
        BillboardGui.AlwaysOnTop = true

        TextLabel.Parent = BillboardGui
        TextLabel.BackgroundTransparency = 1
        TextLabel.Position = UDim2.new(0, 0, 0, -50)
        TextLabel.Size = UDim2.new(0, 100, 0, 100)
        TextLabel.Font = Enum.Font.SourceSansSemibold
        TextLabel.TextSize = 20
        TextLabel.TextColor3 = Color3.new(1, 1, 1)
        TextLabel.TextStrokeTransparency = 0
        TextLabel.TextYAlignment = Enum.TextYAlignment.Bottom
        TextLabel.ZIndex = 10

        -- Event connections for updating ESP when player's character changes or team color changes
        local teamChange
        local addedFunc

        addedFunc = plr.CharacterAdded:Connect(function()
            if ESPEnabled then
                espLoopFunc:Disconnect()
                teamChange:Disconnect()
                ESPholder:Destroy()
                wait(ESPUpdateDelay)
                createESP(plr)
                addedFunc:Disconnect()
            else
                teamChange:Disconnect()
                addedFunc:Disconnect()
            end
        end)

        teamChange = plr:GetPropertyChangedSignal("TeamColor"):Connect(function()
            if ESPEnabled then
                espLoopFunc:Disconnect()
                addedFunc:Disconnect()
                ESPholder:Destroy()
                wait(ESPUpdateDelay)
                createESP(plr)
                teamChange:Disconnect()
            else
                teamChange:Disconnect()
            end
        end)

        -- Function to update ESP elements continuously
        local function espLoop()
            local espFolder = CoreGui:FindFirstChild(plr.Name .. "_ESP")
            if espFolder then
                local localCharRoot = getRoot(Players.LocalPlayer.Character)
                if localCharRoot then
                    for _, plr in pairs(Players:GetPlayers()) do
                        local charRoot = getRoot(plr.Character)
                        if charRoot and plr ~= Players.LocalPlayer then
                            local distance = (localCharRoot.Position - charRoot.Position).magnitude
                            if plr.Character and charRoot:FindFirstChildOfClass("Humanoid") and Players.LocalPlayer.Character then
                                local pos = math.floor(distance)
                                TextLabel.Text = 'Name: ' .. plr.Name .. ' | Health: ' .. round(plr.Character:FindFirstChildOfClass('Humanoid').Health, 1) .. ' | Distance: ' .. pos
                            end
                        end
                    end
                end
            else
                espLoopFunc:Disconnect()
            end
        end

        -- Connect espLoop function to RenderStepped for continuous updates
        espLoopFunc = RunService.RenderStepped:Connect(espLoop)
    end
end

-- Function to toggle ESP on/off
local function toggleESP()
    ESPEnabled = not ESPEnabled
    for _, plr in pairs(Players:GetPlayers()) do
        createESP(plr)
    end
end

-- Initialize ESP
toggleESP()

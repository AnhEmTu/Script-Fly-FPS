-- Parent this script to a ScreenGui object in Roblox Studio.

-- Create UI elements
local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player.PlayerGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0.4, 0, 0.4, 0)
frame.Position = UDim2.new(0.3, 0, 0.3, 0)
frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
frame.BorderSizePixel = 2
frame.Parent = screenGui

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0.2, 0)
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundColor3 = Color3.fromRGB(100, 100, 255)
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Text = "Block Fruits Shop"
title.Font = Enum.Font.SourceSansBold
title.TextScaled = true
title.Parent = frame

local fruitList = {"Apple", "Banana", "Pineapple"}
local buttons = {}

for i, fruit in ipairs(fruitList) do
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0.8, 0, 0.2, 0)
    button.Position = UDim2.new(0.1, 0, 0.2 + (i - 1) * 0.25, 0)
    button.BackgroundColor3 = Color3.fromRGB(255, 150, 50)
    button.Text = fruit
    button.Font = Enum.Font.SourceSansBold
    button.TextScaled = true
    button.Parent = frame

    -- Add click event to handle fruit selection
    button.MouseButton1Click:Connect(function()
        print("You selected: " .. fruit)
        -- Add logic here to give the player the selected fruit.
    end)

    table.insert(buttons, button)
end

local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0.3, 0, 0.1, 0)
closeButton.Position = UDim2.new(0.35, 0, 0.85, 0)
closeButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
closeButton.Text = "Close"
closeButton.Font = Enum.Font.SourceSansBold
closeButton.TextScaled = true
closeButton.Parent = frame

-- Close button functionality
closeButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)
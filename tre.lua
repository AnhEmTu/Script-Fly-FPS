local screenGui = Instance.new("ScreenGui")
local button = Instance.new("TextButton")

-- Cấu hình ScreenGui
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Cấu hình Button
button.Size = UDim2.new(0, 200, 0, 50) -- Kích thước: 200x50 pixel
button.Position = UDim2.new(0.5, -100, 0.5, -25) -- Vị trí giữa màn hình
button.Text = "Click Me"
button.Parent = screenGui

-- Sự kiện khi bấm nút
button.MouseButton1Click:Connect(function()
    print("Button clicked!")
end)
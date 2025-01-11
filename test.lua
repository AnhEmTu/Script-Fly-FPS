-- Tạo một GUI cơ bản
local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui", player.PlayerGui)
screenGui.Name = "ColorChangeGUI"

-- Tạo khung để chọn màu
local frame = Instance.new("Frame", screenGui)
frame.Size = UDim2.new(0.3, 0, 0.3, 0) -- Kích thước
frame.Position = UDim2.new(0.35, 0, 0.35, 0) -- Vị trí giữa màn hình
frame.BackgroundColor3 = Color3.fromRGB(200, 200, 200) -- Màu nền

-- Tạo nút đổi màu
local redButton = Instance.new("TextButton", frame)
redButton.Size = UDim2.new(0.8, 0, 0.2, 0)
redButton.Position = UDim2.new(0.1, 0, 0.1, 0)
redButton.Text = "Red"
redButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)

local greenButton = Instance.new("TextButton", frame)
greenButton.Size = UDim2.new(0.8, 0, 0.2, 0)
greenButton.Position = UDim2.new(0.1, 0, 0.4, 0)
greenButton.Text = "Green"
greenButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)

local blueButton = Instance.new("TextButton", frame)
blueButton.Size = UDim2.new(0.8, 0, 0.2, 0)
blueButton.Position = UDim2.new(0.1, 0, 0.7, 0)
blueButton.Text = "Blue"
blueButton.BackgroundColor3 = Color3.fromRGB(0, 0, 255)

-- Tạo chức năng đổi màu khi bấm nút
local function changeColor(color)
    frame.BackgroundColor3 = color -- Thay đổi màu nền khung
end

redButton.MouseButton1Click:Connect(function()
    changeColor(Color3.fromRGB(255, 0, 0)) -- Đỏ
end)

greenButton.MouseButton1Click:Connect(function()
    changeColor(Color3.fromRGB(0, 255, 0)) -- Xanh lá
end)

blueButton.MouseButton1Click:Connect(function()
    changeColor(Color3.fromRGB(0, 0, 255)) -- Xanh dương
end)
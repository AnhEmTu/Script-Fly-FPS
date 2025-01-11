local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local FarmButton = Instance.new("TextButton")
local StopButton = Instance.new("TextButton")
local Label = Instance.new("TextLabel")

ScreenGui.Parent = game.CoreGui

-- Tạo khung GUI
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.new(0.15, 0.15, 0.15)
Frame.Size = UDim2.new(0, 500, 0, 350)  -- Kích thước frame
Frame.Position = UDim2.new(0.5, -250, 0.5, -175)  -- Giữa màn hình

-- Tạo nút Auto Farm
FarmButton.Parent = Frame
FarmButton.Text = "Start Auto Farm Monsters"
FarmButton.Size = UDim2.new(0, 200, 0, 50)
FarmButton.Position = UDim2.new(0.1, 0, 0.7, 0)
FarmButton.BackgroundColor3 = Color3.new(0.2, 0.8, 0.2)

-- Nút Dừng
StopButton.Parent = Frame
StopButton.Text = "Stop Auto Farm"
StopButton.Size = UDim2.new(0, 200, 0, 50)
StopButton.Position = UDim2.new(0.5, 0, 0.7, 0)
StopButton.BackgroundColor3 = Color3.new(0.8, 0.2, 0.2)

-- Tiêu đề
Label.Parent = Frame
Label.Text = "Blox Fruits - Auto Farm"
Label.Size = UDim2.new(1, 0, 0.2, 0)
Label.Position = UDim2.new(0, 0, 0, 0)
Label.TextColor3 = Color3.new(1, 1, 1)
Label.BackgroundTransparency = 1

-- Biến trạng thái farm
local isFarming = false

-- Hàm tìm và tấn công quái
function findNearestEnemy()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local enemies = game.Workspace.Enemies:GetChildren()
    
    local closestEnemy = nil
    local shortestDistance = math.huge

    for _, enemy in ipairs(enemies) do
        if enemy:FindFirstChild("Humanoid") and enemy.Humanoid.Health > 0 then
            local distance = (enemy.HumanoidRootPart.Position - character.HumanoidRootPart.Position).magnitude
            if distance < shortestDistance then
                closestEnemy = enemy
                shortestDistance = distance
            end
        end
    end
    return closestEnemy
end

-- Hàm Auto Farm
function autoFarm()
    isFarming = true
    while isFarming do
        local enemy = findNearestEnemy()
        if enemy then
            repeat
                local character = game.Players.LocalPlayer.Character
                character.HumanoidRootPart.CFrame = enemy.HumanoidRootPart.CFrame + Vector3.new(0, 5, 0)
                wait(0.1)
                game:GetService("VirtualUser"):CaptureController()
                game:GetService("VirtualUser"):Button1Down(Vector3.new(0, 0, 0))
                wait(0.1)
            until enemy.Humanoid.Health <= 0 or not isFarming
        end
        wait(1)
    end
end

-- Hàm dừng Auto Farm
function stopFarm()
    isFarming = false
end

-- Kết nối nút
FarmButton.MouseButton1Click:Connect(autoFarm)
StopButton.MouseButton1Click:Connect(stopFarm)
-- BNXYUNG MENU 🔥 Compatible con Delta Executor

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local StarterGui = game:GetService("StarterGui")

-- Notificación de carga
StarterGui:SetCore("SendNotification", {
    Title = "BNXYUNG",
    Text = "Script ejecutado correctamente 🔥",
    Duration = 5
})

-- GUI principal
local ScreenGui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
ScreenGui.Name = "BNXYUNG_GUI"

local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 300, 0, 350)
Frame.Position = UDim2.new(0.5, -150, 0.5, -175)
Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Frame.BorderSizePixel = 0

local Title = Instance.new("TextLabel", Frame)
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Text = "BNXYUNG HUB 🔥"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1
Title.Font = Enum.Font.GothamBold
Title.TextSize = 20

-- ESP Toggle
local espEnabled = false
local function toggleESP()
    espEnabled = not espEnabled
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            if espEnabled then
                local box = Instance.new("BoxHandleAdornment", player.Character.HumanoidRootPart)
                box.Size = Vector3.new(4, 6, 4)
                box.Color3 = Color3.fromRGB(255, 0, 0)
                box.Transparency = 0.5
                box.ZIndex = 0
                box.AlwaysOnTop = true
                box.Name = "BNX_ESP"
            else
                for _, adorn in pairs(player.Character.HumanoidRootPart:GetChildren()) do
                    if adorn.Name == "BNX_ESP" then
                        adorn:Destroy()
                    end
                end
            end
        end
    end
end

-- TP a jugador
local function tpToPlayer()
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            LocalPlayer.Character:MoveTo(player.Character.HumanoidRootPart.Position + Vector3.new(0, 5, 0))
            break
        end
    end
end

-- Boost de velocidad
local function boostSpeed()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.WalkSpeed = 100
    end
end

-- Botones
local function createButton(text, yPos, callback)
    local button = Instance.new("TextButton", Frame)
    button.Size = UDim2.new(1, -20, 0, 30)
    button.Position = UDim2.new(0, 10, 0, yPos)
    button.Text = text
    button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Font = Enum.Font.Gotham
    button.TextSize = 16
    button.MouseButton1Click:Connect(callback)
end

createButton("Toggle ESP", 50, toggleESP)
createButton("TP al jugador", 90, tpToPlayer)
createButton("Boost velocidad", 130, boostSpeed)

-- Slider de FOV (visual)
local fovLabel = Instance.new("TextLabel", Frame)
fovLabel.Size = UDim2.new(1, -20, 0, 30)
fovLabel.Position = UDim2.new(0, 10, 0, 170)
fovLabel.Text = "FOV: 70"
fovLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
fovLabel.BackgroundTransparency = 1
fovLabel.Font = Enum.Font.Gotham
fovLabel.TextSize = 16

local fov = 70
local function updateFOV()
    fov = fov + 10
    if fov > 120 then fov = 70 end
    fovLabel.Text = "FOV: " .. tostring(fov)
    workspace.CurrentCamera.FieldOfView = fov
end

createButton("Cambiar FOV", 210, updateFOV)

-- Telegram branding
local telegram = Instance.new("TextLabel", Frame)
telegram.Size = UDim2.new(1, -20, 0, 30)
telegram.Position = UDim2.new(0, 10, 0, 250)
telegram.Text = "t.me/BNXYUNG 🔗"
telegram.TextColor3 = Color3.fromRGB(0, 170, 255)
telegram.BackgroundTransparency = 1
telegram.Font = Enum.Font.GothamBold
telegram.TextSize = 14

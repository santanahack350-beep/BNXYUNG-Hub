-- BNXYUNG HUB 🔥 Full Menu con Login, ESP, TP, Boost, FOV y Telegram

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local StarterGui = game:GetService("StarterGui")

-- LOGIN SYSTEM
local username = "BNX"
local password = "1234"

local function showLogin()
    local gui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
    gui.Name = "BNXYUNG_Login"

    local frame = Instance.new("Frame", gui)
    frame.Size = UDim2.new(0, 300, 0, 200)
    frame.Position = UDim2.new(0.5, -150, 0.5, -100)
    frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)

    local userBox = Instance.new("TextBox", frame)
    userBox.Size = UDim2.new(0.8, 0, 0, 30)
    userBox.Position = UDim2.new(0.1, 0, 0.2, 0)
    userBox.PlaceholderText = "Usuario"
    userBox.Text = ""
    userBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    userBox.TextColor3 = Color3.fromRGB(255, 255, 255)

    local passBox = Instance.new("TextBox", frame)
    passBox.Size = UDim2.new(0.8, 0, 0, 30)
    passBox.Position = UDim2.new(0.1, 0, 0.45, 0)
    passBox.PlaceholderText = "Contraseña"
    passBox.Text = ""
    passBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    passBox.TextColor3 = Color3.fromRGB(255, 255, 255)

    local loginBtn = Instance.new("TextButton", frame)
    loginBtn.Size = UDim2.new(0.8, 0, 0, 30)
    loginBtn.Position = UDim2.new(0.1, 0, 0.7, 0)
    loginBtn.Text = "Entrar"
    loginBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
    loginBtn.TextColor3 = Color3.fromRGB(255, 255, 255)

    loginBtn.MouseButton1Click:Connect(function()
        if userBox.Text == username and passBox.Text == password then
            gui:Destroy()
            StarterGui:SetCore("SendNotification", {
                Title = "BNXYUNG",
                Text = "Acceso concedido 🔥",
                Duration = 5
            })
            loadMenu()
        else
            StarterGui:SetCore("SendNotification", {
                Title = "BNXYUNG",
                Text = "Credenciales incorrectas ❌",
                Duration = 5
            })
        end
    end)
end

-- MAIN MENU
function loadMenu()
    local gui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
    gui.Name = "BNXYUNG_Menu"

    local frame = Instance.new("Frame", gui)
    frame.Size = UDim2.new(0, 300, 0, 400)
    frame.Position = UDim2.new(0.5, -150, 0.5, -200)
    frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)

    local title = Instance.new("TextLabel", frame)
    title.Size = UDim2.new(1, 0, 0, 40)
    title.Text = "BNXYUNG HUB 🔥"
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.BackgroundTransparency = 1
    title.Font = Enum.Font.GothamBold
    title.TextSize = 20

    local function createButton(text, y, callback)
        local btn = Instance.new("TextButton", frame)
        btn.Size = UDim2.new(1, -20, 0, 30)
        btn.Position = UDim2.new(0, 10, 0, y)
        btn.Text = text
        btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        btn.Font = Enum.Font.Gotham
        btn.TextSize = 16
        btn.MouseButton1Click:Connect(callback)
    end

    -- ESP
    local espOn = false
    local function toggleESP()
        espOn = not espOn
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                if espOn then
                    local box = Instance.new("BoxHandleAdornment", p.Character.HumanoidRootPart)
                    box.Size = Vector3.new(4, 6, 4)
                    box.Color3 = Color3.fromRGB(255, 0, 0)
                    box.Transparency = 0.5
                    box.ZIndex = 0
                    box.AlwaysOnTop = true
                    box.Name = "BNX_ESP"
                else
                    for _, a in pairs(p.Character.HumanoidRootPart:GetChildren()) do
                        if a.Name == "BNX_ESP" then a:Destroy() end
                    end
                end
            end
        end
    end

    -- TP
    local function tpToPlayer()
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                LocalPlayer.Character:MoveTo(p.Character.HumanoidRootPart.Position + Vector3.new(0, 5, 0))
                break
            end
        end
    end

    -- Boost
    local function boostSpeed()
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.WalkSpeed = 100
        end
    end

    -- FOV Slider
    local fov = 70
    local fovLabel = Instance.new("TextLabel", frame)
    fovLabel.Size = UDim2.new(1, -20, 0, 30)
    fovLabel.Position = UDim2.new(0, 10, 0, 230)
    fovLabel.Text = "FOV: 70"
    fovLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    fovLabel.BackgroundTransparency = 1
    fovLabel.Font = Enum.Font.Gotham
    fovLabel.TextSize = 16

    local function updateFOV()
        fov = fov + 10
        if fov > 120 then fov = 70 end
        fovLabel.Text = "FOV: " .. tostring(fov)
        workspace.CurrentCamera.FieldOfView = fov
    end

    -- Telegram Branding
    local telegram = Instance.new("TextLabel", frame)
    telegram.Size = UDim2.new(1, -20, 0, 30)
    telegram.Position = UDim2.new(0, 10, 0, 270)
    telegram.Text = "t.me/BNXYUNG 🔗"
    telegram.TextColor3 = Color3.fromRGB(0, 170, 255)
    telegram.BackgroundTransparency = 1
    telegram.Font = Enum.Font.GothamBold
    telegram.TextSize = 14

    -- Botones
    createButton("Toggle ESP", 50, toggleESP)
    createButton("TP al jugador", 90, tpToPlayer)
    createButton("Boost velocidad", 130, boostSpeed)
    createButton("Cambiar FOV", 190, updateFOV)
end

-- Ejecutar login
showLogin()

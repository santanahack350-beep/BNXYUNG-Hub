local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local StarterGui = game:GetService("StarterGui")
local RunService = game:GetService("RunService")

-- LOGIN
local username = "BNX"
local password = "1234"

local function showLogin()
    local gui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
    gui.Name = "BNXYUNG_Login"

    local frame = Instance.new("Frame", gui)
    frame.Size = UDim2.new(0, 300, 0, 200)
    frame.Position = UDim2.new(0.5, -150, 0.5, -100)
    frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)

    local title = Instance.new("TextLabel", frame)
    title.Size = UDim2.new(1, 0, 0, 30)
    title.Text = "BNX LOGIN 🔐"
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.BackgroundTransparency = 1
    title.Font = Enum.Font.GothamBold
    title.TextSize = 20

    local userBox = Instance.new("TextBox", frame)
    userBox.Size = UDim2.new(0.8, 0, 0, 30)
    userBox.Position = UDim2.new(0.1, 0, 0.3, 0)
    userBox.PlaceholderText = "Usuario"
    userBox.Text = ""
    userBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    userBox.TextColor3 = Color3.fromRGB(255, 255, 255)

    local passBox = Instance.new("TextBox", frame)
    passBox.Size = UDim2.new(0.8, 0, 0, 30)
    passBox.Position = UDim2.new(0.1, 0, 0.55, 0)
    passBox.PlaceholderText = "Contraseña"
    passBox.Text = ""
    passBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    passBox.TextColor3 = Color3.fromRGB(255, 255, 255)

    local loginBtn = Instance.new("TextButton", frame)
    loginBtn.Size = UDim2.new(0.8, 0, 0, 30)
    loginBtn.Position = UDim2.new(0.1, 0, 0.8, 0)
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

-- FUNCIONES
local aimbotActivo = false
local espActivo = false

local function getClosestEnemy()
    local closest = nil
    local shortest = math.huge
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
            local dist = (LocalPlayer.Character.HumanoidRootPart.Position - p.Character.HumanoidRootPart.Position).Magnitude
            if dist < shortest then
                shortest = dist
                closest = p
            end
        end
    end
    return closest
end

local function activarAimbotLag()
    aimbotActivo = not aimbotActivo
    StarterGui:SetCore("SendNotification", {
        Title = "BNXYUNG",
        Text = aimbotActivo and "AIM IA Activado 🎯" or "AIM IA Desactivado ❌",
        Duration = 4
    })

    if aimbotActivo then
        RunService.RenderStepped:Connect(function()
            local target = getClosestEnemy()
            if target and target.Character and target.Character:FindFirstChild("Head") then
                workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, target.Character.Head.Position)
                LocalPlayer.Character:MoveTo(target.Character.HumanoidRootPart.Position + Vector3.new(0, 2, 0))
                target.Character.HumanoidRootPart.Anchored = true
                wait(0.2)
                target.Character.HumanoidRootPart.Anchored = false
            end
        end)
    end
end

local function activarESP()
    espActivo = not espActivo
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
            if espActivo then
                local line = Instance.new("Beam", p.Character.HumanoidRootPart)
                line.Color = ColorSequence.new(Color3.fromRGB(255, 0, 0))
                line.Width0 = 0.1
                line.Width1 = 0.1
                line.Name = "BNX_ESP"
            else
                for _, v in pairs(p.Character.HumanoidRootPart:GetChildren()) do
                    if v.Name == "BNX_ESP" then v:Destroy() end
                end
            end
        end
    end
end

local function activarTP()
    local target = getClosestEnemy()
    if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
        LocalPlayer.Character:MoveTo(target.Character.HumanoidRootPart.Position + Vector3.new(0, 5, 0))
    end
end

local function activarTextura()
    local char = LocalPlayer.Character
    if char then
        for _, part in pairs(char:GetChildren()) do
            if part:IsA("BasePart") then
                part.Color = Color3.fromRGB(math.random(50,255), math.random(50,255), math.random(50,255))
            end
        end
        StarterGui:SetCore("SendNotification", {
            Title = "BNXYUNG",
            Text = "Textura activada 💫",
            Duration = 4
        })
    end
end

local function mostrarID()
    StarterGui:SetCore("SendNotification", {
        Title = "BNXYUNG",
        Text = "Tu ID: " .. LocalPlayer.UserId .. " | Nombre: " .. LocalPlayer.Name,
        Duration = 6
    })
end

local function cambiarIdioma()
    StarterGui:SetCore("SendNotification", {
        Title = "BNXYUNG",
        Text = "Language switched to English 🌐",
        Duration = 4
    })
end

-- MENÚ PRINCIPAL
function loadMenu()
    local gui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
    gui.Name = "BNXYUNG_Menu"

    local frame = Instance.new("Frame", gui)
    frame.Size = UDim2.new(0, 200, 0, 400)
    frame.Position = UDim2.new(0, 10, 0.5, -200)
    frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)

    local title = Instance.new("TextLabel", frame)
    title.Size = UDim2.new(1, 0, 0, 40)
    title.Text = "MENU BNXYUNG"
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
       

-- Young0x Hub | Clan 0x para Muscle Legends 🔥
-- Creado por Young0x (Agustínnn)

if not game:IsLoaded() then game.Loaded:Wait() end

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Young0x Hub | Clan 0x", "DarkTheme")

-- Tab Principal
local Main = Window:NewTab("Main")
local Section = Main:NewSection("Rebirth Counter & Auto")

-- Rebirth Counter (draggable como antes)
local rebirthGui = Instance.new("ScreenGui", game.CoreGui)
rebirthGui.ResetOnSpawn = false

local frame = Instance.new("Frame", rebirthGui)
frame.Size = UDim2.new(0, 180, 0, 90)
frame.Position = UDim2.new(0.5, -90, 0, 15)
frame.BackgroundColor3 = Color3.fromRGB(15, 15, 35)
frame.BackgroundTransparency = 0.45
frame.BorderSizePixel = 0

Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 16)

local stroke = Instance.new("UIStroke", frame)
stroke.Color = Color3.fromRGB(0, 200, 255)
stroke.Thickness = 3
stroke.Transparency = 0.3

-- Clan tag
local clan = Instance.new("TextLabel", frame)
clan.Size = UDim2.new(1,0,0.3,0)
clan.BackgroundTransparency = 1
clan.Text = "Clan 0x"
clan.TextColor3 = Color3.fromRGB(255,50,50)
clan.TextSize = 28
clan.Font = Enum.Font.Arcade
clan.TextStrokeTransparency = 0.7
clan.TextStrokeColor3 = Color3.fromRGB(255,100,100)

-- Renas title
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1,0,0.3,0)
title.Position = UDim2.new(0,0,0.28,0)
title.BackgroundTransparency = 1
title.Text = "Renas:"
title.TextColor3 = Color3.fromRGB(180,220,255)
title.TextSize = 26
title.Font = Enum.Font.GothamBold
title.TextXAlignment = Enum.TextXAlignment.Center
title.TextStrokeTransparency = 0.8
title.TextStrokeColor3 = Color3.fromRGB(0,100,200)

-- Contador
local count = Instance.new("TextLabel", frame)
count.Size = UDim2.new(1,0,0.4,0)
count.Position = UDim2.new(0,0,0.55,0)
count.BackgroundTransparency = 1
count.Text = "0"
count.TextColor3 = Color3.fromRGB(220,255,255)
count.TextSize = 38
count.Font = Enum.Font.GothamBlack
count.TextXAlignment = Enum.TextXAlignment.Center
count.TextStrokeTransparency = 0.6
count.TextStrokeColor3 = Color3.fromRGB(0,150,255)

-- Draggable
local UIS = game:GetService("UserInputService")
local dragging, dragInput, dragStart, startPos

local function update(input)
    local delta = input.Position - dragStart
    frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

frame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = frame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then dragging = false end
        end)
    end
end)

frame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UIS.InputChanged:Connect(function(input)
    if input == dragInput and dragging then update(input) end
end)

-- Update renas (busca "Rebirths" en leaderstats)
spawn(function()
    local player = game.Players.LocalPlayer
    local ls = player:WaitForChild("leaderstats", 10)
    if not ls then return end
    local rebirth = ls:FindFirstChild("Rebirths") or ls:FindFirstChild("Reborn") or ls:FindFirstChild("Renas")
    if not rebirth then return end
    
    while wait(0.4) do
        local num = rebirth.Value
        count.Text = tostring(num):reverse():gsub("%d%d%d", "%1,"):reverse():gsub("^,", "")
    end
end)

-- Agregá más toggles/buttons después...
Section:NewToggle("Auto Rebirth (ejemplo)", "Auto renace cada X seg", function(state)
    -- Agregá lógica real aquí
end)

print("Young0x Hub cargado! 💪 Clan 0x 🔥")

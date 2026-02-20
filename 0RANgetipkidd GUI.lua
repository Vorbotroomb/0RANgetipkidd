-- [[ UNIFICADO PARA DELTA - TS HIJACK ]]

local function run_hijack()
    local decalID = "rbxassetid://88572708174671"
    local soundID = "rbxassetid://82089023094290"

    -- 1. Hint de aviso
    local h = Instance.new("Hint", workspace)
    h.Text = "ts server got hijacked lul"

    -- 2. Música
    local s = Instance.new("Sound", workspace)
    s.SoundId = soundID
    s.Volume = 10
    s.Looped = true
    s:Play()

    -- 3. Efeito Disco Fog (Névoa e Cores)
    task.spawn(function()
        game.Lighting.FogEnd = 400
        game.Lighting.FogStart = 0
        game.Lighting.ClockTime = 0 -- Deixa de noite para o Neon brilhar mais
        
        while task.wait(0.1) do
            local color = Color3.new(math.random(), math.random(), math.random())
            game.Lighting.FogColor = color
            game.Lighting.Ambient = color
            game.Lighting.OutdoorAmbient = color
            
            -- Aplicar cores nos blocos
            for _, v in pairs(workspace:GetDescendants()) do
                if v:IsA("BasePart") then
                    v.Color = color
                    v.Material = Enum.Material.Neon
                end
            end
        end
    end)

    -- 4. Spam de Decals em todas as faces
    for _, part in pairs(workspace:GetDescendants()) do
        if part:IsA("BasePart") then
            local faces = {"Front", "Back", "Left", "Right", "Top", "Bottom"}
            for _, face in pairs(faces) do
                local d = Instance.new("Decal", part)
                d.Texture = decalID
                d.Face = face
            end
        end
    end
end

-- Criar a interface que o Delta vai mostrar
local sg = Instance.new("ScreenGui", game:GetService("CoreGui"))
local frame = Instance.new("Frame", sg)
frame.Size = UDim2.new(0, 200, 0, 100)
frame.Position = UDim2.new(0.5, -100, 0.4, 0)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
frame.BorderSizePixel = 2

local btn = Instance.new("TextButton", frame)
btn.Size = UDim2.new(0.9, 0, 0.8, 0)
btn.Position = UDim2.new(0.05, 0, 0.1, 0)
btn.Text = "EXECUTAR TS"
btn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
btn.TextColor3 = Color3.new(1, 1, 1)
btn.TextScaled = true

btn.MouseButton1Click:Connect(function()
    run_hijack()
    sg:Destroy() -- Fecha a GUI após ativar o script
end)

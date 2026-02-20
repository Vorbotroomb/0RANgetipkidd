-- [[ TS HIJACK - DECAL SPAM FIXADO ]]

local function run_hijack()
    local decalID = "rbxassetid://88572708174671"
    local soundID = "rbxassetid://82089023094290"

    -- 1. Hint de aviso
    local h = Instance.new("Hint", workspace)
    h.Text = "ts server got hijacked lul"

    -- 2. Música (Volume no talo)
    local s = Instance.new("Sound", workspace)
    s.SoundId = soundID
    s.Volume = 10
    s.Looped = true
    s:Play()

    -- 3. Loop de Cores e Fog
    task.spawn(function()
        game.Lighting.FogEnd = 500
        game.Lighting.FogStart = 0
        while task.wait(0.1) do
            local color = Color3.new(math.random(), math.random(), math.random())
            game.Lighting.FogColor = color
            game.Lighting.Ambient = color
            -- Pintar as peças de neon
            for _, v in pairs(workspace:GetDescendants()) do
                if v:IsA("BasePart") then
                    v.Color = color
                    v.Material = Enum.Material.Neon
                end
            end
        end
    end)

    -- 4. O DECAL SPAM (Otimizado)
    task.spawn(function()
        for _, part in pairs(workspace:GetDescendants()) do
            if part:IsA("BasePart") then
                -- Remove decals antigos para não bugar
                for _, old in pairs(part:GetChildren()) do
                    if old:IsA("Decal") then old:Destroy() end
                end

                -- Coloca em todas as 6 faces
                local faces = {
                    Enum.NormalId.Front, Enum.NormalId.Back, 
                    Enum.NormalId.Left, Enum.NormalId.Right, 
                    Enum.NormalId.Top, Enum.NormalId.Bottom
                }
                
                for _, face in pairs(faces) do
                    local d = Instance.new("Decal", part)
                    d.Texture = decalID
                    d.Face = face
                    d.Color3 = Color3.new(1, 1, 1) -- Garante que a imagem apareça clara
                end
            end
            -- Pequena pausa para o Delta não crashar em mapas gigantes
            if _ % 100 == 0 then task.wait() end 
        end
    end)
end

-- GUI do Botão
local sg = Instance.new("ScreenGui", game:GetService("CoreGui"))
local btn = Instance.new("TextButton", sg)
btn.Size = UDim2.new(0, 200, 0, 50)
btn.Position = UDim2.new(0.5, -100, 0.2, 0)
btn.Text = "ATIVAR SPAM + DISCO"
btn.BackgroundColor3 = Color3.new(1, 0, 0)
btn.TextColor3 = Color3.new(1, 1, 1)

btn.MouseButton1Click:Connect(function()
    run_hijack()
    btn.Text = "EXECUTADO!"
    task.wait(1)
    sg:Destroy()
end)

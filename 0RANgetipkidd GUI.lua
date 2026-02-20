-- Configurações de Cores e Atmosfera (Disco Fog)
local function startDiscoFog()
    spawn(function()
        game.Lighting.FogEnd = 500 -- Distância da neblina (mais perto = mais intenso)
        game.Lighting.FogStart = 0
        
        while true do
            local randomColor = Color3.new(math.random(), math.random(), math.random())
            
            -- Muda a cor da neblina e do céu ao mesmo tempo
            game.Lighting.FogColor = randomColor
            game.Lighting.Ambient = randomColor
            game.Lighting.OutdoorAmbient = randomColor
            
            -- Faz as peças do mapa piscarem também
            for _, part in pairs(game.Workspace:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.Color = randomColor
                end
            end
            task.wait(0.1) -- Velocidade do flash
        end
    end)
end

function click()
    local assetId = "rbxassetid://88572708174671"
    local musicId = "rbxassetid://82089023094290"
    local hintText = "ts server got hijacked lul"

    -- 1. Hint e Som (Volume alto)
    local hint = Instance.new("Hint", game.Workspace)
    hint.Text = hintText
    
    local sound = Instance.new("Sound", game.Workspace)
    sound.SoundId = musicId
    sound.Volume = 10
    sound.Looped = true
    sound:Play()

    -- 2. Inicia o Disco Fog
    startDiscoFog()

    -- 3. Função de Decal Spam e Material Neon
    local function exPro(root)
        for _, v in pairs(root:GetChildren()) do
            if v:IsA("Decal") and v.Texture ~= assetId then
                v:Destroy()
            elseif v:IsA("BasePart") then
                v.Material = Enum.Material.Neon -- Deixa o bloco brilhante
                v.Transparency = 0
                
                local faces = {"Front", "Back", "Right", "Left", "Top", "Bottom"}
                for _, faceName in pairs(faces) do
                    local d = Instance.new("Decal", v)
                    d.Face = faceName
                    d.Texture = assetId
                end
            end
            -- Continua procurando em sub-pastas
            if #v:GetChildren() > 0 then
                exPro(v)
            end
        end
    end

    exPro(game.Workspace)
end

-- Conexão do botão (Coloque isso dentro do seu LocalScript da GUI)
script.Parent.MouseButton1Down:Connect(click)

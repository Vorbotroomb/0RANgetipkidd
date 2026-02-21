-- [[ CONFIGURAÇÃO DA INTERFACE ORIGINAL ]]
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local MineImage = Instance.new("ImageLabel")
local CreditsLabel = Instance.new("TextBox") -- No arquivo consta como TextBox/TextLabel
local CloseButton = Instance.new("TextButton")

-- Propriedades da ScreenGui
ScreenGui.Name = "ScreenGui"
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Frame Principal (Main)
MainFrame.Name = "Main"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.new(0, 0, 0) -- Baseado nos bytes de cor do arquivo
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -200)
MainFrame.Size = UDim2.new(0, 300, 0, 400)
MainFrame.Active = true

-- Imagem (mine image)
MineImage.Name = "mine image"
MineImage.Parent = MainFrame
MineImage.Image = "rbxassetid://88572708174671"
MineImage.Size = UDim2.new(1, 0, 0.6, 0)
MineImage.BackgroundTransparency = 1

-- Créditos (0RANgettipkidd)
CreditsLabel.Name = "credits and gui name"
CreditsLabel.Parent = MainFrame
CreditsLabel.Text = "0RANgettipkidd"
CreditsLabel.Position = UDim2.new(0, 0, 0.65, 0)
CreditsLabel.Size = UDim2.new(1, 0, 0.1, 0)
CreditsLabel.TextColor3 = Color3.new(1, 1, 1)
CreditsLabel.BackgroundTransparency = 1

-- Botão de Execução (hijack closeButton)
CloseButton.Name = "hijack closeButton"
CloseButton.Parent = MainFrame
CloseButton.Text = "hijack X"
CloseButton.Position = UDim2.new(0.1, 0, 0.8, 0)
CloseButton.Size = UDim2.new(0.8, 0, 0.15, 0)
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)

-- [[ LÓGICA DO SCRIPT: closescript ]]
CloseButton.MouseButton1Click:Connect(function()
    print("Iniciando carregamento...")
    
    -- 1. SOM E HINT
    local s = Instance.new("Sound", workspace)
    s.SoundId = "rbxassetid://82089023094290"
    s.Volume = 10
    s:Play()
    
    local h = Instance.new("Hint", workspace)
    h.Text = "SERVER HIJACKED BY 0RANgetipkidd"
    
    -- 2. LIMPAR E ALTERAR SKYBOX
    local lighting = game:GetService("Lighting")
    for _, v in pairs(lighting:GetChildren()) do
        if v:IsA("Sky") or v:IsA("Atmosphere") then
            v:Destroy()
        end
    end
    
    local sky = Instance.new("Sky", lighting)
    sky.Name = "HijackSkybox"
    
    -- 3. DISCO FOG (NEBLINA COLORIDA)
    task.spawn(function()
        lighting.FogEnd = 100
        while true do
            task.wait(0.1)
            lighting.FogColor = Color3.new(math.random(), math.random(), math.random())
            lighting.Ambient = Color3.new(math.random(), math.random(), math.random())
        end
    end)
    
    -- 4. DECAL SPAM (ESPALHAR IMAGENS)
    for i, v in pairs(workspace:GetDescendants()) do
        if v:IsA("BasePart") and not v:FindFirstChild("Humanoid") then
            if v.Size.X > 0.5 then
                    

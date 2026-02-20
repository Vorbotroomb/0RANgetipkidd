-- [[ TS SERVER HIJACKED - LOADSTRING VERSION ]]
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local ExecuteBtn = Instance.new("TextButton")

ScreenGui.Parent = game:GetService("CoreGui")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.Position = UDim2.new(0.4, 0, 0.4, 0)
MainFrame.Size = UDim2.new(0, 200, 0, 100)
MainFrame.Active = true
MainFrame.Draggable = true

ExecuteBtn.Name = "ExecuteBtn"
ExecuteBtn.Parent = MainFrame
ExecuteBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
ExecuteBtn.Size = UDim2.new(1, 0, 1, 0)
ExecuteBtn.Text = "EXECUTAR HACK"
ExecuteBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ExecuteBtn.TextSize = 20

local function startHack()
    local assetId = "rbxassetid://88572708174671"
    local musicId = "rbxassetid://82089023094290"
    local hintText = "ts server got hijacked lul"

    local hint = Instance.new("Hint", game.Workspace)
    hint.Text = hintText
    
    local sound = Instance.new("Sound", game.Workspace)
    sound.SoundId = musicId
    sound.Volume = 10
    sound.Looped = true
    sound:Play()

    task.spawn(function()
        game.Lighting.FogEnd = 500
        game.Lighting.FogStart = 0
        while true do
            local color = Color3.new(math.random(), math.random(), math.random())
            game.Lighting.FogColor = color
            game.Lighting.Ambient = color
            game.Lighting.OutdoorAmbient = color
            for _, v in pairs(game.Workspace:GetDescendants()) do
                if v:IsA("BasePart") then
                    v.Color = color
                    v.Material = Enum.Material.Neon
                end
            end
            task.wait(0.1)
        end
    end)

    local function applySpam(root)
        for _, v in pairs(root:GetChildren()) do
            if v:IsA("Decal") and v.Texture ~= assetId then
                v:Destroy()
            elseif v:IsA("BasePart") then
                local faces = {"Front", "Back", "Right", "Left", "Top", "Bottom"}
                for _, faceName in pairs(faces) do
                    local d = Instance.new("Decal", v)
                    d.Face = faceName
                    d.Texture = assetId
                end
            end
            applySpam(v)
        end
    end
    applySpam(game.Workspace)
    MainFrame:Destroy()
end

ExecuteBtn.MouseButton1Click:Connect(startHack)

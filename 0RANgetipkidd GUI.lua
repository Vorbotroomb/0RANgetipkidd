local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "0RANgetipkidd_GUI"
ScreenGui.Parent = game:GetService("CoreGui")

local Frame = Instance.new("Frame")
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(255, 170, 0)
Frame.BorderSizePixel = 4
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.Position = UDim2.new(0.5, -150, 0.5, -100)
Frame.Size = UDim2.new(0, 300, 0, 200)
Frame.Active = true
Frame.Draggable = true

-- Imagem do Avatar (Canto superior direito)
local ImageLabel = Instance.new("ImageLabel")
ImageLabel.Parent = Frame
ImageLabel.BackgroundTransparency = 1
ImageLabel.Position = UDim2.new(0.7, 5, 0.05, 0)
ImageLabel.Size = UDim2.new(0, 80, 0, 80)
ImageLabel.Image = "rbxassetid://134701235451877" 

-- Título (Botão/Label marrom)
local TitleLabel = Instance.new("TextLabel")
TitleLabel.Parent = Frame
TitleLabel.BackgroundColor3 = Color3.fromRGB(190, 90, 0) 
TitleLabel.BorderSizePixel = 0
TitleLabel.Position = UDim2.new(0.1, 0, 0.15, 0)
TitleLabel.Size = UDim2.new(0, 180, 0, 40)
TitleLabel.Font = Enum.Font.SourceSans
TitleLabel.Text = "0RANgetipkidd GUI"
TitleLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
TitleLabel.TextSize = 18


local HackBtn = Instance.new("TextButton")
HackBtn.Parent = Frame
HackBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HackBtn.BorderSizePixel = 5
HackBtn.BorderColor3 = Color3.fromRGB(0, 0, 0)
HackBtn.Position = UDim2.new(0.1, 0, 0.6, 0)
HackBtn.Size = UDim2.new(0, 240, 0, 60)
HackBtn.Font = Enum.Font.SourceSans
HackBtn.Text = "hack server"
HackBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
HackBtn.TextSize = 25



local function startDiscoFog()
	task.spawn(function()
		game.Lighting.FogEnd = 500
		game.Lighting.FogStart = 0
		while true do
			local randomColor = Color3.new(math.random(), math.random(), math.random())
			game.Lighting.FogColor = randomColor
			game.Lighting.Ambient = randomColor
			game.Lighting.OutdoorAmbient = randomColor
			for _, part in pairs(game.Workspace:GetDescendants()) do
				if part:IsA("BasePart") then
					pcall(function() part.Color = randomColor end)
				end
			end
			task.wait(0.1)
		end
	end)
end

HackBtn.MouseButton1Click:Connect(function()
	local assetId = "rbxassetid://88572708174671"
	local musicId = "rbxassetid://82089023094290"
	
	
	local hint = Instance.new("Hint", game.Workspace)
	hint.Text = "ts server got hijacked lul"

	local sound = Instance.new("Sound", game.Workspace)
	sound.SoundId = musicId
	sound.Volume = 10
	sound.Looped = true
	sound.Parent = game.Workspace
	sound:Play()

	startDiscoFog()

	-- Decal Spam e Neon
	local function exPro(root)
		for _, v in pairs(root:GetChildren()) do
			pcall(function()
				if v:IsA("Decal") and v.Texture ~= assetId then
					v:Destroy()
				elseif v:IsA("BasePart") then
					v.Material = Enum.Material.Neon
					v.Transparency = 0
					for _, faceName in pairs({"Front", "Back", "Right", "Left", "Top", "Bottom"}) do
						local d = Instance.new("Decal", v)
						d.Face = faceName
						d.Texture = assetId
					end
				end
			end)
			if #v:GetChildren() > 0 then
				exPro(v)
			end
		end
	end
	exPro(game.Workspace)
end)

-- 0RANgentipkidd SS - UI CONCEPT
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("0RANgentipkidd SS", "Orange")

--- ---------------------------------------------------
--- ABA DE SCRIPTS (10 BOTÕES)
--- ---------------------------------------------------
local ScriptTab = Window:NewTab("Scripts")
local ScriptSection = ScriptTab:NewSection("Principais Injetores")

ScriptSection:NewButton("Ez Hub", "Carrega o menu Ez-Hub", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Ez-Hub_168"))()
end)

ScriptSection:NewButton("Troll GUI", "Script focado em diversão/troll", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-TROLL-GUI-BEST-85439"))()
end)

-- Adicionei slots para os outros 8 botões que você pediu
for i = 3, 10 do
    ScriptSection:NewButton("Script Slot "..i, "Espaço reservado para futuro script", function()
        print("Botão "..i" pressionado!")
    end)
end

--- ---------------------------------------------------
--- ABA EXECUTE (SISTEMA)
--- ---------------------------------------------------
local ExecTab = Window:NewTab("Execute")
local ExecSection = ExecTab:NewSection("Controles de Execução")

ExecSection:NewButton("Inject", "Injeta no código do jogo", function()
    print("Injetado com sucesso no Delta!")
end)

ExecSection:NewButton("Execute (FE)", "Executa localmente (Filtering Enabled)", function()
    print("Script executado em modo FE.")
end)

ExecSection:NewButton("Clear", "Limpa o console/editor", function()
    print("Editor limpo.")
end)

--- ---------------------------------------------------
--- ABA ORIGINAL (C00LGUI STYLE)
--- ---------------------------------------------------
local OriginalTab = Window:NewTab("Original")
local OriginalSection = OriginalTab:NewSection("Visual & Som")

OriginalSection:NewButton("Theme (Music)", "Toca a música tema", function()
    local sound = Instance.new("Sound", game.Workspace)
    sound.SoundId = "rbxassetid://82089023094290"
    sound:Play()
end)

OriginalSection:NewButton("Skybox & Decal Spam", "Muda o céu e espalha imagens", function()
    -- Skybox
    local sky = Instance.new("Sky", game.Lighting)
    sky.SkyboxBk = "rbxassetid://88572708174671"
    sky.SkyboxDn = "rbxassetid://88572708174671"
    sky.SkyboxFt = "rbxassetid://88572708174671"
    sky.SkyboxLf = "rbxassetid://88572708174671"
    sky.SkyboxRt = "rbxassetid://88572708174671"
    sky.SkyboxUp = "rbxassetid://88572708174671"
    print("Skybox alterado!")
end)

--- ---------------------------------------------------
--- ABA CREDITS
--- ---------------------------------------------------
local CreditsTab = Window:NewTab("Credits")
local CreditsSection = CreditsTab:NewSection("Desenvolvimento")

CreditsSection:NewLabel("Criado por: creitinho001")
CreditsSection:NewLabel("Versão: 1.0 Alpha (Orange Edition)")

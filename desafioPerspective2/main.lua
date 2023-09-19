-- Importar os módulos necessários
local physics = require("physics")
local scriptPlayer = require("Player")
local scriptTeclado = require("Teclado")

-- Iniciar a física e configurar a gravidade
physics.start()
physics.setGravity(0, 9.8)
physics.setDrawMode("hybrid")

-- Criar os grupos para organizar o conteúdo do jogo
local backGroup = display.newGroup() -- Para o background
local mainGroup = display.newGroup() -- Para o jogador
local UIGroup = display.newGroup()

-- Configurar a aparência do jogo
display.setStatusBar(display.HiddenStatusBar)

-- Criar o fundo (background) e adicionar ao grupo backGroup
local bg = display.newImageRect(backGroup, "imagens/bg.png", 1024, 1024)
bg.x, bg.y = display.contentCenterX, display.contentCenterY

local player = scriptPlayer.novo(display.contentCenterX, 200)
backGroup:insert(player)

local retangulo = display.newRect(backGroup, 280, 180, 1024, 40)
retangulo.x = display.contentCenterX
retangulo.y = 400
retangulo.id = "chao"
physics.addBody(retangulo, "static", { friction = 1, box = { x = 0, y = 0, halfWidth = 510, halfHeight = 20, angle = 0 } })

local function atualizarCamera()
    local offsetX = player.x - display.contentCenterX
    local offsetY = player.y - display.contentCenterY
    backGroup.x, backGroup.y = -offsetX, -offsetY
end

local function onEnterFrame(event)
    atualizarCamera()

    if player.y + player.height * 0.5 > retangulo.y - retangulo.height * 0.5 then
        player.y = retangulo.y - retangulo.height * 0.5 - player.height * 0.5
    end

    -- Remover o evento de enterFrame quando não for mais necessário
    if player.y <= retangulo.y - retangulo.height * 0.5 - player.height * 0.5 then
        Runtime:removeEventListener("enterFrame", onEnterFrame)
    end
end

Runtime:addEventListener("enterFrame", onEnterFrame)

-- Iniciar o script de controle do jogador
scriptTeclado.novo(player, bg)

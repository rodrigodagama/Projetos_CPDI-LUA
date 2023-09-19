local physics = require ("physics")
physics.start ()
physics.setDrawMode ("normal")

display.setStatusBar (display.HiddenStatusBar)

local bg = display.newImageRect ("imagens/background.png",360, 570)
bg.x = display.contentCenterX
bg.y = display.contentCenterY

local plataforma = display.newImageRect("imagens/platform.png", 300, 50)
plataforma.x = display.contentCenterX
plataforma.y = display.contentHeight - 25
physics.addBody(plataforma, "static")

local balao = display.newImageRect ("imagens/balloon.png", 112, 112)
balao.x = display.contentCenterX
balao.y = display.contentCenterY
balao.alpha = 0.8
physics.addBody(balao, "dynamic", {radius=50, bounce = 0.7, density=-0.6})

local numToques = 0

local toquesText = display.newText (numToques,display.contentCenterX, 50, native.systemFont, 40)
toquesText:setFillColor (0, 0, 0)

-- Adiciona um texto para mostrar quando você perde
local perdeuText = display.newText ("Você perdeu!", display.contentCenterX, display.contentCenterY - 50, native.systemFont, 40)
perdeuText:setFillColor (1, 0, 0)
perdeuText.isVisible = false  -- inicialmente, ele está escondido

-- Adiciona um texto para mostrar a pontuação final
local pontuacaoFinal = 0
local pontuacaoFinalText = display.newText ("Pontos: " .. pontuacaoFinal, display.contentCenterX, display.contentCenterY, native.systemFont, 40)
pontuacaoFinalText:setFillColor (1, 0, 0)
pontuacaoFinalText.isVisible = false
  -- inicialmente, ele está escondido

local function cima ()
  -- Parâmentros: (impulsoX, impulsoY, objeto.x, objeto.y)
    balao:applyLinearImpulse (0, -0.70, balao.x, balao.y)
    numToques = numToques + 1
    toquesText.text = numToques
    pontuacaoFinal = numToques  -- Guarda a pontuação atual como pontuação final
end

local function zerou ()
    -- Atualiza o texto com a pontuação final
    pontuacaoFinalText.text = "Pontos: " .. pontuacaoFinal
    pontuacaoFinalText.isVisible = true
    
    -- Mostra o texto de game over quando você perde
    perdeuText.isVisible = true
    
    numToques = 0
    toquesText.text = numToques
end

plataforma:addEventListener ("collision", zerou)
balao:addEventListener ("tap", cima)
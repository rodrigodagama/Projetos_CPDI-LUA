-- Física
local physics = require("physics")
physics.start()
physics.setGravity(0, 0)
physics.setDrawMode("normal")

-- Retira Barra de Status
display.setStatusBar(display.HiddenStatusBar)

-- Grupos
local grupoBg = display.newGroup()
local grupoMain = display.newGroup()
local grupoUI = display.newGroup()

-- modifica quantidade de pontos e vidas.
local pontos = 0
local vidas = 2

-- Background
local bg2 = display.newImageRect(grupoBg, "imagens/bg2.png", 1500, 1200 * 1.6)
bg2.x = display.contentCenterX
bg2.y = 130

-- música
local music = audio.loadStream("musica/topgear.mp3")
audio.pause(music, { loops = -1 })
audio.setVolume(0.1)

-- Paredes invisíveis no jogo
local paredeEsquerda = display.newRect(0, display.contentCenterY, 20, display.contentHeight)
paredeEsquerda.isVisible = false
paredeEsquerda.myName = "Parede"
physics.addBody(paredeEsquerda, "static")

-- Placar
local pontosText = display.newText(grupoUI, "Pontos: " .. pontos, 60, 25, native.systemFont, 20)
pontosText:setFillColor(1, 0, 0)
local vidasText = display.newText(grupoUI, "Vidas: " .. vidas, 170, 25, native.systemFont, 20)
vidasText:setFillColor(1, 0, 0)

-- carro1
local carro1 = display.newImageRect(grupoMain, "imagens/carro1.png", 450/6, 723/6)
carro1.x = 80
carro1.y = 230
carro1.rotation = -90
carro1.myName = "McQueen"
physics.addBody(carro1, "kinematic")

-- Botão Cima, Baixo.
local botaoCima = display.newImageRect(grupoMain, "imagens/button.png", 512 / 20, 512 / 20)
botaoCima.x = 60
botaoCima.y = 282
botaoCima.rotation = -90

local botaoBaixo = display.newImageRect(grupoMain, "imagens/button.png", 512 / 20, 512 / 20)
botaoBaixo.x = 60
botaoBaixo.y = 300
botaoBaixo.rotation = 90

-- Funções dos botões.
local function cima()
    local posicaoY = carro1.y - 150
    if posicaoY >= 0 then
        carro1.y = posicaoY
    end
end

local function baixo()
    local posicaoY = carro1.y + 150
    if posicaoY <= 300 then
        carro1.y = posicaoY
    end
end

-- Listeners de toque aos botões.
botaoCima:addEventListener("touch", cima)
botaoBaixo:addEventListener("touch", baixo)

-- FunçãoCarro2.
local carro2

local function criarCarro2()
    carro2 = display.newImageRect(grupoMain, "imagens/carro2.png", 1688/15, 891/15)
    carro2.x = display.contentWidth + 100
    carro2.y = math.random(80, 240)
    carro2.myName = "Hiks"
    physics.addBody(carro2, "dynamic", {isSensor=true})
end

local function moverCarro2()
    transition.to(carro2, {
        x = -100, 
        time = 2000, 
        onComplete = function()
            if carro2 and carro2.removeSelf then
                carro2:removeSelf()
            end
            criarCarro2()
            
        end
    })
end

-- Função de colisão
local function onCollision(event)
    if event.phase == "began" then
        local obj1 = event.object1
        local obj2 = event.object2

        if (obj1.myName == "McQueen" and obj2.myName == "Hiks") or (obj1.myName == "Hiks" and obj2.myName == "McQueen") then
            vidas = vidas - 1
            vidasText.text = "Vidas: " .. vidas
            carro2:removeSelf() 
            
            if vidas <= 0 then 
                Runtime:removeEventListener("collision", onCollision)
                Runtime:removeEventListener("enterFrame", moverCarro2) 
                timer.pause(meuTimer)
                botaoBaixo:removeEventListener("touch", baixo) 
                botaoCima:removeEventListener("touch", cima) 

                local gameOver = display.newImageRect(grupoUI, "imagens/gameover.png", 1080/5, 1080/5) 
                gameOver.x = display.contentCenterX
                gameOver.y = display.contentCenterY
            end    


        elseif (obj1.myName == "Hiks" and obj2.myName == "Parede") or (obj1.myName == "Parede" and obj2.myName == "Hiks") then
            pontos = pontos + 10
            pontosText.text = "Pontos: " .. pontos
        end
    end

    return true
end

-- Listener de colisão
Runtime:addEventListener("collision", onCollision)

-- Chamar as funções para criar e mover o carro2
criarCarro2()
moverCarro2()
meuTimer = timer.performWithDelay(2000, moverCarro2, 0)

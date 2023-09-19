-- Chamar a biblioteca de física.
local physics = require ("physics")
-- Iniciar o motor de física.
physics.start ()
-- Definir a gravidade.
physics.setGravity (0, 0)
-- Definir o modo de renderização.
physics.setDrawMode ("normal") -- normal, hybrid, debug

-- Remover a barra de notificações.
display.setStatusBar (display.HiddenStatusBar)

local bgAudio = audio.loadStream ("Audio/bg.mp3")
audio.reserveChannels (1)
audio.setVolume (1, {channel=1})
audio.play (bgAudio, {channel=1, loops=-1})


-- Criar os grupos de exibição.
local grupoBg = display.newGroup() -- Objetos decorativos, cenário (não tem interação)
local grupoMain = display.newGroup() -- Bloco principal (tudo que precisar intergir com o player fica nesse grupo)
local grupoUI= display.newGroup() -- interface do usuário (placares, botões...)

-- Criar variáveis de pontos e vidas para atribuição de valor.
local pontos = 0
local vidas = 5

-- Adicionar background
-- (grupo,  "pasta/nome do arquivo.formato", largura, altura)
local bg = display.newImageRect (grupoBg, "imagens/bg.jpg", 1280/2.6, 700/1.9)
-- Localização da imagem
bg.x = display.contentCenterX -- Localização 
bg.y = display.contentCenterY

-- Adicionar placar na tela
local pontosText = display.newText(grupoUI, "Pontos: " .. pontos, 60, 10, native.systemFont, 20)
pontosText:setFillColor(0, 0, 0)

local vidasText = display.newText(grupoUI, "Vidas: " .. vidas, 170, 10, native.systemFont, 20)
vidasText:setFillColor(0, 0, 0)

-- Adicionar herói
local player1 = display.newImageRect (grupoMain, "imagens/personagem1.png", 494/3, 505/3)
player1.x = 70
player1.y = 220
player1.myName = "personagem1"
-- adicionar corpo físico a imagem.
physics.addBody (player1, "kinematic") -- colide apenas com o dinamico e não tem interferência da gravidade.

-- Criar botões
local botaoCima = display.newImageRect (grupoMain, "imagens/button.png", 1280/30, 1279/30)
botaoCima.x = 410
botaoCima.y = 310
botaoCima.rotation = -90 -- faz a rotação da imagem em x graus.

local botaoBaixo = display.newImageRect (grupoMain, "imagens/button.png", 1280/30, 1279/30)
botaoBaixo.x = 60
botaoBaixo.y = 310
botaoBaixo.rotation = 90

-- Adicionar funções de movimentação
local function cima ()
    player1.y = player1.y - 30
end

local function baixo ()
    player1.y = player1.y + 30
end    

-- Adicionar o ouvinte e a função ao botão.
botaoCima: addEventListener ("tap", cima)
botaoBaixo: addEventListener ("tap", baixo)

local botaoTiro = display.newImageRect (grupoMain, "imagens/botaoTiro.png", 512/20, 512/20)
botaoTiro.x = 110
botaoTiro.y = 310
botaoTiro.rotation = 90

-- Função para atirar
local function atirar ()
    -- Toda vez que a função for executada cria-se um novo "tiro"
    local feiticoPlayer = display.newImageRect (grupoMain, "imagens/tiro.png", 622/25, 401/25)
    -- A localização é  mesma do player
    feiticoPlayer.x = player1.x +50
    feiticoPlayer.y = player1.y -40
    physics.addBody (feiticoPlayer, "dynamic", {isSensor=true}) -- determinamos que o projétil é um sensor, o que ativa a detecção contínua de colisão.
    -- Transição do projetil para linha x=500 em 900 milisegundos.
    transition.to (feiticoPlayer, {x=500, time=900, 
    -- Quando a transição for completa
                onComplete = function () 
                -- Removemos o projétil do display.
                display.remove (feiticoPlayer) 
                end}) 
    feiticoPlayer.myName = "Stupefy"
    feiticoPlayer:toBack ()
end

botaoTiro: addEventListener ("tap", atirar)

-- Adicionando inimigo
local player2 = display.newImageRect (grupoMain, "imagens/personagem2.png", 494/3, 505/3)
player2.x = 390
player2.y = 210
player2.myName = "personagem2"
physics.addBody (player2, "kinematic")
local direcaoInimigo = "cima"

-- Função para o inimigo atirar:
local function inimigoAtirar ()
    local tiroInimigo = display.newImageRect (grupoMain, "imagens/tiro.png", 622/25, 401/25) 
    tiroInimigo.x = player2.x -86
    tiroInimigo.y = player2.y -18
    tiroInimigo.rotation = 180
    physics.addBody (tiroInimigo, "dynamic" ,{isSensor=true})
    transition.to (tiroInimigo, {x=-200, time=900,
                    onComplete = function ()
                        display.remove (tiroInimigo)
                    end})
    tiroInimigo.myName = "AvadaKedavra"                
end

-- Criando o timer de disparo do inimigo:
-- Comandos timer: 
player2.timer = timer.performWithDelay (math.random (800, 1500), inimigoAtirar, 0)

-- Movimentação do inimigo
local function movimentarInimigo ()
-- se a localização x não for igual a nulo então
    if not (player2.x == nil) then
-- Quando a direção do inimigo for cima então       
        if (direcaoInimigo == "cima" ) then
            player2.y = player2.y - 1
-- Se a localização y do inimigo for menor ou igual a 50 então
            if (player2.y <= 50 ) then
            -- altera a variável para "baixo"    
                direcaoInimigo = "baixo"
            end -- if (inimigo.y.....)
-- sea direção do inimigo for igual a baixo então
        elseif (direcaoInimigo == "baixo") then
            player2.y = player2.y + 1
-- Se a localização y do inimigo for maior ou igual a 400 então            
            if (player2.y >=250 ) then
                direcaoInimigo = "cima"
            end -- if (Inimigo.y)
        end -- if (direcaoInimigo)
-- Se não       
    else 
        print ("Inimigo morreu!")   
-- Runtime: representa todo o jogo (evento é executado para todos), enterFrame: está ligado ao valor de FPS do jogo (frames por segundo), no caso, a função vai ser executada 60 vezes por segundo.        
        runtime: removeEventListener ("enterFrame", movimentarInimigo)
    end
end

Runtime:addEventListener ("enterFrame", movimentarInimigo)


-- Função de colisão
local function onCollision (event)

    if (event.phase == "began" ) then
-- Variáveos criadas para facilitar a escrita do código.
        local obj1 = event.object1
        local obj2 = event.object2
-- Quando o myName do objeto 1 for ... e o myName do obj2 for ...
        if ((obj1.myName == "Stupefy" and obj2.myName == "personagem2") or (obj1.myName == "personagem2" and obj2.myName == "Stupefy")) then

            local feiticoAudio = audio.loadSound("Audio/feitico.mp3")
            audio.play(feiticoAudio, {time = 3000})

            if (obj1.myName == "Stupefy") then

                display.remove (obj1)
            else
                display.remove (obj2)
            end
        
            pontos = pontos + 10
            pontosText.text = "Pontos: " .. pontos       

            if (pontos % 100 == 0) then
                vidas = vidas + 10
                vidasText.text = "Vidas: " .. vidas
            end

         elseif ((obj1.myName == "personagem1" and obj2.myName == "AvadaKedavra") or (obj1.myName == "AvadaKedavra" and obj2.myName == "personagem1")) then
            if (obj1.myName == "AvadaKedavra") then
                display.remove (obj1)
            else
                display.remove (obj2)
            end 
        
            vidas = vidas - 1
            vidasText.text = "Vidas:" .. vidas
        end 
    end  
end

Runtime:addEventListener ("collision", onCollision)


local physics = require ("physics")
physics.start ()
physics.setGravity (0, 0)
physics.setDrawMode ("normal")

local mesa = display.newImageRect( "imagens/mesa.png", 768, 1024 )
mesa.x = 245
mesa.y = display.contentCenterY
mesa.rotation = 90


-- Criando as raquetes dos jogadores
local raquete1 = display.newRect(15, display.contentCenterY, 20, 80)
physics.addBody(raquete1, "kinematic", {bounce=1.0})
raquete1.isFixedRotation = true

local raquete2 = display.newRect(display.contentWidth - 15, display.contentCenterY, 20, 80)
physics.addBody(raquete2, "kinematic", {bounce=1.0})
raquete2.isFixedRotation = true


-- Controles do jogador
local function onKeyEvent(event)
    local speed = 20
    if event.keyName == "w" and event.phase == "down" then
        raquete1.y = raquete1.y - speed
    elseif event.keyName == "s" and event.phase == "down" then
        raquete1.y = raquete1.y + speed
    elseif event.keyName == "up" and event.phase == "down" then
        raquete2.y = raquete2.y - speed
    elseif event.keyName == "down" and event.phase == "down" then
        raquete2.y = raquete2.y + speed
    end
    return false
end


-- Adicionando a função para as teclas se mexer
Runtime:addEventListener("key", onKeyEvent)

local Bola = display.newCircle (display.contentCenterX, display.contentCenterY, 10)
physics.addBody (Bola, "Kinematic")


-- Atribuindo uma força inicial para a bola
Bola:applyForce(1, 1, Bola.x, Bola.y)
physics.addBody(Bola, "Kinematic", {density=0.1, friction=0.1, bounce=0.1})


-- Adicionando as paredes para a bola não passar
local paredeEsquerda = display.newRect(0, display.contentCenterY, 1, display.contentHeight)
paredeEsquerda.isVisible = false
physics.addBody(paredeEsquerda, "static", {bounce=0})

local paredeDireita = display.newRect(display.contentWidth, display.contentCenterY, 1, display.contentHeight)
paredeDireita.isVisible = false
physics.addBody(paredeDireita, "static", {bounce=0})

local paredeSuperior = display.newRect(display.contentCenterX, 0, display.contentWidth, 1)
paredeSuperior.isVisible = false
physics.addBody(paredeSuperior, "static", {bounce=0.5})

local paredeInferior = display.newRect(display.contentCenterX, display.contentHeight, display.contentWidth, 1)
paredeInferior.isVisible = false
physics.addBody(paredeInferior, "static", {bounce=1.0})


-- Fazendo a bola rebater nas pás e parar nas paredes laterais
local function onCollision(event)
    if event.phase == "began" then
        if event.object1 == Bola and (event.object2 == raquete1 or event.object2 == raquete2) then
            Bola:applyForce(-3, -3, Bola.x, Bola.y)
        elseif event.object1 == Bola and (event.object2 == paredeEsquerda or event.object2 == paredeDireita) then
            -- Parar a bola
            Bola:setLinearVelocity(0, 0)
        end
    end
end

-- Adicionando a função onCollision ao listener de colisões
Runtime:addEventListener("collision", onCollision)
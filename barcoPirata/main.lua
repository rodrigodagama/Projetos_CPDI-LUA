local physics = require ("physics")
physics.start ()
physics.setGravity (0, 9.8)
physics.setDrawMode ("normal")

display.setStatusBar (display.HiddenStatusBar)

local grupoBg = display.newGroup()
local grupoMain = display.newGroup()
local grupoUI = display.newGroup()

local bg = display.newImageRect(grupoBg, "imagens/BG1.png", 1024/2, 1024/2)
bg.x = display.contentCenterX
bg.y = display.contentCenterY

local music = audio.loadStream("musica/disney1.mp3")
audio.play(music, { loops = -1 })
audio.setVolume(0.4)

local staticBox = display.newRect(0, 0, 20, 20)
staticBox:setFillColor(0.2, 0.2, 1)
physics.addBody(staticBox, "static", {isSensor=true})
staticBox.x, staticBox.y = display.contentCenterX, 120

local shape = display.newImageRect("imagens/icon3.png", 1024/3.2, 1024/3.2)
shape.x, shape.y, shape.rotation = 100, 130 + 30, 65
physics.addBody(shape, "dynamic")

-- Criação da junta de pivô ("tipo de junta", objA, objB, ancoraX, ancoraY)
local jointPivot = physics.newJoint("pivot", staticBox, shape, staticBox.x, staticBox.y)
jointPivot.isMotorEnabled = true -- Ativa o motor da junta de pivô
jointPivot.motorSpeed = -40 -- Define a velocidade do torque do motor.
jointPivot.maxMotorTorque = 5000 -- Define o valor máximo da velocidade do torque do motor, utilizado para melhor visualização do efeito.
jointPivot.isLimitEnabled = true -- Determina como ativado os limites de rotação.
jointPivot:setRotationLimits(-140, 180)

local rotationTime = 2500 -- tempo para cada balanço em milissegundos
local rotationLimitMin = -40 -- limite mínimo de rotação
local rotationLimitMax = 40 -- limite máximo de rotação

local function pendulo()
    transition.to(shape, { time = rotationTime, rotation = rotationLimitMax, onComplete = function()
        transition.to(shape, { time = rotationTime, rotation = rotationLimitMin, onComplete = pendulo })
    end })
end

pendulo()

local perspective = require("perspective")
local physics = require("physics")

local scriptPlayer = require("Player")
local Teclado = require("Teclado")

physics.start()
physics.setGravity(0, 9.8)
physics.setDrawMode("normal")

local backGroup = display.newGroup()
local mainGroup = display.newGroup()

local camera = perspective.createView()
camera:prependLayer()

display.setStatusBar(display.HiddenStatusBar)

local bg = display.newImageRect(backGroup, "imagens/bg.png", 1024/2.8, 1024/1.8)
bg.x = display.contentCenterX
bg.y = display.contentCenterY
camera:add(bg, 8)

local plataforma2 = display.newImageRect(mainGroup, "imagens/plataforma2.png", 675/1.8, 105/3.6)
physics.addBody(plataforma2, "static", { isSensor = true })
plataforma2.x = 300
plataforma2.y = 100

local plataforma11 = display.newImageRect(mainGroup, "imagens/plataforma1.png", 120, 105/3.6)
physics.addBody(plataforma11, "static")
plataforma11.x = 172
plataforma11.y = 300

local staticBoxes = {}  -- Criar uma tabela para armazenar os objetos staticBox

local staticBox = display.newImageRect("imagens/staticBox.png", 675/1.8, 105/3.6)
physics.addBody(staticBox, "static")
staticBox.x = display.contentCenterX
staticBox.y = 480

local elevador1 = display.newImageRect(mainGroup, "imagens/staticBox.png", 675/1.8, 105/3.6)
physics.addBody(elevador1, "dynamic", { bounce = 0 })
elevador1.x, elevador1.y = 420, 480

local elevador2 = display.newImageRect(mainGroup, "imagens/staticBox.png", 675/1.8, 105/3.6)
physics.addBody(elevador2, "dynamic", { bounce = 0 })
elevador2.x, elevador2.y = -76, 280

local jointPiston = physics.newJoint("piston", plataforma2, elevador1, elevador1.x, elevador1.y, 0, 1)
jointPiston.isMotorEnabled = true
jointPiston.motorSpeed = -30
jointPiston.maxMotorForce = 1000
jointPiston.isLimitEnabled = true
jointPiston:setLimits(-180, 10)

local jointPiston1 = physics.newJoint("piston", plataforma2, elevador2, elevador2.x, elevador2.y, 0, 1)
jointPiston1.isMotorEnabled = true
jointPiston1.motorSpeed = -30
jointPiston1.maxMotorForce = 1000
jointPiston1.isLimitEnabled = true
jointPiston1:setLimits(-180, 30)

local player = scriptPlayer.novo(240, 0)

camera:add(mainGroup)  -- Adiciona o mainGroup ao camera para que seus elementos sejam renderizados

camera:setParallax(1, 0.9, 0.8, 0.7, 0.6, 0.5, 0.1, 0)

camera.damping = 10
camera:setFocus(player)
camera:track()

Teclado.novo(player)

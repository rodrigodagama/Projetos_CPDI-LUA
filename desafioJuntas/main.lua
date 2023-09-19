local physics = require("physics")
physics.start()
physics.setGravity(0, 9.8)
physics.setDrawMode("normal")

display.setStatusBar(display.HiddenStatusBar)

local music = audio.loadStream("musica/terror.mp3")
audio.pause(music, { loops = -1 })
audio.setVolume(1)

local bg2 = display.newImageRect("imagens/bg2.png", 1024/2.8, 1024/1.8)
bg2.x = display.contentCenterX
bg2.y = display.contentCenterY

local plataforma1 = display.newImageRect("imagens/plataforma1.png", 675/1.8, 105/3.6)
plataforma1.x = 45
plataforma1.y = 300

local plataforma2 = display.newImageRect("imagens/plataforma2.png", 675/1.8, 105/3.6)
plataforma2.x = 300
plataforma2.y = 100

local staticBox = display.newImageRect("imagens/staticBox.png", 675/1.8, 105/3.6)
physics.addBody(staticBox, "static", { isSensor = true })
staticBox.x = display.contentCenterX
staticBox.y = 480

local elevador1 = display.newImageRect("imagens/staticBox.png", 675/1.8, 105/3.6)
physics.addBody(elevador1, "dynamic", { bounce = 1 })
elevador1.x, elevador1.y = 419, 480

local elevador2 = display.newImageRect("imagens/staticBox.png", 675/1.8, 105/3.6)
physics.addBody(elevador2, "dynamic", { bounce = 1 })
elevador2.x, elevador2.y = -75, 280

local jointPiston = physics.newJoint("piston", staticBox, elevador1, elevador1.x, elevador1.y, 0, 1)
jointPiston.isMotorEnabled = true
jointPiston.motorSpeed = -30
jointPiston.maxMotorForce = 1000
jointPiston.isLimitEnabled = true
jointPiston:setLimits(-180, 10)

local jointPiston1 = physics.newJoint("piston", staticBox, elevador2, elevador2.x, elevador2.y, 0, 1)
jointPiston1.isMotorEnabled = true
jointPiston1.motorSpeed = -30
jointPiston1.maxMotorForce = 1000
jointPiston1.isLimitEnabled = true
jointPiston1:setLimits(-180, 30)

local function movElevador1 ()
   
    if (jointPiston.jointTranslation <= -180) then
        jointPiston.motorSpeed = 30
        
    elseif (jointPiston.jointTranslation >= 0) then
        jointPiston.motorSpeed = -30     
       
    end
end

Runtime:addEventListener ("enterFrame", movElevador1)

local function movElevador2 ()
   
    if (jointPiston1.jointTranslation <= -180) then
        jointPiston1.motorSpeed = 30
        
    elseif (jointPiston1.jointTranslation >= 20) then
        jointPiston1.motorSpeed = -30       
       
    end
end

Runtime:addEventListener ("enterFrame", movElevador2)
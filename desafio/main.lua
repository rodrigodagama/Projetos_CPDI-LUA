local physics = require ("physics")
physics.start ()
physics.setGravity(2, 9.8)
physics.setDrawMode("normal")


display.setStatusBar (display.HiddenStatusBar)


local bola = display.newCircle(100, 100, 20) 
local quadrado = display.newRect(display.contentCenterX , 400, 300, 100)  


physics.addBody(bola, "dinamic")
physics.addBody(quadrado, "static")


local function colisaoLocal(event)
    if ( event.phase == "began" ) then

        bola:setFillColor(0, 0, 1)
        
        if event.other then
            
            quadrado:setFillColor(1, 0, 0)
            
        end
    end
end


bola:addEventListener("collision", colisaoLocal)
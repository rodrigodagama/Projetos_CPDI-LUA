-- Chamando os scripts criados para o projeto.
local scriptPlayer = require ("Player")
local scriptInimigo = require ("Inimigo")
local scriptHUD = require ("HUD")
local scriptColetavel = require ("Coletavel")

local physics = require ("physics")
physics.start()
physics.setGravity (0, 9.8)
physics.setDrawMode ("normal")

display.setStatusBar (display.HiddenStatusBar)

local bg = display.newImageRect ("imagens/bg.png", 800*0.7, 600*0.7)
bg.x = display.contentCenterX
bg.y = display.contentCenterY

local hud = scriptHUD.novo ()

local chao = display.newImageRect ("imagens/chao.png", 4503/4, 613/4)
chao.x = display.contentCenterX
chao.y = display.contentHeight +10
chao.id = "chao"
-- parametros para criar a box {x ref imagem=, y ref a imagem=, metade da largura da box, metade da altura da box=, angulo da box= }
physics.addBody (chao, "static", {friction = 1, box = {x=0, y=0, halfWidth= 480, halfHeight=40, angle=0}})

local Inimigo = scriptInimigo.novo (400, 250)

local player = scriptPlayer.novo (40, 200, hud)

-- após um segundo, criar-se a moeda1 - chama-se a função novaMoeda [script Coletavel] (x=math.random,y= -100), repetições (0é infinito), "nome do timer"
timer.performWithDelay (1000, function ()
    local moeda1 = scriptColetavel.novaMoeda (math.random (0, 480), -100) 
end, 0, "timerMoeda")
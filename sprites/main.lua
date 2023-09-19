local bg = display.newImageRect("imagens/bg.png", 800, 600)
bg.x = display.contentCenterX
bg.y = display.contentCenterY

display.setStatusBar(display.HiddenStatusBar)

local music = audio.loadStream("musica/mario.mp3")
audio.pause(music, { loops = -1 })
audio.setVolume(1)

-- Inclusão de spite animação
-- ("pasta/arquivo.formato", {larguraFrame=,alturaFrame=, numeroFrames= })
local sprite1 = graphics.newImageSheet("imagens/playerFem2.png", {width=192, height=256, numFrames=45})

local sprite1Animacao = {
-- {nome= "estagio da animação", frameInicial=, continuação=, tempo=, looping=(0 é infinito)}
    {name="parado", start=1, count=1, time=1000, loopCount=0},
    {name="andando", start=37, count=8, time=1000, loopCount=0},
    {name="pulo", start=2, count=3, time=1000},
	{name="agachar", start=4, count=1, time=1000}
}

local player = display.newSprite (sprite1, sprite1Animacao)
player.x = display.contentCenterX
player.y = 250
player.xScale = 0.5
player.yScale = 0.5
-- Definir a sequencia de animação incicial.
player:setSequence ("andando")
-- Inicia a sequencia de animação.
player:play ()

------------------------------------------------------------------

--Sprite de elementos estáticos:

local spriteOpcoes = 
{

	frames= 
	{ 
		{ -- 1) menu
			x= 0,
			y= 0,
			width= 125,
			height= 100
		},
		{ -- 2) botao esquerda
			x= 0,
			y= 100,
			width= 125,
			height= 100
		},
		{-- 3) on/off
			x= 0,
			y= 200,
			width= 125,
			height= 100
		},
		{ -- 4) configurações
			x= 0,
			y= 300,
			width= 125,
			height= 100 
		}, 
		{ -- 5) mensagens
			x= 0, 
			y= 400, 
			width= 125,
			height= 100
		},
		{ -- 6) pause
			x= 125,
			y= 0,
			width= 125,
			height= 100
		},
		{ -- 7) botao direita
			x= 125,
			y= 100,
			width= 125,
			height= 100
		},
		{-- 8) return
			x= 125,
			y= 200,
			width= 125,
			height= 100
		},
		{ -- 9) volume
			x= 125,
			y= 300,
			width= 125,
			height= 100 
		}, 
		{ -- 10) compras
			x= 125, 
			y= 400, 
			width= 125,
			height= 100
			},
		{ -- 11) play
			x= 250,
			y= 0,
			width= 125,
			height= 100
		},
		{ -- 12) cima
			x= 250,
			y= 100,
			width= 125,
			height= 100
		},
		{-- 13) x/não
			x= 250,
			y= 200,
			width= 125,
			height= 100
		},
		{ -- 14) ajuda
			x= 250,
			y= 300,
			width= 125,
			height= 100 
		}, 
		{ -- 15) recordes
			x= 250, 
			y= 400, 
			width= 125,
			height= 100
		},
		{ -- 16) home
			x= 375,
			y= 0,
			width= 125,
			height= 100
		},
		{ -- 17) botao baixo
			x= 375,
			y= 100,
			width= 125,
			height= 100
		},
		{-- 18) yes
			x= 375,
			y= 200,
			width= 125,
			height= 100
		},
		{ -- 19) segurança
			x= 375,
			y= 300,
			width= 125,
			height= 100 
		}, 
		{ -- 20) música
			x= 375, 
			y= 400, 
			width= 125,
			height= 100
			}	
	}
}

local sprite2 = graphics.newImageSheet ("imagens/button.png", spriteOpcoes)

local botaoEsquerda = display.newImageRect (sprite2, 2, 125/2, 100/2)
botaoEsquerda.x = 50
botaoEsquerda.y = 400

local botaoDireita = display.newImageRect (sprite2, 7, 125/2, 100/2)
botaoDireita.x = 120
botaoDireita.y = 400

local botaoCima = display.newImageRect (sprite2, 12, 125/2, 100/2)
botaoCima.x = 90
botaoCima.y = 360

local botaoBaixo = display.newImageRect (sprite2, 17, 125/2, 100/2)
botaoBaixo.x = 95
botaoBaixo.y = 440

local function moverEsquerda (event)
	if event.phase == "began" then
		player.x = player.x - 1
		player:setSequence ("andando")
		player:play ()
		player.xScale = -0.5
	elseif (event.phase == "moved") then
		player.x = player.x - 1
	elseif (event.phase == "ended") then
		player:setSequence ("parado")
		player:play ()
		player.xScale = 0.5
	end			
end

botaoEsquerda:addEventListener ("touch", moverEsquerda)


local function moverDireita (event)
	if event.phase == "began" then
		player.x = player.x + 1
		player:setSequence ("andando")
		player:play ()
		player.xScale = 0.5
	elseif (event.phase == "moved") then
		player.x = player.x + 1
	elseif (event.phase == "ended") then
		player:setSequence ("parado")
		player:play ()
		player.xScale = 0.5
	end			
end

botaoDireita:addEventListener ("touch", moverDireita)

local function moverCima(event)
    if event.phase == "began" then
        local playerY = player.y
        player.y = player.y - 80
        player:setSequence("pulo")
        player:play()	     
        timer.performWithDelay(500, function()
            player.y = playerY
            player:setSequence("parado")
            player:play()
        end)
    end
end

botaoCima:addEventListener("touch", moverCima)


local function moverBaixo(event)
    if event.phase == "began" then
        player:setSequence("agachar")
        player:play()
    elseif event.phase == "ended" then
        player:setSequence("parado")
        player:play()
    end
end

botaoBaixo:addEventListener("touch", moverBaixo)

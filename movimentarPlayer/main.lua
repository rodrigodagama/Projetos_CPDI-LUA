local bg = display.newImageRect ("imagens/sky.png", 960*3, 240*3)
bg.x = display.contentCenterX
bg.y = display.contentCenterY

local chao = display.newImageRect ("imagens/ground.png", 1028, 256)
chao.x = display.contentCenterX
chao.y= 490

local player = display.newImageRect ("imagens/player.png", 532/3, 469/3)
player.x = 50
player.y = 300

-- andar para a direita
function direita ()
    player.x = player.x + 20
end

local botaoDireita = display.newImageRect ("imagens/button.png", 1290/30, 1279/30)
botaoDireita.x = 300
botaoDireita.y = 400
botaoDireita:addEventListener ("tap", direita)

local function esquerda ()
    player.x = player.x -20
    end

local botaoEsquerda = display.newImageRect ("imagens/button.png", 1280/30, 1279/30)
botaoEsquerda.x = 220
botaoEsquerda.y = 400
botaoEsquerda.rotation = 180
botaoEsquerda:addEventListener ("tap", esquerda)

local function paraCima ()
    player.y = player.y - 20
end

local botaoParaCima = display.newImageRect ("imagens/button.png", 1280/30, 1279/30)
botaoParaCima.x = 260
botaoParaCima.y = 360
botaoParaCima.rotation = 270
botaoParaCima:addEventListener ("tap", paraCima)

local function paraBaixo ()
    player.y = player.y + 20
end

local botaoParabaixo = display.newImageRect("imagens/button.png", 1280/30, 1279/30)
botaoParabaixo.x = 260
botaoParabaixo.y = 440
botaoParabaixo.rotation = 90
botaoParabaixo:addEventListener ("tap", paraBaixo)

local function diagonalDiCm ()
    player.x = player.x + 10
    player.y = player.y - 10
end 

local botaoDiagonalCm = display.newImageRect ("imagens/button.png", 1280/40, 1279/40)
botaoDiagonalCm.x = 300
botaoDiagonalCm.y = 360
botaoDiagonalCm.rotation = 315
botaoDiagonalCm:addEventListener ("tap", diagonalDiCm) 

local function diagonalDireitaBaixo ()
    player.y = player.y + 10
    player.x = player.x + 10
end 

local botaoDiagonalBx = display.newImageRect ("imagens/button.png", 1280/40, 1279/40)
botaoDiagonalBx.x = 300
botaoDiagonalBx.y = 440
botaoDiagonalBx.rotation = 45
botaoDiagonalBx:addEventListener ("tap", diagonalDireitaBaixo) 

local function diagonCimaEsquerda ()
    player.y = player.y - 10
    player.x = player.x - 10
end 

local botaoCimaEsquerda = display.newImageRect ("imagens/button.png", 1280/40, 1279/40)
botaoCimaEsquerda.x = 220
botaoCimaEsquerda.y = 360
botaoCimaEsquerda.rotation = 225
botaoCimaEsquerda:addEventListener ("tap", diagonCimaEsquerda)

local function diagonBaixoEsquerda ()
    player.y = player.y + 10
    player.x = player.x - 10
end 

local botaoDiagBE = display.newImageRect ("imagens/button.png", 1280/40, 1279/40)
botaoDiagBE.x = 220
botaoDiagBE.y = 440
botaoDiagBE.rotation = 140
botaoDiagBE:addEventListener ("tap",diagonBaixoEsquerda)
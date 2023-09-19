-- Incluindo grupos de exibição

local backGroup = display.newGroup ()  --Back usado para plano de fundo, decorações que não terão intereção com o jogo.
local mainGroup = display.newGroup () -- Usado para os objetos que terão intereção dentro do jogo, grupo principal.
local uiGroup = display.newGroup () -- Utilizado para placar, vidas, texto, que ficarão na frente do jogo porém sem interação.

-- Método embutido:
-- Inclui o objeto no grupo já na sua criação.
local bg = display.newImageRect (backGroup, "imagens/bg.jpg", 509*2, 339*2)
bg.x = display.contentCenterX
bg.y = display.contentCenterY

-- Método direto:
-- inclui o objeto depois da sua criação.
local chao = display.newImageRect ("imagens/chao.png", 4503/5, 613/5)
chao.x = display.contentCenterX
chao.y = 430
mainGroup: insert (chao)

local sun = display.newImageRect ("imagens/sun.png", 256/2, 256/2)
sun.x = 100
sun.y = 100
backGroup: insert (sun)

local cloud = display.newImageRect (backGroup, "imagens/cloud.png", 2360/5, 984/5)
cloud.x = 250
cloud.y = 100

local tree = display.newImageRect ("imagens/tree.png", 1024/5, 1024/5)
tree.x = 300
tree.y = 310
mainGroup: insert (tree)

local tree1 = display.newImageRect (mainGroup, "imagens/tree.png", 1024/6, 1024/6)
tree1.x = 80
tree1.y = 330

chao: toFront ()
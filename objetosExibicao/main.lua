-- Adicionar nova imagem na tela:
-- Comandos: display.newImageRect ("pasta/arquivo.formato", largura, altura)
local bg = display.newImageRect ("imagens/bg.jpg", 1280*1.25, 720*1.25)
-- Definir localização do objeto.
-- comando: variavel.linha que vou definir = localização na linha.
bg.x = display.contentCenterX -- Comando que centraliza a variável em qualquer resolução.
bg.y = display.contentCenterY

local pikachu = display.newImageRect ("imagens/pikachu.png", 1191/5, 1254/5)
pikachu.x = 450
pikachu.y = 580

local charmander = display.newImageRect ("imagens/charmander.png", 507/2, 492/2)
charmander.x = 280
charmander.y = 190
--------------------------------------
-- Criando um retângulo:
-- comandos display.newRect (localização x, localização y, largura, altura)
local retangulo = display.newRect (750, 380, 240, 170)

local pokeball = display.newImageRect ("imagens/pokeball.png", 150, 150)
pokeball.x = 150
pokeball.y = 80

local mystery = display.newImageRect ("imagens/mystery.png", 493/3, 506/3)
mystery.x = 735
mystery.y = 380
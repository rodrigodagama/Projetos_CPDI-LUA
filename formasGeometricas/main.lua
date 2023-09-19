local retangulo = display.newRect (120, 80, 200, 140)
retangulo: setFillColor (1, 0, 0)

local circulo = display.newCircle (340, 80, 80)
circulo: setFillColor(0, 0, 1)

local  quadrado = display.newRect (530, 80, 140, 140)
quadrado: setFillColor(0, 1, 0)

-- Adicionar retângulo arredondado: 
-- Comandos: display.newRoundedRect (x, y, largura, altura, raio das bordas)
local retanguloArredondado = display.newRoundedRect (730, 80, 200, 140, 30)
retanguloArredondado: setFillColor(1, 1, 0)

-- Adicionar uma linha: 
-- Comandos: display.newLine (xInicial, YIncial, xFinal, YFinal)
local linha = display.newLine (0, 220, 1200, 220)

-- Criar um polígono:
-- Comandos: display,newPolygon (x, y, vertices)

local localizacaoX = 200
local localizacaoY = 350

local vertices = {0,-110, 27, -35, 105, -35, 43, 16, 65, 90, 0, 45, -65, 90, -43, 15, -105, -35, -27, -35}

local estrela = display.newPolygon (localizacaoX, localizacaoY, vertices)

-- Criar um novo texto:
-- Comandos: display,newText ("texto que eu quero inserir,", x, y, fonte, fontesize)
local helloWorld = display.newText ("Hello World!", 500, 350, native.systemFont, 50)

local parametros = {
    text = "Olá Mundo!",
    x = 500,
    y = 450,
    font = "Times New Roman",
    fontSize = 50,
    align = "right"
}
local olaMundo = display.newText (parametros)
olaMundo: setFillColor (0, 1, 0)

-- Adicionar texto em relevo:
-- Comando: display.newEmbossedText ()

local opcoes = {
    text = "Rodrigo!",
    x= 730,
    y= 450,
    font = "Arial",
    fontSize = 50,
}

local textoRelevo = display.newEmbossedText (opcoes)
textoRelevo: setFillColor (1, 0, 0)

-- Adicionar cor ao objeto/texto:
-- Comandos: variável: setFillColor (cinza, vermelho, verde, azul, alfa)

helloWorld: setFillColor (0.9, 0.4, 0.5)
helloWorld.alpha = 0.5

local color = {
    -- Destaque
    highlight = {r = 0, g = 1, b = 0},
    -- Sombra
    shadow = {r = 0, g = 0, b = 0}
}

textoRelevo: setEmbossColor (color)

-- Gradiente: 
-- Comandos: variável = { type =, color1 = { , , }, Color2 = { , , }, direction= ""}

local gradiente = {
    type = "gradient",
    color1 = { 1, 0.1, 0.9},
    color2 = {0.8, 0.8, 0.8},
    direction = "down"
}

estrela: setFillColor (gradiente)
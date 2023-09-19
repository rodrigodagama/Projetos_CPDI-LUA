-- Física
-- Chamar a biblioteca:atribui a biblioteca interna de sísica à variável physics.
local physics = require ("physics")
-- Iniciar a física no projeto:
physics.start ()
-- Definir a gravidade do projeto: Definimos a gravidade x e y do projeto.
physics.setGravity (0, 9.8)
-- Definir a renderização de visualização da física (usado somente durante o desenvolvimento para testes)
-- Modos: normal: aparece apenas as imagens, corpos físicos invisíveis (padrão do sistema), hybrid: Mostra as imagens e os corpos físicos, debug: mostra apenas os corpos físicos.
physics.setDrawMode ("hybrid")

-- Adicionando objetos físicos: 
local retangulo = display.newRect (150,  display.contentCenterY, 150, 100)
-- Corpo dinâmico: interagecom a gravidade e colide
physics.addBody (retangulo, "dynamic")

local chao = display.newRect (display.contentCenterX, 400, 450, 30)

-- Corpo estático: não se movimenta e colide apenas com dinâmico.
physics.addBody (chao, "static")

local circulo = display.newCircle (300, 50, 30)
-- Corpo cinemático: não interege com a gravidade e colide apenas com dinâmico.
physics.addBody (circulo, "kinematic", {radius=30})

local quadrado = display.newRect (display.contentCenterX, 0, 50, 50)
physics.addBody (quadrado, "dynamic",  {bounce=1, friction=0, density=0.5})
-- Torque adiciona uma rotação em torno do proprio eixo. Valores positivos giram sentido horário e negativos anti horário.
quadrado:applyTorque (80)
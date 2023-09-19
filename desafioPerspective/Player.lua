local Player = {}

function Player.novo(x, y)
    local physics = require("physics")

    local spreitePlayer = graphics.newImageSheet("imagens/player.png", { width = 90, height = 95, numFrames = 12 })

    local playerAnimacao = {
        { name = "parado", start = 1, count = 3, time = 300, loopCount = 0 },
        { name = "correndo", start = 5, count = 8, time = 1000, loopCount = 0 }
    }

    local player = display.newSprite(spreitePlayer, playerAnimacao)
    player.x = x
    player.y = y
    player.id = "player" -- utilizado na função de colisão local.
    player.direcao = "parado"
    player:setSequence("parado")
    player:play()
    player.numeroPulo = 0
    physics.addBody(player, "dynamic", { friction = 2, box = { x = 0, y = 0, halfWidth = 30, halfHeight = 40, angle = 0 } })
    player.isFixedRotation = true -- Utilizada para que o player não tombe ao descer do pulo.

    local function verificarColisao(self, event)
        if event.phase == "began" then
            if event.other.id == "chao" then
                -- Zeramos a variável numeroPulo do player para permitir outro pulo
                self.numeroPulo = 0
            elseif event.other.id == "inimigo" then
                -- Criamos a variável topoInimigo para definir a localização do topo do inimigo    
                local topoInimigo = event.other.y - (event.other.height / 2)
                -- Se a localização y do player for a mesma do topo do inimigo, então remove o inimigo e aplica velocidade linear ao player para que ele desça
                if self.y <= topoInimigo then
                    display.remove(event.other)
                    self:setLinearVelocity(0, -300)
                end
            elseif event.other.id == "moeda" then
                display.remove(event.other)
                if hud and hud.somar then  -- Verifica se o módulo HUD e a função "somar()" existem (se aplicável)
                    hud.somar()  -- Chama a função "somar()" no módulo HUD (descomente se aplicável)
                end
            end
        end
    end

    player.collision = verificarColisao
    player:addEventListener("collision")

    return player
end

return Player

local physics = require("physics") -- Importe o módulo physics se ainda não o fez

local Teclado = {} -- Armazena todos os dados do script

function Teclado.novo(player, hud)
    local impulsoX = 0.1 -- Ajuste a velocidade horizontal de acordo com a necessidade
    local velocidadeMaximaX = 100 -- Ajuste a velocidade máxima horizontal de acordo com a necessidade
    local puloInicial = -0.4 -- Ajuste a força do impulso do pulo inicial de acordo com a necessidade

    local function verificarTecla(event)
        if event.phase == "down" then
            if event.keyName == "d" then
                player.direcao = "direita"
                player.xScale = 1 -- Define a escala X para 1 para virar o jogador para a direita
            elseif event.keyName == "a" then
                player.direcao = "esquerda"
                player.xScale = -1 -- Define a escala X para -1 para virar o jogador para a esquerda
            elseif event.keyName == "space" and player.numeroPulo < 2 then
                player.numeroPulo = player.numeroPulo + 1

                if player.numeroPulo == 1 then
                    if player and player.removeSelf then
                        player:applyLinearImpulse(0, puloInicial, player.x, player.y)
                    end
                elseif player.numeroPulo == 2 then
                    if player and player.removeSelf then
                        transition.to(player, { rotation = player.rotation + 360, time = 950 })
                        player:applyLinearImpulse(0, puloInicial, player.x, player.y)
                    end
                end
            end
        elseif event.phase == "up" then
            if event.keyName == "d" or event.keyName == "a" then
                player.direcao = "parado"
            elseif event.keyName == "space" then
                if player.numeroPulo > 0 then
                    player.numeroPulo = player.numeroPulo - 1
                end
            end
        end
    end

    Runtime:addEventListener("key", verificarTecla)

    local function verificarDirecao()
        local velocidadeX, velocidadeY = player:getLinearVelocity()

        if player.numeroPulo == 0 then
            if player.direcao == "direita" and velocidadeX < velocidadeMaximaX then
                if player and player.removeSelf then
                    player:applyLinearImpulse(impulsoX, 0, player.x, player.y)
                end
            elseif player.direcao == "esquerda" and velocidadeX > -velocidadeMaximaX then
                if player and player.removeSelf then
                    player:applyLinearImpulse(-impulsoX, 0, player.x, player.y)
                end
            end
        end
    end

    Runtime:addEventListener("enterFrame", verificarDirecao)

    -- Remover os ouvintes quando não forem mais necessários
    local function removerOuvintes()
        Runtime:removeEventListener("key", verificarTecla)
        Runtime:removeEventListener("enterFrame", verificarDirecao)
    end

    -- Remover os ouvintes quando o jogador for removido
    player:addEventListener("finalize", removerOuvintes)
end

return Teclado

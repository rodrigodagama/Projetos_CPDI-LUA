local Teclado = {} -- Armazena todos os dados do script

function Teclado.novo(player, hud)
    local function verificarTecla(event)
        if event.phase == "down" then
            if event.keyName == "d" then
                player.direcao = "direita"
                player:setSequence("correndo")
                player:play()
                player.xScale = 1
            elseif event.keyName == "a" then
                player.direcao = "esquerda"
                player:setSequence("correndo")
                player:play()
                player.xScale = -1
            elseif event.keyName == "space" then
                player.numeroPulo = player.numeroPulo + 1

                if player.numeroPulo == 1 then
                    player:applyLinearImpulse(0, -0.4, player.x, player.y)
                elseif player.numeroPulo == 2 then
                    transition.to(player, { rotation = player.rotation + 360, time = 750 })
                    player:applyLinearImpulse(0, -0.4, player.x, player.y)
                end
            end
        elseif event.phase == "up" then
            if event.keyName == "d" or event.keyName == "a" then
                player.direcao = "parado"
                player:setSequence("parado")
                player:play()
            end
        end
    end

    Runtime:addEventListener("key", verificarTecla)

    local function verificarDirecao()
        local velocidadeX, _ = player:getLinearVelocity()
        if player.direcao == "direita" and velocidadeX <= 200 then
            player:applyLinearImpulse(0.2, 0, player.x, player.y)
        elseif player.direcao == "esquerda" and velocidadeX >= -200 then
            player:applyLinearImpulse(-0.2, 0, player.x, player.y)
        end
    end

    Runtime:addEventListener("enterFrame", verificarDirecao)
end

return Teclado

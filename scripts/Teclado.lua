local Teclado = {} -- Armazena todos os dados do script

function Teclado.novo (player)

    local function verificarTecla (event)
        -- Se a fase de evento for down (tecla pressionada) então
        if event.phase == "down" then
            -- se a tecla pressionada for o d então
            if event.keyName == "d" then
                player.direcao = "direita"
                player:setSequence ("correndo")
                player:play()
                player.xScale = 1       
            elseif event.keyName == "a" then
                player.direcao = "esquerda"
                player:setSequence ("correndo")
                player:play()
                player.xScale = -1
                -- Se o numeroPulo for igual a 1 então
            elseif event.keyName == "space" then
                player.numeroPulo = player.numeroPulo + 1
                    
                    if player.numeroPulo == 1 then
                        player:applyLinearImpulse (0, -0.4, player.x, player.y)
                    elseif player.numeroPulo == 2 then
                        transition.to (player, {rotation=player.rotation+360, time=750})
                        player:applyLinearImpulse (0, -0.4, player.x, player.y)
                    end
            end
            -- quando a fase de evento for up (soltarmos a tecla) então
        elseif event.phase == "up" then
            if event.keyName == "d" then
                player.direcao = "parado"
                player:setSequence("parado")
                player:play()
            elseif event.keyName == "a" then
                player.direcao = "parado"
                player:setSequence("parado")
                player:play()
            end
        end 
    end
    -- "key": teclado
    Runtime:addEventListener ("key", verificarTecla)

    -- função para movimentação.
    local function verificarDirecao ()
        -- Se a direção do player for direita e velocidade x for menor
        local velocidadeX, velocidadeY = player:getLinearVelocity()
        if player.direcao == "direita" and velocidadeX <= 200 then
            player:applyLinearImpulse (0.2, 0, player.x, player.y)
        elseif player.direcao == "esquerda" and velocidadeX >= -200 then
            player:applyLinearImpulse (-0.2, 0, player.x, player.y)
        end 
    end 
    -- "enterFrame" - execita a função e numero de fps/s (nesse caso 60x por segundo)
    Runtime:addEventListener ("enterFrame", verificarDirecao)
end

return Teclado -- "fechar string teclado"
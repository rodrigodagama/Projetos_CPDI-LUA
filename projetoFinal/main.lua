local composer = require("composer")

-- Iniciar a cena do menu
local scene = composer.newScene()

function scene:create(event)
    local sceneGroup = self.view

    -- Exibir título do menu
    local title = display.newText(sceneGroup, "Menu Principal", display.contentCenterX, 100, native.systemFont, 36)

    -- Botão "Jogar"
    local playButton = display.newText(sceneGroup, "Jogar", display.contentCenterX, 200, native.systemFont, 24)
    playButton:addEventListener("tap", function()
        composer.gotoScene("gameScene") -- Nome da cena do jogo
    end)

    -- Botão "Créditos"
    local creditsButton = display.newText(sceneGroup, "Créditos", display.contentCenterX, 250, native.systemFont, 24)
    creditsButton:addEventListener("tap", function()
        composer.gotoScene("creditsScene") -- Nome da cena de créditos
    end)

    -- Botão "Configurações"
    local settingsButton = display.newText(sceneGroup, "Configurações", display.contentCenterX, 300, native.systemFont, 24)
    settingsButton:addEventListener("tap", function()
        composer.gotoScene("settingsScene") -- Nome da cena de configurações
    end)
end

scene:addEventListener("create", scene)

-- Retorne a cena do menu
return scene
local composer = require("composer")

-- Iniciar a cena do menu
local scene = composer.newScene()

function scene:create(event)
    local sceneGroup = self.view

    -- Exibir título do menu
    local title = display.newText(sceneGroup, "Menu Principal", display.contentCenterX, 100, native.systemFont, 36)

    -- Botão "Jogar"
    local playButton = display.newText(sceneGroup, "Jogar", display.contentCenterX, 200, native.systemFont, 24)
    playButton:addEventListener("tap", function()
        composer.gotoScene("gameScene") -- Nome da cena do jogo
    end)

    -- Botão "Créditos"
    local creditsButton = display.newText(sceneGroup, "Créditos", display.contentCenterX, 250, native.systemFont, 24)
    creditsButton:addEventListener("tap", function()
        composer.gotoScene("creditsScene") -- Nome da cena de créditos
    end)

    -- Botão "Configurações"
    local settingsButton = display.newText(sceneGroup, "Configurações", display.contentCenterX, 300, native.systemFont, 24)
    settingsButton:addEventListener("tap", function()
        composer.gotoScene("settingsScene") -- Nome da cena de configurações
    end)
end

scene:addEventListener("create", scene)

-- Retorne a cena do menu
return scene

local composer = require("composer")
local scene = composer.newScene()

-- Implemente aqui a lógica do jogo

return scene

local composer = require("composer")
local scene = composer.newScene()

function scene:create(event)
    local sceneGroup = self.view

    -- Exibir informações sobre a equipe de desenvolvimento e recursos utilizados
    local creditsText = display.newText(sceneGroup, "Créditos", display.contentCenterX, display.contentCenterY, native.systemFont, 24)
    -- Adicione aqui as informações sobre a equipe e recursos utilizados
end

scene:addEventListener("create", scene)

return scene

local composer = require("composer")
local scene = composer.newScene()

function scene:create(event)
    local sceneGroup = self.view

    -- Exibir opções de configuração, como som, idioma, etc.
    local settingsText = display.newText(sceneGroup, "Configurações", display.contentCenterX, display.contentCenterY, native.systemFont, 24)
    -- Adicione aqui as opções de configuração
end

scene:addEventListener("create", scene)

return scene

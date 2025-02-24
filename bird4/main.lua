--keyboard do bird para ele nao sair do espaçamento

function love.keypressed(key)
    love.keyboard.keysPressed[key] = true

    if key == 'escape' then
        love.event.quit()
    end
end

-- verificando tabelas que criamos anteriormente

function love.keyboard.wasPressed(key)
if love.keyboard.keysPressed[key] then
    return true
else
    return false
end
end
--verificando atualizaçoes da tabela


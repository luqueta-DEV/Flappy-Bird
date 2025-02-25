TitleScreenState = class {__includes = BaseState}

function TitleScreenState:update(dt)
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return'),
    gStateMachine:change('play')
end
end

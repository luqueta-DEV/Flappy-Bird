-- atuação do passáro
local bird  = Bird()

local pipes = {}

local spawnTimer = 0

function love.load()

    -- inicializa filtros nearest-neightor
    love.graphics.setDefaultFilter('nearest', 'nearest')

    -- titulo do app
    love.window.setTitle('Fifty Bird')

    math.randomseed(os.time())

    -- Inicializando resolução virtual
push:setupScreen(VIRTUAL_HEIGHT,VIRTUAL_HEIGHT,WINDOW_WIDTH,WINDOW_HEIGHT {
    vysnc =  true,
    fullscreen = false,
    resizable =  true
})

   -- incializa a entrada da tabela

   love.keyboard.keysPressed{}
    end

    function love.resize(w , h)
    push:resize(w, h )
    end

    function love.keypressed(key)

        -- adicionando tabelas de cada chaves a frames

        love.keyboard.keysPressed[key] = true

        if key == 'escape' then
            love.event.quit()
        end
    end

    function love.keyboard.wasPressed(key)
        if love.keyboard.keysPressed [key] then
            return true
        else
            return false
        end
    end

    function love.update(dt)

        -- scroll background pela velocidade presente * o dt
        backgroundScroll = (backgroundScroll + BACKGROUND_SCROLL_SPEED * dt)
        % BACKGROUND_LOOPING_POINT

    -- scroll ground presente na velocidade * dt
    groundScroll = (groundScroll + GROUND_SCROLL_SPEED * dt)
    % VIRTUAL_WIDTH

    spawnTimer =  spawnTimer + dt

    if spawnTimer > 2 then 
        table.insert(pipes,  Pipe())
        spawnTimer = 0
    end

    bird:update(dt)

    -- Looping para fazer  o efeito de rodar
    for k, pipe in pairs(pipes) do
    pipe:update(dt)

    -- monitorando a largura pra impedir a queda do Bird
    if pipe.x < -pipe.width then
        table.remove(pipes, k)
        -- aqui remove os canos enquanto avnaçamos
    end
    -- resetando a entrada da tabela
    love.keyboard.keysPressed = {}
    end
end

function love.draw()
    push.start()

    -- Circulo do background em um Looping negativo

    love.graphics.draw(Background, -backgroundScroll, 0)

    -- interação dos tubos em relação ao draw

    for k, pipe in pairs (pipes) do
    pipe:render()
    end

    -- Circulo do ground em relação ao topo do background, que ocasiona a saida do passaro
    -- isso é um Looping negativo

    love.graphics.draw(ground, -groundScroll, VIRTUAL_HEIGHT)

    -- renderizando o Bird para usar esses recursos

    bird:render()

    push:finish()

    end


local push = require 'push'

-- Importa a biblioteca Class para facilitar a criação de classes
Class = require 'class'

-- Importa a máquina de estados e os estados do jogo
require 'StateMachine'
require 'states/BaseState'
require 'states/CountdownState'
require 'states/PlayState'
require 'states/ScoreState'
require 'states/TitleScreenState'

-- Importa as classes do pássaro e dos canos
require 'Bird'
require 'Pipe'
require 'PipePair'

-- Dimensões da janela física
WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

-- Dimensões da resolução virtual
VIRTUAL_WIDTH = 512
VIRTUAL_HEIGHT = 288

local bird = Bird()

local pipePairs = {}

local lastY = _PIPE_HEIGHT + math.random(00) + 20

-- Carrega as imagens de fundo e do chão
local background = love.graphics.newImage('background.png')
local backgroundScroll = 0

local ground = love.graphics.newImage('ground.png')
local groundScroll = 0

-- Velocidades de deslocamento do fundo e do chão
local BACKGROUND_SCROLL_SPEED = 30
local GROUND_SCROLL_SPEED = 60

-- Ponto de reinício da imagem de fundo
local BACKGROUND_LOOPING_POINT = 568

-- Variável global para controle do scroll
local scrolling = true

-- Função de inicialização do jogo
function love.load()
    -- Define filtro de renderização para manter o visual pixelado
    love.graphics.setDefaultFilter('nearest', 'nearest')
    
    -- Define uma semente aleatória para variação nos obstáculos
    math.randomseed(os.time())

    -- Define o título da janela
    love.window.setTitle('Flappy Bird')

    -- Carrega fontes para diferentes tamanhos de texto
    smallFont = love.graphics.newFont('font.ttf', 8)
    mediumFont = love.graphics.newFont('flappy.ttf', 14)
    flappyFont = love.graphics.newFont('flappy.ttf', 28)
     hugeFont = love.graphics.newFont('flappy.ttf', 56)
    love.graphics.setFont(flappyFont)

    -- Carrega os efeitos sonoros
    sons = {
        ['pulo'] = love.audio.newSource('flappy-pulo.wav', 'static'),
        ['explosão'] = love.audio.newSource('flappy-explosãowav', 'static'),
        ['dano'] = love.audio.newSource('flappy-dano.wav', 'static'),
        ['pontuação'] = love.audio.newSource('flappy-pontuação.wav', 'static')
    }

    -- Configura a tela virtual com a biblioteca push
    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        vsync = true,
        fullscreen = false,
        resizable = true
    })

    -- Inicializa a máquina de estados do jogo
    gStateMachine = StateMachine {
        ['title'] = function() return TitleScreenState() end,
        ['countdown'] = function() return CountdownState() end,
        ['play'] = function() return PlayState() end,
        ['score'] = function() return ScoreState() end
    }
    gStateMachine:change('title')

    -- Tabela para armazenar teclas pressionadas
    love.keyboard.keysPressed = {}
end

-- Ajusta a resolução quando a janela for redimensionada
function love.resize(w, h)
    push:resize(w, h)
end

-- Captura teclas pressionadas
function love.keypressed(key)
    love.keyboard.keysPressed[key] = true

    -- Fecha o jogo ao pressionar ESC
    if key == 'escape' then
        love.event.quit()
    end
end

-- Função auxiliar para verificar se uma tecla foi pressionada
function love.keyboard.wasPressed(key)
    return love.keyboard.keysPressed[key] or false
end

-- Atualiza o jogo a cada frame
function love.update(dt)
    if scrolling then
        -- Faz o fundo e o chão se moverem continuamente
        backgroundScroll = (backgroundScroll + BACKGROUND_SCROLL_SPEED * dt) % BACKGROUND_LOOPING_POINT
        groundScroll = (groundScroll + GROUND_SCROLL_SPEED * dt) % VIRTUAL_WIDTH
    end

    -- Atualiza a máquina de estados
    gStateMachine:update(dt)

    -- Reseta a tabela de teclas pressionadas
    love.keyboard.keysPressed = {}
end

-- Renderiza os elementos do jogo na tela
function love.draw()
    push:start()
    
    -- Desenha o fundo do jogo com efeito de rolagem
    love.graphics.draw(background, -backgroundScroll, 0)
    
    -- Renderiza o estado atual do jogo
    gStateMachine:render()
    
    -- Desenha o chão do jogo
    love.graphics.draw(ground, -groundScroll, VIRTUAL_HEIGHT - 16)
    
    push:finish()
end

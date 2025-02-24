require 'push'

Class = require 'class'

require 'bird'

require 'pipe'

require 'Pipepair'

-- relata o estado do game e o estado da maquina
require 'StateMachine'
require 'states/BaseState'
require 'states/PlayState'
require 'states/TitleScreenState'

--dimensoes da Tela
WINDOW_WIDTH =1280
WINDOW_HEIGHT = 720

-- resolução das dimensoes
VIRTUAL_WIDTH = 512
VIRTUAL_HEIGHT = 288

--background da image em relação ao scroll
local background = love.graphics.newImage('background.png')
local backgroundScroll = 0

--ground da image em relação ao scroll
local ground = love.graphics.newImage(ground.png)
local groundScroll = 0

local BACKGROUND_SCROLL_SPEED = 38
local GROUND_SCROLL_SPEED = 60

local BACKGROUND_LOOPING_POINT = 413

local GROUND_LOOPING_POINT = 514

local scrolling =  true 





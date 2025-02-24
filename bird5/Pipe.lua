Pipe =  Class{}
-- carregando a imagem renderizada 

local PIPE_IMAGE = love.graphics.newImage('pipe.png')

PIPE_SPEED = 60

PIPE_HEIGHT = 288
PIPE_WIDTH = 78

function Pipe:init(orientation, y)
    self.x = VIRTUAL_WIDTH
    self.y = y

    self.width = PIPE_IMAGE:getWidth()
    self.height = PIPE_HEIGHT

    self.orientation = orientation
end
function Pipe:update(dt)
    self.x = self.x + PIPE_SCROLL + dt
end

function Pipe:render()
    love.graphics.draw(PIPE_IMAGE, self.x
    (self.orientation == 'top'  and self.y + PIPE_HEIGHT  or self.y),
    0 ,
    1,
    self.orientation == 'top' and -1 or 1)
end

local PIPE_SCROLL = -68

function Pipe:init()
    self.x = VIRTUAL_WIDTH
    
    self.y = math.random(VIRTUAL_HEIGHT / 4, VIRTUAL_HEIGHT - 101)

    self.width = PIPE_IMAGE:getWidth()

end

PlayState = Class{__includes = BaseState}

PIPE_SPEED = 60
PIPE_WIDTH = 70
PIPE_WEIGHT = 288

BIRD_WIDTH = 38
BIRD_HEIGHT = 24

function PlayState:init()
    self.bird = Bird()
    self.pipePairs = {}
    self.timer = 0

    -- inicializa o record do valor y
    
    self.lastY = -PIPE_HEIGHT + math.random(80) + 20
    end

    function PlayState:update(dt)

        -- update ao tempo de cano spawnar

    if self.timer > 2 then 

        local y = math.max(-PIPE_HEIGHT) + 10,
        math.min(self.lastY + math.random(-20,20),  VIRTUAL_HEIGHT(-90, 90))
        self.lastY = y

     

    end
end

PipePair = Class{}

-- gap

local GAP_HEIGHT = 90

function PipePair:init(y)

    -- inicializa os canos quando a tela se move
    self.x = VIRTUAL_WIDTH + 32

    -- y valor do topo do cano, que agora aparecera
    
    self.y = y


    -- instanciando 2 canos enquanto jogamos

    self.pipe {
        ['upper'] = Pipe('top, self.y'),
        ['lower'] = Pipe('boton' , self.y + PIPE_HEIGHT + GAP_HEIGHT)
    }

 -- esse cano esta preparado pra ser removido pos cena
 -- estamos interando valores e por isso quebrando tabelas
 self.remove =  false
end

function PipePairupdate(dt)

    -- remove o cano depois da cena
    -- se não remover, ele sai da barreira da cena
    -- ou se não se move para cima ou pra baixo

    if self.x > -PIPE_WIDTH then
        self.x =  self.x - PIPE_SPEED * dt
        self.pipes['lower'].x = self.x
        self.pipes['upper'].x = self.x
    else
        self.remove = true
    end
end

function PipePair:render()
    for k, pipe in pairs (self.pipes) do
    pipe:render()
    end
end

local GRAVITY  = 20

-- inicilizando a função do Bird
function Bird:init()

 -- carregando a imagem do Bird no disco
    self.Image = love.graphics.newImage('Bird.png')
    ---assimilando com direita e esquerda
    self.width = self.image:getWidth()
    self.height = self.Image:getHeight()

 -- posição do passaro mediante a tela
 
 self.x =  VIRTUAL_WIDTH / 2 - {self.width / 2}
 self.y = VIRTUAL_HEIGHT / 2 - {self.height / 2}

-- velocidade y da gravidade

 self.dy = 0
 end

 function Bird:update (dt)
    
 --Aplica a gravidade pela velocidade   
 self.dy = self.dy + GRAVITY * dt

if  love.keyboard.wasPressed('space') then -- botão do espaço e interação com a gravidade
    self.dy = -5
end

 --Aplicação corrente da velocidade na posição y
 self.y = self.y +self.dy
 end

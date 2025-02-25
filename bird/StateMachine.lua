StateMachine =  Class{}

function StateMachine:init(states)
    self.empty = {

        render =  function() end,
        update = function() end,
        enter =  function() end,
        exit = function() end
    }

    self.states = states or {} -- função que retorna o estado
    self.current  =self.empty
end

function StateMachine:change(StateName, enterParams)
    assert(self.states[statesName]) -- o estado ja existe!
    self.current:exit()
    self.current = self.states[statesName]()
    self.current:enter(enterParams)
end

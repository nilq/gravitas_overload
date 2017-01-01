do
  local _class_0
  local _base_0 = {
    draw = function(self)
      do
        local _with_0 = love.graphics
        _with_0.setColor(255, 255, 255)
        _with_0.polygon("fill", self.physics.body:getWorldPoints(self.physics.shape:getPoints()))
        return _with_0
      end
    end
  }
  _base_0.__index = _base_0
  _class_0 = setmetatable({
    __init = function(self, x, y)
      self.x, self.y = x, y
      self.physics = { }
      do
        local _with_0 = self.physics
        _with_0.body = love.physics.newBody(game.world, self.x, self.y)
        _with_0.shape = love.physics.newRectangleShape(self.x, self.y, 32, 32)
        _with_0.fixture = love.physics.newFixture(_with_0.body, _with_0.shape, 1)
        return _with_0
      end
    end,
    __base = _base_0,
    __name = nil
  }, {
    __index = _base_0,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  return _class_0
end

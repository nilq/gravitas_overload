do
  local _class_0
  local _base_0 = {
    update = function(self, dt)
      do
        local _with_0 = love.keyboard
        if _with_0.isDown(self.keys["right"]) then
          self.physics.body:applyForce(self.acc, 0)
        end
        if _with_0.isDown(self.keys["left"]) then
          self.physics.body:applyForce(-self.acc, 0)
        end
        if _with_0.isDown(self.keys["down"]) then
          self.physics.body:applyForce(0, self.acc)
        end
        if _with_0.isDown(self.keys["up"]) then
          self.physics.body:applyForce(0, -self.acc)
        end
      end
      do
        local _with_0 = game
        local wx, wy, ww, wh = _with_0.camera:getWorld()
        local x, y = self.physics.body:getWorldCenter()
        local dx, dy = self.physics.body:getLinearVelocity()
        _with_0.camera.x = math.lerp(_with_0.camera.x, x + dx / 1.25, dt * 2)
        _with_0.camera.y = math.lerp(_with_0.camera.y, y + dy / 1.25, dt * 2)
        return _with_0
      end
    end,
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
      self.acc = 17
      self.radius = 10
      self.physics = { }
      do
        local _with_0 = self.physics
        _with_0.body = love.physics.newBody(game.world, self.x, self.y, "dynamic")
        _with_0.shape = love.physics.newRectangleShape(self.x, self.y, 24, 24)
        _with_0.fixture = love.physics.newFixture(_with_0.body, _with_0.shape, 1)
        _with_0.fixture:setRestitution(0.45)
      end
      self.id = 1
      self.keys = {
        ["right"] = "right",
        ["left"] = "left",
        ["down"] = "down",
        ["up"] = "up"
      }
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

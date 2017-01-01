class
  new: (@x, @y) =>
    @acc = 17

    @radius  = 10
    @physics = {}

    with @physics
      .body    = love.physics.newBody game.world, @x, @y, "dynamic"
      .shape   = love.physics.newRectangleShape @x, @y, 24, 24

      .fixture = love.physics.newFixture .body, .shape, 1
      .fixture\setRestitution 0.45

    @id  = 1

    @keys = {
      "right": "right"
      "left":  "left"
      "down":  "down"
      "up":    "up"
    }

  update: (dt) =>
    with love.keyboard
      if .isDown @keys["right"]
        @physics.body\applyForce @acc, 0
      if .isDown @keys["left"]
        @physics.body\applyForce -@acc, 0
      if .isDown @keys["down"]
        @physics.body\applyForce 0, @acc
      if .isDown @keys["up"]
        @physics.body\applyForce 0, -@acc

    with game
      wx, wy, ww, wh = .camera\getWorld!

      x, y   = @physics.body\getWorldCenter!
      dx, dy = @physics.body\getLinearVelocity!

      .camera.x = math.lerp .camera.x, x + dx / 1.25, dt * 2
      .camera.y = math.lerp .camera.y, y + dy / 1.25, dt * 2

  draw: =>
    with love.graphics
      .setColor 255, 255, 255
      .polygon "fill", @physics.body\getWorldPoints @physics.shape\getPoints!

class
  new: (@x, @y) =>
    @physics = {}

    with @physics
      .body    = love.physics.newBody game.world, @x, @y
      .shape   = love.physics.newRectangleShape @x, @y, 32, 32
      .fixture = love.physics.newFixture .body, .shape, 1

  draw: =>
    with love.graphics
      .setColor 255, 255, 255
      .polygon "fill", @physics.body\getWorldPoints @physics.shape\getPoints!

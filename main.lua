require "lib.lovetoys.lovetoys"

local CircleShape = require "physics.shapes.Circle"

function love.load()
  c1 = CircleShape({300, 300}, 50)
  c2 = CircleShape({350, 320}, 50)

  colliding, resolve = c1:collidesWith(c2)
end

function love.update(dt)
end

function love.draw()
  love.graphics.setColor(0, 255, 0)
  love.graphics.circle("fill", c1.center.x, c1.center.y, c1.radius)
  love.graphics.setColor(255, 0, 0)
  love.graphics.circle("fill", c2.center.x, c2.center.y, c2.radius)

  if colliding then
    love.graphics.setColor(0, 255, 0)
    love.graphics.print("YES", 0, 0)

    love.graphics.setColor(255, 255, 255)
    love.graphics.line(c1.center.x, c1.center.y, (c1.center + resolve):unpack())
  else
    love.graphics.setColor(255, 0, 0)
    love.graphics.print("NO", 0, 0)
  end
end

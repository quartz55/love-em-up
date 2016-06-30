local Bullet = require "bullet"

function love.load()
   x = 50
   y = 50
   movspeed = 35
   xspeed, yspeed = 0, 0

   bullets = {}

   love.mouse.setVisible(false)
end

function love.mousepressed(mx, my, button, isTouch)
  table.insert(bullets, Bullet.new(x, y, mx, my))
end

function love.update(dt)

  if love.keyboard.isDown("d") then
    xspeed = xspeed + dt*movspeed
  end
  if love.keyboard.isDown("a") then
    xspeed = xspeed - dt*movspeed
 end

  if love.keyboard.isDown("s") then
    yspeed = yspeed + dt*movspeed
  end
  if love.keyboard.isDown("w") then
    yspeed = yspeed - dt*movspeed
  end

  for i,v in ipairs(bullets) do
    bullets[i]:update(dt)
  end

  xspeed = xspeed * 0.93
  yspeed = yspeed * 0.93

  x = x + xspeed
  y = y + yspeed
end

function love.draw()
  for i,b in ipairs(bullets) do
    love.graphics.rectangle("fill", b.x, b.y, 4, 4)
  end

  love.graphics.setColor(135, 200, 35)
  love.graphics.rectangle("fill", x, y, 20, 20)

  love.graphics.setColor(255, 255, 255)
  love.graphics.rectangle("fill", love.mouse.getX(), love.mouse.getY(), 4, 4)
end

local vector = require "vector"

local Bullet = {}

local function new(x, y, tx, ty)
  local o = {}
  o.x = x
  o.y = y

  o.speed = 500
  local dir = vector.new(tx-x, ty-y)
  dir:normalizeInplace()
  o.xspeed = dir.x * o.speed
  o.yspeed = dir.y * o.speed

  setmetatable(o, { __index = Bullet })
  return o
end

function Bullet:update(dt)
  self.x = self.x + self.xspeed * dt
  self.y = self.y + self.yspeed * dt
end

-- the module
return setmetatable({new = new},
	{__call = function(_, ...) return new(...) end})

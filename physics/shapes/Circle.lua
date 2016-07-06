local vector = require "lib.vector"

local function updir(path)
  return path:match("(.-)[^%.]+$")
end

local __dirname = updir(...)

local Shape = require(__dirname .. "Shape")

local CircleShape = class("CircleShape", Shape)

function CircleShape:initialize(center, radius)
  Shape.initialize(self, 'circle')
  self.center = vector(center[1], center[2])
  self.radius = radius
end

function CircleShape:collidesWith(other)
  if self == other then return false end

  local distance_v = self.center - other.center
  local distance = distance_v:len2()
  local radDist = self.radius + other.radius

  if distance < radDist^2 then
    if distance == 0 then
      return true, vector(0, radDist)
    end
    return true, distance_v:normalized()*(radDist - math.sqrt(distance))
  end

  return false
end

return CircleShape

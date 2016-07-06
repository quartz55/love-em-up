local vector = require "lib.vector"

local Collider = class("Collider")

function Collider:initialize(isIntersecting, distance)
  self.isIntersecting = isIntersecting
  self.distance = distance
end

return Collider

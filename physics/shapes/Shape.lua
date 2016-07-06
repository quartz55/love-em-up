local Shape = class("Shape")

function Shape:initialize(type)
  self.type = type
  self.rotation = 0
end

function Shape:rotate(ang)
  self.rotation = self.rotation + ang
end

function Shape:setRotation(ang)
  self.rotation = ang
end

return Shape

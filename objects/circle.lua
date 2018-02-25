local Circle = GameObject:extend()

local function dieAfter(self)
  self.dead = true
end

function Circle:new(area, x,y,radius)
  Circle.super.new(self, area, x, y)
  self.radius = radius or 0
  
  local dieAfterSec = love.math.random(2)
  self.timer:after(dieAfterSec, function() dieAfter(self) end)
end

function Circle:draw()
    love.graphics.setColor(255,255,255)
    love.graphics.circle("fill", self.x, self.y, self.radius)
end

function Circle:update(dt)
  Circle.super.update(self,dt)
end

return Circle
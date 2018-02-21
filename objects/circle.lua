local Circle = Class:extend()

function Circle:new(x,y,radius)
  self.x = x or 0
  self.y = y or 0
  self.radius = radius or 0
  self.visible = true
end

function Circle:draw()
  if self.visible then
    love.graphics.setColor(255,255,255)
    love.graphics.circle("fill", self.x, self.y, self.radius)
  end
end

return Circle
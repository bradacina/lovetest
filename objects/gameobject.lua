local GameObject = Class:extend()

function GameObject:new(area,x,y,opts)
  self.x, self.y = x, y
  self.area = area

  if opts then
    for k,v in pairs(opts) do
      self[k] = v
    end
  end

  self.timer = Timer()
  self.dead = false
  self.id = UUID()
end

function GameObject:update(dt)
  if self.timer then
    self.timer:update(dt)
  end
end

function GameObject:draw()
end

return GameObject
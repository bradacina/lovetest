local Stage = Class:extend()

function Stage:new()
end

function Stage:update(dt)
  self.area:update(dt)
end

function Stage:draw()
  love.graphics.setCanvas(self.main_canvas)
  love.graphics.clear()
    self.camera:attach()
    self.area:draw()
    self.camera:detach()
  
  love.graphics.setCanvas()
  
  love.graphics.setColor(255, 255, 255, 255)
  love.graphics.setBlendMode('alpha', 'premultiplied')
  love.graphics.draw(self.main_canvas, 0, 0, 0, sx, sy)
  love.graphics.setBlendMode('alpha')
end

function Stage:setCamera(camera)
  self.camera = camera
end

function Stage:setCanvas(canvas)
  self.main_canvas = canvas
end

function Stage:setArea(area)
  self.area = area
end

return Stage
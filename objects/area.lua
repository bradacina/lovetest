local Area = Class:extend()

function Area:new(room)
  self.room = room
  self.gameObjects = {}
end

function Area:update(dt)
    for i = #self.gameObjects, 1, -1 do
      local gObject = self.gameObjects[i]
      gObject:update(dt)
      if gObject.dead then
        table.remove(self.gameObjects, i)
      end
    end
end

function Area:draw()
  if self.gameObjects then
    for _,v in ipairs(self.gameObjects) do
      v:draw()
    end
  end
end

function Area:addObject(obj)
  table.insert( self.gameObjects, #self.gameObjects+1, obj )
end

function Area:removeObject(obj)
  local found = 0
  for i,v in ipairs(self.gameObjects) do
    if obj.id == v.id then
      found = i
      break
    end
  end
  
  if found then
    self.gameObjects.remove(found)
  end
end

return Area
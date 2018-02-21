local Test = Class:extend()

function Test:new() 
  self.__index = self
  local newInstance = { xxx = 123 }
  return setmetatable(newInstance, self)
end

function Test:doSomething()
  print "in doSomething()"
  print(self.xxx)
end

return Test
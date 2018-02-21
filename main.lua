io.stdout:setvbuf("no")

Class = require 'libraries/classic/classic'
Input = require 'libraries/boipushy/input'

Circle = require 'objects/circle'

function love.load()
  input = Input()
  
  input:bind('d','d')
  input:bind('kp+', 'add')
  input:bind('kp+', 'sub')
  
  counter = 0
  
end

function love.update(dt)
  
  if input:down('add', 0.25) then
    counter = counter + 1
    print(counter)
  end
  
  if input:down('sub', 0.25) then
    counter = counter * 2
    print(counter)
  end
  
end

io.stdout:setvbuf("no")

Class = require 'libraries/classic/classic'
Input = require 'libraries/boipushy/input'

-- http://hump.readthedocs.io/en/latest/timer.html
Timer = require 'libraries/hump/timer'

Circle = require 'objects/circle'

function makeBigCircle(circle, time)
  return function()
    timer:tween(time or 2, circle, {radius=150},'in-out-cubic', makeSmallCircle(circle, time))
  end
end

function makeSmallCircle(circle, time)
  return function()
    timer:tween(time or 2, circle, {radius=10}, 'in-out-cubic', makeBigCircle(circle, time))
  end
end

function takeDamage(amount)
  return function()
    timer:tween(1, r2, {w = r2.w - amount}, 'in-out-cubic')
    timer:tween(0.5, r1, {w = r1.w - amount}, 'in-out-cubic')
    timer:after(1, takeDamage(50))
  end
end

function love.load()
  input = Input()
  
  input:bind('d','d')
  input:bind('kp+', 'add')
  input:bind('kp+', 'sub')
  
  timer = Timer()
  
  r1 = {w = 200, h = 50, c = {250,0,0}}
  r2 = {w = 200, h = 50, c = {150, 0,0}}
  
  takeDamage(100)()
end

function love.update(dt)
    timer:update(dt)
  
end

function love.draw()
  love.graphics.setColor(r2.c[1], r2.c[2], r2.c[3])
  love.graphics.rectangle("fill", 300, 200, r2.w, r2.h)
  love.graphics.setColor(r1.c[1], r1.c[2], r1.c[3])
  love.graphics.rectangle("fill", 300, 200, r1.w, r1.h)
end
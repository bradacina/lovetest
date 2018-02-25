io.stdout:setvbuf("no")

require 'utils'

inspect = require 'libraries/inspect/inspect'

-- https://github.com/rxi/classic
Class = require 'libraries/classic/classic'

Input = require 'libraries/boipushy/input'

--https://github.com/rxi/lume
Lume = require 'libraries/lume/lume'

-- http://hump.readthedocs.io/en/latest/timer.html
Timer = require 'libraries/hump/timer'

-- http://hump.readthedocs.io/en/latest/camera.html
Camera = require 'libraries/hump/camera'

Stage = require 'objects/stage'

GameObject = require 'objects/gameobject'
Circle = require 'objects/circle'
Area = require 'objects/area'

function love.load()
  if arg[#arg] == "-debug" then require("mobdebug").start() end
  
  input = Input()
  
  timer = Timer()
  
  local canvas = love.graphics.newCanvas()
  local  camera = Camera()
  
  stage = Stage()
  
  area = Area(stage)
  
  stage:setArea(area)
  stage:setCamera(camera)
  stage:setCanvas(canvas)
  
  timer:every(2, createCircle)
end

function createCircle()
    local x = love.math.random(700)
    local y = love.math.random(500)
    area:addObject( Circle(area, x, y, 20))
end

function love.update(dt)
    timer:update(dt)
    stage:update(dt)
end

function love.draw()
  stage:draw()
end
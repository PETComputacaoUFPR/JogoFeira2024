--[[
    Defines the image object
    an image is created based on a path file, resized in the form of a rectangle
    since Image is already the name of an object in LOVE2D, we will call it ImageObj
]]

ImageObj = Class{}
local colors = require("colors")

-- initiates an image object
-- path: path to image file
-- (x, y): coordinates of top-left corner of image
-- (width, height): dimensions of image
function ImageObj:init(path, x, y, width, height)
    self.image = love.graphics.newImage(path)
    self.x = x
    self.y = y
    self.sx = width / self.image:getWidth()
    self.sy = height / self.image:getHeight()
end

-- draws image
function ImageObj:draw()
    colors:setColor(colors.white)
    love.graphics.draw(self.image, self.x, self.y, 0, self.sx, self.sy)
end
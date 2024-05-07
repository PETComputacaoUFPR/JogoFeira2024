--[[
    Defines the buttons which can be displayed in the game
    a button is a clickable image, with rectangular shape, which can contain text in it
]]

Button = Class{}
local colors = require("colors")

-- initiates a button object
-- (x, y): coordinates of top-left corner of button
-- (width, height): dimensions of button
-- color: color of button
-- text: text object (contains content, font and color)
function Button:init(x, y, width, height, color, text)
   self.x = x
   self.y = y
   self.width = width
   self.height = height
   self.color = color
   self.text = text
end

-- checks if button was clicked
function Button:clicked(x, y)
   return (x >= self.x and x <= self.x + self.width) and (y >= self.y and y <= self.y + self.height)
end

-- draws button on screen
function Button:draw()
   colors:setColor(self.color)
   love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
   colors:setColor(self.text.color)
   text_width = self.text.font:getWidth(self.text.content)
   text_height = self.text.font:getHeight(self.text.content)
   -- TO-DO: understand better how centralization works (+5)
   love.graphics.print(self.text.content, self.text.font, self.x + (self.width - text_width) / 2, self.y + (self.height - text_height) / 2 + 5)
end
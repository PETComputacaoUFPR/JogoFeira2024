--[[
    Defines the Calculating screen
    in this screen, a "completion bar" is drawn. Once it ends, goes to Result screen
]]

local colors = require("colors")
require "ProgressBar"

CalculatingScreen = Class{}

function CalculatingScreen:init(window_width, window_height)
    self.window_width = window_width
    self.window_height = window_height

    -- EDITABLE PARAMETERS
    self.bar = ProgressBar(
        0.15 * window_width,
        0.1 * window_height,
        0.7 * window_width,
        0.04 * window_height,
        colors.off_white,
        colors.pink
    )

    self.texts = {
        {time = 3, content = "Lendo sua mente..."},
        {time = 3, content = "Entendendo sua personalidade..."},
        {time = 4, content = "Comparando com nosso banco de dados..."}
    }

    self.text = {

        font = love.graphics.newFont("fonts/Press_Start_2P/PressStart2P-Regular.ttf", 0.03 * window_height),
        y = self.bar.y + self.bar.height + 0.05 * window_height,
        color = colors.off_white
    }

    -- TO-DO: change for images in final version
    self.image = {
        y = 0.4 * window_height,
        width = 0.2 * window_width,
        height = 0.42 * window_height,
        frequency = 0.5
    }
    self.image.color = {
        red = math.random(), 
        green = math.random(), 
        blue = math.random(), 
        alpha = 1
    }


    -- NON EDITABLE PARAMETERS 
    self.time = 0
    self.text_pos = 1

    -- changing times to be accumulative (harder to understand, but easier to implement next calculations)
    for i=2, #(self.texts) do
        self.texts[i].time = self.texts[i].time + self.texts[i-1].time
    end 
    self.bar:set_velocity(self.texts[#(self.texts)].time)

    self.image.time_left = self.image.frequency
end


function CalculatingScreen:update(dt)
    if self.bar:is_complete() then
        return
    end

    self.time = self.time + dt

    -- text
    if self.time > self.texts[self.text_pos].time and self.text_pos < #(self.texts) then
        self.text_pos = self.text_pos + 1
    end

    -- color of image
    self.image.time_left = self.image.time_left - dt
    if self.image.time_left <= 0 then
        self.image.color = {
            red = math.random(), 
            green = math.random(), 
            blue = math.random(), 
            alpha = 1
        }
        self.image.time_left = self.image.frequency
    end

    self.bar:update(dt)
end

-- returns is progress bar is complete
function CalculatingScreen:isDone()
    return self.bar:is_complete()
end

function CalculatingScreen:draw()
    if self.bar.isComplete then
        return
    end

    -- progress bar
    self.bar:draw()

    -- image
    colors:setColor(self.image.color)
    love.graphics.rectangle("fill", (self.window_width - self.image.width) / 2, self.image.y, self.image.width, self.image.height)

    -- text
    colors:setColor(self.text.color)
    text_x = (self.window_width - self.text.font:getWidth(self.texts[self.text_pos].content)) / 2
    love.graphics.print(self.texts[self.text_pos].content, self.text.font, text_x, self.text.y)
end

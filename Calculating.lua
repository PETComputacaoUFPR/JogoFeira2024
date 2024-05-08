--[[
    Defines the Calculating screen
    in this screen, a "completion bar" is drawn. Once it ends, goes to Result screen
]]

local colors = require("colors")
require "ProgressBar"
require "ImageObj"

CalculatingScreen = Class{}

function CalculatingScreen:init(window_width, window_height, options)
    self.window_width = window_width
    self.window_height = window_height
    self.options = options

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

    -- temporary data to create images
    -- assumes image is drawn in middle of screen in the horizontal axis
    image_data = {
        y = 0.4 * window_height,
        width = 0.2 * window_width,
        height = 0.42 * window_height,
        frequency = 0.5
    }



    -- NON EDITABLE PARAMETERS 
    self.time = 0
    self.text_pos = 1

    -- changing times to be accumulative (harder to understand, but easier to implement next calculations)
    for i=2, #(self.texts) do
        self.texts[i].time = self.texts[i].time + self.texts[i-1].time
    end 
    self.bar:set_velocity(self.texts[#(self.texts)].time)

    self.image_data  = {
        frequency = image_data.frequency,
        time_left = image_data.frequency,
        pos = math.random(#(self.options))
    }
    -- loading all images files (calling newImage function is slow, so it's more time efficient this way)
    self.images = {}
    for i=1, #(self.options) do
        self.images[i] = ImageObj(
            self.options[i].path,
            (window_width - image_data.width) / 2,
            image_data.y,
            image_data.width,
            image_data.height
        )
    end
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

    -- image
    self.image_data.time_left = self.image_data.time_left - dt
    if self.image_data.time_left <= 0 then
        self.image_data.pos = math.random(#(self.options))
        self.image_data.time_left = self.image_data.frequency
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
    self.images[self.image_data.pos]:draw()

    -- text
    colors:setColor(self.text.color)
    text_x = (self.window_width - self.text.font:getWidth(self.texts[self.text_pos].content)) / 2
    love.graphics.print(self.texts[self.text_pos].content, self.text.font, text_x, self.text.y)
end

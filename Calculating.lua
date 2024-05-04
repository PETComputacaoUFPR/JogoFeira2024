--[[
    Defines the Calculating screen
    in this screen, a "completion bar" is drawn. Once it ends, goes to Result screen
]]

local colors = require("colors")
local options = require("options")

CalculatingScreen = Class{}

function CalculatingScreen:init(window_width, window_height)
    self.window_width = window_width
    self.window_height = window_height

    self.bar = {
        x = 0.15 * window_width,
        y = 0.1 * window_height,
        width = 0.7 * window_width,
        height = 0.04 * window_height,
        color_full = colors.off_white,
        color_progress = colors.pink
    }

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

    self.imageProperties = {
        y = 0.4 * window_height,
        width = 0.2 * window_width,
        height = 0.42 * window_height,
        frequency = 0.5
    }

    self.image = options

    self.time = 0
    self.text_pos = 1
    self.bar.progress_width = 0
    self.bar.isComplete = false

    -- calculating total time
    self.time_left = 0
    for k, v in pairs(self.texts) do
        self.time_left = self.time_left + v.time
    end
    self.bar.dx = self.bar.width / self.time_left

    -- self.image.color = {
    --     red = math.random(), 
    --     green = math.random(), 
    --     blue = math.random(), 
    --     alpha = 1
    -- }

    for key, option in pairs(self.image) do
        option.time_left = option.frequency
    end
end


function CalculatingScreen:update(dt)
--     if self.bar.isComplete then
--         return
--     end

--     self.time = self.time + dt
--     self.time_left = self.time_left - dt

--     -- text
--     if self.time > self.texts[self.text_pos].time then
--         self.text_pos = self.text_pos + 1
--         self.time = 0
--     end

--     -- color of image
--     self.image.time_left = self.image.time_left - dt
--     if self.image.time_left <= 0 then
--         self.image.color = {
--             red = math.random(), 
--             green = math.random(), 
--             blue = math.random(), 
--             alpha = 1
--         }
--         self.image.time_left = self.image.frequency
--     end

    -- progress bar
    self.bar.progress_width = self.bar.progress_width + self.bar.dx * dt
    if self.time_left < 0 then
        self.bar.progress_width = self.bar.width
        self.bar.isComplete = true
    end
end

-- -- returns is progress bar is complete
function CalculatingScreen:isDone()
    return self.bar.isComplete
end

function CalculatingScreen:draw()
    if self.bar.isComplete then
        return
    end

    -- full bar
    colors:setColor(self.bar.color_full)
    love.graphics.rectangle("fill", self.bar.x, self.bar.y, self.bar.width, self.bar.height)

    -- progress bar
    colors:setColor(self.bar.color_progress)
    love.graphics.rectangle("fill", self.bar.x, self.bar.y, self.bar.progress_width, self.bar.height)

    -- image
    --colors:setColor(self.image.color)
    --love.graphics.rectangle("fill", (self.window_width - self.image.width) / 2, self.image.y, self.image.width, self.image.height)

    for key, option in pairs(self.image) do
        if key == "total_text" then
            colors:setColor(self.text.color)
            love.graphics.newImage(option.image):draw((self.window_width - self.imageProperties.width) / 2, self.imageProperties.y, 0, self.imageProperties.width / option.width, self.imageProperties.height / option.height)
        end
    end

    -- text
    colors:setColor(self.text.color)
    text_x = (self.window_width - self.text.font:getWidth(self.texts[self.text_pos].content)) / 2
    love.graphics.print(self.texts[self.text_pos].content, self.text.font, text_x, self.text.y)
end

--[[
    Defines the Result screen of the game
    this screen shows the selected option, and allows to go back to initial screen
]]

local colors = require("colors")
require "Button"

ResultScreen = Class{}

-- takes the option selected (see "options.lua" for more)
function ResultScreen:init(window_width, window_height, option)
    self.window_width = window_width
    self.window_height = window_height

    -- EDITABLE PARAMETERS (all of them)
    -- title (showing result)
    self.title = {
        content = "Você é ... " .. option.name .. "!",
        font = love.graphics.newFont("fonts/Press_Start_2P/PressStart2P-Regular.ttf", 0.04 * window_height),
        total_space = 0.2 * window_height,
        color = colors.off_white
    }

    -- description data
    self.description = {
        content = option.total_text,
        font = love.graphics.newFont("fonts/Montserrat/static/Montserrat-Medium.ttf", 0.03 * window_height),
        color = colors.off_white,
        x = window_width - 0.5 * window_width,
        y = 0.3 * window_height
    }

    -- image data (just a blank rectangle for now)
    self.image = {
        width = 0.2 * window_width,
        height = 0.42 * window_height,
        color = {
            red = 255 / 255,
            green = 255 / 255,
            blue = 255 / 255,
            alpha = 1 / 1
        },
        x = 0.25 * window_width,
        y = 0.3 * window_height
    }

    -- button data
    self.back_button = Button(
        window_width - 0.17 * window_width,
        window_height - 0.14 * window_height,
        0.12 * window_width,
        0.1 * window_height,
        colors.off_white,
        {
            content = "BACK",
            font = love.graphics.newFont("fonts/Press_Start_2P/PressStart2P-Regular.ttf", 0.03 * window_height),
            color = colors.purple
        }
    )
end

-- checks if back button was clicked
function ResultScreen:back(x, y)
    return self.back_button:clicked(x, y)
end

-- draws the screen
function ResultScreen:draw()
    -- image
    colors:setColor(self.title.color)
    title_width = self.title.font:getWidth(self.title.content)
    title_height = self.title.font:getHeight(self.title.content)
    title_y_margin = (self.title.total_space - title_height) / 2
    love.graphics.print(self.title.content, self.title.font, (self.window_width - title_width) / 2, title_y_margin)

    -- image (TO-DO: just a blank rectangle for now)
    colors:setColor(self.image.color)
    love.graphics.rectangle("fill", self.image.x, self.image.y, self.image.width, self.image.height)

    -- description
    colors:setColor(self.description.color)
    love.graphics.print(self.description.content, self.description.font, self.description.x, self.description.y)

    -- back button
    self.back_button:draw()
end

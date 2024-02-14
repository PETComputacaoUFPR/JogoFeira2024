--[[
    Defines the Initial screen of the game
    this screen contains the START_BUTTON to start the game
]]



InitialScreen = Class{}

function InitialScreen:init(window_width, window_height)
    self.window_width = window_width
    self.window_height = window_height

    -- title that shows in initial screen
    self.title = {
        content = "Jogo da Feira",
        font = love.graphics.newFont("fonts/Minecraft.ttf", 0.12 * window_height),
        color = {
            red = 255 / 255,
            green = 255 / 255,
            blue = 255 / 255,
            alpha = 1 / 1
        },
        margin = 50
    }

    -- button to start game
    self.start_button = {
        margin = 0.8 * window_height,
        width = window_width / 4,
        height = window_height / 7,
        color = {
            red = 0 / 255,
            green = 0 / 255,
            blue = 255 / 255,
            alpha = 1 / 1
        },
        text = {
            content = "START",
            font = love.graphics.newFont("fonts/Minecraft.ttf", 0.07 * window_height),
            color = {
                red = 255 / 255,
                green = 255 / 255,
                blue = 255 / 255,
                alpha = 1 / 1
            }
        }
    }

    -- images that shown on initial screen (for now, just blank squares)
    self.images = {
        margin_x = 0.075 * window_width,
        margin_y = 0.3 * window_height,
        margin_between = 0.20 * window_width,
        width = 0.15 * window_width,
        height = 0.15 * window_width,
        color = {
            red = 255 / 255,
            green = 255 / 255,
            blue = 255 / 255,
            alpha = 1 / 1
        }
    }
end

-- checks if start button was clicked
function InitialScreen:start(x, y)
    return ((x >= (self.window_width - self.start_button.width) / 2 and x <= (self.window_width + self.start_button.width) / 2) and 
        (y >= self.start_button.margin and y <= (self.start_button.margin + self.start_button.height)))
end


-- draws the screen
function InitialScreen:draw()
    -- title
    setColor(self.title.color)
    size_title = self.title.font:getWidth(self.title.content)
    love.graphics.print(self.title.content, self.title.font, (self.window_width - size_title) / 2, self.title.margin)

    -- START_BUTTON "iniciar"
    setColor(self.start_button.color)
    love.graphics.rectangle("fill", (self.window_width - self.start_button.width) / 2, self.start_button.margin, self.start_button.width, self.start_button.height)
    setColor(self.start_button.text.color)
    start_button_text_width = self.start_button.text.font:getWidth(self.start_button.text.content)
    start_button_text_height = self.start_button.text.font:getHeight(self.start_button.text.content)
    -- TO-DO: understand better how centralization works (+5)
    love.graphics.print(self.start_button.text.content, self.start_button.text.font, (self.window_width - start_button_text_width) / 2, self.start_button.margin + (self.start_button.height - start_button_text_height) / 2 + 5)

    -- TO-DO: just drawing some rectangles for now
    setColor(self.images.color)
    love.graphics.rectangle("fill", self.images.margin_x, self.images.margin_y, self.images.width, self.images.height)
    love.graphics.rectangle("fill", (self.window_width - self.images.width) / 2, self.images.margin_y, self.images.width, self.images.height)
    love.graphics.rectangle("fill", self.window_width - self.images.margin_x - self.images.width, self.images.margin_y, self.images.width, self.images.height)
end

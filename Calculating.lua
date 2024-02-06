--[[
    Defines the Calculating screen
    in this screen, a "completion bar" is drawn. Once it ends, goes to Result screen
]]

CalculatingScreen = Class{}

function CalculatingScreen:init(window_width, window_height)
    self.window_width = window_width
    self.window_height = window_height

    self.bar = {
        x = 0.15 * window_width,
        y = 0.1 * window_height,
        width = 0.7 * window_width,
        height = 0.1 * window_height,
        total_time = 10, -- in seconds
        color_full = {
            red = 255 / 255,
            green = 255 / 255,
            blue = 255 / 255,
            alpha = 1 / 1
        },
        color_progress = {
            red = 0 / 255,
            green = 255 / 255,
            blue = 255/ 255,
            alpha = 1 / 1
        }
    }

    self.texts = {
        {time = 3, content = "Lendo sua mente..."},
        {time = 6, content = "Entendendo sua personalidade..."},
        {time = 10, content = "Comparando com nosso banco de dados..."}
    }

    self.text = {
        font = love.graphics.newFont("fonts/Minecraft.ttf", 0.04 * window_height),
        y = self.bar.y + self.bar.height + 0.05 * window_height,
        color = {
            red = 255 / 255,
            green = 255 / 255,
            blue = 255 / 255,
            alpha = 1 / 1
        }
    }

    self.image = {
        y = 0.4 * window_height,
        width = 0.3 * window_width,
        height = 0.3 * window_height,
        frequency = 0.5
    }

    self.time = 0
    self.text_pos = 1
    self.bar.progress_width = 0
    self.bar.isComplete = false

    self.image.color = {
        red = math.random(), 
        green = math.random(), 
        blue = math.random(), 
        alpha = 1
    }
    self.image.time_left = self.image.frequency
end


function CalculatingScreen:update(dt)
    self.time = self.time + dt
    if self.bar.isComplete then
        return
    end

    -- text
    if self.time > self.texts[self.text_pos].time then
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

    -- progress bar
    self.bar.progress_width = self.bar.progress_width + (self.bar.width / self.bar.total_time) * dt
    if self.time > self.bar.total_time then
        self.bar.progress_width = self.bar.width
        self.bar.isComplete = true
    end
end

-- returns is progress bar is complete
function CalculatingScreen:isDone()
    return self.bar.isComplete
end

function CalculatingScreen:draw()
    if self.bar.isComplete then
        return
    end

    -- full bar
    setColor(self.bar.color_full)
    love.graphics.rectangle("fill", self.bar.x, self.bar.y, self.bar.width, self.bar.height)

    -- progress bar
    setColor(self.bar.color_progress)
    love.graphics.rectangle("fill", self.bar.x, self.bar.y, self.bar.progress_width, self.bar.height)

    -- text
    setColor(self.text.color)
    text_x = (self.window_width - self.text.font:getWidth(self.texts[self.text_pos].content)) / 2
    love.graphics.print(self.texts[self.text_pos].content, self.text.font, text_x, self.text.y)

    -- image
    setColor(self.image.color)
    love.graphics.rectangle("fill", (self.window_width - self.image.width) / 2, self.image.y, self.image.width, self.image.height)
end

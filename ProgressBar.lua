--[[
    Defines the Progress Bar, used in the Calculating Screen
]]

local colors = require("colors")
ProgressBar = Class{}

-- creates progress bar object
-- (x, y): coordinates of top-left corner of bar
-- (width, height): dimensions of bar
-- color_background: color of background bar
-- color_progress: color of progress bar
-- total_time: total progress time
function ProgressBar:init(x, y, width, height, color_background, color_progress, total_time)
   self.x = x
   self.y = y
   self.width = width
   self.height = height
   self.color_background = color_background
   self.color_progress = color_progress

   self.progress_width = 0
   self.complete = false

   -- if total_time is not defined, set it later in ProgressBar:set_time
   if not total_time then
      self.velocity = 0
   else
      self.velocity = width / total_time
   end
end

-- sets velocity of progress bar based in total_time
function ProgressBar:set_velocity(total_time)
   self.velocity = self.width / total_time
end

-- updates progres bar (moves progress bar by dt units of time)
function ProgressBar:update(dt)
   if self.complete then
      return
   end
   self.progress_width = self.progress_width + self.velocity * dt
   self.complete = (self.progress_width >= self.width)  -- progress is complete if both bars have same size
end

-- returns true if bar is complete; false otherwise
function ProgressBar:is_complete()
   return self.complete
end

-- draws bar on screen
function ProgressBar:draw()
   -- background bar
   colors:setColor(self.color_background)
   love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)

   -- progress bar
   colors:setColor(self.color_progress)
   love.graphics.rectangle("fill", self.x, self.y, self.progress_width, self.height)
end




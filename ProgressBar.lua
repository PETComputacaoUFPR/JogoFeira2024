--[[
    Defines the Progress Bar, used in the Calculating Screen
]]

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
   self.time_left = total_time
   -- how much the bar should move per unit of second
   self.velocity = width / total_time
   self.complete = false
end

-- updates progres bar (moves progress bar by dt units of time)
function ProgressBar:update(dt)
   if self.complete then
      return
   end
   self.time_left = self.time_left - dt
   if self.time_left <= 0 then
      self.complete = true
      self.progress_width = self.width
   end
   else
      self.progress_width = self.progress_width + self.velocity * dt
   end
return

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
   love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end




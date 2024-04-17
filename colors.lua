-- alias for the colors in the project

local colors = {}
local rgba = function(color) return color[1], color[2], color[3], color[4] end

colors.indigo = { 45/255, 26/255, 82/255, 255}
colors.purple = { 79/255, 23/255, 86/255, 255}
colors.light_purple = { 97/255, 21/255, 89/255, 255}
colors.pink = { 152/255, 16/255, 98/255, 255}
colors.off_white = { 250/255, 249/255, 246/255, 255}
colors.light_blue = { 149/255, 222/255, 255/255, 255}
colors.blue = { 24/255, 171/255, 237/255, 255}

colors.rgba = rgba

return colors

-- importing modules
push = require "push"
Class = require "class"

require "options"
require "Initial"
require "Result"
require "Calculating"

-- importing colors
local colors = require "colors"
local mesh = require "mesh"

-- seed for random
math.randomseed(os.time())

-- begins application
function love.load()
    -- window dimensions
    love.window.setMode(0, 0)
    WINDOW_WIDTH = love.graphics.getWidth() 
    WINDOW_HEIGHT = love.graphics.getHeight() 
    print(WINDOW_WIDTH, WINDOW_HEIGHT)
    love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = true,
        resizable = false,
        vsync = true
    })

    -- title of game
    love.window.setTitle("FeirinhoLampada")

    -- mesh for background
    mesh_r = mesh:gradientMesh("vertical", 
            colors:returnColorObject(colors.indigo), 
            colors:returnColorObject(colors.light_purple),
            colors:returnColorObject(colors.pink)
    )

    -- loading screen (starts at initial screen)
    screen_status = "initial"
    screen = InitialScreen(WINDOW_WIDTH, WINDOW_HEIGHT)

end

-- defines logic for when something in the screen is clicked
function love.mousepressed(x, y, button, istouch, presses)
    -- not left click nor touchscreen
    if button ~= 1 then
        return
    end

    -- button "start" was clicked: initiate "calculation"
    if screen_status == "initial" and screen:start(x, y) then
        screen = CalculatingScreen(WINDOW_WIDTH, WINDOW_HEIGHT, OPTIONS)
        screen_status = "calculating"
    -- button "back" was clicked: go back to initial screen
    elseif screen_status == "result" and screen:back(x, y) then
        screen = InitialScreen(WINDOW_WIDTH, WINDOW_HEIGHT)
        screen_status = "initial"
    end
end

-- defines logic for when some key is pressed
function love.keypressed(key, scancode, isrepeat)
    -- pressing ESC closes the game
    if key == "escape" then
        love.event.quit(0)
    end
end

-- updates between frames
-- dt represents time since last frame
function love.update(dt)
    if screen_status == "calculating" then
        if screen:isDone() then
            screen = ResultScreen(WINDOW_WIDTH, WINDOW_HEIGHT, OPTIONS[math.random(#(OPTIONS))])
            screen_status = "result"
        else
            screen:update(dt)
        end
    end
end

-- draws elements in screen
function love.draw()
    love.graphics.setColor(255,255,255)
    -- desenha o grandiente como background
    love.graphics.draw(mesh_r, -0.15*WINDOW_WIDTH, 0, -0.15, 1.3*WINDOW_WIDTH, 1.5*WINDOW_HEIGHT)

    -- screen elements
    screen:draw()
end

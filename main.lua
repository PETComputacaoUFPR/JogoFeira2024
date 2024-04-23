
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
    love.window.setTitle("JogoDaFeira")

    -- mesh for background
    mesh_r = mesh:gradientMesh("vertical", 
            colors:returnColorObject(colors.indigo), 
            colors:returnColorObject(colors.light_purple),
            colors:returnColorObject(colors.pink)
    )

    -- loading screens (starts at initial screen)
    screen_status = "initial"
    initial_screen = InitialScreen(WINDOW_WIDTH, WINDOW_HEIGHT)

end

function love.mousepressed(x, y, button, istouch, presses)
    if button == 1 then 
        if screen_status == "initial" and initial_screen:start(x, y) then
            calculating_screen = CalculatingScreen(WINDOW_WIDTH, WINDOW_HEIGHT)
            screen_status = "calculating"
        elseif screen_status == "result" and result_screen:back(x, y) then
            screen_status = "initial"
        end
    end
end

function love.keypressed(key, scancode, isrepeat)
    if key == "escape" then
        love.event.quit(0)
    end
end

function love.update(dt)
    if screen_status == "calculating" then
        if calculating_screen:isDone() then
            result_screen = ResultScreen(WINDOW_WIDTH, WINDOW_HEIGHT, OPTIONS[math.random(n_options)])
            screen_status = "result"
        else
            calculating_screen:update(dt)
        end
    end
end

function love.draw()
    -- background
    -- desenha o grandiente como background
    love.graphics.draw(mesh_r, -0.15*WINDOW_WIDTH, 0, -0.15, 1.15*WINDOW_WIDTH, 1.5*WINDOW_HEIGHT)

    -- screen elements
    if screen_status == "initial" then 
        initial_screen:draw()
    elseif screen_status == "calculating" then
        calculating_screen:draw()
    elseif screen_status == "result" then
        result_screen:draw()
    end
end

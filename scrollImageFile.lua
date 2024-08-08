-- scrollImageFile
-- For showing how using
-- PNG *file* works.
-- Scrolls image so that
-- it is display multiple 
-- times.

local png_filename = "/home/we/dust/code/nornsFun/images/image_ML309503171.png"
local current_count = 0

function tick(count)
  current_count = count
  redraw()
end

function init()
  intro_counter = metro.init(tick, 0.1, 180)
  intro_counter:start()
end

function redraw()
  screen.clear()

  x = -60 + current_count
  y = 0
  -- print("Drawing x="..x.." y="..y)
  
  -- Display the png file
  screen.display_png(png_filename, x, y)
  
  screen.update()
end


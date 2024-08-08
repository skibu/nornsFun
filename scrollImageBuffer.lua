-- scrollImageBuffer
-- For showing how using
-- PNG *buffer* doesn't work.
-- Scrolls image so that
-- it is displayed multiple 
-- times.

local png_filename = "/home/we/dust/code/test/images/image_ML309503171.png"
local current_count = 0

function tick(count)
  current_count = count
  redraw()
end

function init()
  -- Load the buffer just once
  png_buffer = screen.load_png (png_filename)
  
  intro_counter = metro.init(tick, 0.1, 180)
  intro_counter:start()
end

function redraw()
  screen.clear()

  -- These commands both work to wait until clear() is done so buffer successfully displayed
  --os.execute("sleep 0")
  --screen.current_point()

  -- Scroll the png from right to left
  x = -60 + current_count
  y = 0

  -- Display the png buffer
  screen.display_image(png_buffer, x, y)
  
  screen.update()
end


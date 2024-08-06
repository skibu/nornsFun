-- bestFont.lua
-- For testing what different 
-- font sizes and faces look like.
-- Adjust font size via encoder3 
-- and scroll through the display
-- using encoder4
-- Hit any key to see what happens 
-- when turn on anti-aliasing
--
-- Hit Key3 to start script...

function init()
  print("====== Initing... ======")
  
  font_size = 8
  font_idx_of_top_line = 1
  
  print("font_size="..font_size)
  print("font_idx_of_top_line="..font_idx_of_top_line)

  px_per_line = font_size + 1
  num_lines_at_once = math.floor(64 / px_per_line)
  print("px_per_line="..px_per_line.." num_lines_at_once="..num_lines_at_once)

  print("#screen.font_face_names="..#screen.font_face_names)
  
  anti_alias = 0
  print("anti_alias="..anti_alias)
end

function key(n, down)
  if anti_alias == 0 then
    anti_alias = 1
  else
    anti_alias = 0
  end
  print("anti_alias switched to "..anti_alias)
  redraw()
end


function enc(n, delta)
  if n == 3 then
    print("====== Changing font size... ======")

    -- Change font size. Limit to min of 4 and max of 64
    font_size = util.clamp(font_size + delta, 4, 64)
    print("font size now "..font_size)
    
    -- Determine num_lines_at_once and don't let it be zero
    px_per_line = font_size + 1
    num_lines_at_once = math.max(math.floor(64 / px_per_line), 1)
    
    -- Since num_lines_at_once changed need to update font_idx_of_top_line as well
    font_idx_of_top_line = util.clamp(font_idx_of_top_line, 1, #screen.font_face_names - num_lines_at_once + 1)
    
    print("px_per_line="..px_per_line.." num_lines_at_once="..num_lines_at_once..
      " font_idx_of_top_line="..font_idx_of_top_line)

    redraw()
  elseif n == 2 then
    print("====== Scrolling... ======")
    
    -- Scroll by changing position of font_idx_of_top_line
    font_idx_of_top_line = util.clamp(font_idx_of_top_line + delta, 1, #screen.font_face_names - num_lines_at_once + 1)
    print("font_idx_of_top_line now "..font_idx_of_top_line)
    redraw()
  end
end

function redraw()
  print("====== Drawing... ======")
  
  screen.clear()
  
  -- All lines drawn with current font size
  screen.font_size(font_size)  
  
  -- Set anti alias
  screen.aa(anti_alias)

  print("font_size="..font_size.." anti_alias="..anti_alias.." px_per_line="..px_per_line..
    " num_lines_at_once="..num_lines_at_once.." font_idx_of_top_line="..font_idx_of_top_line)

  -- For each font to be displayed...
  for font_idx = font_idx_of_top_line, font_idx_of_top_line + num_lines_at_once - 1 do
    global_font_idx = font_idx -- for debugging
    --print("Displaying font_idx="..font_idx.." font_idx_of_top_line="..font_idx_of_top_line)
    screen.font_face(font_idx)
    
    y_pos = px_per_line * (font_idx - font_idx_of_top_line + 1) -1
    -- print("setting y position to "..y_pos)
    screen.move(0, y_pos)
    
    font_text = "sz"..font_size.." \""..font_idx.." "..screen.font_face_names[font_idx]..
      "\" some MORE random text to make it long"
    print("Outputting text: "..font_text)
    screen.text(font_text)
  end
  
    
  screen.update()
end

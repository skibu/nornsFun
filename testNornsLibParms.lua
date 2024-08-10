include "nornsFun/includeNornsLib"
include_norns_lib("parameterExtensions")

local png_filename = "/home/we/dust/code/nornsFun/images/image_ML309503171.png"
  
function init()
  params:clear()
  some_groups = {
    "short", 
    "longer name", 
    "bit longer name",
    "and bit longer name",
    "now we are talking looong", 
    "now super duper long, truncates but works!"
  }
  
  params:add_separator("idSep1", "Option Parameter")
  params:add_option("group","Group:", some_groups, 1) 
end

function redraw()
  screen.clear()

  screen.display_png(png_filename, 0, 0)

  screen.update()
end
  
-- testLongOptionParam.lua

-- For showing that a parameter selector where the label and value are
-- too long is still handled correctly, and that the label and value
-- do not overlap in an ugly way.

function init()
  params:clear()
  some_groups = {
    "short", 
    "longer group", 
    "now we are talking looong", 
    "now super duper long, truncates but works!"
  }
  
  params:add_separator("idSep1", "Option Parameter")
  params:add_option("group","Group:", some_groups, 1) 
end



    
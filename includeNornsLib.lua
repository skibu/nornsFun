-- For including libs from nronsLib repo. Similar to include(), but downloads 
-- the libs if haven’t done so previously. 
-- @tparam name - just the name of the particulae lib to include. Don't need
-- directory nor the .lua suffix.
function include_norns_lib(name)
  -- Where to find the github repo
  local repo_owner = "skibu"
  local repo = "nornsLib"
  
  -- Try to include the lib
  if not pcall(function () result = include(repo.."/"..name) end) then
    -- lib doesnt exist so do a git clone of the norms/lib repo to get all the lib files
    command = "git clone https://github.com/"..repo_owner.."/"..repo..".git ".._path.code..repo
    os.execute(command)
    
    -- Now try including the lib again
    return include(repo.."/"..name)
  end 
end

-- Then can include lib files vie something like:
--include_norns_lib("tricksLib")

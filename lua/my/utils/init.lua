-- :fennel:1711519894
local export = {}
export["packadd!"] = function(package)
  return vim.cmd(("packadd " .. package))
end
export["map!"] = function(mode, key, run, opt)
  local mode0 = vim.split(mode, "")
  local opt0
  if ("string" == type(opt)) then
    opt0 = {desc = opt}
  else
    opt0 = opt
  end
  return vim.keymap.set(mode0, key, run, opt0)
end
export["cmd!"] = function(name, run, opt)
  local opt0
  if ("nil" == type(opt)) then
    opt0 = {}
  else
    if ("string" == type(opt)) then
      opt0 = {desc = opt}
    else
      opt0 = opt
    end
  end
  return vim.api.nvim_create_user_command(name, run, opt0)
end
export.z = function(query)
  local output = vim.system({"zoxide", "query", query}):wait()
  local path = vim.split(output.stdout, "\n")[1]
  if (0 == output.code) then
    vim.cmd.tcd(path)
    return vim.system({"zoxide", "add", path})
  else
    return nil
  end
end
return export
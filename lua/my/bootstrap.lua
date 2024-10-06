local export = {}

local ispath = vim.loop.fs_stat
local packdir = vim.fn.stdpath("config") .. "/pack/my/opt/"

local function clone(args)
  return vim.fn.system({
    "git", "clone",
    "--filter=blob:none",
    args.url,
    args.path
  })
end

function export.lazy(args)
  local name = "lazy.nvim"
  local path = vim.fn.stdpath("data")
	    .. "/lazy/" .. name 

  if not ispath(path) then
    print("["..name.."]: start installing")

    clone({
      url = "https://github.com/folke/lazy.nvim.git",
      path = path,
      branch = args.version or "stable"
    })

    print("["..name.."]: finished installing")
  end
  vim.opt.rtp:prepend(path)
end

function export.rocks()

  -- Install rocks.nvim first
  -- nvim -u NORC -c "source https://raw.githubusercontent.com/nvim-neorocks/rocks.nvim/master/installer.lua"
  local rocks_config = {
    --rocks_path = "C:\\Users\\Windows 10\\AppData\\Local\\nvim-data\\rocks",
    rocks_path = vim.fn.expand(vim.fn.stdpath("data") .. "/rocks"),
    luarocks_binary = "luarocks",
  }

  vim.g.rocks_nvim = rocks_config

  local luarocks_path = {
    vim.fs.joinpath(rocks_config.rocks_path, "share", "lua", "5.1", "?.lua"),
    vim.fs.joinpath(rocks_config.rocks_path, "share", "lua", "5.1", "?", "init.lua"),
  }
  package.path = package.path .. ";" .. table.concat(luarocks_path, ";")

  local libext = vim.fn.has("win32") == 1 and "?.dll" or "?.so"
  local luarocks_cpath = {
    vim.fs.joinpath(rocks_config.rocks_path, "lib", "lua", "5.1", libext),
    vim.fs.joinpath(rocks_config.rocks_path, "lib64", "lua", "5.1", libext),
  }
  package.cpath = package.cpath .. ";" .. table.concat(luarocks_cpath, ";")

  vim.opt.runtimepath:append(vim.fs.joinpath(rocks_config.rocks_path, "lib", "luarocks", "rocks-5.1", "*", "*"))
end

function export.nfnl()
  local path = packdir .. "nfnl"
  if not ispath(path) then
    print("[nfnl]: doesn't exist; start installing")
    clone({
      url = "https://github.com/Olical/nfnl",
      path = path
    })

    vim.fn.system({"git", "-C", path, "checkout", "v1.0.0"})
    print("[nfnl]: installed")
  end
  vim.cmd("helptags " .. path .. "/docs")
  vim.opt.rtp:prepend(path)
end

-- tangerine {version = "$version"}
function export.tangerine(args)
  args = args or {version = ""}
  local name = "tangerine.nvim"
  local path = packdir .. name

  if not ispath(path) then
    print("["..name.."]: start installing")

    clone({
      url = "https://github.com/udayvir-singh/tangerine.nvim",
      path = path,
    })
    vim.fn.system({"git", "-C", path, "checkout", args.version})

    print("["..name.."]: finished installing")
  end
  vim.opt.rtp:prepend(path)
end

return export

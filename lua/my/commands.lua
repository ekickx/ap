-- :fennel:1720451357
local _local_1_ = require("my.utils")
local cmd_21 = _local_1_["cmd!"]
local z = _local_1_["z"]
local function _2_(_241)
  return z(_241.args)
end
cmd_21("Z", _2_, {nargs = "*"})
local function _3_(_241)
  return vim.cmd.edit((vim.fn.stdpath("config") .. "/" .. _241.args))
end
return cmd_21("Config", _3_, {nargs = "*"})
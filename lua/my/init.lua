-- :fennel:1730007666
local function g_21(...)
  if (0 ~= (#{...} % 2)) then
    return nil, "Args is odd, it needs to be even"
  else
    for i = 1, (#{...} / 2) do
      vim.g[({...})[((i * 2) - 1)]] = ({...})[(i * 2)]
    end
    return nil
  end
end
g_21("loaded_tutor_mode_plugin", 1, "loaded_spec", 1)
require("my.settings")
require("my.keymaps")
require("my.commands")
local load = require("my.plugins")
load.apm()
load.devicons()
load.fundo()
load.leap()
load.sandwich()
load["smart-splits"]()
load.substitute()
load.telescope()
load.mini()
load.terminal()
return load.wilder()
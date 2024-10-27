-- :fennel:1729928318
local _local_1_ = require("my.utils")
local map_21 = _local_1_["map!"]
local packadd_21 = _local_1_["packadd!"]
local export = {}
local function setup(name, _3fconfig)
  local module = require(name)
  local config = (_3fconfig or {})
  return module.setup(config)
end
export.apm = function()
  packadd_21("vim-apm")
  local apm = require("vim-apm")
  apm:setup({})
  local function _2_()
    return apm:toggle_monitor()
  end
  return map_21("n", "<Leader>apm", _2_)
end
export.devicons = function()
  packadd_21("nvim-web-devicons")
  return setup("nvim-web-devicons")
end
export.emmet = function()
  vim.g["user_emmet_leader_key"] = ","
  return packadd_21("emmet-vim")
end
export.fundo = function()
  packadd_21("promise-async")
  packadd_21("nvim-fundo")
  return setup("fundo")
end
export.leap = function()
  packadd_21("leap.nvim")
  local leap = require("leap")
  return leap.create_default_mappings()
end
export.mini = function(modules)
  packadd_21("mini.nvim")
  setup("mini.pairs")
  return setup("mini.comment")
end
export.sandwich = function()
  return packadd_21("vim-sandwich")
end
export["smart-splits"] = function()
  packadd_21("smart-splits.nvim")
  local smart_splits = require("smart-splits")
  smart_splits.setup({})
  map_21("n", "<A-h>", smart_splits.resize_left)
  map_21("n", "<A-j>", smart_splits.resize_down)
  map_21("n", "<A-k>", smart_splits.resize_up)
  return map_21("n", "<A-l>", smart_splits.resize_right)
end
export.substitute = function()
  packadd_21("substitute.nvim")
  local s = require("substitute")
  s.setup()
  map_21("n", "x", s.operator, "Substitute")
  map_21("n", "xx", s.line, "Substitute")
  map_21("n", "X", s.eol, "Substitute")
  return map_21("x", "x", s.visual, "Substitute")
end
export.telescope = function()
  packadd_21("plenary.nvim")
  packadd_21("telescope.nvim")
  setup("telescope", {defaults = {prompt_prefix = " \239\145\171  ", sorting_strategy = "ascending", layout_config = {horizontal = {prompt_position = "top"}}}})
  map_21("n", "<Leader>ff", ":Telescope find_files<cr>", "Find files")
  map_21("n", "<Leader>fb", ":Telescope buffers<cr>", "Find buffers")
  map_21("n", "<Leader>fc", ":Telescope live_grep<cr>", "Find context")
  map_21("n", "<Leader>fh", ":Telescope help_tags<cr>", "Find help tags")
  return map_21("n", "<Leader>fk", ":Telescope keymaps<cr>", "Find keymaps")
end
export.toggleterm = function()
  packadd_21("toggleterm.nvim")
  return setup("toggleterm", {open_mapping = "<Leader>ot", insert_mappings = false})
end
export.terminal = function()
  packadd_21("nvim-terminal")
  setup("nvim-terminal")
  local term = require("nvim-terminal").DefaultTerminal
  local function _3_()
    return term:open()
  end
  return map_21("n", "<Leader>ot", _3_, "Open terminal")
end
export.wilder = function()
  packadd_21("wilder.nvim")
  setup("wilder", {modes = {":", "/", "?"}})
  local wilder = require("wilder")
  return wilder.set_option("renderer", wilder.popupmenu_renderer(wilder.popupmenu_palette_theme({border = "rounded", ["max_height:"] = "75%", min_height = 0, prompt_position = "top", reverse = 0, highlighter = wilder.basic_highlighter(), highlights = {accent = wilder.make_hl("WilderAccent", "Pmenu", {{a = 1}, {a = 1}, {foreground = "#f4468f"}}), left = {" ", wilder.popupmenu_devicons()}}})))
end
return export
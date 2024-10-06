local bootstrap = require "my.bootstrap"

do local success = pcall(vim.cmd, [[packadd oxocarbon.nvim]])
if success then
  vim.cmd("colorscheme oxocarbon")
end end

do local success, bootstrap = pcall(require, "my.bootstrap")
if success then
  bootstrap.tangerine("v2.8")
  require("tangerine").setup {
    compiler = {hooks = {"onsave", "oninit"}}
  }
  --bootstrap.rocks()
  require "my"
end end

vim.cmd [[packadd conjure]]
vim.cmd [[packadd fennel.vim]]

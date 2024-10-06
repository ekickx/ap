-- :fennel:1720451399
local function pwsh_3f()
  return (1 == vim.fn.executable("pwsh"))
end
local settings
local _1_
if pwsh_3f() then
  _1_ = "pwsh"
else
  _1_ = nil
end
local _3_
if pwsh_3f() then
  _3_ = ("-NoLogo -NoProfile -ExecutionPolicy " .. "RemoteSigned -Command ")
else
  _3_ = nil
end
settings = {autoindent = true, expandtab = true, shiftwidth = 2, tabstop = 2, smartindent = true, smarttab = true, termguicolors = true, colorcolumn = "80", cursorline = true, laststatus = 3, number = true, relativenumber = true, signcolumn = "auto", wrap = true, list = true, listchars = {eol = "\226\134\178", tab = "\194\187 "}, fillchars = {vert = "\226\148\130", eob = " ", fold = " "}, undofile = true, undodir = vim.fn.expand((vim.fn.stdpath("data") .. "/undodir")), ignorecase = true, smartcase = true, inccommand = "split", grepprg = "rg --vimgrep --smart-case", splitbelow = true, splitright = true, shell = _1_, shellcmdflag = _3_, hidden = true, lazyredraw = true, completeopt = {"menu", "menuone", "noselect", "noinsert"}, pumheight = 10, re = 0, timeoutlen = 400, updatetime = 100, showmode = false, swapfile = false}
for setting, value in pairs(settings) do
  vim.opt[setting] = value
end
return nil
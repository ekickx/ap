vim.cmd[[packadd nvim-lspconfig]]

local lsp_conf = require('lspconfig')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Show message when lsp start
local custom_on_init = function()
  print('LSP started!')
end

-- Bash
lsp_conf.bashls.setup{
  on_init = custom_on_init,
}

-- Go
lsp_conf.gopls.setup{
  on_attach = on_attach,
  on_init = custom_on_init,
  root_dir = function() return vim.loop.cwd() end,
}

-- Rust
lsp_conf.rust_analyzer.setup{
  on_attach = on_attach,
  on_init = custom_on_init,
  capabilities = capabilities,
}

-- Lua
-- By default, lua-language-server doesn't have a cmd set
-- You must change the abosolute path manually
local sumneko_root = vim.fn.expand('$HOME/Projects/lua-language-server')

lsp_conf.sumneko_lua.setup{
  on_attach = on_attach,
  on_init = custom_on_init,
  cmd = {
    sumneko_root .. "/bin/Linux/lua-language-server", "-E",
    sumneko_root .. "/main.lua"
  },
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
        path = vim.split(package.path, ";")
      },
      diagnostics = {
        enable = true,
        globals = {'vim', 'use', 'on_attach'}
      },
    },
  },
}

-- Enable diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = true,
    signs = true,
    update_in_insert = true,
  }
)

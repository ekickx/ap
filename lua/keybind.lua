setmap = vim.api.nvim_set_keymap

-- Set leader key
vim.g.mapleader = " "

-- Refresh config
setmap('n', '<F5>', ':luafile %<CR>', { noremap = true })
setmap('i', '<F5>', ':luafile %<CR>', { noremap = true })

-- Buffer keys

-- new buffer
setmap('n', '<leader>bN', ':enew<CR>', { noremap = true})
-- close/delete buffer
setmap('n', '<leader>bx', ':bd!<CR>', { noremap = true})

-- Switch buffer
-- previously visited buffer
setmap('n', '<leader>bb', ':b#<CR>', { noremap = true})
-- next buffer
setmap('n', '<leader>bn', ':bn<CR>', { noremap = true})
-- preivous buffer
setmap('n', '<leader>bp', ':bp<CR>', { noremap = true})

-- Window keys

-- enter resize mode
vim.g.winresizer_start_key = '<leader>wR'

-- Move between window
-- move up
setmap('n', '<C-K>', '<C-W><C-K>', { noremap = true})
setmap('n', '<leader>wk', '<C-W><C-K>', { noremap = true })
-- move down
setmap('n', '<C-J>', '<C-W><C-J>', { noremap = true})
setmap('n', '<leader>wj', '<C-W><C-J>', { noremap = true })
-- move left
setmap('n', '<C-H>', '<C-W><C-H>', { noremap = true})
setmap('n', '<leader>wh', '<C-W><C-H>', { noremap = true })
-- move right
setmap('n', '<C-L>', '<C-W><C-L>', { noremap = true})
setmap('n', '<leader>wl', '<C-W><C-L>', { noremap = true })

-- Split window
-- horizontal/below split
setmap('n', '<leader>ws', ':split<CR>', { noremap = true })
setmap('n', '<leader>s', ':split<CR>', { noremap = true })
-- vertical/right split
setmap('n', '<leader>wv', ':vsplit<CR>', { noremap = true })
setmap('n', '<leader>v', ':vsplit<CR>', { noremap = true })

-- swap window
setmap('n', '<leader>wS', ':call WindowSwap#EasyWindowSwap()<CR>', { noremap = true, silent = true})

-- close window
setmap('n', '<leader>wx' , ':close<CR>', { noremap = true })

-- Move line/s
setmap('n', '<A-j>', ':m .+1<CR>==', { noremap = true })
setmap('n', '<A-k>', ':m .-2<CR>==', { noremap = true })
setmap("v", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true })
setmap("v", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true })
setmap('i', '<A-j>', '<Esc>:m .+1<CR>==gi', { noremap = true })
setmap('i', '<A-k>', '<Esc>:m .-2<CR>==gi', { noremap = true })

-- Yank/copy to clipboard
setmap('n', '<Leader>y', '"+y', { noremap = true })
-- Paste from clipboard
setmap('n', '<Leader>p', '"+p', { noremap = true })

-- Commentary
setmap("n", "'", ":Commentary<CR>", { noremap = true })
setmap("v", "'", ":Commentary<CR>", { noremap = true })

-- Suda
setmap("c", "w!!", ":w suda://% <CR>", { noremap = false })

-- Colorizer
setmap('n', '<Leader>qc', ':ColorToggle<CR>', { noremap = true})
-- Nerdtree
setmap('n', '<Leader>qn', ':NERDTreeToggle<CR>', { noremap = true})
-- Undotree
setmap('n', '<Leader>qu', ':UndotreeToggle<CR>', { noremap = true})

-- File manager - nnn
setmap('n', '<leader>f', ':NnnPicker %:p:h<CR>', { noremap = true})

-- Float terminal
-- escape terminal
setmap('t', "<Leader>te", "<C-\\><C-n>", { noremap = true })
-- new term
setmap('n', '<Leader>tN', ':FloatermNew<CR>', { noremap = true })
setmap('t', "<Leader>tN", "<C-\\><C-n>:FloatermNew<CR>", { noremap = true })
-- toggle term
setmap('n', '<Leader>tt', ':FloatermToggle<CR>', { noremap = true })
setmap('t', "<Leader>tt", "<C-\\><C-n>:FloatermToggle<CR>", { noremap = true })
-- next term
setmap('n', '<Leader>tn', ':FloatermNext<CR>', { noremap = true })
setmap('t', "<Leader>tn", "<C-\\><C-n>:FloatermNext<CR>", { noremap = true })
-- prev term
setmap('n', '<Leader>tp', ':FloatermPrev<CR>', { noremap = true })
setmap('t', "<Leader>tp", "<C-\\><C-n>:FloatermPrev<CR>", { noremap = true })
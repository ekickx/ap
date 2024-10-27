-- :fennel:1728214636
local bufnr = vim.api.nvim_create_buf(false, true)
print(bufnr)
local layar = {}
local function render_buf(lines_tbl)
  local lines = vim.fn.join(lines_tbl, "\n")
  return lines
end
do
  local buf_list = vim.api.nvim_list_bufs()
  local valid_bufs
  local function _1_(_241)
    return vim.api.nvim_get_option_value("buflisted", {buf = _241})
  end
  valid_bufs = vim.tbl_filter(_1_, buf_list)
  local lines
  local function _2_(_241)
    local name = vim.api.nvim_buf_get_name(_241)
    return vim.fn.fnamemodify(name, ":t")
  end
  lines = vim.tbl_map(_2_, valid_bufs)
  layar.bufs = valid_bufs
  vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, lines)
end
layar.pick_buf = function(buf)
  return vim.cmd.buffer(layar.bufs[buf])
end
local function _3_()
  local curpos = vim.fn.getcurpos()
  local pos = curpos[2]
  return layar.pick_buf(pos)
end
vim.keymap.set("n", "<CR>", _3_, {buffer = bufnr})
vim.g.layar = layar
return nil
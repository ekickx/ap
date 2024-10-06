(macro api! [api ...]
  "(api! get_option_value :buflisted {:buf bufnr})
  will produce this lua code:
  vim.api.nvim_get_option_value('buflisted', {buf = bufnr})"
  (let [apifn (.. :vim.api.nvim_ (. api 1))]
    (list (sym apifn) ...)))

(local bufnr (api! create_buf false true))
(print bufnr)
(local layar {})

(fn render-buf [lines-tbl]
  (let [lines (vim.fn.join lines-tbl "\n")]
    lines))

; APPEARANCES
(let [buf-list   (api! list_bufs)
      valid-bufs (vim.tbl_filter
                   #(api! get_option_value :buflisted {:buf $1})
                   buf-list)
      lines      (vim.tbl_map
                   #(let [name (api! buf_get_name $1)]
                      (vim.fn.fnamemodify name ::t))
                   valid-bufs)]
  (set layar.bufs valid-bufs)
  (api! buf_set_lines bufnr 0 -1 false lines))

; FUNCTION
(fn layar.pick_buf [buf]
  (vim.cmd.buffer (. layar.bufs buf)))

(vim.keymap.set :n :<CR>
                #(let [curpos (vim.fn.getcurpos)
                       pos    (. curpos 2)]
                   (layar.pick_buf pos))
                {:buffer bufnr})

(set vim.g.layar layar)

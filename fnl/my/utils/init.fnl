(local export {})

(macro api! [api ...]
  "(api! get_option_value :buflisted {:buf bufnr})
  will produce this lua code:
  vim.api.nvim_get_option_value('buflisted', {buf = bufnr})"
  (let [apifn (.. :vim.api.nvim_ (. api 1))]
    (list (sym apifn) ...)))

(fn export.packadd! [package]
  (vim.cmd (.. "packadd " package)))

(fn export.map! [mode key run opt]
  "
  `(map! :mode :key :run :desc)`
  or
  `(map! :mode :key :run opt)`

  Example:
  `(map! :nv :<leader>k ::q :quit)`
  "
  (let [mode (vim.split mode "")
        opt (if (= :string (type opt)) {:desc opt} opt)]
    (vim.keymap.set mode key run opt)))

(fn export.cmd! [name run opt]
  "
  `(cmd! :name run)`
  or
  `(cmd! :name run :desc)`
  or
  `(cmd! :name run opt)`
  "
  (let [opt (if (= :nil (type opt)) {}
              (if (= :string (type opt)) {:desc opt} opt))]
    (api! create_user_command name run opt)))

(fn export.z [query]
  (let [output  (: (vim.system [:zoxide :query query]) :wait)
        path    (. (vim.split output.stdout "\n") 1)]
    (if (= 0 output.code)
      (do
      (vim.cmd.tcd path)
      (vim.system [:zoxide :add path])))))

export

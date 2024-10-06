(local {: map!
        : packadd!} (require :my.utils))
(local export {})

(fn setup [name ?config]
  (let [module (require name)
        config (or ?config {})]
    (module.setup config)))

(fn export.apm []
  (packadd! :vim-apm)
    (let [apm (require :vim-apm)]
    (apm:setup {})
    (map! :n :<Leader>apm #(apm:toggle_monitor))))

(fn export.devicons []
  (packadd! :nvim-web-devicons)
  (setup :nvim-web-devicons))

(fn export.fundo []
  (packadd! :promise-async)
  (packadd! :nvim-fundo)
  (setup :fundo))

(fn export.leap []
  (packadd! :leap.nvim)
  (let [leap (require :leap)]
    (leap.create_default_mappings)))

(fn export.mini [modules]
  (packadd! :mini.nvim)
  (setup :mini.pairs))
  ;(setup :mini.surround))

(fn export.sandwich []
  (packadd! :vim-sandwich))

(fn export.telescope []
  (packadd! :plenary.nvim)
  (packadd! :telescope.nvim)
  (setup :telescope
         {:defaults {:prompt_prefix "   "
                     :sorting_strategy :ascending
                     :layout_config
                     {:horizontal
                      {:prompt_position :top}}}})
  (map! :n :<Leader>ff ":Telescope find_files<cr>"
        "Find files")
  (map! :n :<Leader>fb ":Telescope buffers<cr>"
        "Find buffers")
  (map! :n :<Leader>fc ":Telescope live_grep<cr>"
        "Find context")
  (map! :n :<Leader>fh ":Telescope help_tags<cr>"
        "Find help tags")
  (map! :n :<Leader>fk ":Telescope keymaps<cr>"
        "Find keymaps"))

(fn export.toggleterm []
  (packadd! :toggleterm.nvim)
  (setup :toggleterm
         {:open_mapping :<Leader>ot
          :insert_mappings false}))

(fn export.terminal []
  (packadd! :nvim-terminal)
  (setup :nvim-terminal)

  (let [term (. (require :nvim-terminal) :DefaultTerminal)]
    (map! :n :<Leader>ot #(term:open)
          "Open terminal")))

(fn export.wilder []
  (packadd! :wilder.nvim)
  (setup :wilder {:modes [:: :/ :?]})
  (let [wilder (require :wilder)]
    (wilder.set_option
      :renderer
      (wilder.popupmenu_renderer
        ; Command Palette theme
        (wilder.popupmenu_palette_theme
          {:border :rounded
           :max_height: :75%
           :min_height 0
           :prompt_position :top
           :reverse 0
           :highlighter (wilder.basic_highlighter)
           :highlights {:accent (wilder.make_hl
                                  :WilderAccent
                                  :Pmenu
                                  [{:a 1} {:a 1} {:foreground :#f4468f}])
                        :left [" " (wilder.popupmenu_devicons)]}})
        ; Helm theme
        ;(wilder.popupmenu_border_theme
        ;  {:border :rounded
        ;   :min_width :100%
        ;   :min_height :50%
        ;   :reverse 0
        ;   :highlighter (wilder.basic_highlighter)
        ;   :highlights {:accent (wilder.make_hl
        ;                          :WilderAccent
        ;                          :Pmenu
        ;                          [{:a 1} {:a 1} {:foreground :#f4468f}])
        ;                :left [" " (wilder.popupmenu_devicons)]}})
        ))))
export

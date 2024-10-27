(fn pwsh? []
  (= 1 (vim.fn.executable :pwsh)))

(let [settings
       {:autoindent   true
        :expandtab    true
        :shiftwidth   2
        :tabstop      2
        :smartindent  true
        :smarttab     true
        ; appearance
        :termguicolors  true
        :colorcolumn    :80
        :cursorline     true
        :cmdheight      0     ; hide cmd when not used
        :showmode       false
        :laststatus     3
        :number         true
        :relativenumber true
        :signcolumn     :auto ;gutter thing
        :wrap           true
        :list           true
        :listchars      {:eol "↲" :tab "» "}
        :fillchars      {:vert "│" :eob " " :fold " "}
        ; shada-related
        :swapfile false
        :undofile true
        :undodir  (vim.fn.expand
                    (.. (vim.fn.stdpath :data) :/undodir))
        ; search/substitute
        :ignorecase   true
        :smartcase    true
        :inccommand   :split
        :grepprg      "rg --vimgrep --smart-case"
        ; window
        :splitbelow   true
        :splitright   true
        ; shell (especially on windows)
        ; :h shell-powershell
        :shell        (if (pwsh?) :pwsh)
        :shellcmdflag (if (pwsh?)
                        (.. "-NoLogo -NoProfile -ExecutionPolicy "
                            "RemoteSigned -Command "))
        :shellquote   ""
        :shellxquote  ""
        :shellpipe    "2>&1 | tee '%s'"
        :shellredir   ">'%s' 2>&1"
        ; Other
        :hidden       true
        :lazyredraw   true
        :completeopt  [:menu :menuone :noselect :noinsert]
        :pumheight    10
        :re           0
        :timeoutlen   400
        :updatetime   100}]

  (each [setting value (pairs settings)]
    (tset vim.opt setting value)))

(set vim.g.mapleader " ")
(set vim.g.maplocalleader " ")

(local {: map!} (require "my.utils"))

;------------
;  Buffer
;------------
(map! :n :<Leader>bn ::bn<cr>
      "Next buffer")
(map! :n :<Leader>bp ::bp<cr>
      "Previous buffer")
(map! :n :<Leader>bb ::b#<cr>
      "Last visited buffer")
(map! :n :<Leader>bx ::bd!<cr>
      "Close buffer")

;------------
;  Window
;------------
(map! :n :<Leader>s ::split<cr>
      "Horizontal split")
(map! :n :<Leader>v ::vsplit<cr>
      "Vertical split")
(map! :n :<Leader>wx ::close<cr>
      "Close window")

(map! :ni :<C-h> :<ESC><C-W>h "Move between windows")
(map! :ni :<C-j> :<ESC><C-W>j "Move between windows")
(map! :ni :<C-k> :<ESC><C-W>k "Move between windows")
(map! :ni :<C-l> :<ESC><C-W>l "Move between windows")
;(each [_ key (pairs (vim.split :hjkl ""))]
;  (let [keybind (string.format "<C-%s>" key)
;        run (.. :<ESC><C-W> keybind)]
;    (map! :ni keybind run "Move between windows")))

;------------
;  Move Line
;------------
(map! :ni :<A-k> "<cmd>m .-2<cr>"
      "Move line up")
(map! :v :<A-k> ":m '<-2<cr>gv"
      "Move line up")

(map! :ni :<A-j> "<cmd>m .+1<cr>"
      "Move line down")
(map! :v :<A-j> ":m '>+1<cr>gv"
      "Move line down")

;-----------
;  Indent
;-----------
; Persist visual mode when indenting
(map! :v :< :<gv "Visual Indent")
(map! :v :> :>gv "Visual Indent")

;-------------
;  Clipboard
;-------------
(map! :nv :<Leader>y "\"+yy<esc>"
      "Copy to system clipboard")
(map! :nv :<Leader>p "\"+p"
      "Paste from system clipboard")

;-------------
;  Search
;-------------
(map! :n :<Esc> :<cmd>noh<cr>
      {:desc "Clears search highlights"
       :silent true})

;------------------
;  File Operation
;------------------
(map! :ni :<C-s> :<cmd>w<cr>
      "Save file")

;-------------
;  Avoid RSI
;-------------
(map! :nv :<Leader><Leader> ::
      "Command-line mode")
(map! :nv :<Leader>f :/
      "Search mode")

;-------------
;  Terminal
;-------------
(map! :t :<Esc><Esc> :<C-\><C-n>
      "Escape terminal mode")

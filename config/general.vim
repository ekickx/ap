syntax on
syntax enable

set hlsearch

set ignorecase

set number
set relativenumber

""""""""""""""

if (has("termguicolors"))
  set termguicolors
endif

" Theme
set background=dark
colorscheme snazzy
""""""""""""

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif

set undodir=~/.local/share/nvim/undodir
set undofile
set undolevels=100
set undoreload=1000

set backupdir=~/.local/share/nvim/backup
set directory=~/.local/share/nvim/backup

set ruler		" show the cursor position all the time
set cursorline
set guicursor=

if has('mouse')
  set mouse=a
endif

if has("autocmd")

  augroup vimrcEx
    au!

    " For all text files set 'textwidth' to 78 characters.
    autocmd FileType text setlocal textwidth=108

    " Trim whitespace onsave
    " autocmd BufWritePre * %s/\s\+$//e

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    " Also don't do it when the mark is in the first line, that is the default
    " position when opening a file.
    autocmd BufReadPost *
          \ if line("'\"") > 1 && line("'\"") <= line("$") |
          \   exe "normal! g`\"" |
          \ endif

  augroup END

endif " has("autocmd")

" split stuff
set splitbelow
set splitright

" tab stuff
set tabstop=2
set softtabstop=2
set expandtab
set smarttab
set shiftwidth=2
set autoindent
set smartindent

set complete-=i

set nrformats-=octal

set ttimeout
set ttimeoutlen=100

" detect .md as markdown instead of modula-2
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Unix as standard file type
set ffs=unix,dos,mac

" Always utf8
set termencoding=utf-8
set encoding=utf-8
set fileencoding=utf-8

set so=0 " scroll lines above/below cursor
set sidescrolloff=5
set lazyredraw

set magic " for regular expressions

set fillchars=eob:\ 

if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

if has('path_extra')
  setglobal tags-=./tags tags^=./tags;
endif

set autoread

if &history < 1000
  set history=1000
endif
if &tabpagemax < 50
  set tabpagemax=50
endif
if !empty(&viminfo)
  set viminfo^=!
endif
set sessionoptions-=options

" buffer settings
set hid " buffer becomes hidden when abandoned
" auto change dir based on current file's buffer
autocmd BufEnter * silent! lcd %:p:h

" Use italic on comment
highlight Comment cterm=italic gui=italic

" stop highlighting of underscores in markdown files
autocmd BufNewFile,BufRead,BufEnter *.md,*.markdown :syntax match markdownIgnore "_"

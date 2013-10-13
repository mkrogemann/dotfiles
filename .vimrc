set nocompatible                " choose no compatibility with legacy vi
syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands
set ruler                       " show cursor position
filetype plugin indent on       " load file type plugins + indentation

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

"" No belling please
set noerrorbells
set visualbell
set t_vb=

"" Automatically change into current file's dir
"" Interesting option sometimes, not by default though...
"" set autochdir

"" Remove trailing whitespace
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif


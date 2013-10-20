set nocompatible                " choose no compatibility with legacy vi
syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands
set ruler                       " show cursor position
set showmatch                   " show matching parens, braces, brackets
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
set t_vb=                       " controls the 'how' of visual bell (the esc seq?).

"" Find a lot of options documented here:
"" http://vimdoc.sourceforge.net/htmldoc/options.html#options

"" Automatically change into current file's dir
"" Interesting option sometimes, not by default though...
"" set autochdir

"" Remove trailing whitespace
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

"" status line (endless possibilities)
"" http://got-ravings.blogspot.de/2008/08/vim-pr0n-making-statuslines-that-own.html
set laststatus=2
set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P

"" Popup Menu Colors
:highlight Pmenu ctermbg=238 ctermfg=blue
:highlight PmenuSel ctermbg=blue ctermfg=black
"" Bring up Menu even if only one entry, use longest match
:set completeopt=longest,menuone

"" Colors, eg Gary Bernhardt's scheme:
"" https://github.com/garybernhardt/dotfiles/blob/master/.vim/colors/grb256.vim

"":set t_Co=256                   " 256 colors
"":set background=dark
"":color grb256


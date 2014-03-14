set nocompatible                " choose no compatibility with legacy vi
syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands
set ruler                       " show cursor position
set showmatch                   " show matching parens, braces, brackets
filetype plugin indent on       " load file type plugins + indentation
set paste                       " activate 'paste' mode

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode
set nojoinspaces                " Insert only one space when joining lines that contain
                                " sentence-terminating punctuation like '.'
                                " -- thanks to gary bernhardt

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

"" Jump to file
set suffixesadd+=.rb
set path+=lib

"" Buffers
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

"" Keymap
map <F7> mzgg=G`z<CR>           " re-format / re-indent whole file

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
"" The one in current use: https://github.com/jonathanfilip/vim-lucius
""                         http://www.vim.org/scripts/script.php?script_id=2536
:color lucius
:LuciusBlack        " LuciusDark, LuciusLight, LuciusBlack, LuciusWhite, *HighContrast, *LowContrast

"" Highlight cursor position
:hi CursorLine   cterm=NONE ctermbg=darkgrey ctermfg=white guibg=darkred guifg=white
:hi CursorColumn cterm=NONE ctermbg=darkgrey ctermfg=white guibg=darkred guifg=white
:nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>
:set cursorline
:set cursorcolumn


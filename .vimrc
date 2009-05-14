set tabstop=4
set expandtab
set shiftwidth=4
set autoindent
set backspace=2

set number
set laststatus=2
"文字コードと改行コードをステータスラインに表示する
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
set cmdheight=2
set showcmd
set title

colorscheme desert
set encoding=utf-8
set fileencodings=utf-8,euc-jp,iso-2022-jp,sjis
autocmd! BufRead,BufNewFile *.thtml set filetype=php

"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplModSelTarget = 1

set mouse=a
set ttymouse=xterm2

syntax on

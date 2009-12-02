" vim:set foldmethod=marker:set commentstring=\"%s
"{{{
set tabstop=4
set expandtab
set shiftwidth=4
set autoindent
set backspace=2
set number
set laststatus=2
"}}}
"文字コードと改行コードをステータスラインに表示する "{{{
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
set cmdheight=2
set showcmd
set title
"}}}

colorscheme koehler
set encoding=utf-8
set fileencodings=utf-8,euc-jp,iso-2022-jp,sjis
autocmd! BufRead,BufNewFile *.thtml set filetype=php

let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType ruby setlocal tabstop=2 softtabstop=2 shiftwidth=2

" python setting
autocmd BufRead,BufNewFile *.py syntax on
autocmd BufRead,BufNewFile *.py set ai
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,with,try,except,finally,def,class
autocmd BufRead,BufNewFile *.py set tabstop=4 expandtab shiftwidth=4 softtabstop=4 

set completeopt=menu,preview,longest

aug Complete
  au!
  au FileType python     setl omnifunc=pythoncomplete#Complete
  au FileType javascript setl omnifunc=javascriptcomplete#CompleteJS
  au FileType html       setl omnifunc=htmlcomplete#CompleteTags
  au FileType css        setl omnifunc=csscomplete#CompleteCSS
  au FileType xml        setl omnifunc=xmlcomplete#CompleteTags
  au FileType php        setl omnifunc=phpcomplete#CompletePHP
  au FileType c          setl omnifunc=ccomplete#Complete
  
  au FileType ruby,eruby setl omnifunc=rubycomplete#Complete 
  au FileType ruby,eruby comp ruby
  au FileType ruby,eruby let g:rubycomplete_rails = 1
  au FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
  au FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
  au FileType ruby,eruby let g:rubycomplete_include_object = 1
  au FileType ruby,eruby let g:rubycomplete_include_objectspace = 1
"  au FileType ruby,eruby setl dictionary=$HOME/.vim/dict/ruby.dict
  au FileType php setl dictionary=$HOME/.vim/dict/php.dict
aug END

set mouse=a
set ttymouse=xterm2

highlight JpSpace cterm=underline ctermfg=Blue guifg=Blue
au BufRead,BufNew * match JpSpace /　/

"<TAB>で補完
function InsertTabWrapper()
    if pumvisible()
        return "\<c-n>"
    endif
    let col = col('.') - 1
    if !col || getline('.')[col -1] !~ '\k\|<\|/'
        return "\<tab>"
    elseif exists('&omnifunc') && &omnifunc == ''
        return "\<c-n>"
    else
        return "\<c-x>\<c-o>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>

syntax on

set guioptions-=T


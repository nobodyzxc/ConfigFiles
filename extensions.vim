"Vundle
"Bundle 'vim-ruby/vim-ruby'

"git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
set nocompatible                " be iMproved
filetype off                    " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" let Vundle manage Vundle
Bundle 'gmarik/vundle'

" github repos below

Bundle 'scrooloose/nerdtree'
map <F12> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif
map <F11> :TlistToggle<CR>

Bundle 'hotoo/pangu.vim'
autocmd BufWritePre *.markdown,*.md,*.text,*.txt,*.wiki,*.cnx call PanGuSpacing()

Bundle 'ervandew/supertab'
set complete=.,w,b,u,t,i,w,

Bundle 'asins/vim-dict'
autocmd FileType java let g:SuperTabDefaultCompletionType = "<c-x><c-k>"

Bundle 'shougo/vimshell.vim'
Bundle 'shougo/vimproc.vim'
Bundle 'luochen1990/rainbow'
Bundle 'neovimhaskell/haskell-vim'
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords
let g:haskell_classic_highlighting = 1

let g:rainbow_active=1

let g:rainbow_conf = {
            \	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
            \	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
            \	'operators': '_,_',
            \	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
            \	'separately': {
            \		'tex': {
            \			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
            \		},
            \		'lisp': {
            \			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
            \		},
            \		'scheme': {
            \			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
            \		},
            \		'int-racket3m': {
            \			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
            \		},
            \		'*': 0,
            \	}
            \}
"            \		'html': {
"           \			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
"           \		},
"

" vim-scripts repos
Bundle 'taglist.vim'
Bundle 'ShowTrailingWhitespace'
"ShowTrailingWhitespace , clear all <space>$
nnoremap <Leader><Leader> ma:%s/\s\+$//<cr>:let @/=''<CR>`a

"Bundle 'vim-airline/vim-airline'
"Bundle 'artur-shaik/vim-javacomplete2'
"setlocal omnifunc=javacomplete#Complete
"inoremap <buffer> . .<C-X><C-O><C-P>

"Bundle 'html5.vim'
"Bundle 'JavaScript-syntax'

" non github repos
" Bundle 'git://git.wincent.com/command-t.git'

filetype plugin indent on

"* Bundle Cheatsheet
":BundleInstall
":BundleUpdate
":BundleClean
":BundleList
":BundleSearch
"TCL ~$ vim +BundleInstall +qall

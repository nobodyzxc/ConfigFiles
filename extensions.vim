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
map <F10> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif
let NERDTreeQuitOnOpen=0

"Bundle 'taglist.vim'
""cursor and python not open
Bundle 'majutsushi/tagbar'
"instead taglist
map <F12> :TagbarToggle<CR>
if &diff
    "nothing
else

    if winwidth('%') >= 124
        autocmd VimEnter * nested :call tagbar#autoopen(0)
        autocmd FileType c,cpp,python,hs,scheme nested :TagbarOpen
    endif

    let g:tagbar_map_showproto='<space><space>'
endif

Bundle 'hotoo/pangu.vim'

"autocmd BufWritePre *.markdown,*.md,*.text,*.wiki,*.cnx call PanGuSpacing()
nnoremap <Leader>p :Pangu<Cr>

"Bundle 'ervandew/supertab'
"set complete=.,w,b,u,t,i,w,
"smart mapping for tab completion
function InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction

inoremap <TAB> <C-R>=InsertTabWrapper()<CR>


Bundle 'asins/vim-dict'
"autocmd FileType java let g:SuperTabDefaultCompletionType = "<c-x><c-k>"

"Bundle 'tpope/vim-surround.vim'
Bundle 'shougo/vimshell.vim'
Bundle 'shougo/vimproc.vim'
Bundle 'luochen1990/rainbow'
Bundle 'pangloss/vim-javascript'
Bundle 'tomlion/vim-solidity'

Bundle 'neovimhaskell/haskell-vim'
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords
let g:haskell_classic_highlighting = 1
let g:haskell_indent_if = 3
let g:haskell_indent_case = 2
let g:haskell_indent_let = 4
let g:haskell_indent_where = 6
let g:haskell_indent_before_where = 2
let g:haskell_indent_after_bare_where = 2
let g:haskell_indent_do = 3
let g:haskell_indent_in = 1
let g:haskell_indent_guard = 2
let g:haskell_indent_case_alternative = 1

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

Bundle 'ShowTrailingWhitespace'
"ShowTrailingWhitespace , clear all <space>$
nnoremap <Leader><Leader> ma:%s/\s\+$//<cr>:let @/=''<CR>`a

Bundle 'vim-airline/vim-airline'
" set status line
set laststatus=2
" enable powerline-fonts
let g:airline_powerline_fonts = 1

"Plugin 'vim-airline/vim-airline-themes'

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

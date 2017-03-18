"My leader setting
"

let g:intvon = 0
let mapleader = "\<Space>"
set path+=/usr/lib/gcc/x86_64-pc-cygwin/5.4.0/include/c++

"mapping
imap jk <ESC>
nmap <Leader>x :x<CR>
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>
nmap <Leader>n :n<CR>
nmap <Leader>N :N<CR>
nmap <Leader>jq :q!<CR>
nmap <Leader>/ :noh<CR>

set lazyredraw "for gg=G , prevent screen blinking
nmap <Leader>= magg=G`a<CR>

nmap <Leader>k <C-W><C-W>
nmap <Leader>vc :source $MYVIMRC<CR>

nmap <Leader>s :VimShellPop<CR>
nmap <Leader>l :call LoadIntv()<CR>
nmap <Leader>i :call TogIntv()<CR><ESC><C-W><C-W>
nmap <Leader>a :!echo --- <C-R><C-w> --- ;abbrev <C-R><C-W><CR>
nmap <Leader>t :!echo --- <C-R><C-w> --- ;ici <C-R><C-W><CR>
"nmap <C-_> ma<C-V>0I//<ESC><ESC>`a
"vnoremap <C-_> ma<C-V>0I//<ESC><ESC>`a

function! TogIntv()
    if g:intvon == 0
        let g:intvon = 1
        VimShellInteractive racket3m.exe
    elseif g:intvon == 1
        let g:intvon = 2
        wincmd w
        hide
    elseif g:intvon == 2
        let g:intvon = 1
        vert sb 2
    endif
endfunction

function! LoadIntv()
    if g:intvon != 0
        exe "w"
        call vimshell#interactive#send('(load "'.@%.'")')
    endif
endfunction

"vundle below
"git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
set nocompatible                " be iMproved
filetype off                    " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" let Vundle manage Vundle
Bundle 'gmarik/vundle'

" github repos below
"Bundle 'Valloric/YouCompleteMe'
""Wrong , size too large , I don't know why.

Bundle 'scrooloose/nerdtree'
map <F12> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif
map <F11> :TlistToggle<CR>

Bundle 'hotoo/pangu.vim'
autocmd BufWritePre *.markdown,*.md,*.text,*.txt,*.wiki,*.cnx call PanGuSpacing()

Bundle 'ervandew/supertab'
Bundle 'shougo/vimshell.vim'
Bundle 'shougo/vimproc.vim'
Bundle 'luochen1990/rainbow'

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
            \		'html': {
            \			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
            \		},
            \		'*': 0,
            \	}
            \}


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

"traditional setting

set secure
set backspace=2         " allow backspacing over everything in insert mode
set viminfo='20,\"50    " read/write a .viminfo file, don't store more
" than 50 lines of registers
set history=50          " keep 50 lines of command line history
set ruler               " show the cursor position all the time
"set dictionary=~/.dict  " my dictionary :p

set expandtab           " expand tabs to spaces.
set wildchar=<TAB>      " such as <TAB> in shell
set smarttab
set tabstop=4
set shiftwidth=4

set nu
set t_Co=8              " number of colors
set t_Sf=[1;3%p1%dm   " set foreground color
set t_Sb=[1;4%p1%dm   " set background color
set showcmd             " show command
set showmode            " show current mode
set incsearch           " While typing a search pattern, show immediately
" where the so far typed pattern matches.
set hlsearch            " When there is a previous search pattern,
" highlight all its matches.
syntax on               " show parts of the text in another font or color

set fileencodings=utf-8,cp936,big5,latin1
set background=dark

autocmd FileType make setlocal noexpandtab
autocmd FileType java set omnifunc=javacomplete#Complete

colorscheme default

highlight Comment    ctermfg=DarkCyan
highlight SpecialKey ctermfg=Yellow

let rngbeg=0
autocmd FileType markdown,text let rngbeg=100
autocmd FileType c,cc,cpp,java,py,hs let rngbeg=80

"set colorcolumn=80
"^ single col
autocmd VimEnter * if rngbeg > 0 | let &colorcolumn=join(range(rngbeg,999),",")
"^ pane

"autocmd FileType * highlight ColorColumn ctermbg=147 ctermfg=3 term=reverse guibg=#3a3a3a
"autocmd FileType * highlight ColorColumn term=reverse ctermbg=4 gui=undercurl guisp=Blu
"autocmd FileType * highlight ColorColumn term=bold ctermbg=5 guibg=LightMagenta
"autocmd FileType * highlight colorcolumn term=reverse cterm=reverse guibg=LightGrey
"autocmd FileType * highlight colorcolumn  term=bold cterm=bold ctermbg=147 ctermfg=3 guifg=Blue

" v Yellow
"highlight colorcolumn  term=bold cterm=bold ctermbg=147 ctermfg=3

" v Magenta
autocmd FileType * highlight colorcolumn term=bold ctermfg=5 ctermbg=0 gui=bold

set cursorline
hi CursorLine ctermbg=none cterm=underline

set clipboard=unnamed

filetype indent on "for php.vim & html.vim in .vimrc/indent

"have Vim jump to the last position
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif


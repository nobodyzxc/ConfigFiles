"My setting above

"sanbi's setting below vvv
"  VimRC of ShepJeng
set nocompatible
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

autocmd FileType c,cpp,cc call PROG()
autocmd FileType make setlocal noexpandtab
autocmd FileType java set omnifunc=javacomplete#Complete

colorscheme default

function PROG()
    set showmatch
    set nosmartindent
    set cindent comments=sr:/*,mb:*,el:*/,:// cino=>s,e0,n0,f0,{0,}0,^-1s,:0,=s,g0,h1s,p2,t0,+2,(2,)20,*30
    set cinoptions=t0
    imap <C-a>f <END><CR>for(;;) {<CR>}<LEFT>
                \<CR><UP><UP><UP><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT>
    imap <C-a>w <END><CR>while( ) {<CR>}<LEFT>
                \<CR><UP><UP><UP><END><LEFT><LEFT>
    set formatoptions=tcqr
endfunction


highlight Comment    ctermfg=DarkCyan
highlight SpecialKey ctermfg=Yellow

map <F2> :update<CR>                    " using :update to replace :w
map <F3> :update<CR>:q<CR>
map <F4> :q!<CR>
map <F5> :bp<CR>
map <F6> :bn<CR>
" map <F8> :set hls!<BAR>set hls?<CR>     " toggle on/off highlightsearch
map <F8> :set paste!<BAR>set paste?<CR> " toggle on/off paste mode
set pastetoggle=<F8>
map <F9> :!make %:r <CR>

map <F7> :if exists("syntax_on") <BAR>  " press <F7> syntax on/off
        \   syntax off <bar><cr>
        \ else <BAR>
        \   syntax on <BAR>
        \ endif <CR>

map <F10> <ESC>:read !date<CR>
map <F11> <ESC>i//<ESC>
map <F12> <ESC>i<RIGHT>/**/<LEFT><LEFT>
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



"sanbi's setting above ^^^
"==============
"mychange below

let rngbeg=0
autocmd FileType markdown,text let rngbeg=100
autocmd FileType c,cc,cpp,java let rngbeg=80

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

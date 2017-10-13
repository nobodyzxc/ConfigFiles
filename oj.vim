source /etc/vimrc
set nu "num line
set tabstop=4
set shiftwidth=4
set cindent
set smarttab
set expandtab "set tab to space
set autoindent
syntax on
"hi comment ctermfg=cyan
hi comment ctermfg=blue
"prefer ^
"let comment color be blue. instead of dark blue

"super TAB
function InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction

inoremap <TAB> <C-R>=InsertTabWrapper()<CR>

"my rc
imap jk <ESC>
let mapleader = "\<Space>"
nmap <Leader>x :x<CR>
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>
nmap <Leader>n :n<CR>
nmap <Leader>N :N<CR>
nmap <Leader>jq :q!<CR>
nmap <Leader>/ :noh<CR>
nmap <Leader>; :
nmap <Leader>= mcHmhLmlgg=G`h`l`c
noremap H ^
noremap L $

set clipboard=unnamed

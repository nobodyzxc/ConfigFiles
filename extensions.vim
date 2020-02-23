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

" Add support for markdown files in tagbar.
let g:tagbar_type_markdown = {
    \ 'ctagstype': 'markdown',
    \ 'ctagsbin' : '~/.vim/util/markdown2ctags/markdown2ctags.py',
    \ 'ctagsargs' : '-f - --sort=yes',
    \ 'kinds' : [
        \ 's:sections',
        \ 'i:images'
    \ ],
    \ 'sro' : '<|||>',
    \ 'kind2scope' : {
        \ 's' : 'section',
    \ },
    \ 'sort': 0,
\ }

"instead taglist
map <F12> :TagbarToggle<CR>
if &diff
    "nothing
else

    if winwidth('%') >= 124
        autocmd VimEnter * nested :call tagbar#autoopen(0)
        autocmd FileType c,cpp,python,hs,scheme,markdown nested :TagbarOpen
    endif

    let g:tagbar_map_showproto='<space><space>'
endif

Bundle 'hotoo/pangu.vim'

"autocmd BufWritePre *.markdown,*.md,*.text,*.wiki,*.cnx call PanGuSpacing()
nnoremap <Leader>p :Pangu<Cr>


filetype plugin on
set omnifunc=syntaxcomplete#Complete

Bundle 'ervandew/supertab'
"set complete=.,w,b,u,t,i,w,
let g:SuperTabDefaultCompletionType = 'context'
autocmd FileType *
  \ if &omnifunc != '' |
  \   call SuperTabChain(&omnifunc, "<c-p>") |
  \ endif

""smart mapping for tab completion
"function InsertTabWrapper()
"    let col = col('.') - 1
"    if !col || getline('.')[col - 1] !~ '\k'
"        return "\<tab>"
"    else
"        return "\<c-p>"
"    endif
"endfunction
"
"function SInsertTabWrapper()
"    let col = col('.') - 1
"    if !col || getline('.')[col - 1] !~ '\k'
"        return "\<tab>"
"    else
"        return "\<c-x>\<c-k>"
"    endif
"endfunction
"inoremap <TAB> <C-R>=InsertTabWrapper()<CR>
"inoremap <S-TAB> <C-R>=SInsertTabWrapper()<CR>


Bundle 'artur-shaik/vim-javacomplete2'
autocmd FileType java setlocal omnifunc=javacomplete#Complete
let g:SuperTabDefaultCompletionType = '<C-x><C-o>'

Bundle 'asins/vim-dict'
"autocmd FileType java let g:SuperTabDefaultCompletionType = "<c-x><c-k>"

Bundle 'godlygeek/tabular'
Bundle 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_no_default_key_mappings = 1
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_new_list_item_indent = 0
let g:vim_markdown_conceal = 0
"let g:vim_markdown_json_frontmatter = 1 " need vim-json

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

Bundle 'lervag/vimtex'
"let g:tex_flavor='pdflatex'
let g:tex_flavor='pdflatex'
"let g:tex_flavor='latex'
"let g:Tex_CompileRule_dvi = 'latex -interaction=nonstopmode -file-line-error-style $*'
"let g:Tex_CompileRule_pdf = 'pdflatex -interaction=nonstopmode -file-line-error-style $*'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=1
set conceallevel=1
let g:tex_conceal='abdmg'
let g:vimtex_syntax_enabled = 0
"let g:vimtex_latexmk_enabled = 1
"let g:vimtex_latexmk_options = '-halt-on-error'
"let g:vimtex_latexmk_options = '-pdf -verbose -file-line-error -synctex=1'
autocmd BufWritePost *.tex silent! execute "!pdflatex -halt-on-error % >/dev/null 2>&1" | redraw!

"Plugin 'vim-airline/vim-airline-themes'

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

"Plugin 'dense-analysis/ale'

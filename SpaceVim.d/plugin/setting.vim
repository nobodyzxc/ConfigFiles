"custom setting below
" vim:set et sw=2
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab
set autoindent
let mapleader = "\<Space>"
"nnoremap <Tab> :tabnext<CR>
"nnoremap <S-Tab> :tabprev<CR>
nnoremap <C-t>   :tabnew<CR>
nmap <C-q>   :bd<CR>
inoremap <C-t>     <Esc>:tabnew<CR>

nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l
nnoremap <Leader>k  <C-W><C-W>
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>
nmap <Leader>x :x<CR>
nmap <Leader>n :bnext<CR>
nmap <Leader>p :bprev<CR>
nmap <Leader>jq :q!<CR>
nmap <Leader>/ :noh<CR>
nmap <Leader>v :vsplit<CR>
nmap <Leader>h :split<CR>
nmap <Leader>; :
nmap <Leader>= mcHmhLmlgg=G`h`l`c
nmap <Leader>t :!echo --- <C-R><C-w> ---\\n ;sdcv -c <C-R><C-W><CR>
nmap <Leader>g :silent !browser <C-R><C-A> 1>/dev/null 2>/dev/null&<CR>:redraw!<CR>
noremap H ^
noremap L $
xnoremap v <ESC>
set clipboard=unnamedplus
set hlsearch
set wrap
set mouse=

highlight RedundantSpaces ctermbg=red guibg=red

" show ShowTrailingWhitespace
match RedundantSpaces /\s\+$/
nnoremap <Leader>\ ma:%s/\s\+$//<cr>:let @/=''<CR>`a
nnoremap cp "_ciw<c-R>"<ESC>
unmap q

autocmd BufRead,BufNewFile *.md setlocal spell
" plugin setting below
map <F2> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif
let NERDTreeQuitOnOpen=0

map <F3> :TagbarToggle<CR>
if &diff
    "nothing
else

    if winwidth('%') >= 124
        "autocmd VimEnter * nested :call tagbar#autoopen(0)
        autocmd FileType * call tagbar#autoopen(0)
        autocmd FileType c,cpp,python,hs,scheme,markdown nested :TagbarOpen
    endif
    let g:tagbar_map_showproto='<space><space>'
endif

" Key bindings for vim-lsp.
"nn <silent> <Leader>ld :LspDefinition<cr>
"nn <silent> <Leader>lr :LspReferences<cr>
"nn <silent> <Leader>lw :LspWorkspaceSymbol<cr>
"nn <silent> <Leader>lD :LspDocumentSymbol<cr>
"nn <silent> <Leader>lR :LspRename<cr>
nn <silent> <Leader>lD :call SpaceVim#lsp#go_to_declaration()<cr>
nn <silent> <Leader>ld :call SpaceVim#lsp#go_to_def()<cr>
nn <silent> <Leader>lr :call SpaceVim#lsp#references()<cr>
nn <silent> <Leader>ln :call SpaceVim#lsp#rename()<cr>
nn <silent> <Leader>lc :call SpaceVim#lsp#show_doc()<cr>
nn <silent> <Leader>lt :call SpaceVim#lsp#go_to_typedef()<cr>
nn <silent> <Leader>lR :call SpaceVim#lsp#refactor()<cr>
nn <silent> <Leader>ll :call SpaceVim#lsp#
" :FencAutoDetect " decoding autodetect utf8

let g:lsp_diagnostics_echo_cursor = 1

"let mapleader = "\<Space>"
autocmd BufRead,BufNewFile *.py nmap <leader>c :w<Esc>G:r!python %<CR>`.
let g:lsp_log_verbose = 1
let g:lsp_log_file = expand('~/vim-lsp.log')
" for asyncomplete.vim log
let g:asyncomplete_log_file = expand('~/asyncomplete.log')

let g:coc_node_path = '/usr/bin/node'

autocmd FileType python,javascript setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab smartindent

let g:detectindent_preferred_tabsize = 2
let g:detectindent_preferred_indent = 2
let g:detectindent_preferred_expandtab = 2
let g:detectindent_preferred_indent = 2
autocmd BufReadPost * :DetectIndent
"dont let DetectIndent guess tabstop
"autocmd BufReadPost * setlocal tabstop=2

let g:ctrlp_custom_ignore = {
  \ 'dir': '\.git$\|SDK_BUILD_TEST$|prebuilts$|examples$|external$|cmake$|\.cache$',
  \ 'file': '\.idx$'
\ }

if exists("g:ctrlp_user_command")
    unlet g:ctrlp_user_command
endif
"set wildignore+=.*,*/SDK_BUILD_TEST/*,*/prebuilts/*,*/examples/*,*/external/[a-k]*,*/external/[m-z]*
set wildignore+=.*,*/SDK_BUILD_TEST/*,*/prebuilts/*,*/examples/*,*/external/*,*/cmake/*

let g:fzf_layout = { 'down': '40%' }

function! GitFZF()
  let path = trim(system('cd '.shellescape(expand('%:p:h')).' && git rev-parse --show-toplevel'))
  if !isdirectory(path)
    let path = expand('%:p:h')
    endif
  "exe 'FZF ' . path
  exe 'FZF ' . path
endfunction

command! GitFZF call GitFZF()
nnoremap <C-p> :GitFZF<CR>

tnoremap <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<c-\><c-n>"

unmap <C-x>
nnoremap <C-i> <C-i>


function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction
" Insert <tab> when previous text is space, refresh completion if not.
"
 inoremap <silent><expr> <TAB>
 \ coc#pum#visible() ? coc#pum#next(1):
 \ CheckBackspace() ? "\<Tab>" :
 \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

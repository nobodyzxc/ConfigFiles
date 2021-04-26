map <F3> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif
let NERDTreeQuitOnOpen=0

map <F2> :TagbarToggle<CR>
if &diff
    "nothing
else

    if winwidth('%') >= 124
        autocmd VimEnter * nested :call tagbar#autoopen(0)
    endif
    let g:tagbar_map_showproto='<space><space>'
endif

" Key bindings for vim-lsp.
nn <silent> <Leader>lD :call SpaceVim#lsp#go_to_declaration()<cr>
nn <silent> <Leader>ld :call SpaceVim#lsp#go_to_def()<cr>
nn <silent> <Leader>lr :call SpaceVim#lsp#references()<cr>
nn <silent> <Leader>ln :call SpaceVim#lsp#rename()<cr>
nn <silent> <Leader>lc :call SpaceVim#lsp#show_doc()<cr>
nn <silent> <Leader>lt :call SpaceVim#lsp#go_to_typedef()<cr>
nn <silent> <Leader>lR :call SpaceVim#lsp#refactor<cr>
nn <silent> <Leader>ll :call SpaceVim#lsp#

let g:lsp_diagnostics_echo_cursor = 1

let g:lsp_log_verbose = 1
let g:lsp_log_file = expand('~/vim-lsp.log')
" for asyncomplete.vim log
let g:asyncomplete_log_file = expand('~/asyncomplete.log')

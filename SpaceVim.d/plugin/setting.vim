map <F3> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif
let NERDTreeQuitOnOpen=0

map <F2> :TagbarToggle<CR>
if &diff
    "nothing
else

    if winwidth('%') >= 124
        autocmd VimEnter * nested :call tagbar#autoopen(0)
        autocmd FileType c,cpp,python,hs,scheme,markdown nested :TagbarOpen
    endif
    let g:tagbar_map_showproto='<space><space>'
endif

" Key bindings for vim-lsp.
nn <silent> <Leader>ld :LspDefinition<cr>
nn <silent> <Leader>lr :LspReferences<cr>
nn <silent> <Leader>lw :LspWorkspaceSymbol<cr>
nn <silent> <Leader>lD :LspDocumentSymbol<cr>
nn <silent> <Leader>lR :LspRename<cr>

let g:lsp_diagnostics_echo_cursor = 1

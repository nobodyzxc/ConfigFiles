
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

map <F3> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif
let NERDTreeQuitOnOpen=0

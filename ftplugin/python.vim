setlocal tabstop=8
setlocal expandtab
setlocal shiftwidth=4
setlocal softtabstop=4

autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

set colorcolumn=80
highlight ColorColumn ctermbg=DarkGray

let g:syntastic_check_on_open = 0
let g:syntastic_check_on_w = 1
let g:syntastic_check_on_wq = 1

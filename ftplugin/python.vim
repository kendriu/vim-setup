setlocal tabstop=8
setlocal expandtab
setlocal shiftwidth=4
setlocal softtabstop=4

setlocal smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

setlocal colorcolumn=80

setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
setlocal foldexpr< foldmethod<

let b:syntastic_check_on_open = 0
let b:syntastic_check_on_w = 1
let b:syntastic_check_on_wq = 1

"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

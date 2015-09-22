filetype plugin indent on

syntax on

set autoindent
set background=dark
set number

set tabstop=2
set shiftwidth=2
set noexpandtab

set history=1000
set mouse=a
set cmdheight=2
set pastetoggle=<F10>

set hidden " you can change buffers without saving"
set scrolloff=10 " Keep 10 lines (top/bottom) for scope
set smartcase " if there are caps, go case-sensitive
set ttymouse=xterm2 " makes it work in everything"

autocmd BufNewFile,BufRead *.ipynb set ft=javascript
autocmd FileType python setlocal completeopt-=preview

" Load vim-plug
if empty(glob("~/.vim/autoload/plug.vim"))
	execute '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif

" repair arrows
if &term[:4] == "xterm" || &term[:5] == 'screen' || &term[:3] == 'rxvt'
		inoremap <silent> <C-[>OC <RIGHT>
endif


call plug#begin('~/.vim/plugged')
"Plug 'Shougo/unite.vim'
"Plug 'Shougo/vimproc.vim'
Plug 'dbakker/vim-projectroot'
Plug 'kien/ctrlp.vim', { 'on': ['CtrlP', 'CtrlPBuffer', 'CtrlPMRUFiles']}
Plug 'rking/ag.vim', {'on': 'Ag'}
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on':  [ 'NERDTreeToggle', 'NERDTreeCWD']}
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sensible'
Plug 'altercation/vim-colors-solarized'
Plug 'majutsushi/tagbar'
Plug 'Valloric/YouCompleteMe'
Plug 'gregsexton/gitv'

" Track the engine.
Plug 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

" Autoclose brackets
Plug 'Raimondi/delimitMate'

" Git support
Plug 'tpope/vim-fugitive'

" Repeats also plugin operations
Plug 'tpope/vim-repeat'

" Autocompletion in Python
Plug 'davidhalter/jedi-vim', { 'for': 'python' }

" Sort imports in Python
Plug 'fisadev/vim-isort', { 'for': 'python' }

" Python Autoformat
Plug 'Chiel92/vim-autoformat', { 'on': 'Autoformat' }

" Graphic undo tree in vim
Plug 'sjl/gundo.vim', { 'on': 'GundoToggle' }

" IO language syntax
Plug 'andreimaxim/vim-io', { 'for': 'io' }

" Syntax checking
Plug 'scrooloose/syntastic'
Plug 'airblade/vim-gitgutter'
Plug 'vim-scripts/scratch.vim'
Plug 'bling/vim-airline'
call plug#end()


colorscheme solarized
let g:solarized_termcolors=256


"""  NerdTree settings
" autocmd vimenter * NERDTree " autostart

map <F2> :NERDTreeToggle <CR> " toggle NerdTree
map <leader><F2> :ProjectRootExe NERDTreeCWD <CR> " toggle NerdTree

" Open nerdtree if no file specified
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Close vim if only nerdtree exists
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDTreeIgnore = ['\.pyc$']
""" End of Nerdtree


""" CtrlP
map <leader>f :CtrlP<CR>
map <leader>b :CtrlPBuffer<CR>
map <leader>m :CtrlPMRUFiles<CR>
" ctrlp uses old cache when enabled first time
" let g:ctrlp_clear_cache_on_exit = 0
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc
""" End of CtrlP


""" Unite
"nnoremap <leader>F :Unite file_rec/async<CR>
"let g:unite_source_history_yank_enable = 1
"call unite#filters#matcher_default#use(['matcher_fuzzy'])
"nnoremap <leader>q :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec/async:!<cr>
"nnoremap <leader>w :<C-u>Unite -no-split -buffer-name=files   -start-insert file<cr>
""" End of Unite

""" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_w = 0
let g:syntastic_check_on_wq = 0
nmap <C-c> :SyntasticCheck<CR> 
""" End of Syntatsic


""" Airline
" source /usr/local/lib/python2.7/site-packages/powerline/bindings/vim/plugin/powerline.vim
let g:airline_powerline_fonts = 1
"let g:Powerline_symbols = 'fancy'
let g:airline#extensions#tabline#enabled = 1
""" End of Airlane


""" Gundo
map <F5> :GundoToggle<CR>
let g:gundo_preview_bottom = 1
"""  End of Gundo


""" Other shortcuts
map <F8> :TagbarToggle<CR>

" switch window
map <silent> <C-k> :wincmd k<CR>
map <silent> <C-j> :wincmd j<CR>
map <silent> <C-h> :wincmd h<CR>
map <silent> <C-l> :wincmd l<CR>

" source $MYVIMRC reloads the saved $MYVIMRC
nmap <Leader>s :source $MYVIMRC<CR>
"
" " opens $MYVIMRC for editing, or use :tabedit $MYVIMRC
nmap <Leader>v :e $MYVIMRC<CR>

noremap <F3> :Autoformat<CR>
map <Leader>q :ProjectRootCD<CR>
""" End of otherhortcuts


" Ag looks in project directory not in cwd
let g:ag_working_path_mode="r"
let g:tagbar_width = 40
let g:tagbar_autofocus = 1


""" Snippets expands on return
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"
let g:UltiSnipsExpandTrigger="<nop>"
let g:ulti_expand_or_jump_res = 0
function! <SID>ExpandSnippetOrReturn()
  let snippet = UltiSnips#ExpandSnippetOrJump()
  if g:ulti_expand_or_jump_res > 0
    return snippet
  else
    return "\<C-Y>"
  endif
endfunction
imap <expr> <CR> pumvisible() ? "<C-R>=<SID>ExpandSnippetOrReturn()<CR>" : "<Plug>delimitMateCR"
""" End

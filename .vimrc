filetype plugin indent on
let &runtimepath.=',~/vim-setup'

syntax on
set encoding=utf8
" Enable folding
set foldmethod=indent
set foldlevel=99

set modeline
set nocompatible
set autoindent
set background=dark
set relativenumber number
set splitright
set nowrap

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
set t_Co=256

set undofile
set undodir="$HOME/.VIM_UNDO_FILES"

if !has('nvim')
	set ttymouse=xterm2 " makes it work in everything"
endif

au FileType markdown setl shell=bash\ -i

highlight ColorColumn ctermbg=DarkGray

autocmd BufNewFile,BufRead *.ipynb set ft=javascript
autocmd FileType python setlocal completeopt-=preview


" repair arrows
if &term[:4] == "xterm" || &term[:5] == 'screen' || &term[:3] == 'rxvt'
	inoremap <silent> <C-[>OC <RIGHT>
endif

" Load vim-plug
if empty(glob("~/.vim/autoload/plug.vim"))
	execute '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.vim/plugged')
function! BuildYCM(info)
	" info is a dictionary with 3 fields
	" - name: name of the plugin
	" - status: 'installed', 'updated', or 'unchanged'
	" - force: set on PlugInstall! or PlugUpdate!
	if a:info.status == 'installed' || a:info.status == 'updated' || a:info.force
		!./install.py
	endif
endfunction

"Plug 'Shougo/unite.vim'
"Plug 'Shougo/vimproc.vim'
Plug 'dbakker/vim-projectroot'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'rking/ag.vim', {'on': 'Ag'}
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on':  [ 'NERDTreeToggle', 'NERDTreeCWD']}
Plug 'tpope/vim-sensible'
Plug 'altercation/vim-colors-solarized'
Plug 'majutsushi/tagbar'
Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
Plug 'ervandew/supertab'
Plug 'gregsexton/gitv'
Plug 'michaeljsmith/vim-indent-object'
Plug 'justinmk/vim-sneak'
Plug 'bronson/vim-trailing-whitespace'
Plug 'tpope/vim-surround'
Plug 'dietsche/vim-lastplace'

"Neovim
Plug 'wincent/terminus'

" Autocompletion in Python
Plug 'davidhalter/jedi-vim', { 'for': 'python' }

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

" Sort imports in Python
Plug 'fisadev/vim-isort', { 'for': 'python' }

" Python Autoformat
Plug 'Chiel92/vim-autoformat', { 'on': 'Autoformat' }

" Graphic undo tree in vim
Plug 'sjl/gundo.vim', { 'on': 'GundoToggle' }

" IO language syntax
Plug 'andreimaxim/vim-io', { 'for': 'io' }

" Jinja2
Plug 'mitsuhiko/vim-jinja'

" Syntax checking
Plug 'scrooloose/syntastic'
Plug 'airblade/vim-gitgutter'
Plug 'vim-scripts/scratch.vim'
Plug 'elixir-lang/vim-elixir'
Plug 'bling/vim-airline'

Plug 'wakatime/vim-wakatime'
call plug#end()


colorscheme solarized
let g:solarized_termcolors=256
let g:lastplace_ignore = "gitcommit,svn"


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
if executable("ag")
	let g:ackprg = 'ag --nogroup --nocolor --column'

	" Use Ag over Grep
	set grepprg=ag\ --nogroup\ --nocolor

	" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
	let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

	" ag is fast enough that CtrlP doesn't need to cache
	let g:ctrlp_use_caching = 0
endif
""" End of CtrlP


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


"""You Complete Me
let g:ycm_key_list_select_completion = ['<C-TAB>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-S-TAB>', '<Up>']

let g:SuperTabDefaultCompletionType = '<C-Tab>'
""" End of YCM


""" Ag
" Ag looks in project directory not in cwd
let g:ag_working_path_mode="r"
let g:ag_highlight=1

"""  End of Ag


""" Tagbar
let g:tagbar_width = 40
let g:tagbar_autofocus = 1
""" End of Tagbar


""" Airline
" source /usr/local/lib/python2.7/site-packages/powerline/bindings/vim/plugin/powerline.vim
let g:airline_powerline_fonts = 1
"let g:Powerline_symbols = 'fancy'
let g:airline#extensions#tabline#enabled = 1

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
""" End of Airlane

""" Sneak

"replace 'f' with 1-char Sneak
nmap f <Plug>Sneak_f
nmap F <Plug>Sneak_F
xmap f <Plug>Sneak_f
xmap F <Plug>Sneak_F
omap f <Plug>Sneak_f
omap F <Plug>Sneak_F
"replace 't' with 1-char Sneak
nmap t <Plug>Sneak_t
nmap T <Plug>Sneak_T
xmap t <Plug>Sneak_t
xmap T <Plug>Sneak_T
omap t <Plug>Sneak_t
omap T <Plug>Sneak_T
""" End of Sneak


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

noremap <F3> :Autoformat<CR> :Isort<CR> :w<CR>
map <Leader>q :ProjectRootCD<CR>

map <Leader>t :execute ":Ag \"TODO\|FIXME\|XXX\""<CR>

" Enable folding with the spacebar
"nnoremap <space> za
""" End of otherhortcuts


""" Commands
command! W w !sudo tee % > /dev/null

function! s:Edit(path)
	exec "vsplit ".a:path
endfunction

"TODO: http://stackoverflow.com/questions/32767547/tab-completion-for-my-vim-command-dont-work
command! -nargs=1  -complete=file E call s:Edit(<q-args>)
:nnoremap <silent> <F7> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'

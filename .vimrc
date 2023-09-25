set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'davidhalter/jedi-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Plugins
call plug#begin(expand('~/.vim/plugged'))
Plug 'arcticicestudio/nord-vim'
Plug 'preservim/nerdtree'		" side bar file tree
Plug 'itchyny/lightline.vim'		" minimal status bar
Plug 'tpope/vim-fugitive'		" Allows git commands in vim session
Plug 'airblade/vim-gitgutter'		" Shows git changes in gutter
Plug 'easymotion/vim-easymotion'	" go to any word quickly '\\w', '\\e', '\\b'
Plug 'KKPMW/vim-sendtowindow'		" send commands to REPL
Plug 'yuttie/comfortable-motion.vim'    " scrolling 'C-d' or 'C-u'
Plug 'dense-analysis/ale'               " linting [dep]: pip3 install flake8, install.packages('lintr')
Plug 'fisadev/vim-isort'                " Python sort imports [dep]: pip3 install isort
Plug 'mhinz/vim-startify'               " A start menu for vim
Plug 'tmhedberg/SimpylFold'             " Code folding (zo: open, zc: close)
call plug#end()

" jedi-vim
let g:jedi#popup_on_dot = 0

" lightline
let g:lightline = {
        \ 'colorscheme': 'wombat',
	\ 'active': {
	\	'left': [ [ 'mode', 'paste'],
	\		  [ 'gitbranch', 'readonly', 'filename', 'modified'] ]
	\ },
	\ 'component_function': {
	\	'gitbranch': 'FugitiveHead'
	\ },
	\ }

" git gutter
let g:gitgutter_async=0
set updatetime=100			" ms

" nerdtree settings
map <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$']		"ignore pyc files

" Window Splits
set splitbelow splitright
" Change 2 split windows from vert to horiz or horiz to vert
map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-w>t<C-w>K
" Start terminals for R and Python sessions '\tr' or '\tp'
map <Leader>tp :new term://bash<CR>ipython3<CR><C-\><C-n><C-w>k

" Ale Linting
let g:ale_sign_column_always=1
let g:ale_lint_on_enter=1
let g:ale_lint_on_text_changed='always'
let g:ale_echo_msg_error_str='E'
let g:ale_echo_msg_warning_str='W'
let g:ale_echo_msg_format='[%linter%] %s [%severity%]: [%...code...%]'
let g:ale_linters={'python': ['flake8'], 'r': ['lintr']}
let g:ale_fixers={'python': ['black']}
let g:ale_python_flake8_options = '--max-line-length=88'

" startify
let g:startify_lists = [
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'files',     'header': ['   Recent']            },
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ ]

" Theme settings
if $TERM_PROGRAM != "Apple_Terminal"
	set termguicolors
endif
colorscheme nord

" General Settings
syntax enable
set nocompatible
set number " set line numbers
set laststatus=2 " Show status bar (lightline)
set backspace=indent,eol,start

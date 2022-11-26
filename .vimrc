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
" Plug 'fisadev/vim-isort'                " Python sort imports [dep]: pip3 install isort
Plug 'mhinz/vim-startify'               " A start menu for vim
Plug 'tmhedberg/SimpylFold'             " Code folding (zo: open, zc: close)
call plug#end()

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
set updatetime=1000			" ms

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

" startify
let g:startify_lists = [
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'files',     'header': ['   Recent']            },
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ ]

" Theme settings
if (has("termguicolors"))
  set termguicolors
endif
colorscheme nord

" General Settings
syntax enable
set nocompatible
set number " set line numbers
set laststatus=2 " Show status bar (lightline)

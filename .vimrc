" Plugins
call plug#begin(expand('~/.vim/plugged'))
Plug 'arcticicestudio/nord-vim'
Plug 'preservim/nerdtree'		" side bar file tree
Plug 'itchyny/lightline.vim'		" minimal status bar
Plug 'tpope/vim-fugitive'		" Allows git commands in vim session
call plug#end()

" nerdtree settings
map <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$']		"ignore pyc files

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

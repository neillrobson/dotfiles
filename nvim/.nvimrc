filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.nvim/bundle/Vundle.vim
call vundle#begin()

" ***Plugins go here***
Plugin 'gmarik/Vundle.vim'
Plugin 'othree/html5.vim'
Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'bling/vim-airline'
Plugin 'NLKNguyen/papercolor-theme'
" ***End plugin list***

call vundle#end()
" We're done with Vundle

" Syntax highlighting
filetype plugin indent on
syntax on

" Tabs are always 4 literal spaces
set softtabstop=4
set shiftwidth=4
set expandtab

" General config
set mouse=""
set relativenumber
set number
set nowrap
set hidden " hide buffers, don't close them
set title

" Color scheme
set background=light
colorscheme PaperColor

" Airline settings
let g:airline_theme='papercolor'
let g:airline_powerline_fonts = 1
set laststatus=2 " Without this, must split before airline appears
set noshowmode " Get rid of the typical mode indicator

" Shortcuts and remaps
let mapleader="\<SPACE>"
nmap ; :
nmap Q @q
nmap <silent> <leader>/ :nohlsearch<CR>
map <C-n> :bn<CR>
map <C-p> :bp<CR>
let g:user_emmet_leader_key = '<leader>y'

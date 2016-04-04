" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" ***Plugins go here***
Plugin 'gmarik/Vundle.vim'
Plugin 'othree/html5.vim'
Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-dispatch'
Plugin 'Raimondi/delimitMate'
Plugin 'bling/vim-airline'
Plugin 'altercation/vim-colors-solarized'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'reedes/vim-lexical'
" ***End plugin list***

call vundle#end()
" We're done with Vundle

" Syntax highlighting
filetype plugin indent on
syntax enable

" Tabs are always 4 literal spaces
set softtabstop=4
set shiftwidth=4
set expandtab

" Spellcheck config
augroup lexical
    autocmd!
    autocmd FileType markdown,mkd call lexical#init()
    autocmd FileType textile call lexical#init()
    autocmd FileType text call lexical#init({ 'spell': 0 })
augroup END

" General config
set mouse-=a " no mouse
set relativenumber " line numbers count away from cursor
set number " display line numbers
set nowrap " Let text run off end of screen
set hidden " hide buffers, don't close them
set title " show current file being edited on window bar (of the OS)
set timeoutlen=1000 ttimeoutlen=0 " Immediately return to normal mode with escape

" delimitMate settings
let delimitMate_expand_cr = 1 " tab in when <CR> is hit within parens

" Color scheme
set background=dark
colorscheme solarized

" Airline settings
let g:airline_theme='solarized'
let g:airline_powerline_fonts = 1
set laststatus=2 " Without this, must split before airline appears
set noshowmode " Get rid of the typical mode indicator

" Shortcuts and remaps
nmap ; :
nmap Q @q
nmap <silent> <leader>/ :nohlsearch<CR>
map <C-n> :bn<CR>
map <C-p> :bp<CR>
let g:user_emmet_leader_key = '<C-s>'

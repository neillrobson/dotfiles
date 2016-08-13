" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" ***Plugins go here***
Plugin 'gmarik/Vundle.vim' " Plugin manager

Plugin 'tpope/vim-surround' " Enclose text with quotes, parens, etc
Plugin 'tpope/vim-fugitive' " Git plugin
Plugin 'tpope/vim-repeat' " Allows the . command to work with more actions
Plugin 'tpope/vim-dispatch' " Send jobs straight to a background shell
Plugin 'tpope/vim-unimpaired' " Extra shortcuts for moving next/previous

Plugin 'Raimondi/delimitMate' " Autocompletes parenthesis and quotes
Plugin 'mattn/emmet-vim' " HTML completion
Plugin 'othree/html5.vim' " HTML5 tags
Plugin 'pangloss/vim-javascript' " Better Javascript syntax highlighting
Plugin 'mustache/vim-mustache-handlebars' " Handlebars support

Plugin 'vim-airline/vim-airline' " Pretty statusbar
Plugin 'vim-airline/vim-airline-themes' " Prettier statusbar
Plugin 'altercation/vim-colors-solarized' " Color scheme

Plugin 'ctrlpvim/ctrlp.vim' " Fuzzy file finder
Plugin 'majutsushi/tagbar' " Navigate between class and function references like an IDE
Plugin 'christoomey/vim-tmux-navigator' " <C-hjkl> to move between both vim and tmux

Plugin 'reedes/vim-lexical' " Spellchecking
Plugin 'scrooloose/syntastic' " Syntax checking
" ***End plugin list***

call vundle#end()
" We're done with Vundle

" Syntax highlighting
filetype plugin indent on
syntax enable
set background=light
colorscheme solarized
let g:solarized_menu = 0 " No solarized menu in GUI

" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2 " Close, but don't open, error window automatically
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_python_checkers = ['python', 'flake8']

" Tabs are always 4 literal spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

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

" Airline settings
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'solarized'
set laststatus=2 " Without this, must split before airline appears
set noshowmode " Get rid of the typical mode indicator

" Shortcuts and remaps
" Due to Vim Tmux Navigator, <C-h|j|k|l> are all taken
let mapleader = "\<Space>"
map ; :
nmap Q @q
" All shortcuts relating to plugins should use the leader key.
" That way, one can transition to a plugin-free environment with minimal
" mental effort.
nmap <leader>t :TagbarToggle<CR>
nmap <leader>g :Gstatus<CR>
let g:ctrlp_map = '<leader>o'
" Emmet needs insert-mode shortcuts, so we make an exception to our rule.
let g:user_emmet_leader_key = '<C-c>'

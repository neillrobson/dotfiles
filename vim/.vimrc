" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" ***Plugins go here***
Plugin 'gmarik/Vundle.vim' " Plugin manager
Plugin 'othree/html5.vim' " HTML5 tags
Plugin 'mattn/emmet-vim' " HTML completion
Plugin 'tpope/vim-surround' " Enclose text with quotes, parens, etc
Plugin 'tpope/vim-fugitive' " Git plugin
Plugin 'tpope/vim-repeat' " Allows the . command to work with more actions
Plugin 'tpope/vim-dispatch' " Send jobs straight to a background shell
Plugin 'tpope/vim-unimpaired' " Extra shortcuts for moving next/previous
Plugin 'Raimondi/delimitMate' " Autocompletes parenthesis and quotes
Plugin 'bling/vim-airline' " Pretty statusbar
Plugin 'altercation/vim-colors-solarized' " Color scheme
Plugin 'mustache/vim-mustache-handlebars' " Handlebars support
Plugin 'reedes/vim-lexical' " Spellchecking
Plugin 'ctrlpvim/ctrlp.vim' " Fuzzy file finder
Plugin 'christoomey/vim-tmux-navigator' " <C-hjkl> to move between both vim and tmux
Plugin 'pangloss/vim-javascript' " Better Javascript syntax highlighting
Plugin 'scrooloose/syntastic' " Syntax checking
" ***End plugin list***

call vundle#end()
" We're done with Vundle

" Syntax highlighting
filetype plugin indent on
syntax enable

" Syntastic recommended settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

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
set background=light
colorscheme solarized

" GUI settings
if has('gui_running')
    set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 14
endif

" Airline settings
let g:airline_theme='solarized'
let g:airline_powerline_fonts = 1
set laststatus=2 " Without this, must split before airline appears
set noshowmode " Get rid of the typical mode indicator

" Shortcuts and remaps
nmap ; :
nmap Q @q
nmap <silent> <leader>/ :nohlsearch<CR>
let g:user_emmet_leader_key = '<C-s>'

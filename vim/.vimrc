" set the runtime path to include Vundle and initialize
if has('win32') || has('win64')
    let vundle_path = '$HOME/vimfiles/bundle/'
else
    let vundle_path = '~/.vim/bundle/'
endif
let &rtp .= ',' . expand(vundle_path . 'Vundle.vim')
call vundle#begin(vundle_path)

" ***Plugins go here***
Plugin 'VundleVim/Vundle.vim' " Plugin manager

Plugin 'tpope/vim-dispatch' " Send jobs straight to a background shell
Plugin 'tpope/vim-fugitive' " Git plugin
Plugin 'tpope/vim-repeat' " Allows the . command to work with more actions
Plugin 'tpope/vim-surround' " Enclose text with quotes, parens, etc
Plugin 'tpope/vim-unimpaired' " Extra shortcuts for moving next/previous

Plugin 'sheerun/vim-polyglot' " Support for tons of languages
Plugin 'vim-syntastic/syntastic' " Syntax checking
Plugin 'Raimondi/delimitMate' " Autocompletes parenthesis and quotes
Plugin 'mattn/emmet-vim' " HTML completion
Plugin 'jdonaldson/vaxe' " Haxe plugin
Plugin 'joonty/vdebug' " DBGp plugin

Plugin 'vim-airline/vim-airline' " Pretty statusbar
Plugin 'vim-airline/vim-airline-themes' " Prettier statusbar
Plugin 'altercation/vim-colors-solarized' " Color scheme

Plugin 'scrooloose/nerdtree' " File tree explorer
Plugin 'ctrlpvim/ctrlp.vim' " Fuzzy file finder
Plugin 'majutsushi/tagbar' " Navigate between class and function references like an IDE
Plugin 'christoomey/vim-tmux-navigator' " <C-hjkl> to move between both vim and tmux

Plugin 'reedes/vim-lexical' " Spellchecking
Plugin 'junegunn/goyo.vim' " Distraction-free writing
" ***End plugin list***

call vundle#end()
" We're done with Vundle

" Font and Syntax highlighting
filetype plugin indent on
syntax enable
set background=light
colorscheme solarized
let g:solarized_menu = 0 " No solarized menu in GUI
set encoding=utf-8
if has('win32') || has('win64')
    set guifont=Monaco\ for\ Powerline:h12:cANSI
endif

" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2 " Close, but don't open, error window automatically
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_python_checkers = ['python', 'flake8']
let g:syntastic_python_python_exec = 'python3'
let g:syntastic_rst_checkers = ['sphinx']

" Pymode
let g:pymode_lint = 0

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
set sidescroll=1 " Only scroll by 1 char at a when moving the cursor horizontally
set hidden " hide buffers, don't close them
set title " show current file being edited on window bar (of the OS)
set timeoutlen=1000 ttimeoutlen=0 " Immediately return to normal mode with escape
set backspace=2 " Allow backspacing over indentations, line breaks, and any inserted text
set diffopt+=vertical " Always open diffs in vertical splits
if exists('+shellslash')
    set shellslash " Always use forward slashes
endif
set autoread " If file has changed externally, automatically refresh Vim buffer

" delimitMate settings
let delimitMate_expand_cr = 2 " tab in when <CR> is hit within parens

" Airline settings
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t' " Only show file name, not path
let g:airline_theme = 'solarized'
set laststatus=2 " Without this, must split before airline appears
set noshowmode " Get rid of the typical mode indicator

" CtrlP settings
let g:ctrlp_working_path_mode = 0 " Don't be smart about setting work dir
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files'] " Ignore what git ignores

" Shortcuts and remaps
" Due to Vim Tmux Navigator, <C-h|j|k|l> are all taken
let mapleader = "\<Space>"
map ; :
nmap Q @q
nmap gb :b<Space>
nmap gc :bn\|bd#<CR>
nmap <C-Z> zh
nmap <C-G> zl
map gl :call TextwidthToggle()<CR>
function! TextwidthToggle()
  if &textwidth == 0
    set tw=80
  else
    set tw=0
  endif
  echo "Text width set to " . &textwidth
endfunction
if has("gui_running")
  map <C-S> :w<CR>
endif
" All shortcuts relating to plugins should use the leader key.
" That way, one can transition to a plugin-free environment with minimal
" mental effort.
nmap <leader>b :TagbarToggle<CR>
nmap <leader>g :Gstatus<CR>
nmap <leader>n :NERDTreeToggle<CR>
nmap <leader>f :NERDTreeFind<CR>
nmap <leader>o :Goyo<CR>
let g:ctrlp_map = '<leader>p'
let g:lexical#spell_key = '<leader>s'
let g:lexical#thesaurus_key = '<leader>t'
" Emmet needs insert-mode shortcuts, so we make an exception to our rule.
let g:user_emmet_leader_key = '<C-c>'

if &term =~ '256color'
    set t_ut=
endif

" Local configuration
let s:local_config_file = 'kadro.vim'
if filereadable(s:local_config_file)
    exec 'source ' . s:local_config_file
endif

set noshowmode
"
" Starting point for Plugins:
"
call plug#begin()
  if executable("node")
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
  endif
  Plug 'junegunn/fzf'", { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  " default plugins
"  Plug 'pablopunk/native-sidebar.vim'
  Plug 'preservim/nerdtree'
  Plug 'itchyny/lightline.vim'
  Plug 'hashivim/vim-terraform'
  Plug 'jacoborus/tender.vim'
  Plug 'tpope/vim-fugitive'
call plug#end()

if executable("node")
  inoremap <silent><expr> <c-space> coc#refresh()
endif
"
" Load custom looks (after plugins load)
" 
so ~/.vim/smurf-lightline.vim

let perl_fold=1
set nocompatible      " We're running Vim, not Vi!
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins
set tabstop=2
set expandtab
set visualbell                  " don't beep
set noerrorbells                " don't beep
set shiftwidth=2
set ttyfast
set shiftround
set smarttab
set incsearch
set nobackup
set noswapfile
set hlsearch
set noshowmode
" Can never decide if i like mouse support in vim or not
"set mouse=a
"let g:airline_powerline_fonts = 1
" Avoid accidental hits of <F1> while aiming for <Esc>
map! <F1> <Esc>
set t_Co=256


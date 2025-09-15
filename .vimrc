set noshowmode
" set notimeout
set timeoutlen=500
set t_Co=256
let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors

let mapleader=","

"
" Starting point for Plugins:
"
call plug#begin()
  if executable("node")
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
  endif
  Plug 'junegunn/fzf'", { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'liuchengxu/vim-which-key'
  Plug 'preservim/nerdtree'
  Plug 'itchyny/lightline.vim'
  Plug 'hashivim/vim-terraform'
  Plug 'jacoborus/tender.vim'
  Plug 'tpope/vim-fugitive'
  Plug 'lambdalisue/nerdfont.vim'
  " Dockerfile support
  Plug 'ekalinin/Dockerfile.vim'
  Plug 'tpope/vim-commentary'
  Plug 'jabirali/vim-tmux-yank'
  Plug 'preservim/vimux'
call plug#end()

if executable("node")
  inoremap <silent><expr> <c-space> coc#refresh()
endif
"
" Load custom looks (after plugins load)
" 
so ~/.vim/smurf-lightline.vim
so ~/.vim/smurfscript.vim

let perl_fold=1
set nocompatible      " We're running Vim, not Vi!
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins
set tabstop=2
set expandtab
set visualbell                  " don't beep
set noerrorbells                " don't beep
set belloff=all
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
set mouse=a
"let g:airline_powerline_fonts = 1
" Avoid accidental hits of <F1> while aiming for <Esc>
map! <F1> <Esc>
let mapleader=","
noremap <silent> <C-P> :Files<CR>
noremap <silent> <leader>f :Files<CR>
noremap <silent> <leader><tab> :Buffers<CR>
noremap <silent> <tab> :NERDTreeToggle<CR>

":au BufAdd,BufNewFile * nested tab sball
inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"


let g:mapleader = "\<Space>"
let g:maplocalleader = ','
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>
let g:which_key_map = {}
let g:which_key_map['w'] = {
      \ 'name' : '+windows' ,
      \ 'w' : ['<C-W>w'     , 'other-window']          ,
      \ 'd' : ['<C-W>c'     , 'delete-window']         ,
      \ '-' : ['<C-W>s'     , 'split-window-below']    ,
      \ '|' : ['<C-W>v'     , 'split-window-right']    ,
      \ '2' : ['<C-W>v'     , 'layout-double-columns'] ,
      \ 'h' : ['<C-W>h'     , 'window-left']           ,
      \ 'j' : ['<C-W>j'     , 'window-below']          ,
      \ 'l' : ['<C-W>l'     , 'window-right']          ,
      \ 'k' : ['<C-W>k'     , 'window-up']             ,
      \ 'H' : ['<C-W>5<'    , 'expand-window-left']    ,
      \ 'J' : [':resize +5'  , 'expand-window-below']   ,
      \ 'L' : ['<C-W>5>'    , 'expand-window-right']   ,
      \ 'K' : [':resize -5'  , 'expand-window-up']      ,
      \ '=' : ['<C-W>='     , 'balance-window']        ,
      \ 's' : ['<C-W>s'     , 'split-window-below']    ,
      \ 'v' : ['<C-W>v'     , 'split-window-below']    ,
      \ '?' : ['Windows'    , 'fzf-window']            ,
      \ }
call which_key#register('<Space>', "g:which_key_map")

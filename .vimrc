"
" Starting point for Plugins:
"
call plug#begin()
" if nodes available, we'll try use coc, as it's way better, everyone loves
" coc afterall. ;-)
if executable("node")
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
else 
  Plug 'prabirshrestha/vim-lsp'
  Plug 'prabirshrestha/async.vim'
  Plug 'prabirshrestha/asyncomplete.vim'
  Plug 'prabirshrestha/asyncomplete-lsp.vim'
  Plug 'mattn/vim-lsp-settings'
endif
  Plug 'hashivim/vim-terraform'
  Plug 'jacoborus/tender.vim'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'tpope/vim-fugitive'
call plug#end()

if executable("node")
  inoremap <silent><expr> <c-space> coc#refresh()
endif

" Airline Settings
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='tender'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
"let g:airline_symbols.maxlinenr = ''

"let g:airline#extensions#tabline#formatter = 'default'  " f/p/file-name.js
"let g:airline#extensions#tabline#formatter = 'jsformatter' " path-to/f
"let g:airline#extensions#tabline#formatter = 'unique_tail' " file-name.js
let g:airline#extensions#tabline#formatter = 'unique_tail_improved' " f/p/file-name.js

"set t_Co=256
syntax on
set background=dark
colorscheme vividchalk
colorscheme elflord

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
set showcmd
set ttyfast
set shiftround
set smarttab
set incsearch
set nobackup
set noswapfile
set hlsearch
set laststatus=2
let g:airline_powerline_fonts = 1
"set statusline=\ %F\ %=\ %y\ (%%%p)\ line\:\ %l\ col:\ %c\
"let b:did_ftplugin = 1
" Avoid accidental hits of <F1> while aiming for <Esc>
map! <F1> <Esc>

map <C-K> :call SyntaxCheck()<CR>
map <C-R> :call Compileandrun()<CR>
map <C-q> :call Recolor()<CR>
map <C-P> :call PerlDoc()<CR>
map <M-C> :! clear; make %<CR>

au! BufRead,BufNewFile *.json setfiletype json

function! Recolor()
  execute ":syntax off"
  execute ":syntax on"
  execute ":color smurf"
endfunction

if executable('terraform-ls')
  au User lsp_setup call lsp#register_server({
    \ 'name': 'terraform-ls',
    \ 'cmd': {server_info->['terraform-ls', 'serve']},
    \ 'whitelist': ['terraform','tf'],
    \ })
endif

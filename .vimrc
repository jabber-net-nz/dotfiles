syntax on
"
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
"set list
"set listchars=tab:>.,trail:.,extends:#,nbsp:.
set hlsearch
set laststatus=2
set statusline=\ %F\ %=\ %y\ (%%%p)\ line\:\ %l\ col:\ %c\ 

"let b:did_ftplugin = 1

" Avoid accidental hits of <F1> while aiming for <Esc>
map! <F1> <Esc>

map <C-K> :call SyntaxCheck()<CR>
map <C-R> :call Compileandrun()<CR>
map <C-q> :call Recolor()<CR>
"map <C-W> :w<CR><ESC>:!clear<CR>
map <C-P> :call PerlDoc()<CR>
map <M-C> :! clear; make %<CR> 

au! BufRead,BufNewFile *.json setfiletype json 

function! SyntaxCheck()
	let filename = expand("%")
	let ftype = &filetype
	if ftype == '' 
		return
	echo ftype 
	elseif ftype == "cs"
		if exists("Makefile")
		  let cmd = "!clear; make"
		else 
		  let cmd = "!clear; mcs --parse " . filename
		endif
		echo cmd
		execute cmd
	elseif ftype == "perl"
		let cmd = "!clear; echo \"\"; echo \"\"; perl -cw " . filename
		echo cmd
		execute cmd
	elseif ftype == "javascript"
		let cmd = "!clear; echo \"\"; echo \"\"; smjs " . filename
		execute cmd
	elseif ftype == "ruby"
		let cmd = "!clear; echo \"\"; echo \"\"; /usr/bin/env ruby -c " . filename"
		execute cmd
	else
		echo "Cant syntax check file type : " . ftype
		return
	endif
endfunction

function! Recolor()
	execute ":syntax off"
	execute ":syntax on"
	execute ":color smurf"
endfunction

function! Compileandrun()
	let filename = expand("%")
	let ftype = &filetype
	if ftype == '' 
		return
	elseif ftype == "cs"
		let cmd = "!clear; smake"
		echo cmd
		"execute cmd
	elseif ftype == "perl"
		let cmd = "!clear; echo \"\"; echo \"\"; perl " . filename
		echo cmd
		execute cmd
	elseif ftype == "groovy"
		let cmd = "!clear; echo \"\" echo \"\"; groovy " . filename
		echo cmd
		execute cmd
	elseif ftype == "python"
		let cmd = "!clear; echo \"\"; echo \"\"; ./" . filename
		echo cmd
		execute cmd
	elseif ftype == "ruby" 
		let cmd = "!clear; echo \"\"; echo \"\"; ruby " . filename
		echo cmd
		execute cmd
	elseif ftype == "tcl"
		let cmd = "!clear; echo\"\"; echo \"\"; /usr/bin/tclsh " . filename
		echo cmd
		execute cmd
  elseif ftype == "sh"
    let cmd = "!clear; echo\"\"; echo \"\"; bash " . filename
    echo cmd
    execute cmd
  elseif ftype == "javascript"
    let cmd = "!clear; echo\"\"; echo \"\"; nodejs " . filename
    echo cmd
    execute cmd
  elseif ftype == "fish"
    let cmd = "!clear; echo\"\"; echo \"\"; fish " . filename
    echo cmd
    execute cmd
	else 
		echo "Not sure how i'm supposed to run a file of " . ftype ." type"
	endif
	"call cmd
endfunction

execute pathogen#infect()

call plug#begin()
" 
" Starting point for Plugins:
"
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'mattn/vim-lsp-settings'
Plug 'hashivim/vim-terraform'
call plug#end()

if executable('terraform-ls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'terraform-ls',
        \ 'cmd': {server_info->['terraform-ls', 'serve']},
        \ 'whitelist': ['terraform','tf'],
        \ })
endif

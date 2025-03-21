" 
" These are my vim keybinds, and some custom functions
"
let g:loaded_netrw =1 
let g:loaded_netrw_Plugin = 1
let g:loaded_netrw_Settings = 1
let g:loaded_netrw_FileHandlers = 1

let s#buffer_height=4

" Some viMux defaults that we tweak
let g:VimuxOrientation = "v"
let g:VimuxHeight = "10"
let g:VimuxUseNearest = 0

noremap <silent> <leader>r :VimuxPromptCommand<CR>
noremap <silent> <leader>w :Buffers<CR>
noremap <silent> <leader>c :VimuxCloseRunner<CR>

let g:VimuxCloseOnExit = 1
"let g:ft_handler_vim="smurfscript#ft_runner_vim"

":function! smurfscript#ft_runner_vim(file)
"  if a:file ==# "smurfscript.vim" 
"    echo "Can't reload these functions"
"    return
"  endif
"  execute("so " .a:file)
"  echo "Reloaded file"
"endfunction

" this function determins if there's a g:ft_handler_<filetype> function
" if so, it will call the function to handle how to run the filetype.
:function! smurfscript#RunScript(file)
  let l:handler="g:ft_handler_" . &filetype
  if exists(l:handler)
    let l:function = eval(l:handler)
    
    let s:ft_function="call " . l:function . "(\"" . a:file . "\")"
    execute s:ft_function
    return
  else
    echo "No handler found for this filetype"
  endif
endfunction

map <c-r> :call smurfscript#RunScript(expand('%'))<CR>

so ~/.vim/smurfscript/handlers.vim

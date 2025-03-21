" 
" These are the custome handlers
"

" This functon needs to exist here so we can convert the 
" function to a string to pass back to our handler
"

:function! s:run_cmd(command) 
  if exists('g:loaded_vimux') 
    call VimuxRunCommand(a:command)
  else 
    execute("belowright term " . a:command)
  endif
  echo "Command Completed: " . a:command
endfunction

:function! s:get_fn(function) 
  let l:FunctionRef = function(a:function)
  let l:func_string = string(l:FunctionRef)
  let l:func_name = substitute(l:func_string, "^function('\\(.*\\)')$", "\\1", "")
  return l:func_name 
endfunction

" First we setup the functions we want
:function! s:ft_runner_sh(file)
  call s:run_cmd( "bash " . a:file )
endfunction

:function! s:ft_runner_perl(file)
  call s:run_cmd( "perl " . a:file )
endfunction

:function! s:ft_runner_ruby(file)
  call s:run_cmd( "ruby " . a:file )
endfunction

" Next we add the bindings for the handler to pickup
let g:ft_handler_sh    = s:get_fn("s:ft_runner_sh")
let g:ft_handler_perl  = s:get_fn("s:ft_runner_perl")
let g:ft_handler_ruby  = s:get_fn("s:ft_runner_ruby")


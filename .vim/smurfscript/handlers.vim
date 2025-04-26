" 
" These are the custome handlers
"

" This functon needs to exist here so we can convert the 
" function to a string to pass back to our handler
"

:function! s:run_cmd(command) 
  if ( exists('g:loaded_vimux') && !empty($TMUX) ) 
    call VimuxRunCommand(a:command)
  else 
"    execute("belowright term " . a:command)
    call s:RunInTerminal(a:command)
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

command! -nargs=1 RunInTerminal silent call s:RunInTerminal(<q-args>)
command! -nargs=? MakeInTerminal silent call s:MakeInTerminal(<q-args>)

function s:RunInTerminal(cmd)
  let l:options = {'term_name': '!' .. a:cmd}
  const l:orig_winid = win_getid()
  if win_gotoid(s:term_winid) == 1
    let l:options['curwin'] = 1
  endif
  call term_start([&g:shell, &g:shellcmdflag, a:cmd], l:options)
  let s:term_winid = win_getid()
  call win_gotoid(l:orig_winid)
endfunction

if !exists('s:term_winid')
  let s:term_winid = 0
endif

function s:MakeInTerminal(args)
  const l:cmd = expandcmd(&makeprg) .. (a:args == '' ? '' : ' ' .. a:args)
  call s:RunInTerminal(l:cmd)
endfunction

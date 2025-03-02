set t_Co=256
colorscheme iceberg
set noshowmode

set termguicolors " full truecolor support for vim doh!

let s:foreground = "#c5c8c6"
let s:background = '#44475a'
let s:highlight = '#373b41'
let s:comment = '#969896'
let s:grey    = '#282a2e'
let s:red = '#cc6666'
let s:orange='#f0c674'
let s:yellow='#b5bd68'
let s:green='#B5DB68'
let s:aqua='#8abeb7'
let s:blue='#81a2be'
let s:purple='#b294bb'
let s:pane='#4d5057'
let s:pink = '#afdf00'
let s:olive = '#dfaf5f'
let s:navy = '#df875f'
let s:aqua = '#3e999f'

let s:SetStatusLine         = 'hi StatusLine         cterm=NONE ctermbg=8 guibg=' . s:background . ' ctermfg=8 guifg=' . s:foreground
let s:SetStatusLineNC       = 'hi StatusLineNC       cterm=NONE ctermbg=0 guibg=' . s:background . ' ctermfg=8 guifg=' . s:foreground
let s:SetStatusLineSection  = 'hi StatusLineSection  cterm=NONE ctermbg=8 guibg=' . s:yellow     . ' ctermfg=8 guifg=' . s:grey
let s:SetStatusLineSectionV = 'hi StatusLineSectionV cterm=NONE ctermbg=8 guibg=' . s:blue       . ' ctermfg=8 guifg=' . s:grey
let s:SetStatusLineSectionI = 'hi StatusLineSectionI cterm=NONE ctermbg=8 guibg=' . s:orange     . ' ctermfg=8 guifg=' . s:grey
let s:SetStatusLineSectionC = 'hi StatusLineSectionC cterm=NONE ctermbg=8 guibg=' . s:blue       . ' ctermfg=8 guifg=' . s:grey
let s:SetStatusLineSectionR = 'hi StatusLineSectionR cterm=NONE ctermbg=8 guibg=' . s:red        . ' ctermfg=8 guifg=' . s:grey

let g:mode_colors = {
      \ 'n':  'StatusLineSection',
      \ 'v':  'StatusLineSectionV',
      \ '^V': 'StatusLineSectionV',
      \ 'i':  'StatusLineSectionI',
      \ 'c':  'StatusLineSectionC',
      \ 'r':  'StatusLineSectionR'
      \ }

fun! StatusLineRenderer()
  let hl = '%#' . get(g:mode_colors, tolower(mode()), g:mode_colors.n) . '#'

  return hl
        \ . (&modified ? ' + │' : '')
        \ . ' %{StatusLineFilename()} %#StatusLine#%='
        \ . hl
        \ . ' %l:%c '
endfun

fun! StatusLineFilename()
  if (&ft ==? 'netrw') | return '*' | endif
  return substitute(expand('%'), '^' . getcwd() . '/\?', '', 'i')
endfun

fun! <SID>StatusLineHighlights()
  " getting this work with variables was a bit of a pain
  execute s:SetStatusLine
  execute s:SetStatusLineNC
  execute s:SetStatusLineSection
  execute s:SetStatusLineSectionV
  execute s:SetStatusLineSectionI
  execute s:SetStatusLineSectionC
  execute s:SetStatusLineSectionR
endfun

call <SID>StatusLineHighlights()

" only set default statusline once on initial startup.
" ignored on subsequent 'so $MYVIMRC' calls to prevent
" active buffer statusline from being 'blurred'.
if has('vim_starting')
  let &statusline = ' %{StatusLineFilename()}%= %l:%c '
endif


augroup vimrc
  au!
  " show focussed buffer statusline
  au FocusGained,VimEnter,WinEnter,BufWinEnter *
    \ setlocal statusline=%!StatusLineRenderer()

  " show blurred buffer statusline
  au FocusLost,VimLeave,WinLeave,BufWinLeave *
    \ setlocal statusline&

  " restore statusline highlights on colorscheme update
  au Colorscheme * call <SID>StatusLineHighlights()
augroup END


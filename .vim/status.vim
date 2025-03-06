set t_Co=256
colorscheme iceberg
set noshowmode
set background=dark
set laststatus=2

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
let s:inactive = '#3c4452'
let s:inactive_fg = '#7d8085'

let s:SetStatusLine         = 'hi StatusLine         gui=NONE cterm=NONE ctermbg=8 guibg=' . s:background . ' ctermfg=8 guifg=' . s:foreground
let s:SetStatusLineNC       = 'hi StatusLineNC       gui=NONE cterm=NONE ctermbg=0 guibg=' . s:background . ' ctermfg=8 guifg=' . s:foreground
let s:SetStatusLineSection  = 'hi StatusLineSection  gui=NONE cterm=NONE ctermbg=8 guibg=' . s:blue       . ' ctermfg=8 guifg=' . s:grey
let s:SetStatusLineSectionV = 'hi StatusLineSectionV gui=NONE cterm=NONE ctermbg=8 guibg=' . s:yellow     . ' ctermfg=8 guifg=' . s:grey
let s:SetStatusLineSectionI = 'hi StatusLineSectionI gui=NONE cterm=NONE ctermbg=8 guibg=' . s:aqua       . ' ctermfg=8 guifg=' . s:grey
let s:SetStatusLineSectionC = 'hi StatusLineSectionC gui=NONE cterm=NONE ctermbg=8 guibg=' . s:orange     . ' ctermfg=8 guifg=' . s:grey
let s:SetStatusLineSectionR = 'hi StatusLineSectionR gui=NONE cterm=NONE ctermbg=8 guibg=' . s:red        . ' ctermfg=8 guifg=' . s:grey
let s:SetStatusInactive     = 'hi StatusInactive     gui=NONE cterm=NONE ctermbg=8 guibg=' . s:inactive        . ' ctermfg=8 guifg=' . s:inactive_fg



let g:mode_colors = {
      \ 'n':  'StatusLineSection',
      \ 'v':  'StatusLineSectionV',
      \ '^V': 'StatusLineSectionV',
      \ 'i':  'StatusLineSectionI',
      \ 'c':  'StatusLineSectionC',
      \ 'r':  'StatusLineSectionR'
      \ }

let g:mode_string = {
      \ 'n':  ' N ',
      \ 'v':  ' V ',
      \ '^V': ' V ',
      \ 'i':  ' I ',
      \ 'c':  ' C ',
      \ 'r':  ' R: '
      \ }

fun! StatusLineRenderer()
  let mode_hl = '%#' . get(g:mode_colors, tolower(mode()), g:mode_colors.n) . '#' " Default Highlight(n)
  let def_hl  = '%#StatusLine#'
  let custom  = '%#StatusTest#'
  let edit_mode = "none"
  let edit_mode  = get(g:mode_string, tolower(mode()),'N')
  return mode_hl
        \ . edit_mode
        \ . def_hl
        \ . ' %{StatusLineFilename()} '
        \ . def_hl
        \ . (&modified ? '[modified]' : '')
        \ . '%#StatusLine#%= '
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
  execute s:SetStatusInactive
endfun

call <SID>StatusLineHighlights()

" only set default statusline once on initial startup.
" ignored on subsequent 'so $MYVIMRC' calls to prevent
" active buffer statusline from being 'blurred'.
if has('vim_starting')
  "echo s:SetStatusInactive
  let &statusline = '%#StatusInactive# %{StatusLineFilename()}%=  %l:%c '
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

"
" Starting point for Plugins:
"
set t_Co=256
set termguicolors " full truecolor support for vim doh!
set background=dark
colorscheme iceberg
set laststatus=2
let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}

let s:foreground = '#282a2e'
let s:background = '#44475a'

let s:highlight = '#373b41'
let s:status_line = s:background
let s:comment = '#969896'
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

" Basics:
let s:window = '#efefef'
let s:status = s:background
let s:error = '#5f0000'

" Tabline:
let s:tabline_bg = '#3a3a3a'
let s:tabline_active_fg = '#1c1c1c'
let s:tabline_active_bg = '#00afaf'
let s:tabline_inactive_fg = '#c6c6c6'
let s:tabline_inactive_bg = '#585858'

" Statusline:
let s:statusline_active_fg = '#c5c8c6'
let s:statusline_active_bg = s:background

let s:statusline_inactive_fg = '#c6c6c6'
let s:statusline_inactive_bg = s:background

" Visual:
let s:visual_fg = '#000000'
let s:visual_bg = '#8787af'

"let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}, 'command': {} }
let s:p.normal.left = [ [ s:foreground, s:yellow ], [ s:statusline_active_fg, s:status ], [ s:statusline_active_fg, s:statusline_active_bg ] ]
let s:p.normal.right = [ [ s:foreground, s:background ], [ s:statusline_active_fg, s:status ], [ s:statusline_active_fg, s:statusline_active_bg ] ]
let s:p.normal.middle = [ [ s:statusline_active_fg, s:statusline_active_bg ]]
let s:p.inactive.right = [ [ s:foreground, s:background ], [ s:foreground, s:background ] ]
let s:p.inactive.left = [ [ s:foreground, s:background ], [ s:foreground, s:background ] ]
let s:p.inactive.middle = [ [ s:foreground, s:background ], ]
let s:p.insert.left = [ [ s:foreground, s:orange], [ s:statusline_active_fg, s:status ], [ s:statusline_active_fg, s:statusline_active_bg ] ]
let s:p.command.left = [ [ s:foreground, s:purple], [ s:statusline_active_fg, s:status ], [ s:statusline_active_fg, s:statusline_active_bg ] ]
let s:p.replace.left = [ [ s:background, s:pink ], [s:statusline_active_fg, s:status ], [ s:statusline_active_fg, s:statusline_active_bg ] ]
let s:p.visual.left = [ [ s:visual_fg, s:visual_bg ], [s:statusline_active_fg, s:status ], [ s:statusline_active_fg, s:statusline_active_bg ] ]
let s:p.tabline.left = [ [s:tabline_inactive_fg, s:tabline_inactive_bg ]]
let s:p.tabline.tabsel = [ [s:tabline_active_fg, s:tabline_active_bg ] ]
let s:p.tabline.middle = [ [s:tabline_bg, s:tabline_bg]]
let s:p.tabline.right = copy(s:p.normal.right)

let s:p.normal.error = [ [ s:background, s:error ] ]

" Check if we have lightline available, if we do we'll use it, otherwise 
" we will fall back to setting up our own status line
if !empty(glob("~/.vim/plugged/lightline.vim/autoload") )
  let g:lightline#colorscheme#custom#palette = lightline#colorscheme#fill(s:p)
  let g:lightline = {
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'readonly', 'filename', 'modified' ] ],
    \ },
    \ 'mode_map': {
        \ 'n' : 'N',
        \ 'i' : 'I',
        \ 'R' : 'R',
        \ 'v' : 'V',
        \ 'V' : 'VL',
        \ "\<C-v>": 'VB',
        \ 'c' : 'C',
        \ 's' : 'S',
        \ 'S' : 'SL',
        \ "\<C-s>": 'SB',
        \ 't': 'T',
        \ },
      \ 'colorscheme': 'custom',
      \ }
else
  echo "Nope"
endif

syntax on
set noshowmode


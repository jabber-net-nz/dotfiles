" local syntax file - set colors on a per-machine basis:
" vim: tw=0 ts=4 sw=4
" Vim color file
" Maintainer:	Leon Strong (icesmurf@nexus.proz.ac.nz)
" Last Change:	2003 May 02

set bg=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let colors_name = "smurf"
hi Normal		guifg=cyan	guibg=black ctermfg=grey
hi NonText		guifg=brown	ctermfg=darkblue
hi comment		guifg=green ctermfg=darkyellow
hi constant		guifg=cyan	gui=bold ctermfg=darkmagenta
hi identifier	guifg=cyan	gui=NONE ctermfg=darkcyan
hi statement	guifg=lightblue	gui=NONE ctermfg=darkgreen
hi preproc		guifg=Pink2					ctermfg=lightred
hi type			guifg=seagreen	gui=bold	ctermfg=darkblue
hi special		guifg=yellow				ctermfg=darkred
hi ErrorMsg		guifg=Black	guibg=Red
hi WarningMsg	guifg=Black	guibg=Green
hi Error		guibg=Red
hi Todo			guifg=Black	guibg=orange
hi Cursor      guifg=#000020 guibg=#ffaf38 ctermfg=blue ctermbg=brown
hi lCursor     guifg=#ffffff guibg=#000000 ctermfg=blue ctermbg=darkgreen

hi Search		guibg=lightslateblue	ctermbg=yellow
hi IncSearch	gui=NONE guibg=steelblue
hi LineNr		guifg=darkgrey
hi title		guifg=darkgrey
hi StatusLineNC	gui=NONE guifg=lightblue guibg=darkblue
hi StatusLine	cterm=BOLD	guifg=cyan	guibg=blue ctermfg=black ctermbg=darkcyan
hi label		guifg=gold2		ctermfg=white
hi operator		guifg=orange ctermfg=darkred
hi clear Visual
"hi Visual		term=reverse cterm=reverse gui=reverse
hi Visual       guifg=#8080ff guibg=fg      gui=reverse             ctermfg=lightblue ctermbg=fg cterm=reverse
hi VisualNOS    guifg=#8080ff guibg=fg      gui=reverse,underline   ctermfg=lightblue ctermbg=fg cterm=reverse,underline

hi DiffChange   guibg=darkgreen
hi DiffText		guibg=olivedrab
hi DiffAdd		guibg=slateblue
hi DiffDelete   guibg=coral
hi Folded		guibg=gray30	ctermbg=darkblue ctermfg=grey
hi FoldColumn	guibg=gray30 guifg=white ctermbg=darkcyan
hi cIf0			guifg=gray ctermfg=red


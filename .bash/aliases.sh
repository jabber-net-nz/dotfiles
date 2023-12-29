#
# Custom alias setup
#
alias l="ls -a"
alias ls="\ls -F --color -sh"
alias rm="rm -v"
alias vi=vim

alias gzcat=zcat
alias gzgrep=zgrep
alias cat='batcat -p'

alias ssh="ssh -C"
alias grep="egrep --color=never"

alias stresc='sed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[m|K]//g"'
alias pbcopy='xclip -selection clipboard'
alias more=less
alias ls="exa -F --group-directories-first"
alias tree="tree -d"

[ -e /usr/bin/btop ] && alias btop="btop -lc" && alias top="btop"

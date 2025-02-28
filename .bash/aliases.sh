#
# Custom alias setup
#
alias l="ls -a"
alias ls="\ls -F --color -sh"
alias rm="rm -v"
alias vi=vim

alias gzcat=zcat
alias gzgrep=zgrep

alias ssh="ssh -C"
alias grep="egrep --color=never"

alias stresc='sed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[m|K]//g"'
alias pbcopy='xclip -selection clipboard'
alias more=less
alias less=cat
alias tree="tree -d"

[ -e /usr/bin/exa    ] && alias ls="exa -F --group-directories-first"
[ -e /usr/bin/curlie ] && alias curl="curlie"
# setup some defaults if batcat exists
if [ -e /usr/bin/batcat ] ; then 
  export BAT_THEME="Coldark-Dark"
  alias cat='batcat -p'
  export MANPAGER="sh -c 'col -bx | batcat -l man -p'"
  export MANROFFOPT="-c"
fi

[ -e /usr/bin/btop   ] && alias btop="btop -lc" && alias top="btop"

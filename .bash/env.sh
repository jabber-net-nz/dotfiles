export EDITOR=vim
export CYN="%{\e[00;36m%}"
export HCYN="%{\e[01;36m%}"
export WHT="%{\e[00;30m%}"
export COLOR3="%{\e[00;31m%}"
export CLR="%{\e[00;37m%}"
export CLR="%{\e[00m%}"
export GRN="%{\e[00;32m%}"
export TITLE="%{\e]0;wibble\e007%}"
export GREP_COLOR="00;36"
export PERLDOC_PAGER="less -+C -r"
[ -x "$(command -v pygmentize)"  ] && export LESSOPEN="|pygmentize -f terminal256 -Ostyle=native -g %s"
export LESS="-iRFX --shift 5"
export FACTERLIB="/usr/local/etc/facts:$HOME/.facts"


#setenv TERM xterm
export PATH=$PATH:/home/leons/bin:/home/leons/admin-tools/bin
export PATH="$HOME/.tfenv/bin:$PATH"

##
## This file is managed by yadm - it's stored in git
##
##

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

shopt -s checkwinsize

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ]; then
    eval "`dircolors -b ~/.dir_colors`"
    alias ls='ls --color=auto'
fi

source ~/.bash/aliases.sh
source ~/.bash/env.sh
source ~/.bash/historysetup.sh
source ~/.bash/ls_colors.sh
source ~/.bash/term.sh

export HN=`hostname -s`

set_win_title () {
  echo -ne "\033]0; ${USER}@${HN}  `dirs` \007"
}

function setup_wsl() {
  export BROWSER=wslview
  export DOWNLOADS="/mnt/c/Users/icesm/Downloads"
  #export PROMPT_COMMAND='printf "\e]9;9;%s\e\\" "$(wslpath -m "$PWD")"'
}

function setup_direnv() {
  eval "$(direnv hook bash)"
}

function setup_starship() {
  eval "$(starship init bash)"
  starship_precmd_user_func="set_win_title"
}

[ -e $HOME/.rvm/scripts/rvm ]  && source "$HOME/.rvm/scripts/rvm"
[ -e ~/.bash/completions.sh ]  && source ~/.bash/completions.sh
[ -e /usr/bin/wslpath ]        && setup_wsl 
[ -e /usr/bin/direnv ]         && setup_direnv
[ -e /usr/local/bin/starship ] && setup_starship
[ -e /usr/bin/keychain ]       && eval `keychain --eval --agents ssh id_rsa -q`

#export PROMPT_COMMAND=${PROMPT_COMMAND:+"$PROMPT_COMMAND; "}'printf "\e]9;9;%s\e\\" "$(wslpath -w "$PWD")"'

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

DOCKER_REMOTE_HOST=twibbles.dyn.homenet

function sshcleanup() {
  echo "Cleaning up"
  ssh -qNT -S docker-ctrl-socket -O exit "${DOCKER_REMOTE_HOST}" 
  rm -f /tmp/docker.sock
}

function dockerssh() {
  rm -f /tmp/docker.sock
  trap "sshcleanup" EXIT
  ssh -M -S docker-ctrl-socket -fnNT -L /tmp/docker.sock:/var/run/docker.sock "${DOCKER_REMOTE_HOST}"
  DOCKER_HOST=unix:///tmp/docker.sock eval "$*"
}

shopt -s direxpand

export DIRENV_LOG_FORMAT=" $(tput setaf 7)$(tput dim)[direnv]$(tput sgr0) $(tput setaf 7)$(tput bold)%s$(tput sgr0)"

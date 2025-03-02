##
## This file is managed by yadm - it's stored in git
##

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

shopt -s checkwinsize

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ]; then
    [ -e ~/.dircolors ] && eval "`dircolors -b ~/.dircolors`"
    alias ls='ls --color=auto'
fi

source ~/.bash/aliases.sh
source ~/.bash/env.sh
source ~/.bash/historysetup.sh
source ~/.bash/term.sh
source ~/.bash/jq_colors.sh

export HN=`hostname -s`

set_win_title () {
  echo -ne "\033]0; ${USER}@${HN}  `dirs` \007"
}

function setup_wsl() {
  export BROWSER=wslview
  export DOWNLOADS="/mnt/c/Users/icesm/Downloads"
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
[ -e ~/.bash/node_ca.sh ] && source ~/.bash/node_ca.sh
[ -x "$(command -v wslpath)" ] && setup_wsl
[ -x "$(command -v direnv)"  ] && setup_direnv
[ -x "$(command -v keychain)"  ] && eval `keychain --eval --agents ssh id_rsa -q`
[ -x "$(command -v fzf)" ] && eval "$(fzf --bash)"

if [ -x "$(command -v starship)"  ] then 
  setup_starship
else
  ## 256 color terminal, make sure you have putty setup
  ## for it!
  C_HOST=$(tput setaf 36)
  C_USER=$(tput setaf 67)
  C_DIR=$(tput setaf 142)
  C_IN=$(tput setaf 243)
  RESET="\033[m"

  # if we have facter, we'll add some info to our prompt so we know
  # what we're logged into.
  C_PREFIX=""

  if [ -e /opt/puppetlabs/bin/facter ] ; then
    OS_FAMILY=$(/opt/puppetlabs/bin/facter os.family)
    OS_RELEASE=$(/opt/puppetlabs/bin/facter os.release.full)
    C_PREFIX="\[$C_HOST\][\[$C_USER\]$OS_FAMILY\[$C_HOST\]/\[$C_USER\]$OS_RELEASE\[$C_HOST\]] "
  fi

  export PS1="$C_PREFIX\[$C_HOST\][\h] \[$C_USER\][\u] \[$C_DIR\]\w\n\[$C_IN\]\$\[$RESET\] "
fi

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
export BW_SESSION="nHjp+j3QaaS8ceffgbhfLQpw9vscA7Rxxu0I9SBOGafnMq6PiwapfAmH4OpntF3jP4INVgy3fQjUYgbcveHeRQ=="

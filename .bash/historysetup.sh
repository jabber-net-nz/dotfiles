# don't put duplicate lines in the history. See bash(1) for more options

export HISTCONTROL=ignoredups
export HISTCONTROL=ignoreboth
#export HISTTIMEFORMAT="%c "
export HISTTIMEFORMAT="%F,%T "

shopt -s histappend

function UpdateHistory
{
	# this is basically to keep things synced across multiple terminals
	history -n
	history -a # append unwritten stuff
}

PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND ; }" UpdateHistory


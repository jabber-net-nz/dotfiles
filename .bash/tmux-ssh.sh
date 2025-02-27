tmux popup \ 
SSH_HOST=`cat ~/hostlist.txt | fzf --margin 2 --no-scrollbar --header='Choose Host - CTRL-c or ESC to quit' --info=hidden  --header-first --reverse`
if [ ! -z $SSH_HOST ]; then
  echo ""
  tmux new-window -n "$SSH_HOST" ssh $SSH_HOST
else 
  tmux display-message " ** no host selected $SSH_HOST"
fi

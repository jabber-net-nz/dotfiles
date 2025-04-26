#
declare -A rails_panes # Declare our hash to start with.

if [ "$TMUX_PANE " == " " ]; then
  echo "Not running in tmux doh!"
  exit 
fi

# see if we've loaded our rails stuff.
RAILS_PANES_LOADED=`tmux show -wqv @rails_panes_loaded`

if [ "${RAILS_PANES_LOADED}" == "" ] ; then
  tmux set -wq @rails_panes_loaded 1
else
  echo "Rails panes already active!"
  exit
fi

# First we split horizontally, and name our resulting pane
rails_panes["server"]=`tmux split-window -dPF "#{pane_id}" -l "40%" -h rails server`

# set some tmux user variables so we can close stuff down.

tmux set -wq @rails_server_pane_id "${rails_panes['server']}"

rails_panes['console']=`tmux split-window -dPF "#{pane_id}" -v -P -t "${rails_panes['server']}" rails console`
rails_panes['shell']=`tmux split-window -dPF "#{pane_id}" -v -P -t "${rails_panes['console']}" bash`

tmux set -wq @rails_console_pane_id "${rails_panes['console']}"
tmux set -wq @rails_shell_pane_id "${rails_panes['shell']}"

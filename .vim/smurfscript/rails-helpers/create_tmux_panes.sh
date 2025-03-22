#
declare -A rails_panes # Declare our hash to start with.

rails_panes['mine']=$TMUX_PANE

# First we split horizontally, and name our resulting pane
rails_panes["server"]=`tmux split-window -dPF "#{pane_id}" -l "40%" -h bash`
rails_panes['console']=`tmux split-window -dPF "#{pane_id}" -v -P -t "${rails_panes['server']}" bash`

tmux list-panes -F '{ "active": #{pane_active}, "index": #{pane_index}, "id" : "#{pane_id}" }'

#tmux kill-pane -t $RAILS_CONSOLE
#tmux kill-pane -t $RAILS_SERVER


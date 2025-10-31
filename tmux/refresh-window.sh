tmux list-windows -F "#{window_id}" | while read -r i; do tmux respawn-window -k -t "$i"; done

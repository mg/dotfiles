set -g mouse on
bind -n WheelUpPane if-shell -F -t = "#{mouse_any_flag}" "send-keys -M" "if -Ft= '#{pane_in_mode}' 'send-keys -M' 'select-pane -t=; copy-mode -e; send-keys -M'"
bind -n WheelDownPane select-pane -t= \; send-keys -M

set -s escape-time 1
set -g prefix C-a
unbind C-b

bind | split-window -h
bind - split-window -v

set -g default-terminal "screen-256color"

setw -g window-status-attr dim
setw -g window-status-current-attr bright

set -g status-utf8 on
set -g status-right "%d %b %R"
set -g status-justify centre

setw -g monitor-activity on
set -g visual-activity on

bind P pipe-pane -o "cat >>~/#S.#W.#P.log" \; display "Logging to ~/#S.#W.#P.log"

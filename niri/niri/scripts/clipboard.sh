PLACEHOLDER="Search clipboard history"
PROMPT="󱉨  "

pkill fuzzel 
cliphist list | fuzzel  --match-mode fzf --dmenu -w 100 -p "$PROMPT" --placeholder="$PLACEHOLDER" | cliphist decode | wl-copy

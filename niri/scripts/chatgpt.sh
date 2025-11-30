#!/usr/bin/env bash

pkill fuzzel

BROWSER="/usr/bin/google-chrome-stable"
XARGS="/usr/bin/xargs"
PROMPT="󰻞  "
PLACEHOLDER="ask chatgpt"
SEARCHENGINE="https://chat.openai.com/?q={}"

echo | /usr/bin/fuzzel --dmenu -w 100 -p "$PROMPT" --lines 0 --placeholder "$PLACEHOLDER" | $XARGS -r -I {} $BROWSER --app="$SEARCHENGINE" 


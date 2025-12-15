#!/usr/bin/env bash

pkill fuzzel

BROWSER="/usr/bin/google-chrome-stable"
PROMPT="󰊭  "
PLACEHOLDER="Search Google or type URL"
DEFAULT_ENGINE="https://www.google.com/search?q="

# Define bang → search engine mappings
declare -A ENGINES=(
	["!gg"]="https://www.google.com/search?q="
	["!ddg"]="https://duckduckgo.com/?q="
	["!yt"]="https://www.youtube.com/results?search_query="
	["!gh"]="https://github.com/search?q="
	["!rd"]="https://www.reddit.com/search/?q="
	["!pb"]="https://pub.dev/packages?q="
	["!pg"]="https://pkg.go.dev/search?q="
	["!dh"]="https://hub.docker.com/search?q="
	["!aur"]="https://aur.archlinux.org/packages?K="
	["!pac"]="https://archlinux.org/packages/?q="
	["!wiki"]="https://wiki.archlinux.org/index.php?search="
)

query=$(echo | /usr/bin/fuzzel --dmenu -w 100 -p "$PROMPT" --lines 0 --placeholder "$PLACEHOLDER")

[ -z "$query" ] && exit 0

# If it's a URL, open directly
if [[ "$query" =~ ^https?:// ]]; then
	exec $BROWSER --app="$query"
fi

# Extract the first word (possible bang)
first_word="${query%% *}"

if [[ ${ENGINES[$first_word]} ]]; then
	# Remove the bang from the query
	search="${query#"$first_word"}"
	url="${ENGINES[$first_word]}${search// /+}"
else
	# Default to Google
	url="${DEFAULT_ENGINE}${query// /+}"
fi

exec $BROWSER --app="$url"

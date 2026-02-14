# integrate tmux
if command -v tmux &> /dev/null; then
  # Only start tmux if not already inside one
  [ -z "$TMUX" ] && exec tmux new-session -A -s main
fi

# --- ZINIT ---

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# --- PLUGINS ---

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab
zinit ice depth=1
zinit light jeffreytse/zsh-vi-mode

# --- SNIPPETS ---

zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
# update index with pkgfile --update
zinit snippet OMZP::command-not-found

# --- COMPLETION ---

autoload -U compinit && compinit
zinit cdreplay -q

# disable case sensitive completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
# highlights selected item in completion list
zstyle ':completion:*' menu select
# RAINBOW ALERT -- add colors to completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
# completion for commands run with sudo
zstyle ':completion::complete:*' gain-privileges 1
# disable the default tab menu in favor of fzf-tab
zstyle ':completion:*' menu no
# enable directory preview for fzf-tab completion
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
# enable preview for zoxide
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'
# rehash after new binary is installed
zstyle ':completion:*' rehash true

# Apply your Catppuccin theme to fzf-tab specifically
zstyle ':fzf-tab:*' fzf-flags \
  --color=bg+:#313244,spinner:#F5E0DC,hl:#F38BA8 \
  --color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC \
  --color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8 \
  --color=selected-bg:#45475A \
  --color=border:#6C7086,label:#CDD6F4

# Show ⏎ when a command doesn't end with newline
PROMPT_EOL_MARK=$'\u23ce'


# --- ALIASES ---

alias ls='eza'
alias sl='eza'
alias l='eza'
alias s='eza'
alias la='eza -la'
alias q='exit'
alias :q='exit'
alias x='clear'
alias lg='lazygit'
alias c='wl-copy'
alias v='nvim'
alias mkdir='mkdir -p'
alias tk='tmux kill-server'
alias zk='zellij kill-all-sessions'

alias gs='git status --short'
alias gd='git diff'
alias gc='git commit'
alias ga='git add'
alias gcl='git clone'
alias gp='git push'
alias gpm='git push -u origin main'
alias cat='bat'
alias car='bat'

alias cr='cargo run'
alias cb='cargo build'
alias cbr='cargo build --release'
alias cbrl='cargo build --release --locked'

alias "dr"="dart run"
alias "fr"="flutter run"

alias "mr"="make run"
alias "mb"="make build"
alias "mbr"="make build-release"

# --- HISTORY ---

HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase

# append to history rather than overwriting
setopt appendhistory
# share history across all zsh sessions at the same time
setopt sharehistory
# dont add commands starting with space to history
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups 
setopt hist_find_no_dups

# --- KEYBINDS ---

bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,spinner:#F5E0DC,hl:#F38BA8 \
--color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC \
--color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8 \
--color=selected-bg:#45475A \
--color=border:#6C7086,label:#CDD6F4"

# --- SHELL INTEGRATIONS ---
eval "$(starship init zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(direnv hook zsh)"
eval "$(fzf --zsh)"

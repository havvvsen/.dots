# if set -q ZELLIJ
# else
#   zellij
# end

function fish_prompt -d "Write out the prompt"
    # This shows up as USER@HOST /home/user/ >, with the directory colored
    # $USER and $hostname are set by fish, so you can just use them
    # instead of using `whoami` and `hostname`
    printf '%s@%s %s%s%s > ' $USER $hostname \
        (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
end

if status is-interactive
    # Commands to run in interactive sessions can go here
    set fish_greeting

end



fish_vi_key_bindings

# if status is-interactive
#     if not set -q TMUX
#         tmux attach-session -t genesis || tmux new-session -s genesis
#     end
# end

starship init fish | source
if test -f ~/.cache/ags/user/generated/terminal/sequences.txt
    cat ~/.cache/ags/user/generated/terminal/sequences.txt
end

alias "ls"="eza"
alias "x"="clear"
alias "c"="wl-copy"
alias "q"="exit"
alias ":q"="exit"
alias "l"="eza"
alias "la"="eza -la"
alias "sl"="eza"
alias "lg"="lazygit"
alias "v"="tmux set-option status;nvim"
alias "mkdir"="mkdir -p"
alias "tk"="tmux kill-server"
alias "zk"="zellij kill-all-sessions"

alias "gs"="git status --short"
alias "gd"="git diff"
alias "gc"="git commit"
alias "ga"="git add"
alias "gcl"="git clone"
alias "gp"="git push"
alias "gpm"="git push -u origin main"
alias "db"="distrobox"
alias "db-init-kali"="distrobox create --name kali -i docker.io/kalilinux/kali-rolling:latest --home /home/tamara/distrobox/kali --init"
alias "db-init-kali"="distrobox create --name kali -i docker.io/kalilinux/kali-rolling:latest --init"
alias "db-init-fedora"="distrobox create --name fedora -i registry.fedoraproject.org/fedora-toolbox:latest"
alias "db-init-gentoo"="distrobox create --name gentoo -i docker.io/gentoo/stage3:latest --home /home/tamara/distrobox/gentoo"
alias "kali"="distrobox enter kali"
alias "gentoo"="distrobox enter gentoo"
alias "fedora"="distrobox enter fedora"
alias "cat"="bat"
alias "car"="bat"

alias "cr"="cargo run"
alias "cb"="cargo build"

alias "dr"="dart run"


export MANPAGER="nvim +Man!"
export EDITOR="nvim"
export _JAVA_AWT_WM_NONREPARENTING=1
export CHROME_EXECUTABLE=google-chrome-stable
export ANDROID_HOME=$HOME/Android/Sdk

fish_add_path $HOME/.spicetify
fish_add_path $HOME/fvm/versions/stable/bin
fish_add_path $HOME/Android/Sdk/cmdline-tools/latest/bin
fish_add_path $HOME/Android/Sdk/platform-tools

fish_add_path $HOME/go/bin
fish_add_path $HOME/.cargo/bin

# Generated for pdtm. Do not edit.
fish_add_path $HOME/.pdtm/go/bin

fish_add_path "/home/tamara/.bun/bin"


# Created by `pipx` on 2025-07-01 08:09:14
set PATH $PATH $HOME/.local/bin
set -Ux PAGER less



zoxide init fish | source

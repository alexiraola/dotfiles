if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -gx CDPATH $CDPATH . ~ ~/Projects
set -gx GPG_TTY $TTY

fish_add_path $HOME/go/bin
fish_add_path $HOME/.config/bin
fish_add_path /usr/local/sbin

alias vim="nvim"

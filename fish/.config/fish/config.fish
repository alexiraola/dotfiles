if status is-interactive
    # Commands to run in interactive sessions can go here
end

eval (brew shellenv)

set -U fish_greeting # disable fish greeting
set -U fish_key_bindings fish_vi_key_bindings

set -Ux EDITOR nvim

set -gx CDPATH $CDPATH . ~ ~/Projects
set -gx GPG_TTY $TTY

fish_add_path $HOME/go/bin
fish_add_path $HOME/.config/bin
fish_add_path /usr/local/sbin

alias vim="nvim"

starship init fish | source

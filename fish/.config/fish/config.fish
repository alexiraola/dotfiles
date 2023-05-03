if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -gx CDPATH $CDPATH . ~ ~/Projects
set -gx GPG_TTY $TTY
set -gx PATH $PATH . ~ $HOME/go/bin

alias vim="nvim"

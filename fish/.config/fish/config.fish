if status is-interactive
    # Commands to run in interactive sessions can go here
end

# eval (brew shellenv)

set -U fish_greeting # disable fish greeting
set -U fish_key_bindings fish_vi_key_bindings

set -Ux EDITOR nvim
set -Ux XDG_CONFIG_HOME $HOME/.config

set -U nvm_default_version v18

set -gx CDPATH $CDPATH . ~ ~/Projects
set -gx GPG_TTY $TTY

fish_add_path $HOME/go/bin
fish_add_path $HOME/.config/bin
fish_add_path /usr/local/sbin
fish_add_path $HOME/development/flutter/bin
fish_add_path $HOME/android-sdk-macosx/platform-tools
fish_add_path $HOME/.deno/bin
fish_add_path $HOME/.local/bin

alias vim="NVIM_APPNAME=lazyvim nvim"
alias nvim-lazyvim="NVIM_APPNAME=lazyvim nvim"
alias ls="eza --icons=always"
alias bat="batcat"

zoxide init --cmd cd fish | source
starship init fish | source

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
/home/alex/.local/bin/mise activate fish | source

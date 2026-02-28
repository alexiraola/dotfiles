if status is-interactive
    # Commands to run in interactive sessions can go here
end

# --- Settings ---
set -U fish_greeting # disable fish greeting
set -U fish_key_bindings fish_vi_key_bindings

set -Ux EDITOR nvim
set -Ux XDG_CONFIG_HOME $HOME/.config
set -U nvm_default_version v18

set -gx CDPATH $CDPATH . ~ ~/Projects
set -gx GPG_TTY (tty)

set -Ux GOPATH $HOME/go

# --- Universal Paths ---
fish_add_path $GOPATH/bin
fish_add_path $HOME/.config/bin
fish_add_path $HOME/.local/bin
fish_add_path $HOME/.deno/bin
fish_add_path $HOME/.nimble/bin
fish_add_path $HOME/.opencode/bin

# --- OS Specific Configuration ---
switch (uname)
    case Darwin
        # Homebrew
        if test -d /opt/homebrew/bin
            /opt/homebrew/bin/brew shellenv | source
        else if test -d /usr/local/bin/brew
            /usr/local/bin/brew shellenv | source
        end

        fish_add_path /usr/local/sbin
        fish_add_path $HOME/development/flutter/bin
        fish_add_path $HOME/android-sdk-macosx/platform-tools
        fish_add_path $HOME/swift-6.0.2/usr/bin
        fish_add_path $HOME/.config/herd-lite/bin
    case Linux
        # Add any Linux-specific paths here if needed
end

# --- Aliases ---
alias vim="NVIM_APPNAME=lazyvim nvim"
alias nvim-lazyvim="NVIM_APPNAME=lazyvim nvim"
alias ls="eza --icons=always"

# --- Tool Initializations ---
if command -q zoxide
    zoxide init --cmd cd fish | source
end

if command -q starship
    starship init fish | source
end

# Bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# Mise
if test -x /usr/bin/mise
    /usr/bin/mise activate fish | source
else if command -q mise
    mise activate fish | source
end

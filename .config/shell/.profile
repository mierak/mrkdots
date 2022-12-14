#!/bin/sh

# Adds `~/.local/bin` to $PATH
export PATH="$PATH:${$(find ~/.local/bin -type d -printf %p:)%%:}"

export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="firefox"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# ~/ Cleanup of home directory
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
export WGETRC="${XDG_CONFIG_HOME:-$HOME/.config}/wget/.wgetrc"
export GOPATH="${XDG_DATA_HOME:-$HOME/.local/share}/go" # stop yay from putting stuff in $HOME
export XINITRC="${XDG_CONFIG_HOME:-$HOME/.config}/x11/.xinitrc"
export GTK2_RC_FILES="${XDG_CONFIG_HOME:-$HOME/.config}/gtk-2.0/gtkrc-2.0"
export GNUPGHOME="${XDG_DATA_HOME:-$HOME/.local/share}/gnupg"
export PASSWORD_STORE_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/password-store"
export NPM_CONFIG_USERCONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/npm/npmrc"
export CUDA_CACHE_PATH="${XDG_CACHE_HOME:-$HOME/.cache}/nv"
export STACK_ROOT="${XDG_DATA_HOME:-$HOME/.local/share}/stack"
export RUSTUP_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/rustup"
export CARGO_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/cargo"
export XAUTHORITY="${XDG_RUNTIME_DIR:-$HOME}/Xauthority"

export __GL_SYNC_DISPLAY_DEVICE="DP-0"

# Adds GO bin to $PATH
export PATH="$PATH:$GOPATH/bin"

# Start graphical server on user's current tty if not already running.
#[ "$(tty)" = "/dev/tty1" ] && ! pidof -s Xorg >/dev/null 2>&1 && exec startx "$XINITRC"

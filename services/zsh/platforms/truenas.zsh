#!/bin/zsh

# TRUENAS platform setup

# Load Linux Common Variables
source "$ZSH_PLATFORMS/linux.zsh"

# Setting Distrobox Backend to Docker
source "$ZSH_ENV/distrobox-docker.env"

# Loading NVM from common
nvm_loadvars

# Loading Dotnet
dotnet_loadvars

# Keychain
zstyle :omz:plugins:keychain identities id_ed25519 B26FD0B0B9666479

unset PYENV_ROOT
unset PYENV_REPO
unset PYENV_BIN
unset PYENV_SHELL

# Plugin Set
# plugins=(profiles aliases brew gpg-agent pass keychain history git git-lfs gitignore ssh tmux zsh-interactive-cd)
# plugins=(profiles aliases brew git git-lfs gitfast ssh tmux zsh-navigation-tools pyenv)
plugins=(profiles aliases brew gitfast ssh tmux zsh-navigation-tools zsh-interactive-cd)
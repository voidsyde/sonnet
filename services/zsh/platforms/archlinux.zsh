#!/bin/zsh

# PLATFORM SETUP & CUSTOMIZATION
# ARCH based distros platform setup

# Load Linux Common Variables
source "$ZSH_PLATFORMS/linux.zsh"

# Load Dotnet Variables
source "$ZSH_ENV/archlinux.env"

# Setting Distrobox Backend to Docker
# source "$ZSH_ENV/distrobox-docker.env"

# Loading ArchLinux Aliases
source "$ZSH_ALIASES/alias_archlinux.zsh"

# Loading NVM from common
nvm_loadvars

# Loading Pyenv from common
pyenv_loadvars

# Loading Dotnet
# dotnet_loadvars

# Keychain
zstyle :omz:plugins:keychain identities id_ed25519 B26FD0B0B9666479

# Welcome Message
MSG="Welcome to $OS_NAME | Detected PLATFORM $PLATFORM | Detected ARCH $ARCH"

# Plugins
# plugins=(profiles aliases git git-lfs gitfast ssh pass tmux zsh-navigation-tools pyenv)
# plugins=(profiles aliases gpg-agent ssh-agent keychain pass history git git-lfs ssh zsh-navigation-tools pyenv)
plugins=(profiles aliases brew history gitfast ssh tmux zsh-navigation-tools pyenv)

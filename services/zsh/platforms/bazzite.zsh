#!/bin/zsh

# PLATFORM SETUP & CUSTOMIZATION
# OSTREE based distros platform setup

# Load Linux Common Variables
source "$ZSH_PLATFORMS/linux.zsh"

# Loading NVM from common
nvm_loadvars

# Loading Pyenv from common
pyenv_loadvars

# Keychain
zstyle :omz:plugins:keychain identities id_ed25519 B26FD0B0B9666479

# Welcome Message
MSG="Welcome to $OS_NAME | Detected PLATFORM $PLATFORM | Detected ARCH $ARCH"

# Plugins
plugins=(profiles aliases gpg-agent ssh-agent keychain pass history git git-lfs ssh zsh-navigation-tools pyenv)

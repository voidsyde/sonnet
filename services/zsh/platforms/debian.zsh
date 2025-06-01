#!/bin/zsh

# PLATFORM SETUP & CUSTOMIZATION
# DEBIAN based distros platform setup

# Load Linux Common Variables
source "$ZSH_PLATFORMS/linux.zsh"

# sorcing additional loaders
source "$ZSH_LOADER/nvm-loader.zsh"
source "$ZSH_LOADER/pyenv-loader.zsh"


# Loading NVM
nvm_loadvars

# Loding PYENV
pyenv_loadvars

# Loading Dotnet
dotnet_loadvars

# Keychain
zstyle :omz:plugins:keychain identities id_ed25519 B26FD0B0B9666479

# Welcome Message
MSG="Welcome to $OS_NAME | Detected PLATFORM $PLATFORM | Detected ARCH $ARCH"

# Plugin Set
if [[ "$USER" == "root" ]]; then
    plugins=(aliases gitfast history ssh tmux zsh-navigation-tools)
elif [[ "$ARCH" == "aarch64" ]]; then
    plugins=(profiles aliases gitfast ssh tmux zsh-navigation-tools pyenv)
else
    # Loading Brew
    brew_loadvars
    # plugins=(profiles aliases gpg-agent ssh-agent keychain git git-lfs gitfast ssh tmux brew pyenv)
    plugins=(profiles aliases brew history gitfast ssh tmux zsh-navigation-tools pyenv)
fi
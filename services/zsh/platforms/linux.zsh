#!/bin/zsh

# PLATFORM SETUP & CUSTOMIZATION
# GENERIC LINUX based distros platform setup

# Load Linux Common Variables
source "$ZSH_ENV/architecture.env"

# Load Editor Information
source "$ZSH_ENV/gtk.env"

# Load Brew Package Manager Related Variables
source "$ZSH_ENV/brew.env"

# Load XDG variables
source "$ZSH_ENV/xdg.env"

# Load GPG variables
source "$ZSH_ENV/gpg.env"

# Load Docker variables
source "$ZSH_ENV/docker.env"

# Load Podman variables
source "$ZSH_ENV/podman.env"

# Load Dotnet Variables
source "$ZSH_ENV/dotnet.env"

# Setting Distrobox Backend to Docker
source "$ZSH_ENV/distrobox-podman.env"

# Setting up Brew
source "$ZSH_LOADER/brew-loader.zsh"

# Setting up NVM Loaders
source "$ZSH_LOADER/nvm-loader.zsh"

# Setting up NVM Loaders
source "$ZSH_LOADER/pyenv-loader.zsh"

# Setting up Dotnet
source "$ZSH_LOADER/dotnet-loader.zsh"

# Remove Brew
# if [[ "$ARCH" == "aarch64" ]]; then
#     plugins=(profiles aliases gpg-agent ssh-agent keychain gitfast ssh tmux last-working-dir pyenv)
# fi

# Default Plugins
plugins=(aliases gitfast history ssh tmux zsh-navigation-tools)
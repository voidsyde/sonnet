#!/bin/sh

# Brew Loader Script
# The function is commonly sourced
# Functions to load nvm are used insider platform setup or profiles plugin

brew_loadvars(){
    source "$ZSH_ENV/brew.env"

    export BREW_XDG_DATA_DIRS="/home/linuxbrew/.linuxbrew/share:$XDG_DATA_DIRS"

    eval "$($HOMEBREW_PREFIX/bin/brew shellenv)"
}
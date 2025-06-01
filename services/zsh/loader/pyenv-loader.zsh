#!/bin/sh

# PyEnv Loader Script
# The function is commonly sourced
# Functions to load nvm are used insider platform setup or profiles plugin

pyenv_loadvars() {
    # Source env set in the variables
    source "$ZSH_ENV/pyenv.env"

    # export TMPDIR="$HOME/.cache/pyenv"
    # export PYENV_VERSION=3.13

    # add bin to path so that it can be used in terminal
    add_to_path "$PYENV_BIN"
    add_to_path "$PYENV_REPO"

    # with pyenv in path we can use its bootstrap
    eval "$(pyenv init --path)"

    # source its zsh completion script
    source $PYENV_REPO/completions/pyenv.zsh
}
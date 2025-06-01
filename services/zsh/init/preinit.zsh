#!/bin/zsh

# echo "In etc/zsh/init/platform.zsh"

source "$ZSH_INIT/common.zsh"

# Detect plugin manager and load the appropriate pre-init script
if [[ -d "$ZSH" ]]; then
    # echo "Using Oh My Zsh"
    source "$ZSH_LOADER/oh-my-zsh.zsh"
elif command -v zinit >/dev/null; then
    # echo "Using zinit"
    source "$ZSH_LOADER/zinit.zsh"
else
    echo "No plugin manager found, running in minimal mode."
fi
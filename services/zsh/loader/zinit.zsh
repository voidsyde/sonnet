#!/bin/zsh

if [[$ZSH_DEBUG == true]] ; then
    echo "In etc/zsh/loader/zinit.zsh"
fi

# Ensure environment variables and platform detection are loaded
source "$ZSH_CUSTOM/env/zsh.env"
source "$ZSH_CUSTOM/utils/platform.zsh"
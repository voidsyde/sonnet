#!/bin/zsh
# brew.zsh - Load Homebrew conditionally

source $ZSH_CUSTOM/utils/platform.zsh  # Import platform detection

load_brew() {
    if [[ "$PLATFORM" != "arch" ]]; then
        echo "Loading Homebrew..."
        eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    else
        echo "Skipping Homebrew on Arch Linux"
    fi
}

load_brew

#!/bin/sh

# PLATFORM DETECTION
# Load platform detection
# Load platform-specific environment variables

# echo "In etc/zsh/init/platform.zsh"

# Load platform detection
source "$ZSH_UTILS/hwinfo.zsh"

# Load platform detection
detect_platform

# Load platform-specific environment variables
case "$PLATFORM" in
    Darwin)
        # Load MacOS Variables
        source "$ZSH_PLATFORMS/macos.zsh"
    ;;
    Linux)
        if [[ "$IS_TRUENAS" == "true" ]]; then
            # Load TrueNAS Variables
            source "$ZSH_PLATFORMS/truenas.zsh"
        elif [[ "$ID_LIKE" == "arch" ]]; then
            if [[ "$ID" == "steamos" ]]; then
                # Load SteamDeck Variables
                source "$ZSH_PLATFORMS/steamdeck.zsh"
            elif [[ "$ID" == "cachyos" ]]; then
                # CachyOS
                # Load CachyOS Variables
                source "$ZSH_PLATFORMS/archlinux.zsh"
            else
                # Load Arch Linux Variables
                source "$ZSH_PLATFORMS/archlinux.zsh"
            fi
        else
            # Load Linux Variables
            source "$ZSH_PLATFORMS/debian.zsh"
        fi
    ;;
esac
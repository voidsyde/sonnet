#!/bin/zsh

echo "Platform Setup"

# Detect platform and load appropriate configurations
case "$(uname)" in
Darwin)
    echo "Running on macOS"
    export PLATFORM="macos"
    eval "$(/opt/homebrew/bin/brew shellenv)" # Adjust for Intel: `/usr/local/bin/brew`

    unset HOMEBREW_CACHE
    unset HOMEBREW_LOGS
    ;;
Linux)
    # Brew cache
    export HOMEBREW_CACHE=/home/linuxbrew/.cache
    export HOMEBREW_LOGS=/home/linuxbrew/.cache

    # XDG Data Setup
    export XDG_CACHE_HOME="$HOME/.cache"
    export XDG_CONFIG_HOME="$HOME/.config"
    export XDG_DATA_HOME="$HOME/.local/share"
    export XDG_STATE_HOME="$HOME/.local/state"
    export XDG_DATA_DIRS="/var/lib/flatpak/exports/share:/home/deck/.local/share/flatpak/exports/share:/home/linuxbrew/.linuxbrew/share:$XDG_DATA_DIRS"

    # Read /etc/os-release to determine distro family
    if [[ -f /etc/os-release ]]; then
        source /etc/os-release

        case "$ID" in

        # Arch Linux
        arch | *arch*)
            echo "Running on Arch Linux, skipping Homebrew"
            export PLATFORM="arch"
            # Compilation flags
            export ARCHFLAGS="-arch $(uname -m)"
            ;;
        # Debian Based Linux
        debian | ubuntu | *debian*)
            echo "Running on Debian-based system"
            export PLATFORM="debian"
            eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
            ;;
        # RHEL Based Linux
        fedora | rhel | centos | rocky | almalinux)
            echo "Running on RHEL-based system (including Fedora)"
            export PLATFORM="rhel"
            eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
            ;;
        *)
            echo "Unknown Linux distribution: $ID"
            export PLATFORM="unknown-linux"
            ;;
        esac
    else
        echo "Could not determine Linux distribution."
        export PLATFORM="unknown-linux"
    fi
    ;;
*)
    echo "Unsupported platform: $(uname)"
    export PLATFORM="unknown"
    ;;
esac

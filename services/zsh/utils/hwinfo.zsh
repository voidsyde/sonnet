#!/bin/bash

# Function to export environment variables
export_variables() {
    export ID_LIKE
    export ID
    export PRETTY_NAME
    export NAME
    export PLATFORM
    export KERNEL_PLATFORM
    export OS_PLATFORM
    export OS
    export VERSION_CODENAME
    export VERSION_ID
    export IS_TRUENAS
    export OS_NAME
}

# Function to detect Linux OS and platform
linux_detection() {
    source /etc/os-release

    # Handle missing ID_LIKE for base distros
    if [[ -z "$ID_LIKE" ]]; then
        ID_LIKE="$ID"
    fi

    PLATFORM="$KERNEL_PLATFORM"  # Preserve original name for backward compatibility
    OS_PLATFORM="$ID_LIKE"
    OS="$ID"
    OS_NAME="$PRETTY_NAME"

    case "$ID_LIKE" in
        arch)
            if [[ -z "$VERSION_CODENAME" ]]; then
                VERSION_CODENAME="${BUILD_ID:-}"
                VERSION_ID="${BUILD_ID:-}"
            fi

            if [[ "$VERSION_CODENAME" == "holo" ]]; then
                OS="steamdeck"
                OS_NAME=$PRETTY_NAME
                VERSION_CODENAME="$VERSION_CODENAME"
            fi
        ;;
        rhel | fedora)
            if [[ "$VARIANT_ID" == "silverblue" || "$VARIANT_ID" == "kinoite" || "$NAME" == "Bazzite" ]]; then
                OS="silverblue"
            else
                OS="rhel"
            fi
        ;;
        suse)
            OS="suse"
        ;;
        debian)
            OS="debian"
        ;;
        *)
            OS="linux"
        ;;
    esac

    # Detect if running on TrueNAS using uname -r
    if [[ "$(uname -r)" == *"truenas"* ]]; then
        IS_TRUENAS="true"
        OS="truenas"
        OS_NAME="TrueNAS Scale"
        elif [[ -f /usr/bin/cli-console ]]; then
        IS_TRUENAS="true"
        OS="truenas"
        OS_NAME="TrueNAS Scale"
    else
        IS_TRUENAS="false"
    fi

    export_variables
}

# Main function to detect platform

detect_platform() {
    # Initialize default variables
    OS="unknown"
    PLATFORM="$(uname -s)"  # Preserved name for backward compatibility
    KERNEL_PLATFORM="$PLATFORM"  # Store original uname -s value
    OS_PLATFORM="unknown"
    VERSION_CODENAME=""
    VERSION_ID=""
    IS_TRUENAS="false"
    OS_NAME="$NAME"

    case "$KERNEL_PLATFORM" in
        Darwin)
            OS="macos"
            export_variables
        ;;
        Linux)
            if [[ -f /etc/os-release ]]; then
                linux_detection
            else
                OS="linux"
                export_variables
            fi
        ;;
    esac
}

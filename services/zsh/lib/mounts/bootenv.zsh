# Base directory for mounting boot environments
BASE_MOUNTPOINT="/mnt"

# Function to handle script termination gracefully
cleanup() {
    echo "Operation interrupted. Cleaning up..."
    sudo umount -l "$PKG_MOUNTPOINT" 2>/dev/null
    sudo umount -l "$MOUNTPOINT" 2>/dev/null
    exit 1
}

# Function to mount a boot environment
mount_be() {
    local be_name="$1"
    local os_dataset="rpool/ROOT/$be_name"
    MOUNTPOINT="$BASE_MOUNTPOINT/$be_name"

    # Create the mountpoint directory if it doesn't exist
    sudo mkdir -p "$MOUNTPOINT"

    # Set mountpoint as legacy and mount the OS dataset
    sudo zfs set mountpoint=legacy "$os_dataset"
    sudo mount -t zfs "$os_dataset" "$MOUNTPOINT"
    echo "Mounted $os_dataset at $MOUNTPOINT"

    # Determine the appropriate package dataset to mount
    case "$be_name" in
        cachyos|steamos)
            local pkg_dataset="rpool/SYSTEM/pkg/cachyos"
            ;;
        arch)
            local pkg_dataset="rpool/SYSTEM/pkg/arch"
            ;;
        *)
            return
            ;;
    esac

    PKG_MOUNTPOINT="$MOUNTPOINT/var/cache/pacman/pkg"
    sudo mkdir -p "$PKG_MOUNTPOINT"
    sudo mount -t zfs "$pkg_dataset" "$PKG_MOUNTPOINT"
    echo "Mounted $pkg_dataset at $PKG_MOUNTPOINT"
}

# Function to unmount a boot environment
unmount_be() {
    local be_name="$1"
    local os_dataset="rpool/ROOT/$be_name"
    MOUNTPOINT="$BASE_MOUNTPOINT/$be_name"

    # Unmount the package dataset if it was mounted
    if mountpoint -q "$PKG_MOUNTPOINT"; then
        sudo umount -l "$PKG_MOUNTPOINT"
        echo "Unmounted package dataset from $PKG_MOUNTPOINT"
    fi

    # Unmount the OS dataset
    sudo umount -l "$MOUNTPOINT"
    echo "Unmounted $os_dataset from $MOUNTPOINT"

    # Reset the mountpoint property based on the boot environment
    case "$be_name" in
        arch|cachyos|steamos)
            sudo zfs set mountpoint="/" "$os_dataset"
            echo "Reset mountpoint for $os_dataset to /"
            ;;
        *)
            sudo zfs set mountpoint=legacy "$os_dataset"
            echo "Set mountpoint for $os_dataset to legacy"
            ;;
    esac
}

# Trap SIGINT (Ctrl+C) to invoke cleanup
trap cleanup SIGINT

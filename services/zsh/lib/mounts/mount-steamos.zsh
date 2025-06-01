source "$ZSH_UTILS/sources.zsh"

mount-steamos() {
    # Create the directory if it doesn't exist
    sudo mkdir -p /mnt/steamos

    # mount at the destination
    sudo mount -t zfs rpool/ROOT/steamos /mnt/steamos

    # Mount Pkgs
    sudo mount -t zfs rpool/SYSTEM/pkg/cachyos /mnt/steamos/var/cache/pacman/pkg
}

unmount-steamos() {
    unmount-disk /mnt/steamos
}

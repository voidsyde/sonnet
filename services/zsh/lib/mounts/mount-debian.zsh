source "$ZSH_UTILS/sources.zsh"

mount-debian() {
    # Create the directory if it doesn't exist
    sudo mkdir -p /mnt/debian

    # mount at the destination
    sudo mount -t zfs rpool/ROOT/debian /mnt/debian

    sudo mount -t zfs rpool/SYSTEM/pkg/deb /mnt/debian/deb
}

unmount-debian() {
    unmount-disk /mnt/debian
}

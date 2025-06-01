source "$ZSH_UTILS/sources.zsh"

mount-fedora() {
    # Create the directory if it doesn't exist
    sudo mkdir -p /mnt/fedora

    # mount at the destination
    sudo mount -t zfs rpool/ROOT/fedora /mnt/fedora
}

unmount-fedora() {
    unmount-disk /mnt/fedora
}

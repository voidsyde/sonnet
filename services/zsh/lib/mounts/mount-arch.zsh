source "$ZSH_UTILS/sources.zsh"

mount-arch() {
    # Create the directory if it doesn't exist
    sudo mkdir -p /mnt/arch

    # mount at the destination
    sudo mount -t zfs rpool/ROOT/arch /mnt/arch

    # Mount Pkgs
    sudo mount -t zfs rpool/SYSTEM/pkg/arch /mnt/arch/var/cache/pacman/pkg
}

unmount-arch() {
    unmount-disk /mnt/arch
}

mount-archlts() {
    # Create the directory if it doesn't exist
    sudo mkdir -p /mnt/archlts

    # mount at the destination
    sudo mount -t zfs rpool/ROOT/arch.lts /mnt/archlts

    # Mount Pkgs
    sudo mount -t zfs rpool/SYSTEM/pkg/arch /mnt/archlts/var/cache/pacman/pkg
}

unmount-archlts() {
    unmount-disk /mnt/archlts
}

source "$ZSH_UTILS/sources.zsh"

mount-cachyos() {
    # Datasets
    CHROOT_OS_DATASET="rpool/ROOT/cachyos"
    PKGS_DATASET="rpool/SYSTEM/pkg/cachyos"

    # Mountpoints
    CHROOT_MOUNTPOINT="/mnt/cachyos"
    CHROOT_PKG_MOUNTPOINT="$CHROOT_MOUNTPOINT/var/cache/pacman/pkg"

    # Create the directory if it doesn't exist
    sudo mkdir -p $CHROOT_MOUNTPOINT

    # Set mountpoint as legacy & mount at the destination
    sudo zfs set mountpoint=legacy "$CHROOT_OS_DATASET"
    sudo mount -t zfs "$CHROOT_OS_DATASET" "$CHROOT_MOUNTPOINT"
    echo "Mounted $CHROOT_OS_DATASET at $CHROOT_MOUNTPOINT"

    # Mount Pkgs
    sudo mount -t zfs rpool/SYSTEM/pkg/cachyos /mnt/cachyos/var/cache/pacman/pkg
    sudo mount -t zfs "$PKGS_DATASET" "$CHROOT_PKG_MOUNTPOINT"
    echo "Mounted $PKGS_DATASET at $CHROOT_PKG_MOUNTPOINT"
}

unmount-cachyos() {
    # Original Mountpoint
    ORIGINAL_MOUNTPOINT="/"

    # Datasets
    CHROOT_OS_DATASET="rpool/ROOT/cachyos"
    PKGS_DATASET=rpool/SYSTEM/pkg/cachyos

    # Unmount
    sudo umount -Rv /mnt/cachyos
    sudo zfs unmount "$CHROOT_OS_DATASET"
    echo "Unmounted $CHROOT_OS_DATASET"

    # Set mountpoint as /
    echo "Setting original mountpoint back for dataset:$CHROOT_OS_DATASET"
    sudo zfs set mountpoint="$ORIGINAL_MOUNTPOINT" $CHROOT_OS_DATASET

    # Print Confirmation
    echo "Done"

}

mount-cachyoslts() {
    # Create the directory if it doesn't exist
    sudo mkdir -p /mnt/cachyoslts

    # mount at the destination
    sudo mount -t zfs rpool/ROOT/cachyos.lts /mnt/cachyoslts

    # Mount Pkgs
    # sudo mount -t zfs rpool/SYSTEM/pkg/cachyos /mnt/arch/var/cachyoslts/pacman/pkg
}

unmount-cachyoslts() {
    sudo umount -Rv /mnt/cachyoslts
}

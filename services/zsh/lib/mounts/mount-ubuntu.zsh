source "$ZSH_UTILS/sources.zsh"

mount-ubuntu() {
    # Create the directory if it doesn't exist
    sudo mkdir -p /mnt/ubuntu

    # mount at the destination
    sudo mount -t zfs rpool/ROOT/ubuntu /mnt/ubuntu

    # sudo mount -t zfs rpool/SYSTEM/pkg/deb /mnt/ubuntu/deb
}

unmount-ubuntu() {
    unmount-disk /mnt/ubuntu
}

mount-ubuntults() {
    # Create the directory if it doesn't exist
    sudo mkdir -p /mnt/ubuntults

    # mount at the destination
    sudo mount -t zfs rpool/ROOT/ubuntu.lts /mnt/ubuntults

    # sudo mount -t zfs rpool/SYSTEM/pkg/deb /mnt/ubuntults/deb
}

unmount-ubuntults() {
    unmount-disk /mnt/ubuntults
}

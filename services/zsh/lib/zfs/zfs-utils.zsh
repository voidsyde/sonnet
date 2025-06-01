zfs-set() {
    PROPERTY=$1
    POOL=$2
    sudo zfs set ${PROPERTY} ${POOL}
}

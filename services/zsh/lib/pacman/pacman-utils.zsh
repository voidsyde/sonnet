# echo "In etc/zsh/exports/pacman.zsh"

pacman-pkg-download() {
sudo pacman -Sw -- $(pacman -Qqn)
}

pacman-pkg-export() {
    # Q - Queries the package database. This option allows you to view installed packages and their files,
    # other useful meta-information about
    # individual packages (dependencies, conflicts, install date, build date, size).

    # q - Shows less information for certain query operations. This is useful when pacman’s output is processed in a script.
    # e - Lists explicitly installed packages that are not required by any other package.
    # pkglist.txt - It is the output file where you store the list of installed files.
    sudo pacman -Qqe | tee -a "$1" >/dev/null
}

pacman-pkg-import() {
    # Just in case, the backup list includes foreign packages, such as AUR packages, remove them first, and then install the rest of packages using command:
    sudo pacman -S $(comm -12 <(pacman -Slq | sort) <(sort "$1"))
    
    # sudo pacman -S --needed $(comm -12 <(pacman -Slq | sort) <(sort pkglist.txt))

    # sudo pacman -S --overwrite '/usr/*' -- $(pacman -Qqn)

    # pacman -Qkk | grep '^warning: Permissions'

    # sudo pacman -S --overwrite '/usr/*' -- $(pacman -Qqn)
}

pacman-reinstall(){
    sudo pacman -S -- $(pacman -Qqn)
}

add_cachyos_repo() {
    sudo tee -a /etc/pacman.conf <<EOF
        # cachyos repos
        [cachyos]
        Include = /etc/pacman.d/cachyos-mirrorlist
EOF
}

add_chaoticaur_repo() {
    sudo tee -a /etc/pacman.conf <<EOF
    # Append (adding to the end of the file) to /etc/pacman.conf:
    [chaotic-aur]
    Include = /etc/pacman.d/chaotic-mirrorlist
EOF
}

pacman-key-receive(){
    sudo pacman-key --recv-key $1 --keyserver keyserver.ubuntu.com && sudo pacman-key --lsign-key $1
}

arch-repos-add() {
    sudo pacman-key --init
    sudo pacman-key --populate
    sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
    sudo pacman-key --lsign-key 3056513887B78AEB
    sudo pacman -U --noconfirm 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
    sudo pacman -U --noconfirm 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
    sudo pacman-key --recv-keys F3B607488DB35A47 --keyserver keyserver.ubuntu.com
    sudo pacman-key --lsign-key F3B607488DB35A47
    sudo pacman -U --noconfirm 'https://mirror.cachyos.org/repo/x86_64/cachyos/cachyos-keyring-20240331-1-any.pkg.tar.zst' \
        'https://mirror.cachyos.org/repo/x86_64/cachyos/cachyos-mirrorlist-18-1-any.pkg.tar.zst' \
        'https://mirror.cachyos.org/repo/x86_64/cachyos/cachyos-v3-mirrorlist-18-1-any.pkg.tar.zst' \
        'https://mirror.cachyos.org/repo/x86_64/cachyos/cachyos-v4-mirrorlist-6-1-any.pkg.tar.zst'

    # CachyOS Repos
    add_cachyos_repo

    # Add Chaotic AUR
    add_chaoticaur_repo
}

pacman-reinstall() {
    sudo pacman -S -- $(pacman -Qqn)
}
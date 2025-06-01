
# Adds System Flathub Repo
fl-addsystemflathub() {
    sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
}

# Adds User Flathub Repo
fl-adduserflathub() {
    flatpak remote-add --if-not-exists --user flathub https://dl.flathub.org/repo/flathub.flatpakrepo
}

fl-install() {
    # python3 $HOME/.local/lib/flatpak/flatpak-install.py
    flatpak install -y flathub "$@"
}

fl-reinstall() {
    python3 $HOME/.local/lib/flatpak/flatpak-reinstall.py
}

fl-repair() {
    flatpak repair
}

fl-search() {
    # python3 $HOME/.local/lib/flatpak/flatpak-search.py "$@"
    flatpak search "$@"
}

fl-uninstall() {
    # python3 $HOME/.local/lib/flatpak/flatpak-uninstall.py "$@"
    flatpak uninstall -y "$@"
}

# Update's both flatpak apps and system apps
fl-update() {
    # python3 $HOME/.local/lib/flatpak/flatpak-update.py
    flatpak --system update -y && flatpak --user update -y
}

# Migrates an app from System's flathub to User's Flathub
fl-migrateto-user(){
    # python3 $HOME/.local/lib/flatpak/flatpak-user.sh
    flatpak --user install -y flathub "$@" && flatpak --system uninstall -y "$@"
}

# Migrates an app from User's flathub to System's Flathub
fl-migrateto-system(){
    # python3 $HOME/.local/lib/flatpak/flatpak-system.sh
    sudo flatpak install -y flathub "$@" && flatpak --user uninstall -y "$@"
}
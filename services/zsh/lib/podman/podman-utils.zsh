enable-podman() {
    sudo systemctl enable --now podman.socket
    sudo systemctl enable --now podman.service
    sudo systemctl enable --now podman-restart.services
    sudo systemctl enable --now podman-clean-transient.service
    sudo systemctl enable --now podman-auto-update.service
    sudo systemctl enable --now podman-auto-update.timer
}

disable-podman() {
    sudo systemctl disable --now podman.socket
    sudo systemctl disable --now podman.service
    sudo systemctl disable --now podman-restart.services
    sudo systemctl disable --now podman-clean-transient.service
    sudo systemctl disable --now podman-auto-update.service
    sudo systemctl disable --now podman-auto-update.timer
}

restart-podman() {
    sudo systemctl restart podman.service
}

stop-podman() {
    sudo systemctl stop podman.service
}

start-podman() {
    sudo systemctl start podman.service
}

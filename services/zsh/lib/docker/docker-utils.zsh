enable-docker() {
    sudo systemctl enable --now docker.socket
    sudo systemctl enable --now docker.service
}

disable-docker() {
    sudo systemctl disable --now docker.service
    sudo systemctl disable --now docker.socket
}

restart-docker() {
    sudo systemctl restart docker.service
}

stop-docker() {
    sudo systemctl stop docker.service
}

start-docker() {
    sudo systemctl start docker.service
}

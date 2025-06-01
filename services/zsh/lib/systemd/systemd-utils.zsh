reload-daemon(){
    sudo systemctl daemon-reload
}

reload-fstab(){
    sudo systemctl daemon-reload && sudo mount -av
}

reload-udev(){
    sudo systemctl daemon-reload && sudo udevadm control --reload && sudo udevadm trigger
}

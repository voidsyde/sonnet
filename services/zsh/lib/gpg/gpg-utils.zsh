gpg-listkeys(){
    gpg --list-secret-keys --keyid-format LONG
}

gpg-reload(){
    gpg-connect-agent reloadagent /bye
}

gpg-restart(){
    gpgconf --kill gpg-agent && gpgconf --launch gpg-agent
}

gpg-keygrip(){
    gpg --with-keygrip -K
}

gpg-recvkeys(){
    gpg --keyserver keyserver.ubuntu.com --recv-keys $1
}
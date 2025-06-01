# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias lsv="la | grep"
alias envs="env | grep"
alias path="echo $PATH"

# Git - Enhanced for automation
alias gitsubmodules="git sub-init"
alias gitpull="git pull-dev"
alias giturl="git remote get-url origin"
alias gitsub-update="git sub-update"
alias gitsub-commit="git sub-commit"
alias gitsync="git sync-all"
alias gitstatus="git status --porcelain"
alias gitclean="git clean -fd"

# distrobox
alias box="distrobox"
alias boxls="distrobox-list"
alias boxrm="distrobox-remove"
alias boxin="distrobox-enter"
alias boxupd="distrobox-update"

# distrobox root
alias boxsuls="boxroot ls"
alias boxsurm="boxroot rm"
alias boxsuin="boxroot rm"

# change user and groups
alias groups-add="sudo usermod -aG cdrom,sudo,wheel,floppy,audio,video,render,input,plugdev,users"
alias rename-user="sudo usermod -l sganti parallels"
alias rename-group="sudo groupmod -n sganti parallels"
alias rename-home="sudo usermod -d /home/sganti -m sganti"

# distrobox boxes
alias box-arch="SHELL=/bin/bash distrobox enter --root arch"
alias box-ubuntu="distrobox enter --root ubuntu"
alias box-noble="SHELL=/bin/bash distrobox enter --root noble"
alias box-jammy="SHELL=/bin/bash distrobox enter --root jammy"
alias box-debian="SHELL=/bin/bash distrobox enter --root debian"
alias box-rhel="SHELL=/bin/bash distrobox enter --root rhel"

# diskinfo
alias disk-info="diskinfo"
alias di="diskinfo"

# vim
alias svim="sudo vim"
alias nim="nano"
alias snim="sudo nano"

# sysctl
alias svim-sysctl="svim /etc/sysctl.d/99-sysctl-custom.conf"

# systemd
alias sdctl="sudo systemctl"
alias status="sds status"
alias usdctl="systemctl --user"
alias ustatus="sdsu status"

# nano
alias snano="sudo nano"

# fstab
alias editftab="svim /etc/fstab"
alias catftab="snano /etc/fstab"

# Reload
alias reld="reload-daemon"
alias relfstab="reload-fstab"
alias rel="reload-zsh"
alias reludev="reload-udev"
alias vj="view-journal"
alias tj="tail-journal"
alias pods="sudo podman"
alias docks="sudo docker"

# distro info
alias osr="cat /etc/os-release"
alias posix="uname"
alias os="echo $OS"
alias shellchange="chsh -s /bin/zsh"

# git
# git submodule add https://github.com/pyenv/pyenv.git
alias gitsubmodules="git submodule update --init --recursive"
alias gitpull="git pull origin develop"
alias giturl="git remote get-url origin"

# flatpak
alias fget="flatpak install -y"
alias fupd="flatpak update -y"
alias frns="flatpak uninstall -y"
alias fsearch="flatpak list | grep"
alias flist="flatpak list"

# brew
alias brns="brew uninstall"
alias bsyyu="brew update && brew upgrade && brew outdated"
alias bss="brew search"
alias bsi="brew info"
alias brs="brew install"

# gpg
# alias gpg-keygrip="gpg --with-keygrip -K"
# alias gpg-listkeys="gpg --list-secret-keys --keyid-format LONG"
# alias gpg-restart="gpgconf --kill gpg-agent && gpgconf --launch gpg-agent"
# alias gpg-reload="gpg-connect-agent reloadagent /bye"

# Selinux
# alias avc-recent="sudo ausearch -m avc -ts recent"

# Path - Quick Switcher
alias devenv="cd $HOME/.local"
alias svg="cd $HOME/.local/lib/assets/SVG"
alias png="cd $HOME/.local/lib/assets/PNG"
alias appdata="cd /mnt/zfspool/appdata"
alias zfspool="cd /mnt/zfspool"
alias vmzfspool="cd /mnt/vmzfspool"
alias steamapps="cd $HOME/.local/Share/Steam/steamapps"
alias nextcloud="cd $HOME/Nextcloud"
alias pm_isos="cd /mnt/vmzfspool/proxmox/isos"
alias spx="cd $HOME/ode/gitlab/nythrel/obsidian/separatrix"

# Apps - apt-cacher-ng
alias aptcache_edit="sudo vim /etc/apt/apt.conf.d/apt-cacher-ng"
alias aptcache_cat="sudo cat /etc/apt/apt.conf.d/apt-cacher-ng"

# find
# alias find-tilde="find $@ -type f -name '*~' -exec rm -v {} \;"

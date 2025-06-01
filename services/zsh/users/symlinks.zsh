#!/bin/bash

############################################################ PACKAGES ############################################################
sudo apt update && sudo apt install -y tmux zsh fzf git git-lfs fzf shellcheck
chsh -s /bin/zsh

############################################################ $HOME ############################################################
symlink -y $HOME/.local/etc/bash.d/$USER/$USER.env $HOME/.env
symlink -y $HOME/.local/etc/bash.d/$USER/$USER.bashrc $HOME/.bashrc
symlink -y $HOME/.local/etc/bash.d/$USER/$USER.bash_profile $HOME/.bash_profile
symlink -y $HOME/.local/etc/bash.d/$USER/$USER.bash_logout $HOME/.bash_logout
symlink -y $HOME/.local/etc/bash.d/$USER/$USER.bash_profile $HOME/.bash_profile
symlink -y $HOME/.local/etc/bash.d/$USER/$USER.bash_aliases $HOME/.bash_aliases
symlink -y $HOME/.local/etc/bash.d/$USER/$USER.profile $HOME/.profile
symlink -y $HOME/.local/etc/bash.d/$USER/$USER.gitconfig $HOME/.gitconfig
symlink -y $HOME/.local/etc/bash.d/$USER/$USER.viminfo $HOME/.viminfo
symlink -y $HOME/.local/etc/bash.d/$USER/$USER.vimrc $HOME/.vimrc
symlink -y $HOME/.local/etc/ssh/config $HOME/.ssh/config
symlink -y $HOME/.local/.editorconfig $HOME/.editorconfig
symlink -y $HOME/.local/etc/gnupg/dirmngr.conf $HOME/.gnupg/dirmngr.conf
symlink -y $HOME/.local/etc/gnupg/gpg.conf $HOME/.gnupg/gpg.conf
symlink -y $HOME/.local/etc/gnupg/gpg-agent.conf $HOME/.gnupg/gpg-agent.conf
symlink -y $HOME/.local/etc/zsh/users/$USER.zshrc $HOME/.zshrc
symlink -y $HOME/.local/etc/zsh/users/$USER.zprofile $HOME/.zprofile
symlink -y $HOME/.local/etc/zsh/users/$USER.zlogin $HOME/.zlogin
symlink -y .local/os/$OS/$OS.gitconfig $HOME/.gitconfig
symlink $HOME/.local/etc/yay/$USER.config.json $HOME/.config/yay/config.json
symlink -y $HOME/.local/etc/zsh/users/$USER.zshrc $HOME/.zshrc
symlink -y $HOME/.local/etc/zsh/users/$USER.zprofile $HOME/.zprofile
symlink -y $HOME/.local/etc/zsh/users/$USER.zlogin $HOME/.zlogin

# GPG
symlink -y $HOME/.local/etc/gnupg/dirmngr.conf $HOME/.gnupg/dirmngr.conf
symlink -y $HOME/.local/etc/gnupg/gpg.conf $HOME/.gnupg/gpg.conf
symlink -y $HOME/.local/etc/gnupg/gpg-agent.conf $HOME/.gnupg/gpg-agent.conf
gpgconf --kill gpg-agent && gpgconf --launch gpg-agent

# gamescope
symlink -y "$HOME/.local/etc/environment.d/gamescope-session-plus.conf" "$XDG_CONFIG_HOME/environment.d/gamescope-session-plus.conf"

# Distrobox
symlink -y $HOME/.local/etc/distrobox $XDG_CONFIG_HOME/distrobox

# vscode settings - /home/deck/.config/Code/User/settings.json
mv "$XDG_CONFIG_HOME/Code/User/settings.json" "$XDG_CONFIG_HOME/Code/User/settings.json.bak"
symlink -y "$HOME/.local/.vscode/settings.json"  "$XDG_CONFIG_HOME/Code/User/settings.json"

# vscode-server settings - /home/deck/.config/Code/User/settings.json
mv "$HOME/.vscode-server/data/Machine/settings.json" "$HOME/.vscode-server/data/Machine/settings.json.bak"
symlink -y "$HOME/.local/.vscode/settings.json"  "$HOME/.vscode-server/data/Machine/settings.json"









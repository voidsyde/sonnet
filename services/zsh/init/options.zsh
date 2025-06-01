#!/bin/sh

# Plugin Setup

# echo "In etc/zsh/init/options.zsh"

# Keychain
zstyle :omz:plugins:keychain agents gpg,ssh
# zstyle :omz:plugins:keychain identities id_ed25519 B26FD0B0B9666479
# zstyle :omz:plugins:keychain options --quiet

# SSH Agent
zstyle :omz:plugins:ssh-agent agent-forwarding yes
# zstyle :omz:plugins:ssh-agent helper ksshaskpass

# Pass Completion
# compdef _pass workpass
# zstyle ':completion::complete:workpass::' prefix "$HOME/.password-store"
# workpass() {
#     PASSWORD_STORE_DIR=$HOME/.password-store pass $@
# }
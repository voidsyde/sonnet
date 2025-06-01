# shellcheck disable=SC1071

# PLATFORM SETUP & CUSTOMIZATION
# MACOS platform setup

# profiles plugin

MSG="Welcome to MacOS"

# Loading NVM from common
# echo "Loading NVM from common"

# sorcing additional loaders
source "$ZSH_LOADER/nvm-loader.zsh"
source "$ZSH_LOADER/pyenv-loader.zsh"
source "$ZSH_LOADER/dotnet-loader.zsh"

# Loading NVM
nvm_loadvars

# Loding PYENV
pyenv_loadvars

# Loading Dotnet
dotnet_loadvars

# Keychain
zstyle :omz:plugins:keychain identities id_ed25519 id_rsa B26FD0B0B9666479

# plugins=(profiles aliases brew gpg-agent ssh-agent keychain pass history git git-lfs gitfast ssh tmux zsh-navigation-tools macos pyenv)
plugins=(profiles aliases brew gitfast ssh tmux zsh-navigation-tools macos)
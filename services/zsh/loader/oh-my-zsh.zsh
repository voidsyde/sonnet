#!/bin/zsh

# echo "In etc/zsh/platforms/macos.zsh"

# Define plugin list dynamically
# plugins=(aliases git git-lfs gpg-agent pass keychain history gitignore ssh tmux zsh-interactive-cd vscode)

echo $MSG
echo "Oh My Zsh Loader - Loaded plugins: $plugins"

# Conditionally load Homebrew plugin if not on Arch
# [[ "$OS" != "arch" ]] && plugins+=(brew)

# Source Oh My Zsh (which is already Zsh-specific)
source "$ZSH/oh-my-zsh.sh"


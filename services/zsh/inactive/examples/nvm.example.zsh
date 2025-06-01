echo "NVM setup - lang.zsh"

# Linux Brew NVM setup
# export NVM_DIR="$HOME/.nvm"
# if [ -s "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh" ]; then
#     [ -s "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh" ] && \. "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh"                                       # This loads nvm
#     [ -s "/home/linuxbrew/.linuxbrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/home/linuxbrew/.linuxbrew/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion
# fi

# MacOS NVM
# export NVM_DIR="$HOME/.nvm"
# [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"                                       # This loads nvm
# [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion

# # Arch Linux NVM Setup
# export NVM_DIR="$HOME/.nvm"
# if [ -s "/usr/share/nvm/init-nvm.sh" ]; then
#     . "/usr/share/nvm/init-nvm.sh"
# fi

# NVM setup
# export NVM_DIR="$HOME/.nvm"
# if [ -s "/usr/share/nvm/init-nvm.sh" ]; then
#     . "/usr/share/nvm/init-nvm.sh"
# elif [ -s "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh" ]; then
#     [ -s "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh" ] && \. "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh"                                       # This loads nvm
#     [ -s "/home/linuxbrew/.linuxbrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/home/linuxbrew/.linuxbrew/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion
# fi

# if [[ -f /etc/arch-release || -d /etc/pacman.d ]]; then
#     echo "Running on Arch Linux, skipping Homebrew"
# else
#     echo "Not Arch Linux, loading Homebrew"
#     eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
# fi

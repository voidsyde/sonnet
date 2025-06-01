# identifying Platform

# if [[ "$(uname)" == "Darwin" ]]; then
#     echo "Running on macOS"
#     source ~/.config/macos_script.zsh
# elif [[ "$(uname)" == "Linux" ]]; then
#     echo "Running on Linux"
#     source ~/.config/linux_script.zsh
# else
#     echo "Unknown OS"
# fi

# Identifying Distro based on arch release

# case "$(cat /etc/os-release 2>/dev/null)" in
#     (*"ID=arch"*|*"ID_LIKE=arch"*)
#         echo "Running on Arch Linux, skipping Homebrew"
#         ;;
#     (*"ID=debian"*|*"ID_LIKE=debian"*)
#         echo "Running on Debian-based system"
#         eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
#         ;;
#     (*"ID=fedora"*|*"ID_LIKE=rhel"*)
#         echo "Running on RHEL-based system (including Fedora)"
#         eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
#         ;;
#     (*)
#         echo "Unknown distro"
#         ;;
# esac

# Using if-else:

# if [[ -f /etc/os-release ]] && grep -q "Arch" /etc/os-release; then
#     echo "Running on Arch Linux, skipping Homebrew"
# else
#     echo "Not Arch Linux, loading Homebrew"
#     eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
# fi

# Using case:

# case "$(cat /etc/os-release 2>/dev/null)" in
#     (*"Arch"*)
#         echo "Running on Arch Linux, skipping Homebrew"
#         ;;
#     *)
#         echo "Not Arch Linux, loading Homebrew"
#         eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
#         ;;
# esac

# More Reliable Check for Arch-Based Distros
# Instead of just checking for pacman, we can verify if pacman is the system package manager:

# if [[ -f /etc/arch-release || -d /etc/pacman.d ]]; then
#     echo "Running on Arch Linux, skipping Homebrew"
# else
#     echo "Not Arch Linux, loading Homebrew"
#     eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
# fi




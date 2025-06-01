# Put files in this folder to add your own custom functionality.
# See: https://github.com/ohmyzsh/ohmyzsh/wiki/Customization
#
# Files in the custom/ directory will be:
# - loaded automatically by the init script, in alphabetical order
# - loaded last, after all built-ins in the lib/ directory, to override them
# - ignored by git by default
#
# Example: add custom/shortcuts.zsh for shortcuts to your local projects
#
# brainstormr=~/Projects/development/planetargon/brainstormr
# cd $brainstormr

# echo "GPG setup - gpg.zsh"

# GPG
# export GPG_TTY=$(tty)
# export GCM_CREDENTIAL_STORE=gpg


# Specify GPG key ID
# GPG_KEY="B26FD0B0B9666479"
# GPG_KEYGRIP="D7F7EC045AB1F83B546A7392325F2407DFDFACE2"

# echo "your-secret-passphrase" | gpg-preset-passphrase --preset "$GPG_KEYGRIP"

# Unlock key by forcing a decryption of a dummy message
# echo "Unlocking GPG keyring..."
# echo "Pandu@123" | gpg --encrypt --recipient "$GPG_KEY" | gpg --decrypt --quiet --batch --yes > /dev/null 2>&1

# if [[ $? -eq 0 ]]; then
#     echo "GPG keyring unlocked successfully!"
# else
#     echo "Failed to unlock GPG keyring."
# fi
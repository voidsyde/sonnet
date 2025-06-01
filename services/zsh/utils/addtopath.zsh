# Add your own custom plugins in the custom/plugins directory. Plugins placed
# here will override ones with the same name in the main plugins directory.
# See: https://github.com/ohmyzsh/ohmyzsh/wiki/Customization#overriding-and-adding-plugins

# Function to add a directory to PATH if it's not already there
add_to_path() {
    [[ ":$PATH:" == *":$1:"* ]] || PATH="$1:$PATH"
}
#!/bin/sh

# NVM Loader Script
# The function is commonly sourced
# Functions to load nvm are used insider platform setup or profiles plugin

nvm_loadvars() {
    # Source NVM Variables
    source "$ZSH_ENV/nvm.env"

    # Add NVM to Path
    add_to_path "$NVM_ROOT"
    add_to_path "$NVM_DIR"

    # Source the init script
    source "$NVM_ROOT/nvm.sh"
}

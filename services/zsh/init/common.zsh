#!/bin/sh

# Environment Variables
# This init script loads environment variables

# Load ZSH Environment Variables
source "$ZSH_ENV/zsh.env"

# Load Local Variables
source "$ZSH_ENV/locale.env"

# Load ZSH Theme variable
source "$ZSH_ENV/theme.env"

# Load Editor Information
source "$ZSH_ENV/editor.env"

# Load plugin options fuctions
source "$ZSH_INIT/options.zsh"

# Load helper fuctions
source "$ZSH_INIT/functions.zsh"

# Load helper fuctions
source "$ZSH_INIT/exports.zsh"

# Cofigure Paths fuctions
source "$ZSH_INIT/configure.zsh"

# Load platform-specific environment variables
source "$ZSH_INIT/platform.zsh"

# Optional: Debug
# source "$ZSH_INIT/debug.zsh"
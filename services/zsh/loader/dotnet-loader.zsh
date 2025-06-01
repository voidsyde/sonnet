#!/bin/sh

# Dotnet Loader Script
# The function is commonly sourced
# Functions to load dotnet are used insider platform setup or profiles plugin

dotnet_loadvars(){
    source "$ZSH_ENV/dotnet.env"

    add_to_path "$DOTNET_ROOT"
    add_to_path "$DOTNET_TOOLS"
}
#!/bin/sh

# Add user-specific directories to PATH
add_to_path "/usr/bin"
add_to_path "/usr/sbin"
add_to_path "/usr/local/bin"
add_to_path "$HOME/.local/bin"
add_to_path "$HOME/.local/podman/bin"
add_to_path "$HOME/.dotnet"
add_to_path "$HOME/.dotnet/tools"
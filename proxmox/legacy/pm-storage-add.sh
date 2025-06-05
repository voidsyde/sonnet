#!/bin/bash

# Function to create a single ZFS dataset with optional parameters
create_single_dataset() {
    local dataset=$1
    local mountpoint=${2:-"inherit"} # Default to inherit if not provided
    local blocksize=${3:-""} # Default to no specific blocksize

    # Check if dataset already exists
    if zfs list -H -o name "$dataset" 2>/dev/null | grep -q "^$dataset$"; then
        echo "Dataset '$dataset' already exists. Skipping creation."
        return
    fi

    # Ensure parent datasets exist
    local parent=$(dirname "$dataset")
    while [ "$parent" != "." ] && ! zfs list -H -o name "$parent" 2>/dev/null | grep -q "^$parent$"; do
        echo "Parent dataset '$parent' does not exist. Creating it."
        zfs create "$parent"
        parent=$(dirname "$parent")
    done

    # Create the dataset
    echo "Creating dataset '$dataset'."
    if [ -n "$blocksize" ]; then
        zfs create -o refreservation=none -o recordsize="$blocksize" "$dataset"
    else
        zfs create -o refreservation=none "$dataset"
    fi

    # Set mountpoint
    echo "Setting mountpoint for '$dataset' to '$mountpoint'."
    if [ "$mountpoint" == "inherit" ]; then
        zfs inherit mountpoint "$dataset"
    else
        zfs set mountpoint="$mountpoint" "$dataset"
    fi
}

# Check if the required argument is provided
if [ -z "$1" ]; then
    echo "Usage: pm-storage-create <dataset> [mountpoint] [blocksize]"
    exit 1
fi

# Call the function with the provided arguments
create_single_dataset "$1" "$2" "$3"

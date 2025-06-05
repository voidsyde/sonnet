#!/usr/bin/env python3
import subprocess
import sys
import os

def dataset_exists(dataset):
    """Check if a ZFS dataset exists."""
    try:
        subprocess.run(["zfs", "list", "-H", "-o", "name", dataset], check=True, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
        return True
    except subprocess.CalledProcessError:
        return False

def create_dataset(dataset, mountpoint="inherit", blocksize=None):
    """Create a ZFS dataset with optional mountpoint and blocksize."""
    if dataset_exists(dataset):
        print(f"Dataset '{dataset}' already exists. Skipping creation.")
        return

    # Build the zfs create command
    command = ["zfs", "create", "-p", "-o", "refreservation=none"]
    if blocksize:
        command.extend(["-o", f"recordsize={blocksize}"])
    command.append(dataset)

    print(f"Creating dataset '{dataset}'.")
    subprocess.run(command, check=True)

    # Set mountpoint
    print(f"Setting mountpoint for '{dataset}' to '{mountpoint}'.")
    if mountpoint == "inherit":
        subprocess.run(["zfs", "inherit", "mountpoint", dataset], check=True)
    else:
        subprocess.run(["zfs", "set", f"mountpoint={mountpoint}", dataset], check=True)

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: pm-storage-create <dataset> [mountpoint] [blocksize]")
        sys.exit(1)

    dataset = sys.argv[1]
    mountpoint = sys.argv[2] if len(sys.argv) > 2 else "inherit"
    blocksize = sys.argv[3] if len(sys.argv) > 3 else None

    try:
        create_dataset(dataset, mountpoint, blocksize)
        print("Dataset creation complete.")
    except subprocess.CalledProcessError as e:
        print(f"Error: {e}")
        sys.exit(1)

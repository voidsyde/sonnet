#!/usr/bin/env python3
import subprocess
import sys

def dataset_exists(dataset):
    """Check if a ZFS dataset exists."""
    try:
        subprocess.run(["zfs", "list", "-H", "-o", "name", dataset], check=True, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
        return True
    except subprocess.CalledProcessError:
        return False

def add_proxmox_storage_via_api(storage_name, dataset, content):
    """Add storage to Proxmox via API."""
    try:
        print(f"Adding storage '{storage_name}' to Proxmox.")
        subprocess.run(
            [
                "pvesh",
                "create",
                "/storage",
                f"--storage={storage_name}",
                "--type=zfspool",
                f"--pool={dataset}",
                f"--content={content}",
                "--sparse=1",
            ],
            check=True,
        )
        print(f"Storage '{storage_name}' added successfully.")
    except subprocess.CalledProcessError as e:
        print(f"Error adding storage '{storage_name}': {e}")
        sys.exit(1)

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
    if mountpoint == "inherit":
        print(f"Setting mountpoint for '{dataset}' to inherit.")
        subprocess.run(["zfs", "inherit", "mountpoint", dataset], check=True)
    else:
        print(f"Setting mountpoint for '{dataset}' to '{mountpoint}'.")
        subprocess.run(["zfs", "set", f"mountpoint={mountpoint}", dataset], check=True)

if __name__ == "__main__":
    if len(sys.argv) < 3:
        print("Usage: pm-storage-create <dataset> <storage_name> [mountpoint] [blocksize]")
        sys.exit(1)

    dataset = sys.argv[1]
    storage_name = sys.argv[2]
    mountpoint = sys.argv[3] if len(sys.argv) > 3 else "inherit"
    blocksize = sys.argv[4] if len(sys.argv) > 4 else None

    try:
        # Create the ZFS dataset
        create_dataset(dataset, mountpoint, blocksize)

        # Add the dataset to Proxmox storage
        add_proxmox_storage_via_api(storage_name, dataset, "images,rootdir")

        print("Dataset and Proxmox storage creation complete.")
    except subprocess.CalledProcessError as e:
        print(f"Error: {e}")
        sys.exit(1)

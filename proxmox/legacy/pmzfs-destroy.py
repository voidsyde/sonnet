#!/usr/bin/env python3

import subprocess
import sys


def dataset_exists(dataset):
    """Check if a ZFS dataset exists."""
    try:
        subprocess.run(
            ["zfs", "list", "-H", "-o", "name", dataset],
            check=True,
            stdout=subprocess.DEVNULL,
            stderr=subprocess.DEVNULL,
        )
        return True
    except subprocess.CalledProcessError:
        return False


def delete_proxmox_storage(storage_name):
    """Delete a Proxmox storage entry."""
    try:
        print(f"Removing storage entry '{storage_name}' from Proxmox.")
        subprocess.run(["pvesm", "remove", storage_name], check=True)
        print(f"Storage entry '{storage_name}' removed successfully.")
    except subprocess.CalledProcessError as e:
        print(f"Error removing storage '{storage_name}': {e}")
        sys.exit(1)


def delete_dataset(dataset):
    """Delete a ZFS dataset."""
    if not dataset_exists(dataset):
        print(f"Dataset '{dataset}' does not exist. Skipping deletion.")
        return

    print(f"Deleting dataset '{dataset}'.")
    try:
        subprocess.run(["zfs", "destroy", "-r", dataset], check=True)
        print(f"Dataset '{dataset}' deleted successfully.")
    except subprocess.CalledProcessError as e:
        print(f"Error deleting dataset '{dataset}': {e}")
        sys.exit(1)


if __name__ == "__main__":
    if len(sys.argv) < 3:
        print("Usage: pm-storage-delete <dataset> <storage_name>")
        sys.exit(1)

    dataset = sys.argv[1]
    storage_name = sys.argv[2]

    try:
        # Remove Proxmox storage entry
        delete_proxmox_storage(storage_name)

        # Remove ZFS dataset
        delete_dataset(dataset)
    except subprocess.CalledProcessError as e:
        print(f"Error: {e}")
        sys.exit(1)

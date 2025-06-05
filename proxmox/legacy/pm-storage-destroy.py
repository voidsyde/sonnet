#!/usr/bin/env python3

import subprocess
import sys


def delete_proxmox_storage(storage_name):
    """Delete a Proxmox storage entry without removing the dataset."""
    try:
        print(f"Removing storage entry '{storage_name}' from Proxmox.")
        subprocess.run(["pvesm", "remove", storage_name], check=True)
        print(f"Storage entry '{storage_name}' removed successfully.")
    except subprocess.CalledProcessError as e:
        print(f"Error removing storage '{storage_name}': {e}")
        sys.exit(1)


if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: qm-storage-delete <storage_name>")
        sys.exit(1)

    storage_name = sys.argv[1]

    try:
        delete_proxmox_storage(storage_name)
    except subprocess.CalledProcessError as e:
        print(f"Error: {e}")
        sys.exit(1)

#!/usr/bin/env python3

import os
import subprocess
import struct
import sys
import signal

def signal_handler(sig, frame):
    print('\nOperation cancelled. Exiting...')
    sys.exit(0)

signal.signal(signal.SIGINT, signal_handler)

def run_command(command):
    result = subprocess.run(command, shell=True, capture_output=True, text=True)
    return result.stdout.strip(), result.stderr.strip()

def get_pool_hostid(pool_name):
    command = f"zdb -C {pool_name} | grep -A2 hostid"
    output, error = run_command(command)
    if error:
        print(f"Error: {error}")
        sys.exit(1)

    for line in output.splitlines():
        if 'hostid:' in line:
            return int(line.split(': ')[1])
    print("Couldn't find hostid in pool configuration.")
    sys.exit(1)

def convert_to_little_endian(hostid):
    big_endian_bytes = struct.pack('>I', hostid)
    little_endian_bytes = struct.unpack('<I', big_endian_bytes)[0]
    return little_endian_bytes

def write_hostid_to_file(hostid):
    hostid_hex = f'{hostid:08x}'
    with open('/etc/hostid', 'wb') as f:
        for i in range(0, len(hostid_hex), 2):
            f.write(bytes.fromhex(hostid_hex[i:i+2])[::-1])

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: zfs_hostid_fix.py <poolname>")
        sys.exit(1)

    pool_name = sys.argv[1]

    # Step 1: Get pool hostid
    print(f"Fetching hostid for pool '{pool_name}'...")
    pool_hostid = get_pool_hostid(pool_name)
    print(f"Pool hostid (Decimal): {pool_hostid}")
    print(f"Pool hostid (Hexadecimal - Big Endian): {pool_hostid:08x}")

    # Step 2: Compare with current hostid directly
    current_hostid = run_command("hostid")[0].strip()
    print(f"Current system hostid (Hexadecimal): {current_hostid}")

    if current_hostid != f'{pool_hostid:08x}':
        print("Mismatch detected between current hostid and ZFS pool hostid.")
        converted_hostid = convert_to_little_endian(pool_hostid)
        print(f"Converted hostid (Hexadecimal - Little Endian): {converted_hostid:08x}")
        confirm = input("Do you want to apply the ZFS pool hostid to /etc/hostid? (y/yes to proceed): ").strip().lower()

        if confirm not in ['y', 'yes']:
            print("Operation cancelled by user.")
            sys.exit(0)

        # Step 3: Write hostid to /etc/hostid
        print("Writing hostid to /etc/hostid...")
        write_hostid_to_file(converted_hostid)
        print("Hostid updated successfully.")
    else:
        print("No mismatch detected. No changes made.")

    # Final output
    print(f"Final hostid (Hexadecimal): {current_hostid}")


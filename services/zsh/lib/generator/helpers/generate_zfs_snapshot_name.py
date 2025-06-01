#!/usr/bin/env python3

import datetime
import signal
import sys

def handle_sigint(signum, frame):
    """Handle Ctrl+C gracefully by exiting."""
    sys.exit(1)

# Set up SIGINT (Ctrl+C) handler
signal.signal(signal.SIGINT, handle_sigint)

def gen_snap():
    """Generate TrueNAS-style snapshot name."""
    snapshot_name = f"auto-{datetime.datetime.now().strftime('%Y-%m-%d_%H-%M')}"
    print(snapshot_name)

if __name__ == "__main__":
    gen_snap()

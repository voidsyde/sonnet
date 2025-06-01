#!/usr/bin/env python3

import secrets
import string

print('-'.join(''.join(secrets.choice(string.ascii_letters + string.digits) for _ in range(6)) for _ in range(3)))

# python -c "import secrets, string; print('-'.join(''.join(secrets.choice(string.ascii_letters + string.digits) for _ in range(6)) for _ in range(3)))"
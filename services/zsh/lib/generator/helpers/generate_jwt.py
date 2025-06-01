#!/usr/bin/env python3

import os
import base64
import secrets

print(base64.urlsafe_b64encode(secrets.token_bytes(32)).decode())

# print(base64.b64encode(os.urandom(32)).decode())
# python3 -c "import secrets; import base64; print(base64.urlsafe_b64encode(secrets.token_bytes(32)).decode())"

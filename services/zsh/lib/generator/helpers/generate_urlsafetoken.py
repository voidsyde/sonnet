#!/usr/bin/env python3

import secrets

print(secrets.token_urlsafe(64))

# python3 -c "import secrets; print(secrets.token_urlsafe(64))"
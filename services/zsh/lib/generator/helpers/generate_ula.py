#!/usr/bin/env python3

import random;

print('fd%02x:%04x:%04x::/48' % (random.randint(0, 255), random.randint(0, 65535), random.randint(0, 65535)))

# python3 -c "import random; print('fd%02x:%04x:%04x::/48' % (random.randint(0, 255), random.randint(0, 65535), random.randint(0, 65535)))"


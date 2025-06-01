# For Encryption Keys: Use openssl rand -hex 64 (128 characters) for maximum security.
# Generates a 128-character encryption key
# openssl rand -hex 64

helpers=$ZSH_LIB/generator/helpers

gen-hex32() {

    python3 "$helpers/generate_hex32.py"
}

gen-hex() {

    python3 "$helpers/generate_hex64.py"
}

# For JWT & Session Secrets: Use openssl rand -base64 64 (88 characters).
# Generates a 44-character JWT secret
gen-jwt() {

    python3 "$helpers/generate_jwt.py"
}

# For URL-safe tokens: Use Python’s secrets.token_urlsafe(64
gen-token() {

    python3 "$helpers/generate_urlsafetoken.py"
}

# ZFS Snapshot name
gen-snapshot() {

    python3 "$helpers/generate_zfs_snapshot_name.py"
}

# Generate Password
gen-pass() {

    openssl rand -base64 18 | tr -dc 'a-zA-Z0-9' | fold -w6 | head -3 | paste -sd '-'
}

gen-pwd() {

    python3 "$helpers/generate_password.py"
}

# Generate UUID
gen-uuid() {
    python3 "$helpers/generate_uuid.py"
}

# Generate HMAC
gen-hmac() {
    python3 "$helpers/generate_hmac.py"
}

# Generate unique link id
gen-ula() {
    python3 "$helpers/generate_ula.py"
}

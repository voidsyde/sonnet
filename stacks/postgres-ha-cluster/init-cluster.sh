#!/usr/bin/env bash
set -euo pipefail

here="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
compose="${here}/compose.yaml"

# Load env
if [[ -z "${1:-}" ]]; then
    echo "Usage: $0 <node-env-file>   # e.g., docker41.env"
    exit 1
fi
source "${here}/.env.template"
source "${1}"

echo "==> Ensuring ZFS datasets exist and have proper ownership..."
sudo mkdir -p "${DATA_DIR}" "${WAL_DIR}" "${ETCD_DATA_DIR}"
sudo chown -R 999:999 "${DATA_DIR}" || true # postgres UID/GID in spilo
sudo chmod 700 "${DATA_DIR}" || true
sudo chown -R 1000:1000 "${ETCD_DATA_DIR}" || true

echo "==> Rendering HAProxy backend servers from HAPROXY_BACKEND_IPS..."
mapfile -t IPs < <(echo "${HAPROXY_BACKEND_IPS}" | tr ',' '\n')
hap="${here}/haproxy/haproxy.cfg"
cp "${hap}" "${hap}.tmp"
{
    echo "    # Auto-generated backends"
    idx=1
    for ip in "${IPs[@]}"; do
        echo "    server pg${idx} ${ip}:5432 check port ${PATRONI_REST_PORT}"
        idx=$((idx + 1))
    done
} >>"${hap}.tmp"
mv "${hap}.tmp" "${hap}"

echo "==> Rendering PgBouncer users file from env secrets..."
# Create SCRAM entry for ${PGBOUNCER_USERNAME}
# Use psql to create role later; here we just seed pgbouncer users.txt with a MD5 or SCRAM line.
# For simplicity we will write a plaintext auth query user; replace with SCRAM via gen later if desired.
users="${here}/pgbouncer/users.txt"
cat >"${users}" <<EOF
"${PGBOUNCER_USERNAME}" "${PGBOUNCER_PASSWORD}"
EOF

echo "==> Bringing up etcd → patroni → haproxy → pgbouncer → exporters"
docker compose --env-file "${1}" -f "${compose}" up -d etcd
sleep 5
docker compose --env-file "${1}" -f "${compose}" up -d patroni
# Wait for Patroni API to be ready
for _ in {1..30}; do
    if curl -fsS "http://${PATRONI_REST_IP}:${PATRONI_REST_PORT}/health" >/dev/null; then
        break
    fi
    sleep 2
done
docker compose --env-file "${1}" -f "${compose}" up -d haproxy pgbouncer postgres_exporter pgbouncer_exporter

echo "==> If this is the first node bootstrapping the cluster, creating roles for monitoring and pgbouncer..."
leader_ip="$(curl -fsS "http://${PATRONI_REST_IP}:${PATRONI_REST_PORT}/leader" | tr -d '"')"
psql_uri="postgresql://${PATRONI_SUPERUSER_USERNAME}:${PATRONI_SUPERUSER_PASSWORD}@${leader_ip}:5432/postgres"

psql "${psql_uri}" -v ON_ERROR_STOP=1 <<SQL
DO $$
BEGIN
    IF NOT EXISTS (SELECT FROM pg_roles WHERE rolname = '${MONITOR_USERNAME}') THEN
    CREATE ROLE ${MONITOR_USERNAME} LOGIN PASSWORD '${MONITOR_PASSWORD}';
    GRANT pg_monitor TO ${MONITOR_USERNAME};
    END IF;
    IF NOT EXISTS (SELECT FROM pg_roles WHERE rolname = '${PGBOUNCER_USERNAME}') THEN
    CREATE ROLE ${PGBOUNCER_USERNAME} LOGIN PASSWORD '${PGBOUNCER_PASSWORD}';
    END IF;
END$$;
SQL

echo "==> Done. Repeat on other nodes with their respective env files."

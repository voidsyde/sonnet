#!/usr/bin/env bash
set -euo pipefail

here="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
compose="${here}/compose.yaml"

if [[ -z "${1:-}" ]]; then
    echo "Usage: $0 <node-env-file>   # e.g., docker41.env"
    exit 1
fi
source "${here}/.env.template"
source "${1}"

red() { printf "\033[31m%s\033[0m\n" "$*"; }
green() { printf "\033[32m%s\033[0m\n" "$*"; }
yel() { printf "\033[33m%s\033[0m\n" "$*"; }

ok=true

echo "==> etcd members"
if ! etcdctl --endpoints="http://127.0.0.1:2379" member list; then
    red "etcd member list failed"
    ok=false
fi

echo "==> Patroni cluster"
if ! curl -fsS "http://${PATRONI_REST_IP}:${PATRONI_REST_PORT}/cluster"; then
    red "Patroni REST unreachable"
    ok=false
fi

echo "==> Patroni leader"
if ! curl -fsS "http://${PATRONI_REST_IP}:${PATRONI_REST_PORT}/leader"; then
    red "Leader not reported"
    ok=false
fi

echo "==> Replication status (on leader)"
leader_ip="$(curl -fsS "http://${PATRONI_REST_IP}:${PATRONI_REST_PORT}/leader" | tr -d '\"')"
if ! psql "postgresql://${PATRONI_SUPERUSER_USERNAME}:${PATRONI_SUPERUSER_PASSWORD}@${leader_ip}:5432/postgres" \
    -c "SELECT client_addr, state, sync_state, write_lag, flush_lag, replay_lag FROM pg_stat_replication"; then
    red "Replication query failed"
    ok=false
fi

echo "==> PgBouncer pools"
if ! PGPASSWORD="${PGBOUNCER_PASSWORD}" psql -h 127.0.0.1 -p "${PGBOUNCER_PORT}" -U "${PGBOUNCER_USERNAME}" \
    -c "SHOW POOLS;"; then
    red "PgBouncer SHOW POOLS failed"
    ok=false
fi

echo "==> Exporters"
if ! wget -qO- "http://127.0.0.1:9187/metrics" >/dev/null; then
    red "postgres_exporter metrics endpoint failed"
    ok=false
fi
if ! wget -qO- "http://127.0.0.1:9127/metrics" >/dev/null; then
    red "pgbouncer_exporter metrics endpoint failed"
    ok=false
fi

if $ok; then
    green "All health checks passed"
    exit 0
else
    red "One or more health checks FAILED"
    exit 1
fi

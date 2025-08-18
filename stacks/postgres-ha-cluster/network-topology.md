# Network Topology (Nyx - PostgreSQL HA)

## VLANs / Subnets (per APPLY)

- **Consensus**: 10.0.0.0/24 (etcd on docker01-03 (+04 optional))
- **Replication**: 10.0.0.0/24 (PostgreSQL inter-node traffic)
- **Client**: 192.168.6.0/24 (PgBouncer endpoints; optional HAProxy VIP)

## Ports

- etcd: 2379 (client), 2380 (peer)
- Patroni REST: 8008 (health/switchover)
- PostgreSQL: 5432 (replication network only)
- HAProxy (leader routing): 5433 (internal-to-node; pgbouncer upstream)
- PgBouncer: 6432 (client connections)
- Metrics: 9187 (postgres_exporter), 9127 (pgbouncer_exporter)

## Routing Path

Clients → PgBouncer (192.168.6.x:6432) → HAProxy (127.0.0.1:5433) → Leader Postgres (10.0.0.4x:5432)

## Notes

- HAProxy determines the leader using Patroni REST (`/master`) on each node.
- PgBouncer per node connects to local HAProxy for transparent leader routing.
- Postgres listens only on replication network IP to avoid client bypass of PgBouncer.
- TrueNAS replicas (async-only) should follow the leader directly (outside of Patroni cluster) and are **never** promoted.

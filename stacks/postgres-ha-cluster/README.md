# Nyx PostgreSQL HA — Apply Phase Outputs

## Files

- compose.yaml
- .env.template
- docker41.env, docker42.env, docker43.env, docker44.env
- init-cluster.sh
- healthcheck.sh
- haproxy/haproxy.cfg (template; auto-augmented by init script)
- pgbouncer/pgbouncer.ini, pgbouncer/users.txt (seeded / will be updated)
- network-topology.md

## Quick Start

1. Copy `.env.template` to your node env (e.g., `docker41.env`) and adjust values.
2. On each node: `./init-cluster.sh ./docker41.env`
3. Validate: `./healthcheck.sh ./docker41.env`

## Notes

- PgBouncer authenticates using users.txt initially; consider switching to `auth_query` once cluster roles exist.
- HAProxy backends are generated from `HAPROXY_BACKEND_IPS` at init.
- No hardcoded IPs inside compose.yaml; all via envs.

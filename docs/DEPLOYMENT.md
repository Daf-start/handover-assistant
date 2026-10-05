# docs/DEPLOYMENT.md
# Deployment Guide

## Local stack
```bash
docker compose up --build
```
This starts MySQL, the Java backend and the React frontend.

## Production notes
- Use Linux-based hosts with Docker or Kubernetes
- Configure Entra ID credentials securely via environment variables
- Disable debug logging and enforce TLS
- Back up MySQL regularly
- Run Flyway migrations in CI before release

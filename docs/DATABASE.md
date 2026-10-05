# docs/DATABASE.md
# MySQL Database Design

## Core entities
- users
- roles
- user_roles
- handover_expedientes
- tasks
- email_sources
- documents
- comments
- ai_suggestions
- audit_logs

## Constraints and indexes
- unique email constraint on users
- foreign keys between handover and related records
- indexes on status, due date, assignee and handover ID
- audit logs for traceability

## Migration strategy
All schema versions are stored under `backend/src/main/resources/db/migration/` with numerical prefixes.

# docs/ARCHITECTURE.md
# Handover Assistant Architecture

## 1. Goals
The Handover Assistant centralizes an organization’s operational knowledge during personnel transitions. It allows users to collect email intelligence from Microsoft Outlook, validate AI-generated information, assign tasks, track follow-up and produce a reliable handover report.

## 2. System layers
- Presentation layer: React/Next.js dashboard
- API layer: Spring Boot REST API
- Domain layer: Handover, task, document and audit models
- Data layer: MySQL 8 with Flyway migrations
- Integration layer: Microsoft Graph API, Entra ID, file storage
- AI layer: suggestion engine that presents recommendations for user approval

## 3. Runtime workflow
1. User authenticates via Microsoft Entra ID.
2. Dashboard loads summary metrics and active expediantes.
3. User creates a handover expediente.
4. Microsoft Graph imports relevant email data.
5. AI assistant proposes activities, tasks and missing facts.
6. User validates before accepting extracted information.
7. Tasks, documents and follow-up comments are tracked.
8. Reports are generated and archive is stored.

## 4. Security model
- Entra ID as identity provider
- JWT validation in Spring Security
- RBAC: ADMIN, MANAGER, SUPERVISOR, USER
- Audit logs for every business change
- No automatic override of official data

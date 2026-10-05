# docs/API.md
# Handover Assistant API

## Core endpoints
- GET /api/dashboard
- GET /api/handover
- POST /api/handover
- GET /api/auth/me

## Response conventions
- JSON payloads
- HTTP 200 for successful reads
- HTTP 201 for created resources
- HTTP 400 for validation errors
- HTTP 401/403 for auth failures

## Security
- Bearer JWT required for protected endpoints
- Swagger UI available at /swagger-ui.html

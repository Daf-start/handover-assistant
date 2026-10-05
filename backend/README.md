# backend/README.md
# Backend service

## Local run
```bash
cd backend
./mvnw spring-boot:run
```

## Environment variables
- `SPRING_DATASOURCE_URL`
- `SPRING_DATASOURCE_USERNAME`
- `SPRING_DATASOURCE_PASSWORD`
- `APP_CORS_ALLOWED_ORIGINS`
- `AZURE_TENANT_ID`
- `AZURE_CLIENT_ID`
- `AZURE_CLIENT_SECRET`

## Endpoints
- `/api/dashboard`
- `/api/handover`
- `/api/auth/me`

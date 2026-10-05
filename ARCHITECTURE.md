# Handover Assistant project architecture

This repository contains the initial MVP structure for the Handover Assistant application.

## Included
- Spring Boot Java 21 backend skeleton
- MySQL 8 + Flyway migrations with base schema and seed data
- React/Next.js frontend starter
- Docker Compose local dev environment
- Architecture and operational docs

## Important notes
- The app is designed to authenticate through Microsoft Entra ID and use Microsoft Graph API.
- The AI assistant never overwrites official data; it proposes changes for human validation.
- This is the initial modular foundation and can be expanded with entity modules, document management and real Graph integration.

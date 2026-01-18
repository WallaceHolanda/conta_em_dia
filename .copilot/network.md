## Network Layer

The project uses **Dio** as the HTTP client.

However, the codebase must NOT be tightly coupled to Dio.

### Rules

- Dio must be wrapped by a network abstraction
- Domain and Presentation must not depend on Dio
- Datasources depend on an interface, not on Dio directly

### Guidelines

- Use interceptors for:
  - Auth token injection
  - Logging
  - Error handling
- Map network errors to domain-friendly errors
- Do not expose Dio-specific errors outside data layer

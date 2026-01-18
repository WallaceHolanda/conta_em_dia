## Dependency Injection

The project uses the **injectable** package for dependency injection.

Responsibilities of the DI layer:
- Register dependencies
- Resolve implementations based on environment
- Centralize object creation

### Rules

- Pages, Cubits and UseCases must depend only on abstractions
- No environment checks outside the DI layer
- Datasource selection must happen in a single place
- Use annotations (`@injectable`, `@singleton`, etc.)

### Environment-based resolution

Different implementations must be registered
based on the active environment (mock or dev).

Example (conceptual):

- In mock environment → register MockDatasource
- In dev environment → register ApiDatasource

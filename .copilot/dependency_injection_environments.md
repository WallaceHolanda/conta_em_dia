## Dependency Injection & Environments

The project uses **injectable** together with **GetIt** for dependency injection.

Dependency injection is responsible for:
- Object creation
- Dependency registration
- Environment-based implementation resolution

All dependency resolution must be centralized and handled exclusively by the DI layer.

---

## Environment Configuration

The application supports multiple environments:

- `mock`: used for UI development and flow validation
- `dev`: used for real API consumption (localhost initially)

The active environment must be defined **at build/run time** using `--dart-define`.

Example: --dart-define=ENVIRONMENT=mock

The environment value must never be hardcoded.

---

## Environment Reading

The environment must be read only once and centralized under the core layer.

Rules:
- Use `String.fromEnvironment` to read the environment value with key 'ENVIRONMENT'
- Do not read environment variables in Cubits, Pages or Repositories
- Expose environment information through a single helper class

Example responsibilities:
- Map string values (`mock`, `dev`) to an enum
- Provide helper getters (e.g. `isMock`, `isDev`)

---

## Injectable Environments

Injectable environments must be defined explicitly and mapped to the application environment.

Rules:
- Injectable environment keys must match the app environments ('mock', 'dev')
- Environment mapping must happen before dependency initialization
- No `if` or `switch` logic is allowed outside the DI setup

---

## Dependency Registration Rules

- Use `@injectable`, `@singleton`, or `@lazySingleton`
- Prefer abstractions (interfaces) over concrete implementations
- Higher layers must depend only on abstractions
- Environment-based decisions must not leak outside DI
- Place annotations directly on the classes, e.g., `@LazySingleton(as: AuthDataSource, env: ['mock'])`

---

## Datasource Resolution Strategy

For any external data source:

- Define a datasource interface (contract)
- Provide multiple implementations when necessary:
  - Mock implementation with `@LazySingleton(as: Interface, env: ['mock'])`
  - API implementation with `@LazySingleton(as: Interface, env: ['dev'])`

Rules:
- Mock datasources must return local/static data
- Mock datasources must NOT perform HTTP requests
- API datasources must perform real network calls
- Injectable must decide which implementation is injected based on env

Datasource selection must be done using injectable environment annotations on the classes.

---

## Constraints

- No environment checks inside UI, Cubits or Repositories
- No manual datasource selection
- No conditional logic based on environment outside DI
- Dependency resolution must happen before `runApp`

---

## Goal

This setup ensures:
- Low coupling
- Clear separation of concerns
- Easy environment switching
- Scalable and maintainable architecture

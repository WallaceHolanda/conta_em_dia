## Architecture

This project follows Clean Architecture, organized by features.

All code inside `lib/` must follow this structure:

lib/
├── core/
└── features/
    └── feature_name/
        ├── presentation/
        │   ├── pages/
        │   ├── widgets/
        │   └── cubit/
        ├── domain/
        │   ├── entities/
        │   └── repositories/
        └── data/
            ├── models/
            ├── repositories/
            └── datasources/

### Presentation
Responsible for UI and state management.
Must not contain business rules.

### Domain
Responsible for business logic.
Must be independent from Flutter and external packages.

### Data
Responsible for data access and implementations.

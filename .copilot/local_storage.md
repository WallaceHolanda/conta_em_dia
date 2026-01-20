## Storage Architecture Instructions

Local and secure storage must be treated as **infrastructure services**,
not as repositories.

Storage concerns are technical and must not be modeled as domain concepts.

---

## Storage Strategy

The project uses two different storage mechanisms, each with a clear purpose:

- **Local Storage** (SharedPreferences)
  - Used for simple flags and non-sensitive data
  - Example: onboarding completion, UI preferences

- **Secure Storage** (Flutter Secure Storage)
  - Used for sensitive data
  - Example: authentication token, credentials

These storage mechanisms must be isolated behind service abstractions.

---

## Service-Based Approach

Storage must be modeled using **services**, not repositories.

Reasons:
- Storage does not represent business data
- Storage does not map to domain entities
- Storage is a technical concern
- Using repositories here adds unnecessary abstraction

---

## Storage Location

All storage-related code must live under the `core` layer.

Suggested structure:

core/
└── storage/
    ├── local_storage_service.dart
    ├── secure_storage_service.dart
    └── implementations/
        ├── shared_preferences_storage_service.dart
        └── flutter_secure_storage_service.dart

---

## Service Interfaces

Service interfaces must be **intent-based**, not key-based.

Rules:
- Do not expose raw keys
- Do not expose generic get/set methods
- Methods must describe intent clearly

Example responsibilities:
- `hasSeenOnboarding()`
- `setOnboardingSeen()`
- `saveToken(String token)`
- `getToken()`

---

## Implementations

Concrete implementations:
- Must use the appropriate storage library internally
- Must not leak storage details outside the service
- Must implement exactly one service interface

Storage libraries (SharedPreferences, SecureStorage) must never be accessed
directly by features or Cubits.

---

## Dependency Injection

- Storage services must be injected using **injectable**
- Features must depend only on service interfaces
- Implementations must be resolved by DI

Rules:
- No direct instantiation of storage classes
- No service locator usage inside UI or Cubits
- Storage initialization must be handled by DI modules

---

## Architecture Constraints

- Do not model storage as repositories
- Do not create datasources for storage
- Do not access SharedPreferences or SecureStorage directly
- Do not expose raw storage keys
- Do not place storage logic inside features

---

## Goal

This approach ensures:
- Clear separation of concerns
- Correct architectural semantics
- Improved testability
- Reduced boilerplate
- Cleaner and more maintainable codebase

## Navigation & Route Architecture

The application uses **Flutter native named routes** combined with
**dedicated route widgets** to manage dependency injection and state scope.

Navigation must be simple, explicit and predictable.

---

## Route Responsibility

Each screen must have a **dedicated route widget** responsible for:

- Creating and providing Cubits via `BlocProvider`
- Resolving dependencies using GetIt / Injectable
- Defining the lifecycle scope of the Cubit

Pages must NOT:
- Create Cubits
- Resolve dependencies
- Contain navigation decision logic

---

## Route Structure

Routes must be implemented as independent widgets and placed
inside a `routes` folder within each feature.

Example structure:

lib/
└── features/
    └── feature_name/
        └── presentation/
            ├── pages/
            ├── cubit/
            └── routes/
                └── feature_route.dart

---

## Route vs Page

### Route
- Handles dependency injection
- Wraps the Page with `BlocProvider` or `MultiBlocProvider`
- May trigger initial Cubit actions (e.g. `start()`)

### Page
- Renders UI only
- Listens to state changes
- Dispatches user actions to the Cubit
- Contains no DI or environment logic

---

## Initial Route (Splash / AppStart)

The application must always start from a **Splash/AppStart route**.

Responsibilities of the Splash/AppStart feature:
- Decide the initial navigation flow
- Determine if onboarding was already seen
- Determine if the user is authenticated
- Redirect to the correct next route

The Splash route must:
- Always be the initial route
- Emit a navigation state
- Remove itself from the navigation stack (`pushReplacement`)

The Splash Page must:
- Display minimal UI (loading indicator)
- React to navigation states only
- Contain no decision logic

---

## Navigation Flow

The initial navigation flow must follow this order:

- First access → Onboarding
- Not authenticated → Login
- Authenticated → Home/Dashboard

All initial flow decisions must be centralized in the AppStart Cubit.

---

## Global Routes Definition

All named routes must be centralized in a single file.

Rules:
- Route names must be constants
- Avoid hardcoded route strings
- Routes must point to Route widgets, not Pages

Example responsibility:
- `/login` → LoginRoute
- `/home` → HomeRoute

---

## Architecture Update

The Clean Architecture structure is extended to include route widgets
inside the presentation layer.

Updated presentation layer structure:

presentation/
├── pages/
│   └── UI widgets only
├── cubit/
│   └── State management
└── routes/
    └── Dependency injection and Cubit scope

This keeps:
- UI pure and reusable
- State lifecycle explicit
- Dependency injection centralized

---

## Constraints

- Do not create Cubits inside Pages
- Do not inject dependencies inside Widgets
- Do not perform navigation decisions inside UI code
- Do not use `go_router` or external navigation libraries
- Do not access storage or repositories inside Pages

---

## Goal

This navigation strategy ensures:
- Clear separation of concerns
- Predictable state lifecycle
- Scalable navigation flow
- Clean and testable architecture

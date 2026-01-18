## Environments

The project must support multiple environments:

- mock: UI development and flow validation
- dev: real API consumption (localhost initially)

The active environment must be resolved only at the
dependency injection layer.

UI, Cubits, UseCases and Domain layers must not be aware
of the current environment.

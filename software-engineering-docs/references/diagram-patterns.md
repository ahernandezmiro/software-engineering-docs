# Diagram Patterns

## System Context (architecture.md)

```mermaid
graph LR
  Actor[Primary Actor] --> Core[Core Platform]
  Core --> Billing[Billing System]
  Core --> Notify[Notification Service]
  Core --> IdP[Identity Provider]
```

## Use Case Interaction (use_cases.md)

```mermaid
sequenceDiagram
  actor User
  participant App
  participant Auth as Identity Provider
  participant Payment as Billing System
  User->>App: Submit request
  App->>Auth: Verify access
  Auth-->>App: Access decision
  App->>Payment: Execute operation
  Payment-->>App: Operation result
  App-->>User: Final response
```

## Domain UML (uml.md)

```mermaid
classDiagram
  class Account {
    +id: UUID
    +status: AccountStatus
    +activate()
    +suspend()
  }

  class Subscription {
    +id: UUID
    +plan: string
    +renew()
    +cancel()
  }

  Account "1" --> "many" Subscription : owns
```

## Style Guidance

1. Keep diagrams high-level and architecture/domain focused.
2. Avoid method-level call chains from implementation classes.
3. Show only meaningful actors, systems, and domain entities.

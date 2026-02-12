# Quality Gates

## Domain Boundary Gates

1. `requirements.md` contains no endpoint paths, SQL, transport payload details, or framework-specific APIs.
2. `requirements.md` language remains business-capability focused and testable.
3. `specification.md` owns system contracts and input/output semantics.

## Cross-Document Consistency Gates

1. Every `FR-*` maps to one or more `UC-*`.
2. Every `UC-*` references related `FR-*` and relevant `CON-*` when integration exists.
3. Every contract in `specification.md` appears in at least one sequence/flow interaction.
4. System names and IDs (`SYS-*`) are identical across architecture/specification/use-cases.
5. `NFR-*` have measurable targets and corresponding verification in `tests.md`.

## Diagram Gates

1. Diagrams use the same actor/system naming as narrative sections.
2. Diagrams show system boundaries and external dependencies.
3. Interaction diagrams represent only meaningful domain steps (no low-level implementation calls).

## Completeness Gates

1. Core user journeys have at least one complete main flow and error path.
2. Significant external dependencies include failure modes and fallback behavior.
3. If tests are applicable, critical requirements are mapped to at least one validation strategy.

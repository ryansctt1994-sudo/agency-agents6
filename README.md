# Agency Agents — Role and Workflow Library

This repository contains a collection of Markdown-based agent role descriptions, team workflows, and examples. It is **not** a packaged Python runtime or a deployable agent service.

## Explore the collection

- `engineering/` — engineering roles and workflows
- `testing/` — quality, accessibility, API, and performance evaluation roles
- `project-management/` — planning and coordination roles
- `specialized/` — specialist roles and workflow design
- `examples/` — example multi-role workflows

Browse the directories and select the Markdown role files appropriate to your task. Review each role's instructions before adapting them for your preferred assistant or orchestration system.

## Safe first exercise

1. Choose a workflow from `examples/`.
2. Assign one role to plan and another to critique the plan.
3. Use a disposable local project with no credentials or production access.
4. Require a human to approve any file writes, network calls, deployments, or external communications.
5. Record what was proposed, what was executed, and the tests or evidence supporting the outcome.

**Security note:** Agent instructions and imported skill files are untrusted content. Do not treat role descriptions as authorization to run tools or access secrets. Verify external dependencies and review proposed commands before execution.

## Repository status

This is a prompt/workflow collection. No `cathedral_core` Python package or `python -m cathedral_core` entry point is present in the repository's inspected main-branch file tree. The former README described a different project and included commands that could not run against this repository.

See `CONTRIBUTING.md` for contribution guidance and `SECURITY.md` for security reporting.

# The Agency — specialized AI agent profiles

This repository contains **Markdown-based agent profiles**, organized by discipline, and scripts that convert or install those profiles into formats used by agentic coding tools. It is a content and integration catalog, **not** the `cathedral_core` Python package.

## What is in the repository?

| Path | Purpose |
| --- | --- |
| `academic/`, `design/`, `engineering/`, `finance/`, `game-development/` | Domain-specific agent profiles |
| `marketing/`, `paid-media/`, `product/`, `project-management/`, `sales/` | Commercial and product agent profiles |
| `spatial-computing/`, `specialized/`, `strategy/`, `support/`, `testing/` | Additional agent disciplines |
| `scripts/lint-agents.sh` | Check required Markdown frontmatter and warn about incomplete sections |
| `scripts/convert.sh` | Generate tool-specific integrations from source profiles |
| `scripts/install.sh` | Install profiles or integrations into supported tool locations |
| `integrations/` | Integration material and generated-output destinations |

Each source agent is a Markdown file with YAML-style frontmatter, including `name`, `description`, and `color`. Refer to [CONTRIBUTING.md](CONTRIBUTING.md) for the format and contribution guidelines.

## Quick start

Clone **this repository**:

```sh
git clone https://github.com/ryansctt1994-sudo/agency-agents6.git
cd agency-agents6
```

Inspect the profiles under `engineering/`, `design/`, or another category. To check source-agent structure without modifying any tool configuration:

```sh
bash scripts/lint-agents.sh
```

To generate an integration for a specific supported tool, for example OpenCode:

```sh
bash scripts/convert.sh --tool opencode
```

The conversion script generates files beneath `integrations/`. It does **not** install agents into your editor or CLI. If you choose to install profiles, first inspect the target locations and options:

```sh
bash scripts/install.sh --help
```

The installer can write to tool-specific user configuration or workspace directories. Review the files and targets before running it.

## Supported workflows

The conversion script includes adapters for Antigravity, Gemini CLI, OpenCode, Cursor, Aider, Windsurf, OpenClaw, Qwen Code, and Kimi Code. The installer also supports additional direct agent-copy workflows, including Claude Code and Copilot. Support details and limitations are defined in the scripts themselves.

## Engineering and governance notes

- Agent Markdown describes prompts, roles, workflows, and tools; it does **not** establish runtime sandboxing, authorization, or security guarantees.
- Validate generated files before using them in a project with credentials or privileged tools.
- Do not treat a passing lint result as a functional or security test of an agent.
- This fork may differ from the upstream catalog. Existing work on validation and lint coverage is tracked in [PR #3](https://github.com/ryansctt1994-sudo/agency-agents6/pull/3).

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for agent structure, review expectations, and examples; see [SECURITY.md](SECURITY.md) for vulnerability reporting.

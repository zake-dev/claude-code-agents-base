# CLAUDE.md

This file provides guidance to Claude Code when working with this repository.

## Project Overview

[Add your project description here]

## Language Policy

**All generated documents must be written in English:**
- Research documents in `thoughts/`
- Implementation plans
- PR descriptions
- Code comments
- Commit messages

This ensures consistent token efficiency and international collaboration.

## Development Commands

### Quick Actions
- `make setup` - Install dependencies and configure development environment
- `make check` - Run linting and type checking
- `make test` - Run all test suites
- `make check-test` - Run checks and tests together

### Thoughts Sync
- `./hack/thoughts-sync.sh` - Sync thoughts directory and create searchable index

## Workflow

This project uses a structured development workflow:

1. **Research**: `/research_codebase` - Investigate and document findings
2. **Plan**: `/create_plan` - Create detailed implementation plan
3. **Plan Review**: Human reviews and approves the plan
4. **Implement**: `/implement_plan` - Execute the approved plan
5. **Validate**: `/validate_plan` - Verify implementation against plan
6. **PR Review**: `/describe_pr` - Generate PR description

### Ticket Management
- Tickets are stored in `thoughts/shared/tickets/GH-XXX.md`
- Use GitHub Issues for tracking, GitHub Projects for status
- Fetch issue to local file: `./hack/fetch-ticket.sh <issue-number>`
- Then plan with: `/create_plan thoughts/shared/tickets/GH-XXX.md`

## Technical Guidelines

### TypeScript
- Modern ES6+ features
- Strict TypeScript configuration
- Check `package.json` for scripts and dependencies

### Go
- Standard Go idioms
- Context-first API design
- Check `go.mod` for version requirements

### Python
- Use virtual environments
- Follow PEP 8 style guide
- Check `requirements.txt` or `pyproject.toml`

## Development Conventions

### TODO Annotations

Priority-based TODO annotation system:

- `TODO(0)`: Critical - never merge
- `TODO(1)`: High - architectural flaws, major bugs
- `TODO(2)`: Medium - minor bugs, missing features
- `TODO(3)`: Low - polish, tests, documentation
- `TODO(4)`: Questions/investigations needed
- `PERF`: Performance optimization opportunities

### Thoughts Directory Structure

```
thoughts/
├── {username}/           # Personal notes
├── shared/               # Team shared
│   ├── tickets/         # GH-XXX.md format
│   ├── research/        # Investigation documents
│   ├── plans/           # Implementation plans
│   └── prs/             # PR descriptions
└── searchable/          # Auto-generated hard links for search
```

## Additional Resources

- GitHub Issues: Project issue tracking
- GitHub Projects: Workflow status board

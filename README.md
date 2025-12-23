# Claude Code Agents Base

A starter template for projects using [Claude Code](https://docs.anthropic.com/en/docs/claude-code) with a structured development workflow. This repository provides pre-configured agents, commands (skills), and utilities to enhance AI-assisted software development.

## Features

- **Custom Agents**: Specialized sub-agents for codebase exploration, pattern finding, and research
- **Development Workflow Skills**: Plan → Implement → Validate → PR cycle with built-in commands
- **Thoughts Directory**: Structured documentation system for research, plans, and tickets
- **CI/CD Integration**: GitHub Actions workflows with Claude Code support
- **Utility Scripts**: Helper tools for repository setup, git worktrees, and thoughts synchronization

## Getting Started

### Prerequisites

- [Claude Code CLI](https://docs.anthropic.com/en/docs/claude-code) installed
- Git

### Installation

1. Use this template to create a new repository or clone directly:

```bash
git clone https://github.com/your-org/claude-code-agents-base.git your-project
cd your-project
```

2. Run the setup script:

```bash
make setup
```

3. Update `CLAUDE.md` with your project-specific instructions.

## Development Workflow

This template provides a structured workflow for AI-assisted development:

| Step | Command | Description |
|------|---------|-------------|
| 1. Research | `/research_codebase` | Investigate and document findings |
| 2. Plan | `/create_plan` | Create detailed implementation plan |
| 3. Review | - | Human reviews and approves the plan |
| 4. Implement | `/implement_plan` | Execute the approved plan |
| 5. Validate | `/validate_plan` | Verify implementation against plan |
| 6. PR | `/describe_pr` | Generate PR description |

### Additional Commands

- `/commit` - Create git commits with standardized messages
- `/debug` - Debug issues by investigating logs and git history
- `/create_handoff` - Create handoff document for session transfer
- `/resume_handoff` - Resume work from handoff document

## Project Structure

```
.
├── .claude/
│   ├── agents/          # Custom sub-agent definitions
│   ├── commands/        # Skill/command definitions
│   └── settings.json    # Claude Code settings
├── .github/
│   ├── workflows/       # CI/CD workflows with Claude integration
│   └── ISSUE_TEMPLATE/  # Issue and PR templates
├── hack/
│   ├── setup_repo.sh    # Repository setup script
│   ├── thoughts-sync.sh # Thoughts directory sync
│   └── create_worktree.sh # Git worktree helper
├── thoughts/            # Documentation directory (create as needed)
│   ├── {username}/      # Personal notes
│   └── shared/          # Team shared docs
│       ├── tickets/     # Issue tracking (GH-XXX.md)
│       ├── research/    # Investigation documents
│       ├── plans/       # Implementation plans
│       └── prs/         # PR descriptions
├── CLAUDE.md            # Project instructions for Claude Code
├── Makefile             # Development commands
└── README.md
```

## Custom Agents

| Agent | Description |
|-------|-------------|
| `codebase-locator` | Locates files and components relevant to a task |
| `codebase-analyzer` | Analyzes implementation details |
| `codebase-pattern-finder` | Finds similar implementations and patterns |
| `thoughts-locator` | Discovers relevant documents in thoughts/ |
| `thoughts-analyzer` | Deep dive research on topics |
| `web-search-researcher` | Research using web search |

## Make Targets

```bash
make help          # Show all available targets
make setup         # Install dependencies and configure environment
make check         # Run linting and type checking
make test          # Run all tests
make check-test    # Run checks and tests together
make thoughts-sync # Sync thoughts directory
make worktree      # Create git worktree for parallel development
make githooks      # Install git hooks
```

## Customization

### Adding Project-Specific Setup

Edit `hack/setup_repo.sh` to add your project's dependencies:

```bash
# Example for Go:
run_silent "Installing Go dependencies" "go mod download"

# Example for TypeScript:
run_silent "Installing npm dependencies" "npm install"
```

### Configuring Checks and Tests

Update the `Makefile` with your project's commands:

```makefile
check:
    golangci-lint run ./...   # For Go
    npm run lint              # For TypeScript

test:
    go test ./...             # For Go
    npm test                  # For TypeScript
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgements

This project includes code derived from [humanlayer](https://github.com/humanlayer/humanlayer). See [NOTICE.md](NOTICE.md) for details.

.PHONY: setup setup-ci check test check-test help githooks worktree thoughts-sync

# Default target
.DEFAULT_GOAL := help

##@ Setup

setup: ## Install dependencies and configure environment
	@./hack/setup_repo.sh

setup-ci: ## Setup for CI environment
	@CI=true ./hack/setup_repo.sh

##@ Development

check: ## Run linting and type checking
	@echo "Running checks..."
	@# Add your check commands here
	@# Example for Go: golangci-lint run ./...
	@# Example for TypeScript: npm run lint
	@echo "Checks passed"

test: ## Run all tests
	@echo "Running tests..."
	@# Add your test commands here
	@# Example for Go: go test ./...
	@# Example for TypeScript: npm test
	@echo "Tests passed"

check-test: check test ## Run checks and tests

##@ Utilities

thoughts-sync: ## Sync thoughts directory
	@./hack/thoughts-sync.sh

worktree: ## Create a git worktree for parallel development
	@./hack/create_worktree.sh

githooks: ## Install git hooks
	@echo "Installing git hooks..."
	@echo 'make check test' > .git/hooks/pre-push
	@chmod +x .git/hooks/pre-push
	@echo "Git hooks installed"

##@ Help

help: ## Show this help
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

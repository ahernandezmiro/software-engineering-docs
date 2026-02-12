#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="${1:-.}"

if ! command -v rg >/dev/null 2>&1; then
  echo "error: ripgrep (rg) is required" >&2
  exit 1
fi

echo "# Project Inventory"
echo
echo "## Root"
echo "- $(cd "$ROOT_DIR" && pwd)"
echo
echo "## Candidate Documentation Files"
rg --files "$ROOT_DIR" | rg -i '(^|/)(readme|docs|adr|architecture|requirements|spec|design|use_cases|tests?)' | sed 's/^/- /' || true
echo
echo "## Likely Service Boundaries (file hints)"
rg --files "$ROOT_DIR" | rg -i '(route|controller|handler|service|consumer|producer|gateway|client|api|grpc|event|queue|worker)' | head -n 200 | sed 's/^/- /' || true
echo
echo "## Domain Model Hints"
rg --files "$ROOT_DIR" | rg -i '(domain|entity|model|aggregate|valueobject|repository)' | head -n 200 | sed 's/^/- /' || true
echo
echo "## Test Surface"
rg --files "$ROOT_DIR" | rg -i '(test|spec)\.(js|ts|py|go|java|rb|rs|cs|php)$|(^|/)(tests?|__tests__)/' | head -n 200 | sed 's/^/- /' || true
echo
echo "## Dependency / Build Files"
rg --files "$ROOT_DIR" | rg -i '(^|/)(package\.json|pnpm-lock\.yaml|yarn\.lock|pom\.xml|build\.gradle|go\.mod|Cargo\.toml|requirements\.txt|pyproject\.toml|Gemfile|composer\.json|Makefile|Dockerfile)' | sed 's/^/- /' || true

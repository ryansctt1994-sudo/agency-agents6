#!/usr/bin/env bash
# Deterministic, dependency-free fixture tests for scripts/lint-agents.sh.
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
tmp="$(mktemp -d)"
trap 'rm -rf "$tmp"' EXIT
passed=0

assert_exit() {
  local label="$1" expected="$2" file="$3"
  local rc=0
  bash "$ROOT/scripts/lint-agents.sh" "$file" >"$tmp/output" 2>&1 || rc=$?
  if [[ "$expected" == "pass" && "$rc" -ne 0 ]] || [[ "$expected" == "fail" && "$rc" -eq 0 ]]; then
    echo "FAIL $label (exit=$rc, expected=$expected)"
    cat "$tmp/output"
    exit 1
  fi
  echo "PASS $label"
  passed=$((passed + 1))
}
valid_body='## Identity
A careful engineer reviews plans with independent verification and refuses unapproved execution.
## Core Mission
Inspect evidence, report failures, validate inputs, and keep all protected changes gated.
## Critical Rules
Never access production, disclose secrets, modify the main branch, or claim success without logs.'
printf '%s\n' '---' 'name: reviewer' 'description: verifies changes' 'color: blue' '---' "$valid_body" >"$tmp/valid.md"
assert_exit valid-frontmatter pass "$tmp/valid.md"
printf '%s\n' 'name: reviewer' 'description: verifies changes' 'color: blue' "$valid_body" >"$tmp/missing-open.md"
assert_exit missing-opening fail "$tmp/missing-open.md"
printf '%s\n' '---' 'name: reviewer' 'description: verifies changes' 'color: blue' "$valid_body" >"$tmp/missing-close.md"
assert_exit missing-closing fail "$tmp/missing-close.md"
printf '%s\n' '---' 'name: reviewer' 'description: verifies changes' 'color: blue' '***' "$valid_body" >"$tmp/wrong-close.md"
assert_exit wrong-delimiter fail "$tmp/wrong-close.md"
printf '%s\n' '---' 'name: reviewer' 'color: blue' '---' "$valid_body" >"$tmp/missing-field.md"
assert_exit missing-required-field fail "$tmp/missing-field.md"
printf '%s\r\n' '---' 'name: reviewer' 'description: verifies changes' 'color: blue' '---' "$valid_body" >"$tmp/crlf.md"
assert_exit windows-crlf pass "$tmp/crlf.md"
printf '%s\n' '---' 'name: 审查者' 'description: Prüfung — 검토' 'color: blue' '---' "$valid_body" >"$tmp/unicode.md"
assert_exit unicode-frontmatter pass "$tmp/unicode.md"
echo "Agent lint fixtures: $passed passed."

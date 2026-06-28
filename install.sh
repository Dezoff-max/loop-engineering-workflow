#!/usr/bin/env bash
set -euo pipefail

REPO_URL="${REPO_URL:-https://github.com/Dezoff-max/loop-engineering-workflow.git}"
DEFAULT_INSTALL_DIR="$HOME/.codex/skills/loop-engineering-workflow"
LEGACY_INSTALL_DIR="$HOME/.codex/skills/loop"
INSTALL_DIR="${INSTALL_DIR:-$DEFAULT_INSTALL_DIR}"

info() {
  printf '%s\n' "$1"
}

fail() {
  printf 'Error: %s\n' "$1" >&2
  exit 1
}

command -v git >/dev/null 2>&1 || fail "git is required to install Loop Engineering Workflow."

parent_dir="$(dirname "$INSTALL_DIR")"
mkdir -p "$parent_dir"

if [ "$INSTALL_DIR" = "$DEFAULT_INSTALL_DIR" ] && [ -e "$LEGACY_INSTALL_DIR" ]; then
  if [ ! -e "$DEFAULT_INSTALL_DIR" ]; then
    fail "$LEGACY_INSTALL_DIR already exists. Move it to $DEFAULT_INSTALL_DIR or set INSTALL_DIR to avoid duplicate loop skills."
  fi
  info "Warning: legacy install path also exists at $LEGACY_INSTALL_DIR. Remove it or keep only one loop skill to avoid duplicate skill names."
fi

if [ -e "$INSTALL_DIR" ]; then
  if [ ! -d "$INSTALL_DIR/.git" ]; then
    fail "$INSTALL_DIR already exists and is not a git repository. Move it first or set INSTALL_DIR."
  fi

  current_origin="$(git -C "$INSTALL_DIR" remote get-url origin 2>/dev/null || true)"
  case "$current_origin" in
    "$REPO_URL"|"https://github.com/Dezoff-max/loop-engineering-workflow"|"git@github.com:Dezoff-max/loop-engineering-workflow.git")
      ;;
    *)
      fail "$INSTALL_DIR already exists and points to a different remote: $current_origin"
      ;;
  esac

  if [ -n "$(git -C "$INSTALL_DIR" status --porcelain)" ]; then
    fail "$INSTALL_DIR has local changes. Commit, stash, or back them up before updating."
  fi

  info "Updating Loop Engineering Workflow in $INSTALL_DIR..."
  git -C "$INSTALL_DIR" pull --ff-only
else
  info "Installing Loop Engineering Workflow to $INSTALL_DIR..."
  git clone "$REPO_URL" "$INSTALL_DIR"
fi

info "Installed successfully."
info "Use it in Codex with: \$loop"

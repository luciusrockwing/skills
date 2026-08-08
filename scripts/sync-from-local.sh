#!/usr/bin/env bash
# Pull latest skills from the 3 local sources into this repo.
# Run from repo root: bash scripts/sync-from-local.sh
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
VAULT="$REPO_ROOT/skills/vault"
META="$REPO_ROOT/skills/meta"
CODING="$REPO_ROOT/skills/coding"

SRC_VAULT="${SECONDBRAIN:-/storage/emulated/0/Documents/secondbrain}/.agents/skills"
SRC_META="$HOME/.agents/skills"
SRC_CODING="$HOME/.pi/agent/git/github.com"

DUPES="research-add-fields research-add-items research-deep research-report"

sync_dir() {
  local src="$1" dst="$2" exclude="$3"
  [ -d "$src" ] || { echo "missing source: $src"; return; }
  for d in "$src"/*/; do
    [ -d "$d" ] || continue
    n=$(basename "$d")
    case " $exclude " in *" $n "*) continue;; esac
    rm -rf "$dst/$n"
    cp -r "$d" "$dst/$n"
    # canonicalize hard paths -> $SKILLS_HOME
    if [ -f "$dst/$n/SKILL.md" ]; then
      sed -i -E 's#~/\.(claude|codex)/skills#$SKILLS_HOME#g' "$dst/$n/SKILL.md"
    fi
    echo "synced: $n"
  done
}

echo "== vault ==";   sync_dir "$SRC_VAULT" "$VAULT" ""
echo "== meta ==";    sync_dir "$SRC_META"  "$META"  "$DUPES"
# coding source is nested (github.com/owner/repo/skills); explicit loop
echo "== coding ==";  rm -rf "$CODING"/* 2>/dev/null || true
for d in "$SRC_CODING"/*/*/skills/*/; do
  [ -d "$d" ] || continue
  n=$(basename "$d")
  cp -r "$d" "$CODING/$n"
  echo "synced: $n"
done

chmod -R u+rw,go+r "$REPO_ROOT/skills"
echo "done. review with: git status"

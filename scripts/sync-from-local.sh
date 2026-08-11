#!/usr/bin/env bash
# Pull latest skills from local secondbrain source into this repo.
# Run from repo root: bash scripts/sync-from-local.sh
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
SRC="${SECONDBRAIN:-$HOME/workspace/secondbrain/.agents/skills}"
DST="$REPO_ROOT/skills"

sync_dir() {
  local src="$1" dst="$2"
  [ -d "$src" ] || { echo "missing source: $src"; return; }
  for d in "$src"/*/; do
    [ -d "$d" ] || continue
    n=$(basename "$d")
    rm -rf "$dst/$n"
    cp -r "$d" "$dst/$n"
    if [ -f "$dst/$n/SKILL.md" ]; then
      sed -i -E 's#~/\.(claude|codex)/skills#$SKILLS_HOME#g' "$dst/$n/SKILL.md"
    fi
    echo "synced: $n"
  done
}

echo "== knowledge =="; sync_dir "$SRC" "$DST/knowledge"
echo "== research ==";  sync_dir "$SRC" "$DST/research"
echo "== code ==";      sync_dir "$SRC" "$DST/code"
echo "== design ==";    sync_dir "$SRC" "$DST/design"
echo "== author ==";    sync_dir "$SRC" "$DST/author"
echo "== modes ==";     sync_dir "$SRC" "$DST/modes"
echo "== web ==";       sync_dir "$SRC" "$DST/web"
echo "== config ==";    sync_dir "$SRC" "$DST/config"
echo "== experiments =="; sync_dir "$SRC" "$DST/experiments"

chmod -R u+rw,go+r "$DST"
echo "done. review with: git status"

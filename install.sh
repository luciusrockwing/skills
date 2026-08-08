#!/usr/bin/env bash
# luciusrockwing/skills installer — copies skills into ~/.agents/skills (or --dir)
set -euo pipefail

REPO_RAW="https://raw.githubusercontent.com/luciusrockwing/skills/main"
DEFAULT_DIR="$HOME/.agents/skills"
TARGET="$DEFAULT_DIR"
CAT=""
FORCE=0
DRY=0

usage() { echo "usage: install.sh [--cat vault|meta|coding] [--dir PATH] [--force] [--dry-run]"; exit 1; }

while [ $# -gt 0 ]; do
  case "$1" in
    --cat) CAT="$2"; shift 2;;
    --dir) TARGET="$2"; shift 2;;
    --force) FORCE=1; shift;;
    --dry-run) DRY=1; shift;;
    -h|--help) usage;;
    *) usage;;
  esac
done

[ -n "$CAT" ] && case "$CAT" in vault|meta|coding) ;; *) echo "bad --cat: $CAT"; exit 1;; esac

SRC="${SKILLS_SRC_DIR:-}"
if [ -z "$SRC" ]; then
  # running from a clone: use local skills/; else fetch via curl into temp
  if [ -d "skills" ]; then SRC="skills"; fi
fi

copy_one() {
  local rel="$1" src="$2" dst="$TARGET/$rel"
  if [ -e "$dst" ] && [ "$FORCE" -eq 0 ]; then
    echo "skip (exists): $rel"; return
  fi
  if [ "$DRY" -eq 1 ]; then echo "copy: $rel -> $dst"; return; fi
  mkdir -p "$(dirname "$dst")"
  cp -r "$src" "$dst"
  # rewrite $SKILLS_HOME token to actual target dir
  if [ -f "$dst/SKILL.md" ]; then
    sed -i "s#\$SKILLS_HOME#$TARGET#g" "$dst/SKILL.md"
  fi
  echo "ok: $rel"
}

if [ -n "$SRC" ]; then
  for cat in ${CAT:-vault meta coding}; do
    [ -d "$SRC/$cat" ] || continue
    for d in "$SRC/$cat"/*/; do
      [ -d "$d" ] || continue
      copy_one "$cat/$(basename "$d")" "$d"
    done
  done
  echo "done -> $TARGET"
  exit 0
fi

# no local skills dir: stream from raw repo
TMP=$(mktemp -d); trap 'rm -rf "$TMP"' EXIT
echo "fetching index from $REPO_RAW/skills ..."
for cat in ${CAT:-vault meta coding}; do
  # list dirs via GitHub API-free: fetch known index from README not available; use raw tree fallback
  echo "remote streaming for '$cat' not supported without clone; clone first:" >&2
  echo "  git clone https://github.com/luciusrockwing/skills && cd skills && ./install.sh" >&2
  exit 1
done

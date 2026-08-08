# AGENTS.md — luciusrockwing/skills

## Purpose

Single public source of truth for RA's personal agent skills, installable into `~/.agents/skills` via one link.

## Layout

- `skills/vault/` — obsidian/research/second-brain skills (from `secondbrain/.agents/skills`)
- `skills/meta/` — caveman + agent-meta skills (from `~/.agents/skills`)
- `skills/coding/` — ponytail, superpowers, drawio (from `~/.pi/agent/git/github.com/*/skills`)
- `scripts/sync-from-local.sh` — pull latest from the 3 local sources
- `install.sh` — curl|bash installer

## Contracts

- One target only: `~/.agents/skills` (or repo-local `.agents/skills` via `--dir`).
- No CLI dialect splits (no `.claude`/`.codex`/opencode variants).
- 4 `research-*` skills kept once, canonically in `skills/vault/`.
- Skill files use the `$SKILLS_HOME` token for runtime paths; `install.sh` rewrites it to the target dir.

## Update workflow

1. Edit skills locally in their source.
2. `bash scripts/sync-from-local.sh` to pull into this repo.
3. Review diff, `git add -A && git commit && git push`.

## Verification

- `bash -n install.sh`
- `./install.sh --dry-run` lists copies
- fresh clone + `./install.sh` populates `~/.agents/skills/<name>/SKILL.md`

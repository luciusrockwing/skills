# luciusrockwing/skills

RA's personal agent skills, collected from three local sources and installable into `~/.agents/skills` with one command.

## Install

```bash
# all categories -> ~/.agents/skills
curl -fsSL https://raw.githubusercontent.com/luciusrockwing/skills/main/install.sh | bash

# one category only
curl -fsSL https://raw.githubusercontent.com/luciusrockwing/skills/main/install.sh | bash -s -- --cat vault

# custom target dir (e.g. repo-local .agents/skills)
curl -fsSL https://raw.githubusercontent.com/luciusrockwing/skills/main/install.sh | bash -s -- --dir ./myrepo/.agents/skills

# overwrite existing
curl -fsSL https://raw.githubusercontent.com/luciusrockwing/skills/main/install.sh | bash -s -- --force

# preview only
curl -fsSL https://raw.githubusercontent.com/luciusrockwing/skills/main/install.sh | bash -s -- --dry-run
```

## Categories

| Dir | Source | Count | Contents |
| --- | --- | --- | --- |
| `skills/vault/` | `secondbrain/.agents/skills` | 32 | obsidian, research, second-brain, compress, defuddle, diagnose, frontend-design, git, json-canvas, misc-*, personal-*, server-healthcheck, shadcn-improve, spec-driven-development, to-issues, to-prd, web-search, write-a-skill, zoom-out |
| `skills/meta/` | `~/.agents/skills` | 16 | caveman*, engineering, improve, in-progress, misc, personal, productivity, research, session-handoff |
| `skills/coding/` | `~/.pi/agent/git/github.com/*/skills` | 21 | ponytail +5, superpowers/*, drawio-skill |

## Notes

- Single target only: `~/.agents/skills` (and its repo-local variant). No Claude/Codex/OpenCode splits.
- 4 `research-*` skills exist in both vault and meta sources; kept once, canonically in `skills/vault/`.
- Hard-coded home paths are rewritten to the `$SKILLS_HOME` token at copy time.

## Sync from local

```bash
bash scripts/sync-from-local.sh
```

Pulls the latest from the three local sources into this repo (manual commit after).

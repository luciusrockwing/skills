# luciusrockwing/skills

RA's personal agent skills — installable into `~/.agents/skills` with one command.

## Install

```bash
curl -fsSL https://raw.githubusercontent.com/luciusrockwing/skills/main/install.sh | bash
```

Options:

```bash
# one category only
curl -fsSL .../install.sh | bash -s -- --cat vault

# custom target dir (e.g. repo-local)
curl -fsSL .../install.sh | bash -s -- --dir ./myrepo/.agents/skills

# overwrite existing
curl -fsSL .../install.sh | bash -s -- --force

# preview only
curl -fsSL .../install.sh | bash -s -- --dry-run
```

## Categories

| Dir | Source | Count | Contents |
| --- | --- | --- | --- |
| `skills/vault/` | `~/.agents/skills` | 32 | obsidian, research, second-brain, compress, defuddle, diagnose, frontend-design, git, json-canvas, misc-*, personal-*, server-healthcheck, shadcn-improve, spec-driven-development, to-issues, to-prd, web-search, write-a-skill, zoom-out |
| `skills/meta/` | `~/.agents/skills` | 16 | caveman*, engineering, improve, in-progress, misc, personal, productivity, research, session-handoff |
| `skills/coding/` | `~/.pi/agent/git/github.com/*/skills` | 21 | ponytail +5, superpowers/*, drawio-skill |

## Notes

- Single target only: `~/.agents/skills` (or repo-local via `--dir`). No Claude/Codex/OpenCode splits.
- Hard-coded home paths are rewritten to `$SKILLS_HOME` at install time.
- `scripts/sync-from-local.sh` is for repo maintainers only — not needed for end users.

## Credits

### External upstreams

| Original repo | Skills |
| --- | --- |
| [DietrichGebert/ponytail](https://github.com/DietrichGebert/ponytail) | `ponytail`, `ponytail-audit`, `ponytail-debt`, `ponytail-gain`, `ponytail-help`, `ponytail-review` |
| [obra/superpowers](https://github.com/obra/superpowers) | `brainstorming`, `dispatching-parallel-agents`, `executing-plans`, `finishing-a-development-branch`, `receiving-code-review`, `requesting-code-review`, `subagent-driven-development`, `systematic-debugging`, `test-driven-development`, `using-git-worktrees`, `using-superpowers`, `verification-before-completion`, `writing-plans`, `writing-skills` |
| [Agents365-ai/drawio-skill](https://github.com/Agents365-ai/drawio-skill) | `drawio-skill` |
| [JuliusBrussee/caveman](https://github.com/JuliusBrussee/caveman) | `caveman-compress`, `caveman-help` |
| [obsidianmd/jsoncanvas](https://github.com/obsidianmd/jsoncanvas) | `json-canvas` |
| [mariano-aguero/spec-driven-development-skill](https://github.com/mariano-aguero/spec-driven-development-skill) | `spec-driven-development` |

### Original (RA-authored, no external upstream)

- **vault/**: `compress`, `defuddle`, `diagnose`, `frontend-design`, `git`, `misc-scaffold-exercises`, `misc-setup-pre-commit`, `obsidian-bases`, `obsidian-cli`, `obsidian-markdown`, `personal-edit-article`, `personal-obsidian-vault`, `research-add-fields`, `research-add-items`, `research-deep`, `research-report`, `second-brain`, `second-brain-ingest`, `second-brain-lint`, `second-brain-query`, `server-healthcheck`, `shadcn-improve`, `to-issues`, `to-prd`, `web-search`, `write-a-skill`, `zoom-out`
- **meta/**: `cavecrew`, `caveman`, `caveman-commit`, `caveman-review`, `caveman-stats`, `deprecated`, `engineering`, `improve`, `misc`, `personal`, `productivity`, `research`, `session-handoff`

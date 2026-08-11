# luciusrockwing/skills

RA's personal agent skills — installable into `~/.agents/skills/` with one command.

## Install

```bash
curl -fsSL https://raw.githubusercontent.com/luciusrockwing/skills/main/install.sh | bash
```

Options:

```bash
# custom target dir (e.g. repo-local)
curl -fsSL .../install.sh | bash -s -- --dir ./myrepo/.agents

# overwrite existing
curl -fsSL .../install.sh | bash -s -- --force

# preview only
curl -fsSL .../install.sh | bash -s -- --dry-run
```

## Categories

| Dir | Source | Count | Contents |
| --- | --- | --- | --- |
| `knowledge/` | `~/.agents/skills` | 10 | obsidian, second-brain, json-canvas, edit-article |
| `research/` | `~/.agents/skills` | 5 | research pipeline (deep, report, add-items, etc.) |
| `code/` | mixed | 32 | TDD, debugging, superpowers, ponytail, codebase-design, prototype |
| `design/` | mixed | 3 | frontend-design, drawio-skill, shadcn-improve |
| `author/` | `~/.agents/skills` | 5 | write-a-skill, zoom-out, writing-great-skills, to-issues, to-prd |
| `modes/` | `~/.agents/skills` | 20 | caveman*, session-handoff, grilling, teach, improve, spec-driven |
| `web/` | `~/.agents/skills` | 1 | web-search |
| `config/` | `~/.agents/skills` | 12 | git, diagnose, compress, setup, server-healthcheck |
| `archive/` | `~/.agents/skills` | 7 | all deprecated skills |
| `experiments/` | `~/.agents/skills` | 7 | in-progress skills |

## Notes

- Single target only: `~/.agents/skills/` (or repo-local via `--dir`). No Claude/Codex/OpenCode splits.
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

- **knowledge/**: obsidian-bases, obsidian-cli, obsidian-markdown, personal-edit-article, personal-obsidian-vault, second-brain (+ ingest, lint, query), json-canvas
- **research/**: research, research-add-fields, research-add-items, research-deep, research-report
- **code/**: codebase-design, domain-modeling, prototype, improve-codebase-architecture, code-review, diagnosing-bugs, implement, tdd, triage, wayfinder, research-matt, resolving-merge-conflicts
- **design/**: frontend-design, shadcn-improve
- **author/**: write-a-skill, zoom-out, writing-great-skills, to-issues, to-prd
- **modes/**: cavecrew, caveman (+ commit, compress, help, review, stats), edit-article, grill-me, grill-with-docs, grilling, handoff, improve, obsidian-vault, session-handoff, spec-driven-development, teach, to-spec, to-tickets, ask-matt
- **config/**: compress, defuddle, diagnose, git, git-guardrails-claude-code, migrate-to-shoehorn, scaffold-exercises, setup-pre-commit, server-healthcheck, setup-matt-pocock-skills
- **experiments/**: claude-handoff, loop-me, setup-ts-deep-modules, wizard, writing-beats, writing-fragments, writing-shape

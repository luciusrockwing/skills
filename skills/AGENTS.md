# AGENTS.md — skills/

## Purpose

All installable agent skills for the `luciusrockwing/skills` repository. This folder is the single source of truth for every skill that ships to `~/.agents/skills/`.

## Ownership

Owned by RA. Each skill is independently installable. Category folders group skills by workflow domain; they do not add their own rules beyond what this doc and the root AGENTS.md specify.

## Local Contracts

- **One SKILL.md per skill.** Every skill folder must contain exactly one `SKILL.md` — that is the canonical, loadable unit. README, scripts, references, and assets are optional supplements.
- **`$SKILLS_HOME` token.** Skill files use `$SKILLS_HOME` for runtime paths. `install.sh` rewrites it to the target directory at install time. Never hardcode `~/.agents/skills` inside a skill.
- **No CLI dialect splits.** A skill ships once. No `.claude/`, `.codex/`, or `opencode` variants of the same skill.
- **Category READMEs.** Each category folder (`vault/`, `meta/`, `coding/`) keeps a `README.md` that lists its skills and their one-line purpose. The README is a navigation aid, not a contract — the contract lives here and in the skill's own `SKILL.md`.

## Work Guidance

- **Adding a skill:** Create `<category>/<skill-name>/SKILL.md`. If it's a new category, create the folder and a `README.md` listing its skills. Update this doc's Child DOX Index.
- **Editing a skill:** Edit `SKILL.md`. Keep the YAML frontmatter (`name`, `description`) current — the plugin uses it for triggering and discovery.
- **Deprecating a skill:** Move it to the deprecated area. Update the relevant README. Remove it from the Child DOX Index under its former category.
- **Sync workflow (for repo maintainers):** `bash scripts/sync-from-local.sh` pulls latest from local sources. Review diff, commit, push.

## Verification

- `bash -n install.sh` — installer parses
- `./install.sh --dry-run` — lists what would copy without writing
- Every skill folder has exactly one `SKILL.md`
- `$SKILLS_HOME` appears in skill files, never a hardcoded path
- Category READMEs match their actual contents

## Child DOX Index

### vault/ (32 skills)

Obsidian, research, second-brain, compress, defuddle, diagnose, frontend-design, git, json-canvas, misc-scaffold-exercises, misc-setup-pre-commit, obsidian-bases, obsidian-cli, obsidian-markdown, personal-edit-article, personal-obsidian-vault, research-add-fields, research-add-items, research-deep, research-report, second-brain-ingest, second-brain-lint, second-brain-query, server-healthcheck, shadcn-improve, spec-driven-development, to-issues, to-prd, web-search, write-a-skill, zoom-out, deprecated-design-an-interface, deprecated-qa, deprecated-request-refactor-plan

### meta/ (16 skills)

cavecrew, caveman, caveman-commit, caveman-compress, caveman-help, caveman-review, caveman-stats, deprecated, engineering, improve, in-progress, misc, personal, productivity, research, session-handoff

### coding/ (21 skills)

brainstorming, dispatching-parallel-agents, drawio-skill, executing-plans, finishing-a-development-branch, ponytail, ponytail-audit, ponytail-debt, ponytail-gain, ponytail-help, ponytail-review, receiving-code-review, requesting-code-review, subagent-driven-development, systematic-debugging, test-driven-development, using-git-worktrees, using-superpowers, verification-before-completion, writing-plans, writing-skills

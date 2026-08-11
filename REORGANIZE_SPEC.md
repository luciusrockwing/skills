# Implementation Spec: Reorganize Skills by Workflow Domain

## Goal

Reorganize `~/.agents/skills` from the old `vault/` `meta/` `coding/` three-bucket structure into workflow-domain folders that reflect how each skill is actually used.

## Final Structure

```
skills/
├── archive/        # Retired skills (7)
├── author/         # Writing as craft (3)
├── code/           # Code creation and architecture (33)
├── config/         # Setup, configure, maintain (11)
├── design/         # UI, UX, visual design (3)
├── experiments/    # Active development (7)
├── knowledge/      # Personal knowledge base (10)
├── modes/          # Ways of working (16)
├── research/       # Research pipeline (5)
└── web/            # Web search (1)
```

## Skill Mapping

### knowledge/ (10)
obsidian-bases, obsidian-cli, obsidian-markdown, personal-obsidian-vault, second-brain, second-brain-ingest, second-brain-lint, second-brain-query, json-canvas, personal-edit-article

### research/ (5)
research, research-add-fields, research-add-items, research-deep, research-report

### code/ (33)
brainstorming, codebase-design, dispatching-parallel-agents, domain-modeling, executing-plans, finishing-a-development-branch, improve-codebase-architecture, ponytail, ponytail-audit, ponytail-debt, ponytail-gain, ponytail-help, ponytail-review, prototype, receiving-code-review, requesting-code-review, subagent-driven-development, systematic-debugging, test-driven-development, using-git-worktrees, using-superpowers, verification-before-completion, writing-plans, writing-skills

### design/ (3)
drawio-skill, frontend-design, shadcn-improve

### author/ (3)
write-a-skill, writing-great-skills, zoom-out

### modes/ (16)
cavecrew, caveman, caveman-commit, caveman-compress, caveman-help, caveman-review, caveman-stats, edit-article, grill-me, grilling, handoff, improve, obsidian-vault, session-handoff, teach

### web/ (1)
web-search

### config/ (11)
compress, defuddle, diagnose, git, git-guardrails-claude-code, migrate-to-shoehorn, misc-scaffold-exercises, misc-setup-pre-commit, scaffold-exercises, setup-matt-pocock-skills, setup-pre-commit

### archive/ (7)
deprecated-design-an-interface, deprecated-qa, deprecated-request-refactor-plan, design-an-interface, qa, request-refactor-plan, ubiquitous-language

### experiments/ (7)
claude-handoff, loop-me, setup-ts-deep-modules, wizard, writing-beats, writing-fragments, writing-shape

## Status

COMPLETE — all skills moved, old folders removed, structure verified.

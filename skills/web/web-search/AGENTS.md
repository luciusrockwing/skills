# web-search/ — Web Search Modules

## Purpose

Provides modular web search capabilities with specialized search strategies per domain.

## Ownership

Owned by `.agents/AGENTS.md`. Maintained as part of the skill library.

## Local Contracts

- `SKILL.md` contains the primary search agent instructions
- `modules/` contains per-domain search strategy files
- Each module file documents a specific search domain's quirks, tokens, and effective query patterns

## Work Guidance

Add a new module when a distinct search domain requires unique strategy. Keep modules focused and concise.

## Verification

Search results should be tested periodically against real queries for each module.

## Child DOX Index

- `modules/academic-papers.md` — Academic search strategy
- `modules/chinese-tech.md` — Chinese tech search strategy
- `modules/general-web.md` — General web search strategy
- `modules/github-debug.md` — GitHub issue/debug search strategy
- `modules/stackoverflow.md` — StackOverflow search strategy

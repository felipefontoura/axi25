# 4. Implementation

> The nuts and bolts. If [Philosophy](01-philosophy.md) is *why* and
> [Techniques](03-techniques.md) is *how you think*, this is *how the files actually work*.

## The folder tree

```
AXI25/
├── AGENTS.md            constitution — every agent reads this (the single source of truth)
├── CLAUDE.md            Claude Code / ObsidiBot context file → imports AGENTS.md (@AGENTS.md)
├── opencode.json        OpenCode config → points at AGENTS.md, defines the "axi25" agent
├── index.md             catalog of all wiki pages (the agent maintains it)
├── log.md               append-only operations log
├── .bin/install.sh / .ps1    optional: re-sync the .claude/skills copy; health check
├── .agents/skills/      the 13 skills — canonical (Codex, OpenCode, Pi read this natively)
├── .claude/skills/      a REAL copy of the 13 skills for Claude Code + the ObsidiBot wrapper
├── .obsidian/           Obsidian vault config (plugins, appearance) — the primary path
├── 00-capture/          INBOX  → quick/ diary/ studies/ worklogs/
├── 10-sources/          RAW MATERIAL (read-only) → articles/ books/ courses/ papers/ assets/
├── 20-wiki/             KNOWLEDGE → concepts/ entities/ areas/ decisions/ patterns/ syntheses/ maps/
├── 25-studies/          STUDY IN FORMATION
├── 30-projects/         EXECUTION → active/ someday/ archive/
├── 35-worklogs/         WORK DONE → + harvest/
├── 40-journal/          LIFE → daily/ weekly/ signals/
├── 50-zeitgeist/        TEMPORAL DISCOURSE → discourse/{articles,papers,threads,talks} syntheses/ observations/
├── 90-system/           CONFIG → references/ (templates, operations, user-profile) prompts/ scripts/
└── docs/                this documentation
```

Every top-level layer has a `README.md` describing its local contract. Empty folders keep a
`.keep` file so the structure ships intact.

## Frontmatter conventions

Every page carries YAML frontmatter. The required base is `type`, plus `created`/`updated` (or
`date`) and `areas` where relevant. Each page type has its own fields — the canonical set lives
in [`90-system/references/page-templates.md`](../../90-system/references/page-templates.md). Examples:

```yaml
# concept
type: concept
areas: [learning]
created: 2026-01-15
updated: 2026-01-15
confidence: high        # high | medium | low | speculative
```

```yaml
# worklog
type: worklog
date: 2026-01-15
areas: [work, learning]
projects: [my-project]
status: unprocessed     # → processed once harvested
```

`confidence` and `status` are load-bearing: `axi25-lint` and the maturity rules read them.

## Naming & language

- **Filenames**: kebab-case, in the user's `filename_language` (default `match` = the user's
  language; `en` forces English slugs regardless of content). Set it in
  [`user-profile.md`](../../90-system/references/user-profile.md).
- **File content**: always the user's default language.
- **Wikilinks**: `[[kebab-case-name]]`, bare — never wrapped in backticks (that breaks link
  navigation in several editors).
- **Dates**: ISO 8601 (`YYYY-MM-DD`).

## The 13 skills

Skills are Markdown instruction files (`SKILL.md`). They trigger from natural language; the
full trigger table is in [`AGENTS.md`](../../AGENTS.md) § Skills Reference.

| Skill | Fires on | Does | Touches |
|---|---|---|---|
| `axi25-onboarding` | first run / "onboarding" | guided setup + micro-training | user-profile, first pages |
| `axi25-doctor` | "check my setup" / missing tool | detects & installs dependencies (with consent) | your environment |
| `axi25-core` | any vault interaction | operational loop, conventions | index, log |
| `axi25-capture` | "capture", "save this" | zero-friction inbox save | `00-capture/` |
| `axi25-ingest` | "ingest", "add to wiki" | Deep Extraction Standard → wiki | `10-sources/`→`20-wiki/` |
| `axi25-process` | "process inbox" | classify + route captures | `00-capture/` → everywhere |
| `axi25-journal` | reflection / "how was my day" | daily entry + signals | `40-journal/` |
| `axi25-study` | "study note", "notes on…" | study in formation | `25-studies/` |
| `axi25-worklog` | "work log", "harvest the log" | log + harvest | `35-worklogs/` |
| `axi25-query` | "what do I know about…" | retrieval + synthesis | reads `20-wiki/` |
| `axi25-lint` | "lint", "health check" | orphans, ghosts, contradictions | whole vault |
| `axi25-review` | "weekly review" | retrospective | `40-journal/weekly/` |
| `axi25-plan` | "weekly plan" | forward-looking plan | `40-journal/weekly/` |

To **add a skill**, drop `.agents/skills/<name>/SKILL.md` (a name + description frontmatter and
instructions) and re-run `.bin/install.sh`. To **add an area**, just create
`20-wiki/areas/<area>.md` from the Area template.

## The operational loop

Every significant interaction follows: **read `index.md` → work → update `index.md` → append to
`log.md`.** The log format is fixed:

```
## [2026-01-15] ingest | How to Take Smart Notes
- Created: atomic-notes, spaced-repetition
- Updated: learning
- Links added: 6
```

Before writing any `[[wikilink]]`, the agent verifies the target exists (`ls 20-wiki/concepts/ |
grep …`) and only links what's real — or creates a conscious stub first. No ghost links.

## How each harness runs it

The universal contract is **`AGENTS.md`**. Every agent reads it; skills come from two **real**
directories (never symlinks), so nothing breaks on any OS:

- **Obsidian + Claude Code** (the designed-for, zero-command path) — the ObsidiBot wrapper reads
  `CLAUDE.md` as its context file and its `commandsFolder` is pre-pointed at the skills, so each
  appears as a command. The underlying `claude` CLI also natively discovers `.claude/skills/`.
- **OpenAI Codex** — reads `AGENTS.md` natively and discovers skills in `.agents/skills/`.
- **OpenCode** — `opencode.json` sets `instructions: ["AGENTS.md"]`; discovers skills in
  `.agents/skills/` (and `.claude/skills/`).
- **Pi.dev** — reads `AGENTS.md`; discovers skills in `.agents/skills/`.

Because the skill files are plain Markdown and `AGENTS.md` documents where they live, the system
degrades gracefully: even a harness with zero skill support works by reading the SKILL.md files.

### No symlinks — Windows-safe by design

The skills ship as two **real** directories: `.agents/skills/` (canonical) and `.claude/skills/`
(a copy). No symlinks anywhere, so any zip extractor on any OS — including Windows — yields a
working vault with zero setup. `.bin/install.sh` / `.bin/install.ps1` / `npx axi25 wire` only
re-sync the `.claude/skills` copy after you edit `.agents/skills`; lay users never run them.

## Backups & version history

The vault is plain files, so **git** is the natural backup and history layer. The Obsidian path
includes the Git plugin for one-click commits; from a terminal, `git init` + periodic
`git commit` gives you full, local, private version history. `.gitignore` already excludes local
harness state and any secrets.

## Markdown quality

`.markdownlint-cli2.jsonc` at the root defines a prose-friendly lint config. `axi25-lint` runs
`markdownlint-cli2` over changed files and **reports** — it never blind-`--fix`es, because
autofix can mask structural loss. Green lint is necessary, not sufficient.

## What's intentionally NOT here (this edition)

To keep the promise of "unzip and it just works on any harness, any OS," this edition ships only
the pure, dependency-free Markdown skills. Heavier capabilities that need local ML models,
credentials, or platform-specific tooling — audio/video transcription, YouTube ingestion,
automated PDF/EPUB→Markdown conversion, narration/prosody analysis — are **not** included. They
are candidates for an advanced/Pro add-on. Everything in this edition runs with just an AI agent
and a text editor.

---

Back to: [Philosophy](01-philosophy.md) · [Pillars](02-the-five-pillars.md) ·
[Techniques](03-techniques.md) · [References](05-references.md)

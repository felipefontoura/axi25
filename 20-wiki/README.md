# 20-wiki — KNOWLEDGE (canonical layer — full read/write)

Promoted, atomic, linked, reusable knowledge. The agent owns this layer — it
writes, links, and maintains it based on your captures and sources.

**One idea per page. Minimum 3 [[wikilinks]] per page.**

## Subfolders

| Folder | Content |
|--------|---------|
| `concepts/` | Atomic ideas — one clear, standalone idea per file |
| `entities/` | People, companies, tools, technologies |
| `areas/` | Life domains (work, health, family, learning, finance, …) |
| `decisions/` | Major decisions with full context and outcomes |
| `patterns/` | Recurring patterns detected across captures and logs |
| `syntheses/` | Saved analyses, comparisons, multi-source query answers |
| `maps/` | Maps of Content — thematic indexes linking topic clusters |

## Promotion criteria

An idea earns a wiki page when at least one of the following is true:

- Explicit user request
- Repeated evidence across multiple captures or sessions
- Decision impact — it changes or has changed what you decide
- Recurring vocabulary that appears across sessions
- At least 3 real connections to existing wiki pages

When in doubt, keep the idea in `25-studies/` (or in journal, if it is life-domain).
Do not create premature wiki pages.

## What does NOT belong here

- Immature reflections or study in formation → `25-studies/`
- Raw external sources → `10-sources/`
- WIP execution artifacts → `30-projects/`
- Temporal discourse signals → `50-zeitgeist/`

## Conventions

- Filenames: English, kebab-case (e.g. `compound-interest-of-knowledge.md`)
- Wikilinks: bare [[link]] — never wrapped in backticks
- YAML frontmatter on every page: `type`, `areas`, `created`, `updated`
- Full catalog maintained in `../index.md`
- Confidence level on claims: `high / medium / low / speculative`

## Skills

- **axi25-ingest** — extracts knowledge from a source and creates or updates pages here
- **axi25-query** — retrieves and synthesizes what you know about a topic
- **axi25-lint** — checks wiki health: orphan pages, missing links, contradictions

See [../AGENTS.md](../AGENTS.md) for Core Rules, Anti-Patterns, page templates
(`90-system/references/page-templates.md`), and the maturity ladder.

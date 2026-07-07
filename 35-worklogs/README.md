# 35-worklogs — WORK DONE (permanent)

The permanent home for **processed work logs** — dense technical session records
preserved verbatim and harvested for opportunities. The raw log is never rewritten
or summarized. Nothing captured is lost: content graduates from the inbox and is
frozen here. Git preserves the original regardless.

## Content

```
35-worklogs/
  YYYY-MM-DD-<slug>.md        ← frozen raw session log (status: processed)
  harvest/
    YYYY-MM-DD-<slug>.md      ← mined opportunities (learning, projects, content, connections)
```

A log being present here means it has been harvested. The harvest is always paired
with its source log. Logs can be re-mined at any time.

## What belongs here

Dense records of work **executed**: implementation sessions, debugging, deploy
postmortems, research sprints, market analysis. The entry opens with a session:
*"full session of…", "~Nh getting X running", "reverse-engineering…"*.

## What does NOT belong here

- Formal study of a concept or theory → `25-studies/`
  (see **Study Note vs Work Log** in [../AGENTS.md](../AGENTS.md))
- Life reflections, mood, events → `40-journal/`
- WIP drafts not yet finished → `00-capture/worklogs/`
- Reusable knowledge extracted → `20-wiki/`

## Flow

```
00-capture/worklogs/<slug>.md   (WIP draft, status: unprocessed)
        │  session done → axi25-worklog (harvest)
        ▼
35-worklogs/YYYY-MM-DD-<slug>.md      (status: processed)
35-worklogs/harvest/YYYY-MM-DD-<slug>.md   (mined opportunities)
```

## Harvest semantics

The harvest is **proactive but confirmed**: the agent offers a teaser of what it
found, then harvests only if you accept (or you ask directly). Harvest output is
exploratory — it surfaces opportunities and is never auto-promoted to `20-wiki/`.

## Naming

`YYYY-MM-DD-<slug>.md` — ISO date prefix, English kebab-case slug describing the
session. Example: `2024-11-15-auth-service-debug.md`

## Skills

- **axi25-worklog** — creates the finalized log and runs the harvest

See [../AGENTS.md](../AGENTS.md) for the Study Note vs Work Log distinction,
harvest semantics, and the maturity ladder.

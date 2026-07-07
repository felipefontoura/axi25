# 40-journal — LIFE

Life only: interior state, mood, family, prayer, gratitude, crisis, events.
**Journal = life** — study and work do not live here.

## Subfolders

| Subfolder | Content | Who writes |
|-----------|---------|-----------|
| `daily/` | `YYYY-MM-DD.md` — daily reflection | you write; agent processes |
| `signals/` | Extracted signals: mood/energy, events, mentions, themes | agent writes |
| `weekly/` | `YYYY-WNN.md` — weekly review + weekly plan | agent writes |

## What belongs here

Anything on the **life axis**: how you feel, what happened, relationships, spiritual
reflection, personal decisions, gratitude, struggles, health observations, family
moments. This layer has whole-life scope — health, family, faith, and personal growth
all belong here.

## What does NOT belong here

- Study in formation (technical, theoretical, philosophical) → `25-studies/` (`axi25-study`)
- Dense work session records → `35-worklogs/` (`axi25-worklog`)
- Reusable, atomic knowledge → `20-wiki/`

## Flow

```
you write daily/YYYY-MM-DD.md
        ↓ axi25-journal
signals/ ← mood, energy, events, mentions extracted
        ↓ over time, when signal reaches threshold
20-wiki/areas/ and 20-wiki/patterns/ ← updated
```

Weekly files (`weekly/YYYY-WNN.md`) contain both the retrospective (review) and the
forward-looking plan for the same week. The agent generates these from daily entries
and signals.

## Naming

- Daily: `YYYY-MM-DD.md` (e.g. `2024-11-15.md`)
- Weekly: `YYYY-WNN.md` (e.g. `2024-W46.md`)
- Signals: agent-defined, kebab-case

## Skills

- **axi25-journal** — processes a daily entry: extracts signals, updates areas and patterns
- **axi25-review** — writes the weekly review as retrospective
- **axi25-plan** — writes the weekly plan as forward-looking

See [../AGENTS.md](../AGENTS.md) for the maturity ladder and the whole-life scope rule.

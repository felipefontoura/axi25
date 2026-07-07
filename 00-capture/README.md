# 00-capture — INBOX

The entry point for all raw input. You drop things here; the agent classifies and
**promotes** each item to its permanent home. Raw is never lost — content graduates
to its destination layer (and git preserves the original). This is a transient inbox,
not a permanent archive: **inbox-zero is the healthy state**.

## Inboxes (by capture mode, not by destination)

| Subfolder | What goes in | Where it ends up |
|-----------|-------------|-----------------|
| `quick/` | Jotted and dropped; not yet classified | Any layer |
| `diary/` | Life, mood, family, philosophy, events | `40-journal/daily/` |
| `studies/` | Study draft (WIP) | `25-studies/` when finished |
| `worklogs/` | Work draft (WIP) | `35-worklogs/` when the session is done |

**WIP rule**: `studies/` and `worklogs/` are built incrementally. Process them only
when finalized — not mid-session.

## What does NOT belong here

- Items you have already classified → their permanent destination layer
- External sources (articles, books, papers) → `10-sources/`
- Permanent journal entries → write directly to `40-journal/daily/`

## Flow

```
capture (axi25-capture) → quick/ · diary/ · studies/ · worklogs/
        ↓ classify (axi25-process)
permanent destination:
  quick/  → any layer based on content
  diary/  → 40-journal/daily/
  studies/  → 25-studies/
  worklogs/ → 35-worklogs/
```

Processing means **promoting** the content to its permanent home and clearing the
inbox slot. The raw is never deleted — it lives on in the destination layer, and
git stores the original.

## Naming

Captures have no strict naming convention — they are transient. Use whatever
keeps you moving. The agent renames on promotion.

## Skills

- **axi25-capture** — quick-capture a thought, link, or idea into the inbox
- **axi25-process** — classify pending captures and route them to their permanent home

See [../AGENTS.md](../AGENTS.md) for the maturity ladder and classification rules.

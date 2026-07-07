# 50-zeitgeist — TEMPORAL DISCOURSE SNAPSHOTS

The **spirit of the age** — a living record of public discourse. Captures are
dated and expire in months, not years. This layer is for people who work with
media, ideas, and trends and need to track what the world is arguing about *right now*.

**This is not permanent knowledge.** A zeitgeist signal that matures into a durable
idea is promoted to `20-wiki/`; the temporal snapshot stays here as provenance.

## Subfolders

```
discourse/
  articles/    ← articles and opinion pieces you paste in
  papers/      ← preprints and early-release papers (time-sensitive framing)
  threads/     ← social media threads and forum debates
  talks/       ← conference talks, lectures, presentations
syntheses/     ← cross-format convergence (multi-source synthesis)
observations/  ← trend observations without a single source
```

## Signal types

Tag each discourse item with one of the five signal types:

| Tag | Meaning |
|-----|---------|
| `hot-take` | Strong current opinion — may not age well |
| `contrarian` | Goes against the mainstream consensus |
| `frame-novo` | A new framing or lens applied to an existing debate |
| `dado-novo` | New data or evidence that changes the picture |
| `tensao` | Active tension or conflict between two camps |

## What belongs here

- Time-bound public discourse you are tracking (articles, papers, threads, talks)
- Trend observations with a clear temporal anchor
- Cross-source syntheses of what multiple voices are saying right now

## What does NOT belong here

- Permanent, enduring knowledge → `20-wiki/`
- Raw external sources intended for deep study → `10-sources/`
- Personal reflections on events → `40-journal/`
- Audio-only sources (audio pipelines are not included in v1)

## Flow

```
paste discourse item → discourse/<type>/YYYY-MM-DD-slug.md
        ↓ axi25-ingest § Zeitgeist Scouting
signal extracted
  → syntheses/   (if multiple sources converge)
  → observations/ (if trend without single source)
  → 20-wiki/     (if signal proves durable)
```

## Naming

`YYYY-MM-DD-<slug>.md` — ISO date prefix anchors the temporal context.
Example: `2024-11-10-ai-agents-replacing-saas.md`

## Skills

- **axi25-ingest** — the Zeitgeist Scouting section handles temporal discourse
  extraction and signal tagging

See [../AGENTS.md](../AGENTS.md) for the zeitgeist definition, signal shelf-life
rules, and the distinction from permanent `20-wiki/` knowledge.

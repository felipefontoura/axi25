# 25-studies — STUDY IN FORMATION (permanent)

The permanent home for **finalized study notes** — the maturity rung between raw
capture and canonical wiki knowledge. The raw note is preserved **verbatim** here:
nothing from `00-capture/studies/` is lost — it graduates to this layer. Ideas that
mature further get promoted to `20-wiki/`; the study note stays here as provenance.

## Content

- `<topic-slug>.md` — finalized study note
  - `status: processed`
  - `maturity: study → working-theory → promoted`

Named by **topic** (not by date) — study is theme-centric, not session-centric.

## What belongs here

Formal study of a concept, theory, book, or course in formation. The note opens
with study or reflection: *"studied X", "notes on [book]", "reflection on Z"*.
Accepts lightweight signal extraction. Technical, theoretical, philosophical, and
theological study all belong here.

## What does NOT belong here

- Dense technical work sessions (implementation, debugging, deploy) → `35-worklogs/`
  (see **Study Note vs Work Log** in [../AGENTS.md](../AGENTS.md))
- Life reflections, mood, family → `40-journal/`
- Unfinished WIP drafts → `00-capture/studies/` (not yet processed)
- Promoted, atomic ideas → `20-wiki/` (once they have earned a wiki page)

## Flow

```
00-capture/studies/<topic>.md   (WIP draft, status: unprocessed)
        │  study finishes → axi25-study
        ▼
25-studies/<topic>.md           (status: processed)
        │  explicit promotion / repeated evidence
        ▼
20-wiki/concepts/ or syntheses/  (study note remains as provenance)
```

## Naming

`<topic-slug>.md` — English, kebab-case, topic-first.

Examples: `retrieval-augmented-generation.md`, `stoic-view-on-time.md`,
`double-entry-bookkeeping.md`

## Skills

- **axi25-study** — processes a finished study note, writes it here, and offers
  promotion to `20-wiki/` when the idea is ready

See [../AGENTS.md](../AGENTS.md) for the Study Note vs Work Log distinction and
the full maturity ladder.

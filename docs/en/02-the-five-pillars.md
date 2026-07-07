# 2. The Five Pillars

> AXI25 is built around five distinct layers of work: capturing raw input,
> organizing external sources, building permanent knowledge, tracking execution,
> and tracking the live discourse. Each layer has a clear owner (a skill), a clear
> folder, and a clear relationship to the others. The philosophy behind the design:
> [Philosophy](01-philosophy.md). The craft for working within each layer:
> [Techniques](03-techniques.md).

## 1. Capture

**What it is.** The zero-friction inbox. Every idea, note, URL, thought, or draft that
enters the system lands here first, unclassified. Nothing is processed at capture time
— routing happens later via `axi25-process`. The rule: get it in, sort it out later.

**Folder**: `00-capture/`, with four sub-inboxes:

| Inbox | What goes here | Behavior |
|---|---|---|
| `quick/` | Untriaged idea, URL, thought — "don't know what it is yet" | New timestamped file each time |
| `diary/` | Life, mood, family, prayer, personal reflection | New timestamped file each time |
| `studies/` | A study note or theoretical draft in progress (WIP) | Append to the active draft; create if none exists |
| `worklogs/` | A work session draft in progress (WIP) | Append to the active draft; create if none exists |

`studies/` and `worklogs/` are **incremental drafts** — you keep adding to the same
file across a session. When finished, they graduate to their permanent home. `quick/`
and `diary/` spawn a new timestamped file each time.

**Skills**: `axi25-capture` saves to the inbox. `axi25-process` classifies and routes.

**Walkthrough.** You're debugging an API integration and notice something worth
remembering: "The SDK retries silently — you have to set a custom retry handler or
you'll never know why calls are slow." You say "capture this." `axi25-capture` drops
it into `quick/` with `status: unprocessed`. Later, running `axi25-process`, it gets
classified: this is a technical discovery tied to an active session, so it routes to
the work-session draft in `00-capture/worklogs/` and eventually to `35-worklogs/`.

**When to use.** Always. Every input starts here.

**When NOT to use.** Don't capture when you already know the destination. If you want
to ingest a specific article into the wiki, run `axi25-ingest` directly — capture
is for when you're just getting something out of your head.

---

## 2. Organize Sources

**What it is.** The library of raw, unmodified external material: articles, books,
courses, papers, and assets you've brought into the vault for reference. `10-sources/`
is **read-only** — you never edit a file here. Its purpose is to be a stable, citable
foundation that `axi25-ingest` reads and turns into wiki knowledge.

**Folder**: `10-sources/`, with sub-folders:

```
10-sources/
  articles/
  books/
  courses/
  papers/
  assets/
```

**Skill**: `axi25-ingest` reads from here and writes to `20-wiki/`. It never writes
back into `10-sources/`.

**A note on format.** Sources must be in text form when you drop them in. Paste article
text, book chapter text, or transcripts directly. PDF-to-Markdown and EPUB-to-Markdown
auto-conversion is a planned add-on, not available in this edition. For now, you copy,
paste, or drop already-text sources.

**Walkthrough.** You paste the full text of an article on sleep debt into
`10-sources/articles/walker-sleep-debt.md` with the correct frontmatter
(`source_kind`, `source_url`, `date_published`). You then run `axi25-ingest` on it.
The skill reads the source, applies the Deep Extraction Standard, and writes to
`20-wiki/`: a `source-*` synthesis page summarizing the article, concept pages for
the atomic ideas, an entity page for the researcher, and an update to
`20-wiki/areas/health.md`. The source file in `10-sources/` stays untouched.

**When to use.** Whenever you have a substantial external source — article, book
chapter, paper, transcript — that you want permanently represented in your wiki.

**When NOT to use.** Don't put your own study notes or internal reflections here.
Those aren't external sources — they belong in `00-capture/studies/` (then
`25-studies/`). Don't modify files in `10-sources/` even to fix a typo; they're the
archival record.

---

## 3. Wiki

**What it is.** The compounding core. `20-wiki/` is where raw input becomes permanent,
atomic, linked knowledge. Unlike a notes app or a folder of documents, the wiki
grows: each ingest and study promotion adds connections to what already exists, making
older knowledge more useful over time. This is the Zettelkasten at the center of the
system.

**Folder**: `20-wiki/`, with sub-folders:

```
20-wiki/
  concepts/     atomic ideas — one idea per file
  entities/     people, companies, tools, technologies
  areas/        life domains (work, health, family, learning, finance, …)
  decisions/    major decisions with context and outcomes
  patterns/     recurring patterns detected across journal/wiki
  syntheses/    saved analyses, comparisons, source summaries
  maps/         Maps of Content (thematic indexes)
```

**Skills**:

- `axi25-ingest` — writes to the wiki (creates and updates concept, entity, area,
  and synthesis pages via the Deep Extraction Standard)
- `axi25-query` — reads the wiki to answer your questions
- `axi25-lint` — checks for orphans, weak pages, ghost links, and contradictions

**Walkthrough.** After ingesting the sleep debt article, `axi25-ingest` creates
`20-wiki/concepts/sleep-debt.md` (idea, mechanism, examples, anti-patterns), updates
`20-wiki/entities/matthew-walker.md`, and adds a signal to `20-wiki/areas/health.md`.
Three weeks later you ingest a book on performance with a chapter on recovery.
`axi25-ingest` finds the existing `sleep-debt.md` and **updates it** with the new
perspective rather than creating a duplicate. The concept now cites two sources and
has six connections. That's the compounding effect.

**When to use.** Query whenever you want to know what you know ("what do I know about
attention?"). Ingest whenever you have a mature external source. Lint periodically —
especially after a large ingest — to keep the graph healthy.

**When NOT to use.** Don't promote every fleeting thought into `20-wiki/`. Immature
ideas belong in `00-capture/`, `25-studies/`, or `40-journal/`. See the maturity
ladder in [Techniques](03-techniques.md#the-maturity-ladder--promotion-rules). The
anti-swamp rule: wiki pages are earned, not granted.

---

## 4. Projects & Worklogs

**What it is.** The execution layer. `30-projects/` tracks active work (goals, tasks,
status). `35-worklogs/` is the permanent library of dense work sessions — strategic
raw material that you mine for learning, content, and project seeds.

**Folders**:

```
30-projects/
  active/       current work
  someday/      parked ideas
  archive/      completed or abandoned
35-worklogs/
  YYYY-MM-DD-slug.md    frozen raw session
  harvest/              opportunities mined from the session
```

**Skills**: `axi25-worklog` creates and harvests work logs. `axi25-plan` (weekly
planning) and `axi25-review` (weekly retrospective) read both folders.

**The harvest.** A work session doesn't end when you close your editor. Once a draft
in `00-capture/worklogs/` is finished, `axi25-worklog` offers a teaser ("this session
has ~6 opportunities") and — if you confirm — runs the harvest. The harvest reads the
session through five lenses, plus a sixth arc view:

| Lens | What it surfaces |
|---|---|
| Learning | Expensive, durable lessons — concept candidates |
| Projects | Seeds for new work, or what feeds an existing project |
| Content | Angles with hooks for video, post, thread, or article |
| Toolkit | Reusable patterns worth packaging as a template or script |
| Relations | How the session connects to other concepts and projects |
| Journey | Recurring threads across prior logs; emerging competencies |

The output is `35-worklogs/harvest/YYYY-MM-DD-slug.md`: a list of open opportunities.
Each item is a checkbox (`- [ ]`) — a conversion tracker. When you act on one, it
leaves for its real home (a project, a study note, a content draft) and gets marked
done (`- [x]`). The harvest file stays as the permanent record.

**Walkthrough.** You spend three hours debugging a race condition in your queue
processor. You log the session in `00-capture/worklogs/2026-07-07-queue-debug.md`.
When done, `axi25-worklog` offers: "3 learning items, 1 content seed, 1 toolkit
candidate." You confirm. The harvest surfaces: "the queue's retry semantics are
undocumented — video-thread opportunity" and "the isolation pattern used here is
reusable — worth packaging as a script." The raw log freezes to `35-worklogs/`. Two
days later you start the video, check off the harvest item, and link it to the project.

**When to use.** Use `30-projects/active/` for any work with a goal and a timeline.
Use `axi25-worklog` whenever you finish a dense technical session worth mining.

**When NOT to use.** Don't route study notes to `35-worklogs/` — those go to
`25-studies/`. Don't route life reflections into work logs — those go to
`40-journal/`. The life/study/work axis is strict; see
[Techniques](03-techniques.md#the-maturity-ladder--promotion-rules).

---

## 5. Zeitgeist

**What it is.** The live discourse layer — temporal snapshots of public conversation on
topics you track. Named after the German philosophical concept (see
[References](05-references.md#zeitgeist)): the "spirit of the age." This pillar is
for people who create content, track markets, or need to stay antenna-up on what's
gaining energy right now. If that's not you, skip it entirely.

**Folders**:

```
50-zeitgeist/
  discourse/
    articles/     articles, newsletters, blog posts
    papers/       preprints and papers (discourse focus, not deep DES)
    threads/      Twitter/X, Hacker News, LinkedIn discussions
    talks/        keynote transcripts
  syntheses/      cross-format synthesis on a theme and period
  observations/   trends without a single source
```

**Skill**: `axi25-ingest` § Zeitgeist Scouting — triggered when a source has
`scan_for_zeitgeist: true` in its frontmatter, or when you say "scout signals."

**The five signal types.** Zeitgeist scouting identifies five kinds of discourse
signal:

| Type | What it is |
|---|---|
| `hot-take` | Declarative, punchy, citable — polemic phrasing |
| `contrarian` | Position against current consensus |
| `new-frame` | A new frame on a known topic |
| `new-data` | A specific number, fact, or case-study that changes the argument |
| `tension` | Disagreement between relevant voices |

Each signal gets a `pauta_rating` (1-5) scoring its usefulness for your content or
positioning. Signals live in `50-zeitgeist/discourse/<type>/<source>/signals/`, never
in `20-wiki/`. They decay in 3-6 months and are deliberately kept separate from
permanent knowledge.

**Walkthrough.** You paste a Substack essay on AI regulation into
`50-zeitgeist/discourse/articles/thompson-ai-regulation.md`. During ingest, the
Zeitgeist Scouting pass finds two signals: a `contrarian` claim that safety frameworks
are already obsolete, and a `dado-novo` citing a specific court ruling. It writes two
signal files, rates them 4 and 3, and surfaces a ranked table. You decide the
contrarian angle warrants a short-form response. You open a project draft and link
the signal as the seed.

**When to use.** When you work with public discourse — content creation, market
research, journalism, advocacy. For tracking what's alive in the conversation now,
before it hardens into consensus.

**When NOT to use.** Don't put zeitgeist signals in `20-wiki/`. Temporal discourse is
not permanent knowledge. Don't apply full DES to zeitgeist sources — the scouting pass
is intentionally shallow. The value is the discourse pulse, not a masterclass.

---

## The supporting layers: 40-journal/ and 25-studies/

Two more folders aren't named "pillars" but are essential rungs of the maturity ladder,
and they feed the wiki:

**`40-journal/`** holds daily life entries (written by you, not the AI), weekly
reviews, weekly plans, and signal extractions. It is the interior layer. Ideas and
patterns that surface repeatedly in your journal are candidates for `25-studies/` or
eventual wiki promotion.

**`25-studies/`** is study in formation. When you're working through a book, course,
or theoretical concept, notes live here until they're mature enough to promote. This
is not a worklog (that's `35-worklogs/`) and not life (that's `40-journal/`): study
notes are intellectual input in digestion.

Both layers sit between `00-capture/` and `20-wiki/` on the maturity ladder. See
[Techniques](03-techniques.md#the-maturity-ladder--promotion-rules) for the full
promotion rules and the life/study/work genre axis.

---

## How the pillars connect

Capture feeds everything. Raw input lands in `00-capture/`, and `axi25-process`
classifies it: life goes to journal, study goes to `25-studies/`, work sessions go
to `35-worklogs/`, external sources go to `10-sources/` and then through
`axi25-ingest` into the wiki. Projects draw from the wiki (concepts, decisions,
patterns) and feed back into it via worklog harvests. Zeitgeist runs in parallel —
temporal signals never enter the wiki, but they can seed projects or content.

The wiki is the flywheel: every ingest and promotion makes it more connected, making
future queries, reviews, and planning more useful. The system compounds because the
bookkeeping — cross-referencing, updating, linking — happens automatically.

Next: **[Techniques](03-techniques.md)** — the craft that makes each pillar work.

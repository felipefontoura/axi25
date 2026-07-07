# 3. Techniques

> If [The Five Pillars](02-the-five-pillars.md) is the *what* — the folders and the
> skills — this is the *how*: the craft decisions that separate a compounding knowledge
> base from a well-organized graveyard. Each technique here has a direct connection to
> at least one pillar; several span all of them. For the file and frontmatter mechanics,
> see [Implementation](04-implementation.md).

## Atomic notes

One idea per page. Not one topic, not one chapter, not one source — one clear,
nameable idea.

Why it matters: ideas buried inside long documents can't be linked independently,
can't be found by traversal, and can't collide unexpectedly with unrelated concepts.
When you split ideas into atoms, you make the connections visible and actionable.

**How to split.** If a page title contains "and," it's probably two pages.
`sleep-debt-and-recovery.md` → `sleep-debt.md` + `sleep-recovery.md`. If a page
covers both a mechanism and its application in ways that don't obviously belong
together, split them. When in doubt, prefer two short pages over one long one.

**Naming.** Title pages as concepts or claims, not as sources. Prefer
`attention-residue.md` over `cal-newport-notes.md`. The title is the idea, not
the container it came from. A good test: would the title still make sense if you
deleted the source?

The minimum connection count (3 links per page) enforces atomicity indirectly — if
you can't find 3 real connections, the idea is probably too narrow to stand alone,
or too broad and needs splitting.

---

## Aggressive linking

Every wiki page must have at least **3 `[[wikilinks]]`**. This is the minimum, not
the target. Links are the product: when you state *why* two notes connect, you're
doing the thinking, not just the filing.

**Link forward AND back.** If `sleep-debt.md` links to `attention-residue.md`, then
`attention-residue.md` should acknowledge the connection back. Orphan pages — zero
inbound links — exist but can never be discovered by traversal. `axi25-lint` flags
them.

**Cross-domain linking is where the system earns its name.** A work insight connecting
to a health pattern connecting to a family decision is what a second brain actually
does. Link across life areas, not just within them.

**One firm rule: wikilinks are bare.** Write `[[link]]`, never `` `[[link]]` ``. Backtick
code spans are for paths, shell commands, and literal values — not for links you want
to actually navigate. Wrapping a wikilink in backticks breaks link resolution in most
editors. This rule is in the AGENTS.md constitution under Anti-Patterns for a reason:
it's the most common formatting mistake, and it silently breaks the graph.

---

## The maturity ladder & promotion rules

Not every thought belongs in `20-wiki/`. The maturity ladder is the anti-swamp rule.

```
00-capture/   raw input, no interpretation          ← everything starts here
40-journal/   life, reflection, interior state       ← matures as lived experience
25-studies/   study in formation                     ← intellectual input being digested
35-worklogs/  dense executed work                    ← strategic raw material to mine
20-wiki/      promoted, atomic, linked knowledge     ← earned its place
```

**Promotion to `20-wiki/` requires one of:**

- Explicit user request ("promote this to a concept")
- Repeated evidence — the idea appeared across 2+ days, 2+ sources, or 2+ projects
- Decision impact — it changed or would change a real decision
- Recurring vocabulary — it's a term you use repeatedly when thinking or writing
- At least 3 real connections to existing wiki pages

Until one of those fires, keep ideas in their current rung. A study note that stays
in `25-studies/` for a week isn't failing — it's working correctly. A wiki page created
from a single fleeting thought that never gets linked is the failure. That's the swamp.

**The life/study/work axis.** Three genres, three homes — enforce them:

| Genre | Home | Disambiguating phrase |
|---|---|---|
| Interior life, mood, family, events | `40-journal/daily/` | "how I felt today", "family dinner", "spiritual question" |
| Intellectual input in formation | `25-studies/` | "studied X", "notes on…", "reflection on the book" |
| Executed work session | `35-worklogs/` | "full session of…", "~3h getting X running", "debugged Y" |

Misrouting breaks the harvest pipeline (built for worklogs) and the study promotion
pipeline (built for `25-studies/`). `axi25-lint` check #11 flags genre mismatches.
If ambiguous, ask.

---

## Deep Extraction Standard (DES)

When you ingest a mature source — book, article, course, paper — `axi25-ingest`
applies the Deep Extraction Standard. This is what separates a second brain from a
collection of linked summaries.

**7 layers per significant idea:**

1. **The idea** — in your own voice, precise and clear. Not a quote, not a paraphrase
   — your synthesis of what it means.
2. **Mechanism** — why does it work? The underlying principle, not the surface fact.
   "Sleep debt accumulates" is the fact; "the adenosine clearance rate sets a debt
   ceiling that determines cognitive recovery time" is the mechanism.
3. **Source example** — unfolded, not just named. What happens, in what context, how
   the example operates in the original work.
4. **Applied example** — mapped to your context when transfer is obvious. Skip this
   if the application isn't clear; don't invent one.
5. **Anti-pattern or variant** — how it fails; how it varies by context. An idea
   without its failure mode is incomplete.
6. **When to use / when NOT to use** — contextual applicability. The conditions that
   activate or deactivate the idea.
7. **Operational hook** — how you apply this tomorrow. A concrete first action.

**Frameworks vs. tactical plays.** Large frameworks — a 3-act structure, a sales
pipeline, a product development model — get full decomposition. Each component earns
its 7 layers. Individual patterns within a *family* of related patterns do not each
get 7 layers; the category gets it, and the family is covered in ≤100 lines.

**Voice.** Cold, analytical, skeptical. Cut hype adjectives: "pure gold," "brutal,"
"strong signal," "state of the art" are forbidden crutches. If an idea demands
emphasis, describe the mechanism — don't decorate it with adjectives. A synthesis that
reads like a landing page has failed. It should read like a technical memo to yourself
in 6 months.

**Size targets.**

| Source type | Target range |
|---|---|
| Dense book / full course / manifesto | 400-700 lines |
| Short tactical playbook | 200-400 lines |
| Academic paper (5-15 pages) | 150-350 lines |
| Isolated article / single chapter | 100-200 lines |

A 50-line summary of a 45-minute course is a red flag. An 800-line summary of an
8-page paper is inflation.

**The 6-month test.** After writing a synthesis, ask: "Reading only this page in 6
months, can I teach the content without reopening the original?" If not, it's shallow.
This is a mental ruler for the author — not a section to add at the end of the document.

Full specification: `.agents/skills/axi25-ingest/SKILL.md`.

---

## The worklog harvest

The harvest turns a raw work session into surfaced opportunities along a learning
journey. It is not a to-do list generated from a log — it's an intelligence report
on what the session yielded.

**Trigger model: teaser → confirm.** When a worklog draft is finished,
`axi25-worklog` offers a brief teaser: "this session has ~6 opportunities (2 expensive
lessons, 2 content seeds, 1 recurring thread with the previous session)." You confirm,
and the harvest runs. If you ask directly ("harvest today's log"), it skips the teaser.

**The five actionable lenses plus Journey:**

| Lens | What it surfaces | Format |
|---|---|---|
| Learning | Expensive, durable lessons; concept candidates | Checkboxes (`- [ ]`) |
| Projects | New seeds or what feeds existing work | Checkboxes |
| Content | Angles with hooks for video, post, thread, or article | Checkboxes |
| Toolkit | Reusable patterns worth packaging as templates or scripts | Checkboxes |
| Relations | How the session connects to other concepts and projects | Plain bullets |
| Journey | Recurring threads across earlier logs; emerging competencies | Plain bullets |

**Checkboxes are conversion trackers.** Each `- [ ]` is an open opportunity. When you
act on one, it leaves for its real home — a project, a study note, a content draft —
and gets marked done: `- [x] … → [[destination]]`. Relations and Journey don't use
checkboxes because they're analysis, not actions.

**The report is read, not drained.** You open the harvest, pick what's actionable
now, and act on those items. It is not an inbox to empty. A session that surfaces 5
opportunities where you act on 2 is a good harvest. The report stays as the permanent
record: "this raw session yielded 2 converted items."

---

## Maps of Content (MOCs)

A Map of Content is a navigational hub: a page that organizes related concepts,
entities, decisions, and projects around a theme. It is not a category folder and not
a summary — it's a curated index maintained over time.

**When to make one.** When you notice a cluster of related pages that are hard to
navigate without a hub. A useful heuristic: 5+ concept pages on a theme, with
overlapping connections that no single concept captures. Examples:
`20-wiki/maps/map-ai-engineering.md`, `20-wiki/maps/map-sleep-performance.md`,
`20-wiki/maps/map-stoic-philosophy.md`.

**What a MOC does.** It links the concepts below it and provides brief orientating
notes — which are foundational, which are applied, which are contested. The linked
pages do the deep work; the MOC only shows the shape of the territory.

**What a MOC is not.** A MOC is not an excuse to defer atomic note creation. "I'll put
everything in the map and split it later" is not how it works — atoms come first, the
map emerges from the atoms. MOCs also don't replace folder organization; they coexist
with it as a navigational layer on top.

MOCs live in `20-wiki/maps/`. Template: `90-system/references/page-templates.md`.

---

## Confidence & contradictions

**Mark confidence.** Every concept page carries a `confidence` field in its
frontmatter: `high`, `medium`, `low`, or `speculative`. Claims backed by multiple
sources and lived experience are `high`. Claims from a single source with no
verification are `low`. Hypotheses worth tracking but untested are `speculative`.
Confidence tracks where you've done the work and where you're guessing.

**Record contradictions, don't smooth them.** When `axi25-ingest` finds a new source
that conflicts with an existing wiki page, it flags the contradiction. The right
response is not to pick a side and delete the other — it's to record both, mark the
tension explicitly, and leave it open. Real knowledge has rough edges. A wiki that
contradicts itself is more honest than one that pretends to be settled.

**Contradictions are signals.** A flagged contradiction often means you've hit a
genuine complexity in the domain — a context-dependence, a tradeoff, a place where
both things are true under different conditions. `axi25-lint` check #4 surfaces
contradictions during health checks. The goal is not to eliminate them but to make
them legible.

---

## Weekly rhythm

The system works best with a weekly cadence — one session looking back, one looking
forward, and periodic health checks.

**Review (`axi25-review`).** Triggered by "weekly review" or "how was my week." Reads
journal entries, study notes, `log.md`, area pages, and active projects for the last 7
days. Generates `40-journal/weekly/YYYY-WNN.md` with: a narrative summary, area-by-
area assessment, knowledge growth, study notes in formation, open loops, and a "next
week focus." Also updates area pages and runs a light lint pass.

**Plan (`axi25-plan`).** Triggered by "weekly plan" or "plan this week." The forward-
looking complement to review. Reads the last review and all live context, then
**dialogues before writing** — it asks about your priority ranking, capacity,
non-negotiables, and the explicit "not doing this week" list. The plan includes a week
thesis, goals by area, a day-by-day distribution, non-negotiables, the NOT list, and
measurable success indicators.

The NOT list matters as much as the goal list. Every explicit "not doing" frees
capacity for what does matter. A plan without a NOT list is a wishlist.

**Lint (`axi25-lint`).** Run periodically — after a large ingest, or as part of the
weekly review — to keep the wiki healthy. Finds orphans, weak pages, ghost links,
contradictions, stale content, incomplete frontmatter, duplicate concepts, harvest debt,
genre mismatches, and more. Auto-fixes obvious issues; asks before merging or
re-routing ambiguous ones.

The weekly rhythm is what keeps the system from stagnating. Without review, the wiki
grows but stops being used. Without planning, the system captures but doesn't drive
action. Lint without the rhythm is housekeeping without purpose.

---

Back: **[The Five Pillars](02-the-five-pillars.md)** ·
Next: **[Implementation](04-implementation.md)** · **[References](05-references.md)**

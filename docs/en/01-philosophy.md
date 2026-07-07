# 1. Philosophy

> AXI25 deliberately blends several well-known knowledge traditions. This chapter names
> each one honestly, in plain language, and shows how they lock together. If you've heard
> "Zettelkasten", "PARA", "second brain", or "Zeitgeist" thrown around and weren't sure how
> they relate — this is the map. Every claim links to a real source in
> [References](05-references.md).

## What this actually is (not storage)

Don't mistake AXI25 for a place to store and organize knowledge. Storage is a commodity — any
notes app does it. It is not the product.

AXI25 is the **persistent memory of you, one specific operator.** Its job is to make the AI you use
progressively smarter about you. Every AI starts from zero: it doesn't know who you are, what you've
decided, how you think, or what you're building. This vault is the antidote — the compounding record
your AI reads so it stops restarting from scratch every conversation.

The outcome isn't "knowing more." It's your **advantage**. Everyone uses the same AIs; the difference
is that yours knows your whole practice — so you decide ahead and arrive more prepared, while everyone
else's AI resets every day. Time compounds in your favor. That compounding advantage is the product;
the notes are not.

## The problem it solves

You read, build, and think constantly. Almost none of it accumulates. Notes apps become
graveyards; bookmarks rot; the same lesson gets re-learned three times. The bottleneck was
never capturing — it's the *bookkeeping* of turning scattered input into connected, reusable,
decision-ready knowledge. That bookkeeping is boring, endless, and exactly what humans abandon.

AXI25's bet: **let an AI do the bookkeeping, and let a set of proven note-taking principles
shape what it builds.** You bring judgment and questions; the AI extracts and connects — it doesn't
archive. Storing without reuse is a graveyard; the value is in what compounds, not what piles up.

## Five traditions, one system

AXI25 is not one method. It's a synthesis of five, each solving a different piece.

### 1. Zettelkasten — the DNA of the wiki

Niklas Luhmann, a German sociologist, published ~70 books and 400+ articles by writing on
index cards kept in a *slip-box* (Zettelkasten). Each card held **one idea**, in his own
words, with an address and **explicit links** to related cards. The magic wasn't storage —
it was the web of connections, which generated new ideas when cards were combined. Sönke
Ahrens popularized the method for everyone in *How to Take Smart Notes* (2017).[^zk][^ahrens]

Two principles AXI25 takes wholesale:

- **Atomicity** — one clear idea per note. Ideas buried inside big documents can't be
  re-linked or re-found.[^zk]
- **Links are the product** — when you connect two notes, you articulate *why* they relate.
  That act is thinking. (AXI25 enforces a minimum of 3 connections per wiki page.)

This is what `20-wiki/` *is*: a personal Zettelkasten.

### 2. PARA & "Building a Second Brain" — organize by action, distill over time

Tiago Forte's insight: *"our brains are for having ideas, not storing them."*[^basb] His PARA
method sorts everything you keep by **actionability**, not topic — **P**rojects, **A**reas,
**R**esources, **A**rchives.[^basb] His CODE loop — **C**apture, **O**rganize, **D**istill,
**E**xpress — is the pipeline from raw input to real output, with *progressive summarization*
distilling notes in passes over time.[^basb]

AXI25 borrows the actionability lens (its layers map to Projects/Areas/Resources) and the
capture→distill→express pipeline, but replaces manual progressive summarization with the AI's
[Deep Extraction Standard](03-techniques.md#deep-extraction-standard-des).

### 3. Evergreen notes & Maps of Content — maturity and navigation

Andy Matuschak formalized **evergreen notes**: notes written to *evolve and accumulate across
projects*, which must be atomic, concept-oriented (titled as claims, not sources), and densely
linked.[^evergreen] Crucially, he observes that *most* notes people take are transient — and
that's fine; the discipline is developing the few that deserve to become evergreen.[^evergreen]
Nick Milo's **Maps of Content** (MOCs) add lightweight, evolving index notes that sit above the
atomic notes without forcing rigid folders.[^lyt]

AXI25 takes the transient-vs-evergreen distinction as its backbone (see the maturity ladder
below) and ships MOCs as `20-wiki/maps/`.

### 4. The LLM Wiki — the operator that makes it sustainable

In 2026 Andrej Karpathy described the **LLM Wiki** pattern: instead of retrieving raw chunks
at query time (standard RAG), an LLM *incrementally builds and maintains* a persistent,
interlinked Markdown wiki as you feed it sources. His words: the knowledge is *"compiled once
and then kept current, not re-derived on every query,"* and the wiki becomes *"a persistent,
compounding artifact"* where *"the cross-references are already there."*[^karpathy]

His diagnosis of why humans abandon wikis is the whole reason AXI25 exists:

> "The tedious part of maintaining a knowledge base is not the reading or the thinking — it's
> the bookkeeping… Humans abandon wikis because the maintenance burden grows faster than the
> value. LLMs don't get bored, don't forget to update a cross-reference, and can touch 15
> files in one pass."[^karpathy]

AXI25 is an opinionated implementation of that pattern, wired to the note-taking traditions
above. (Note on attribution: "LLM Wiki" is Karpathy's 2026 design note; "wiki-llm" is community
shorthand. AXI25 is *inspired by* it — not affiliated.)

### 5. Zeitgeist — the temporal layer, for people who work with media

*Zeitgeist* (German: *Zeit* = time, *Geist* = spirit) means the **spirit of the age** — the
dominant ideas, moods, and assumptions of a period, so pervasive that people experience them as
"just how things are." The term entered philosophy via Herder (1769) and became central to
Hegel's philosophy of history.[^zeitgeist]

Permanent knowledge (the wiki) is built to last years. But if you make content, track markets,
or need to stay antenna-up, you also need to capture the **live discourse** — what's gaining
energy *right now*, before it hardens into consensus. Those signals decay in months, so they
must be kept *separate* from permanent knowledge. That's `50-zeitgeist/`. If you don't work with
media, you can ignore this pillar entirely.

## The synthesis: the maturity ladder

Here's the idea that ties all five together — and the single most important thing to understand.

Both Zettelkasten (fleeting → literature → permanent notes) and BASB (capture → distill)
independently arrive at the same structural truth: **not every thought should become permanent
knowledge immediately.**[^maturity] Raw captures are noisy and context-dependent. Only through
processing — rewriting in your own words, testing against what you already know, distilling to
the essential claim — does a thought *earn* permanence.

AXI25 makes this ladder literal. Each rung is a folder:

```
00-capture/   raw input, no interpretation           (fleeting)
40-journal/   life, reflection, interior state        (matures as lived experience)
25-studies/   study in formation — ideas being digested (literature/working notes)
35-worklogs/  dense executed work — raw material to mine
20-wiki/      promoted, atomic, linked knowledge       (evergreen / permanent)
30-projects/  execution and deliverables
50-zeitgeist/ temporal discourse signals              (expires in months)
```

An idea is **promoted** to the wiki only when it earns it: you ask explicitly, or it recurs
across days/projects/sources, or it changes a decision, or it becomes recurring vocabulary, or
it has ≥3 real connections.[^basb][^zk] Until then it waits in a lower rung. This one rule is
what separates AXI25 from every notes app that turns into a swamp.

The system's formula:

```
practice → observation → study → concept → decision → execution → content/product → new practice
```

The goal is **not to know more.** It's to build, decide, teach, and discern better — because
your experience was preserved, connected, and matured, instead of lost.

---

Next: **[The Five Pillars](02-the-five-pillars.md)** — how this philosophy becomes daily use.

## Footnotes

[^zk]: Zettelkasten method / Luhmann — zettelkasten.de. See [References](05-references.md#zettelkasten).
[^ahrens]: Sönke Ahrens, *How to Take Smart Notes* (2017). See [References](05-references.md#zettelkasten).
[^basb]: Tiago Forte, "Building a Second Brain: The Definitive Introductory Guide" (Forte Labs, 2023). See [References](05-references.md#para--building-a-second-brain).
[^evergreen]: Andy Matuschak, "Evergreen notes." See [References](05-references.md#evergreen-notes--digital-gardens).
[^lyt]: Nick Milo, Linking Your Thinking / Maps of Content. See [References](05-references.md#evergreen-notes--digital-gardens).
[^karpathy]: Andrej Karpathy, "LLM Wiki" (GitHub gist, 2026). See [References](05-references.md#the-llm-wiki-pattern).
[^zeitgeist]: "Zeitgeist" — Wikipedia; Hegel, *Lectures on the Philosophy of History*. See [References](05-references.md#zeitgeist).
[^maturity]: Convergence of the Zettelkasten three-tier model and BASB progressive summarization. See [References](05-references.md#note-maturity).

---
type: study-note
date: 2026-01-14
areas: [learning]
topic: Zettelkasten method (Luhmann / Ahrens)
projects: [example-personal-wiki]
status: processed
maturity: working-theory
example: true
---

# [EXEMPLO] Study Notes — Zettelkasten Method

## Context

Started studying the Zettelkasten method after the decision to adopt a second brain. Primary source: Ahrens' "How to Take Smart Notes." Secondary: forum posts from the zettelkasten.de community, and several YouTube walkthroughs of Obsidian-based implementations. These notes are working theory — not ready to be split into wiki concepts yet, but past raw capture.

## What I Studied

The Zettelkasten (German: "slip-box") is a note-taking method developed by the sociologist Niklas Luhmann. He maintained two slip-boxes: one for bibliographic references (the source layer) and one for his own ideas in his own words (the permanent-note layer). Notes in the permanent layer were numbered rather than categorised, and connections between notes were made via explicit links written on the notes themselves.

Three note types in Luhmann's system:

1. **Fleeting notes** — temporary captures, written fast, processed within a day, then discarded
2. **Literature notes** — what you understood from a source, written in your own words, stored with the bibliographic reference
3. **Permanent notes** — one idea per card, written as a self-contained statement, linked to related permanent notes

The modern software equivalent: fleeting notes → `00-capture/quick/`, literature notes → `20-wiki/syntheses/` (source summaries), permanent notes → `20-wiki/concepts/`.

## Observations

- Luhmann's numbering system was a workaround for the limits of physical cards. Software replaces numbering with search and graph links — this simplifies one layer of the system considerably.
- The hardest part is *not* writing notes — it is deciding which ideas deserve a permanent note. Most ideas from reading are not worth the space. The filter question: "Does this connect to something I already know in a way that changes how I understand it?"
- "Thinking on paper" as a phrase understates what happens: it is more accurate to say that writing *is* the primary site of thinking, not a record of thinking that happened elsewhere.
- The slip-box becomes useful at a critical mass — Luhmann reportedly said his box started helping him at around 500 notes. Below that threshold it is mostly discipline practice.

## Hypotheses

- The wiki-llm pattern (Karpathy) is a natural evolution: if the slip-box works by surfacing unexpected connections, an LLM reading a structured vault can surface connections at a scale no human can manually maintain.
- There may be a tension between the Zettelkasten's insistence on your-own-words and the convenience of pasting excerpts: the paste is always easier, but the rewrite is what builds the schema.

## Open Questions

- What is the Zettelkasten equivalent for procedural knowledge (code patterns, physical skills)? The method seems designed for declarative/theoretical knowledge.
- At what point does a working-theory study note get split into multiple concept pages? Is there a rule, or is it judgment?
- How does the Zettelkasten handle contradictions between sources — does Luhmann describe a protocol?

## Connections

- [[atomic-notes]] — permanent notes in the Zettelkasten are the direct ancestor of this wiki concept
- [[source-how-to-take-smart-notes]] — the primary source for these notes; the source summary has more bibliographic detail
- [[map-knowledge-management]] — this study note is a major input to the knowledge management map
- [[spaced-repetition]] — studied alongside this; interesting gap: Zettelkasten literature almost never discusses SR even though the two systems address different parts of the same problem

## Promotion Candidates

- [[atomic-notes]] — already promoted; these notes confirmed the concept
- `permanent-vs-fleeting-notes` — possible split from the three-note-types section above if this gets its own wiki page

---
type: system-reference
name: ""
language: ""
filename_language: match
date_format: ISO 8601
set_up_on: ""
works_with_media: false
---

<!-- ONBOARDING PENDING -->
<!--
  This vault has not been set up yet. While this marker is present, any harness
  operating in this vault should run the `axi25-onboarding` skill FIRST (see
  AGENTS.md § First Run — Onboarding). Onboarding fills in the fields below and
  removes this marker. Do not delete the marker by hand — let onboarding do it,
  so the fields get filled at the same time.
-->

# User Profile

> Every skill reads this file for the user's name, default language, and life areas.
> Onboarding writes it. You can edit it any time afterward.

## Who

<!-- one line: role / context. e.g. "Freelance lawyer who codes on the side, in Brazil." -->

## Default language

<!-- The language the agent SPEAKS and WRITES vault content in. e.g. pt-BR | en | es | fr -->

## Filename language

<!-- How AI-generated FILENAMES (slugs) are written:
     - `match`  → mirror your default language (pt-BR content → pt-BR slugs). This is the default.
     - `en`     → force ALL filenames to English, kebab-case, even when content is in another
                  language (this is how the product author runs their own vault: 100% EN slugs,
                  localized content).
     - <any language code> → force that language for slugs.
     Set the `filename_language` field in the frontmatter above to match this choice. -->

match

## Core areas

<!-- The standing life domains this vault tracks. Default set below; edit freely. -->

- work
- health
- family
- learning
- finance

## Current focus / goals

<!-- 1-3 things you are actively pushing on right now. -->

-

## Works with media / needs trend-sensing?

<!-- true → the Zeitgeist pillar (50-zeitgeist/) is emphasized: capturing the current
     public discourse for content/positioning. false → keep it minimal. -->

false

## Strategy framework (optional)

<!-- If you organize your output around named channels or business pillars, list them.
     axi25-worklog uses this to route the harvest's Content/Toolkit lenses. Leave
     empty if not applicable. -->

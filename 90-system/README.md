# 90-system — Configuration

The machine room. Nothing here is "knowledge" — it is how AXI25 runs.

## What lives here

- `references/` — the detailed docs the skills read at runtime:
  - `user-profile.md` — your name, language, areas, goals (written by onboarding; every skill reads it)
  - `page-templates.md` — the exact template for every page type
  - `operations.md` — condensed reference for each operation
  - `axi25-definition.md` — the canonical definition / north star
- `prompts/` — reusable prompt templates you want to keep
- `scripts/` — zero-token checks you can run on every commit:
  - `check_quotes.py` — checks every timestamped quote in `20-wiki/` against the transcript its page cites (`source_path`). Exits 1 if a quote can't be found.
  - `wiki_lint.py` — dangling `[[links]]` and orphan pages. Exits 1 if it finds any.
  - Run them from the vault root: `python3 90-system/scripts/check_quotes.py .`

## What does NOT belong here

- Actual knowledge (that is `20-wiki/`), life (`40-journal/`), or execution (`30-projects/`).
- Secrets or credentials — never commit those (see `.gitignore`).

## Related

- The constitution: [[../AGENTS.md]] (`AGENTS.md` at the vault root)
- The skills: `.agents/skills/`

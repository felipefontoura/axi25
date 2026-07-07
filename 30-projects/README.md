# 30-projects — EXECUTION

Execution artifacts, WIP, and deliverables. Use this layer to **act**, not to
canonize knowledge. Reusable insights extracted from a project belong in `20-wiki/`,
not here.

## Subfolders

- `active/` — projects you are working on now
- `someday/` — parked ideas and backlog projects
- `archive/` — completed or abandoned projects

## Sibling-folder pattern

For projects with substantial WIP, use the sibling pattern:

```
active/my-project.md        ← wiki/index page (resolves the wikilink)
active/my-project/          ← folder grouping WIP artifacts
  scripts/
  research/
  drafts/
  published/
```

The `.md` file resolves the wikilink; the folder groups the work.

## What belongs here

- Project index pages and status tracking
- WIP artifacts: drafts, scripts, research notes specific to this project
- Published output references and content pipelines

## What does NOT belong here

- Reusable knowledge extracted from a project → `20-wiki/`
- Dense records of work sessions → `35-worklogs/`
- Raw external sources → `10-sources/`

## Key conventions

**`research/` vs `10-sources/`**: `project/research/` holds operational notes
for this project only. Never copy external source content into `research/` — link
to the file in `10-sources/` instead.

**Content pipeline inside a project**:

```
draft-vN.md
  → frozen artifact in 10-sources/
  → wiki synthesis in 20-wiki/syntheses/
  → published/vNNN-slug.md
```

**Naming**: English, kebab-case for all filenames and slugs.

## Skills

- **axi25-core** — base rules govern all project page creation and linking
- **axi25-worklog** — use when logging a dense work session (it goes to `35-worklogs/`, not here)

See [../AGENTS.md](../AGENTS.md) for the File and Path Conventions section.

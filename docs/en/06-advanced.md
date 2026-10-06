# 6. Advanced / Power Users

> **Lay users don't need this chapter.** If you just want to use AXI25, open the folder in
> Obsidian and type `onboarding` (see [`../../SETUP.md`](../../SETUP.md)). This chapter is for
> people who run their own AI harness, want to extend the system, or package it themselves.

## Run it on any harness

The skills are real directories, so every supported agent discovers them with no setup. From the
vault folder:

```bash
npx @axi25/vault@latest doctor    # checks your env, prints the exact next step
```

| Harness | Start | Skills read from |
|---|---|---|
| Claude Code (terminal) | `claude` → `onboarding` | `.claude/skills/` |
| OpenAI Codex | `codex` → `onboarding` | `.agents/skills/` + `AGENTS.md` |
| OpenCode | `opencode` → `onboarding` | `.agents/skills/` (+ `.claude/skills/`) |
| Pi.dev | `pi` → `onboarding` | `.agents/skills/` |

All of them read `AGENTS.md` (the constitution). Missing a CLI? Ask in chat: **"check my setup"** →
the `axi25-doctor` skill installs it for you, with consent, cross-OS.

## The CLI

```bash
npx @axi25/vault@latest doctor [dir]   # environment check + next step
npx @axi25/vault@latest init [dir]     # scaffold a full vault from scratch (any empty folder)
npx @axi25/vault@latest wire [dir]     # re-sync the .claude/skills copy from .agents/skills
```

`init` even works from nothing: it builds the folder tree, the reference files, and both skill
directories — the vault self-heals (see `AGENTS.md` § Self-healing environment).

## Extend the system

- **Add a skill:** create `.agents/skills/<name>/SKILL.md` with `name` + `description` frontmatter
  and instructions, then run `npx @axi25/vault@latest wire` to copy it into `.claude/skills`. It
  triggers by natural language once its description is discoverable; add a row to `AGENTS.md` §
  Skills Reference so the router knows about it.
- **Add a life area:** create `20-wiki/areas/<area>.md` from the Area template in
  `90-system/references/page-templates.md`.
- **Customize the worklog harvest:** the five lenses are generic. Define named content channels or
  business pillars in `90-system/references/user-profile.md` under "Strategy framework" and the
  harvest maps its Content/Toolkit lenses onto them.

## Customize behavior

Everything user-facing is driven by `90-system/references/user-profile.md`:

| Field | Effect |
|---|---|
| `language` | the language the AI speaks and writes vault content in |
| `filename_language` | `match` (default) mirrors your language; `en` forces English slugs |
| `works_with_media` | `true` emphasizes the Zeitgeist pillar; `false` keeps it minimal |
| Strategy framework | named channels/pillars the harvest routes into |

The Obsidian panel's behavior (permission mode, the skills-command folder, the context file) lives
in `.obsidian/plugins/bojubot/data.json` — it ships pre-set (`commandsFolder: .agents/skills`,
`contextFilePath: CLAUDE.md`, `permissionMode: acceptEdits`). Raise or lower autonomy there.

## Backups: cloud folder, Obsidian Sync, or git

For simple backup, a cloud folder (Google Drive / Dropbox / iCloud) or Obsidian Sync is enough. See
[`../../SETUP.md`](../../SETUP.md) § Back up your vault for those lay options and their caveats (sync
hidden folders; don't run two sync methods on one vault). This section covers the advanced path,
**git + GitHub**, which gives you something the others don't: a full, browsable history of every change.

### Why git for a knowledge vault

Every commit snapshots the whole vault. That means you can:

- see exactly what changed and when, and diff any two points in time;
- restore a note (or the whole vault) to a past state after a bad edit or an AI mistake;
- keep an off-machine, private backup on GitHub;
- review what the AI did across a session as a diff before you trust it.

For a vault an AI edits continuously, that revision history is a real safety net.

### One-time setup

```bash
cd "path/to/AXI25"
git init
git add -A
git commit -m "AXI25 — initial vault"
```

Then create a **private** repo on GitHub and push (keep it private — your vault is personal):

```bash
git remote add origin git@github.com:you/your-vault.git
git push -u origin main
```

### Day to day

- The Obsidian **Git** plugin can auto-commit on a schedule (one click, no terminal).
- Or from a terminal: `git add -A && git commit -m "..."` for a checkpoint, then `git push`.
- History: `git log --oneline`. Restore a file: `git checkout <commit> -- path/to/note.md`.

`.gitignore` already excludes local harness state, secrets, and the internal audit file. The
`.claude/skills` copy is committed so the vault stays self-contained. Don't run git and a
cloud-folder sync on the same vault at once — pick one backup path.

## Package it as a Claude plugin (optional, for updates at scale)

AXI25 ships vault-bundled (zip) so nothing needs installing. If you'd rather distribute skills as
a **Claude Code plugin / marketplace** (centralized versioning, `/plugin update`), add a
`.claude-plugin/plugin.json` manifest pointing at the `skills/` set and publish a `marketplace.json`.
Users then `/plugin marketplace add <repo>` + `/plugin install axi25`. Note this is Claude-only —
Codex/OpenCode/Pi keep reading `.agents/skills/` directly.

## What's intentionally not here (Pro add-ons)

This edition ships only the pure, dependency-free Markdown skills. Capabilities that need local ML
models, credentials, or platform-specific tooling — audio/video transcription, YouTube ingestion,
automated PDF/EPUB→Markdown conversion, narration/prosody analysis — are candidates for a separate
advanced/Pro add-on, not included here.

---

Back to the [documentation index](../README.md) · [Implementation](04-implementation.md)

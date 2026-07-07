<!--
  Context file for the primary harness: Claude Code — including the ObsidiBot / BojuBot
  Obsidian wrapper, which reads CLAUDE.md as its context file. The full constitution lives
  in AGENTS.md (one source of truth for every harness); the @import below pulls it in.
-->

@AGENTS.md

---

**Operator note (Claude).** This project's skills live in `.agents/skills/<name>/SKILL.md`,
mirrored to `.claude/skills/<name>/SKILL.md` for native discovery. When a trigger in
AGENTS.md § Skills Reference matches, use the matching skill — either the native `skill` tool
(if listed) or by READING `.claude/skills/<name>/SKILL.md` and following it. Both paths are
equivalent; the read-the-file path always works.

If `90-system/references/user-profile.md` still contains `<!-- ONBOARDING PENDING -->`, the
vault is not set up yet — run the **axi25-onboarding** skill before anything else (see
AGENTS.md § First Run — Onboarding). If the folder tree or a reference file is missing, scaffold
it first (AGENTS.md § Self-healing environment). Guide the user gently by stage (AGENTS.md §
Stage Awareness).

# Setup

> 🇺🇸 English · 🇧🇷 [Português (principal)](SETUP.pt-br.md) · 🏠 [Home](README.md)

AXI25 is built for a **no-terminal** experience: you download it, open it in **Obsidian**, and
the AI starts operating your notes using **your own Claude subscription** (Pro or Max). Works on
Linux, macOS, and Windows.

---

## The recommended path — Obsidian + Claude (beginner-friendly)

You'll install 3 free things (Obsidian + 2 plugins) and sign in with your Claude account. The
plugin walks you through it — no terminal knowledge required.

1. **Install Obsidian** (free) from <https://obsidian.md>. Open it and choose
   **"Open folder as vault"** → select your AXI25 folder (the one you extracted).
2. **Enable community plugins** — the one spot where people get stuck (it's a single click).
   When the vault opens, Obsidian shows a security prompt about community plugins. Click the button
   that **enables/trusts** them (something like **"Trust author and enable plugins"** or **"Turn on
   community plugins"**). The **AXI25** panel is already bundled and pre-configured — enabling
   plugins brings it up automatically. You **don't** install anything from the store.

   > ⚠️ **If the prompt doesn't appear, or the panel doesn't show up:** open **Settings** (gear,
   > bottom-left) → **Community plugins** → turn off **Restricted mode** → confirm **AXI25** is
   > **enabled** in the list. This trust step is an Obsidian security gate and **can't be skipped** —
   > but it's one click, and it never repeats for this vault.
3. Open the AXI25 panel (sidebar icon or command palette → "AXI25"). On first run it shows a
   **wizard**:
   - **"Install Claude Code" step** — it shows a command with a **copy** button. Paste it where it
     asks (it opens the right place for you). This is the only command in the whole setup.
   - **Sign-in step** — opens your browser to log in with your **Claude account (Pro or Max)**.
4. Done. In the AXI25 chat, say hi (or type anything). In a fresh vault that kicks off the guided
   run, and it takes you through the rest. The skills are pre-wired as commands (type `/` in the
   chat to see them).

> Automatic backup (optional): install the **Git** community plugin to version your vault with one click.

> **Why "Claude Code"?** The Obsidian AI panel runs on top of Claude Code (Anthropic's command-line
> engine), which accepts your Pro/Max subscription login. The AXI25 wizard installs and connects
> it for you — as close to "no terminal" as it gets.

Nothing else needs configuring: the folders, the skills, and `CLAUDE.md` all ship ready.

---

## Back up your vault

Your vault is a folder of files. Back it up like any folder that matters.

- **Recommended (simple): a cloud folder.** Put AXI25 folder inside your **Google Drive** (or
  Dropbox, iCloud, OneDrive). That's it, continuous backup. One important detail: set the sync app
  to sync **all files, including hidden ones** (the folders starting with a dot, like `.agents` and
  `.obsidian`). If it skips hidden files, your skills and settings won't be backed up. And avoid
  opening the vault on two computers at once: let the sync finish before you close.
- **Obsidian Sync (native, paid).** Syncs your **notes** across devices very well. Honest caveat: by
  default it does **not** sync hidden folders (`.agents`, `.claude`), so the skills don't travel with
  it. Great for notes, not a full-system backup. And do **not** run Obsidian Sync alongside a cloud
  folder on the same vault: pick one, or you'll get conflicts.
- **Advanced (versions and history): Git + GitHub.** If you want to travel back in time and see every
  change, use git. Full tutorial in [`docs/`](docs/) (the Advanced chapter).

## For power users (other harnesses)

**Facilitated command** — from the vault folder, run:

```bash
npx @axi25/vault doctor
```

It checks your environment (which CLIs you have) and prints **the exact next step**. Either way,
if you already use an AI agent, AXI25 works there with **no extra steps** — the skills are real
directories that each harness discovers natively:

| Harness | How | Where it finds skills |
|---|---|---|
| **Claude Code** (terminal) | `cd` into the folder → `claude` → `onboarding` | `.claude/skills/` |
| **OpenAI Codex** | `cd` into the folder → `codex` → `onboarding` | `.agents/skills/` + `AGENTS.md` |
| **OpenCode** | `cd` into the folder → `opencode` → `onboarding` | `.agents/skills/` + `AGENTS.md` |
| **Pi.dev** | `cd` into the folder → `pi` → `onboarding` | `.agents/skills/` + `AGENTS.md` |

All read `AGENTS.md` (the constitution). Go deeper in **[`docs/`](docs/)** (philosophy → techniques
→ implementation). Need to install one of their CLIs? Ask in chat: **"check my setup"** — the
`axi25-doctor` skill detects and installs it for you, with consent.

> **npm** install (optional): `npx @axi25/vault init my-vault` scaffolds a complete vault
> from scratch in any folder.

---

## Language & filenames

- **You write in your language; the AI answers in it.** (Skill files are in English — that's just
  how the AI is *instructed*; it never speaks that English back at you.)
- **Vault content** is in your default language (set during onboarding).
- **Filenames** follow your language by default; to force English, set `filename_language: en` in
  `90-system/references/user-profile.md`.

---

## Troubleshooting

- **AXI25 says it can't find Claude** → you haven't finished its wizard (step 5). Run the
  "Install Claude Code" command it shows and sign in. It uses that same binary.
- **A subscription is required** → the Claude Code login needs a **Claude Pro or Max** account.
- **Skills don't show as commands in Obsidian** → in Settings → AXI25, confirm the skills folder
  (`commandsFolder`) points to `.agents/skills` and "Register skills as commands" is on (it ships
  that way).
- **I said hi and nothing happened** → make sure you opened the *folder* as a vault (not a single
  file), so the AI can see `AGENTS.md`.

Everything the AI needs is plain text in this folder — worst case, open `AGENTS.md` and `docs/` in
any editor and read along.

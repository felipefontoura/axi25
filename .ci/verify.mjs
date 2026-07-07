#!/usr/bin/env node
/**
 * AXI25 — verify (the "test" stage).
 * Structural + content checks that must hold for every release. Exits non-zero on failure.
 *
 *   node .ci/verify.mjs   (or: npm test)
 */
import { promises as fs } from "node:fs";
import path from "node:path";
import { fileURLToPath } from "node:url";

const ROOT = path.resolve(path.dirname(fileURLToPath(import.meta.url)), "..");
process.chdir(ROOT);

const SKIP_DIRS = new Set([".git", "node_modules", "dist", ".claude"]); // .claude/skills is a copy
const IGNORE_MD_UNDER = [".claude/skills/", "node_modules/", ".obsidian/plugins/"];
const fails = [];
const oks = [];
const ok = (m) => oks.push(m);
const fail = (m) => fails.push(m);

async function exists(p) { try { await fs.lstat(p); return true; } catch { return false; } }

async function walk(dir, out = { files: [], symlinks: [] }) {
  for (const e of await fs.readdir(dir, { withFileTypes: true })) {
    const full = path.join(dir, e.name);
    const rel = path.relative(ROOT, full);
    if (e.isSymbolicLink()) { out.symlinks.push(rel); continue; }
    if (e.isDirectory()) {
      if (SKIP_DIRS.has(e.name)) continue;
      await walk(full, out);
    } else {
      out.files.push(rel);
    }
  }
  return out;
}

async function main() {
  // 1. Key files present
  const required = [
    "AGENTS.md", "CLAUDE.md", "opencode.json", "package.json", "index.md", "log.md",
    "README.md", "README.pt-br.md", "README.en.md",
    "SETUP.md", "SETUP.pt-br.md", "SETUP.en.md", "LICENSE", "THIRD-PARTY-NOTICES.md",
    "90-system/references/user-profile.md", "90-system/references/page-templates.md",
    ".assets/axi25-banner.png", ".assets/axi25-banner-dark.png",
    ".obsidian/plugins/bojubot/main.js", ".obsidian/plugins/bojubot/data.json",
    ".bin/axi25.mjs",
  ];
  for (const f of required) (await exists(f)) ? null : fail(`missing required file: ${f}`);
  ok(`required files present (${required.length})`);

  // 2. Skills: two real dirs, in sync, each with SKILL.md
  const agents = (await fs.readdir(".agents/skills", { withFileTypes: true })).filter((d) => d.isDirectory()).map((d) => d.name).sort();
  const claude = (await fs.readdir(".claude/skills", { withFileTypes: true })).filter((d) => d.isDirectory()).map((d) => d.name).sort();
  if (agents.length < 10) fail(`too few skills in .agents/skills (${agents.length})`);
  if (agents.join(",") !== claude.join(",")) fail(".agents/skills and .claude/skills are out of sync (run: npm run wire)");
  for (const s of agents) if (!(await exists(path.join(".agents/skills", s, "SKILL.md")))) fail(`skill ${s} missing SKILL.md`);
  ok(`skills: ${agents.length} in .agents/skills, mirrored to .claude/skills`);

  // 3. Fresh-vault invariant
  const profile = await fs.readFile("90-system/references/user-profile.md", "utf8");
  profile.includes("ONBOARDING PENDING") ? ok("user-profile has ONBOARDING PENDING (ships fresh)") : fail("user-profile.md is missing the ONBOARDING PENDING marker");

  // 4. Walk: zero symlinks + collect md
  const { files, symlinks } = await walk(ROOT);
  symlinks.length === 0 ? ok("zero symlinks (Windows-safe)") : fail(`found ${symlinks.length} symlink(s): ${symlinks.slice(0, 5).join(", ")}`);

  const mdFiles = files.filter((f) => f.endsWith(".md") && !IGNORE_MD_UNDER.some((p) => f.replaceAll("\\", "/").startsWith(p)));

  // 5. Broken relative markdown links + banner <img src>
  const linkRe = /\[[^\]]*\]\(([^)]+)\)/g;
  const srcRe = /(?:src|srcset)="([^"]+\.png)"/g;
  let broken = 0;
  for (const f of mdFiles) {
    const txt = await fs.readFile(f, "utf8");
    const base = path.dirname(f);
    for (const m of txt.matchAll(linkRe)) {
      let t = m[1].trim();
      if (/^(https?:|mailto:|#)/.test(t)) continue;
      t = t.split("#")[0];
      if (t && !(await exists(path.resolve(base, t)))) { broken++; fail(`broken link in ${f}: ${t}`); }
    }
    for (const m of txt.matchAll(srcRe)) {
      const t = m[1];
      if (!(await exists(path.resolve(base, t)))) { broken++; fail(`broken image in ${f}: ${t}`); }
    }
  }
  if (broken === 0) ok(`relative links resolve (${mdFiles.length} md files)`);

  // 6. No personal-data leaks
  const leakRe = /felipe fontoura/i;
  const leakSkip = new Set(["AUDIT.md", "LICENSE", "THIRD-PARTY-NOTICES.md"]);
  let leaks = 0;
  for (const f of mdFiles) {
    if (leakSkip.has(f)) continue;
    if (leakRe.test(await fs.readFile(f, "utf8"))) { leaks++; fail(`personal-data leak in ${f}`); }
  }
  if (leaks === 0) ok("no personal-data leaks in shipped docs");

  // 7. The distributable must NOT ship dev/CI/pipeline files
  const build = await fs.readFile(".ci/build-dist.sh", "utf8");
  const mustExclude = [".ci/*", ".github/*", ".git/*", "AUDIT.md"];
  const missing = mustExclude.filter((e) => !build.includes(e));
  missing.length === 0
    ? ok("build excludes pipeline/dev files (.ci, .github, .git, AUDIT.md)")
    : fail(`build-dist.sh no longer excludes: ${missing.join(", ")} (buyers would see the pipeline)`);

  // Report
  for (const m of oks) process.stdout.write(`  \x1b[32m✓\x1b[0m ${m}\n`);
  for (const m of fails) process.stdout.write(`  \x1b[31m✗\x1b[0m ${m}\n`);
  if (fails.length) { process.stderr.write(`\n  FAILED: ${fails.length} check(s)\n`); process.exit(1); }
  process.stdout.write(`\n  All checks passed.\n`);
}

main().catch((e) => { process.stderr.write(`\n  verify error: ${e.stack || e.message}\n`); process.exit(1); });

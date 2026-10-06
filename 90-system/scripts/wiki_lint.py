#!/usr/bin/env python3
"""Lint an LLM wiki without spending tokens: dangling [[links]] and orphan pages."""
import re, sys
from pathlib import Path

root = Path(sys.argv[1] if len(sys.argv) > 1 else ".").resolve()
hidden = lambda p: any(part.startswith(".") for part in p.relative_to(root).parts)
everything = [p for p in root.rglob("*") if not hidden(p)]
names = {p.stem.lower() for p in everything} | {p.name.lower() for p in everything}

# Lint what the agent writes. log.md is history, 10-sources/ is raw, and
# 90-system/, docs/ and the READMEs are documentation full of example links.
skip_names = {"log.md", "README.md", "AGENTS.md", "CLAUDE.md"}
pages = [p for p in everything if p.suffix == ".md" and p.name not in skip_names
         and not {"10-sources", "90-system", "docs"} & set(p.relative_to(root).parts)]
link = re.compile(r"\[\[([^\]|#\\]+)")

inbound, dangling = {}, []
for p in pages:
    for target in link.findall(p.read_text(errors="ignore")):
        t = target.strip().split("/")[-1].lower()
        if p.name != "index.md":  # the catalog links everything; it can't vouch
            inbound.setdefault(t, set()).add(p.stem.lower())
        if t not in names:
            dangling.append(f"{p.relative_to(root)} -> [[{target}]]")

wiki = [p for p in pages if "20-wiki" in p.parts and p.stem != "README"]
orphans = [p.relative_to(root) for p in wiki
           if not inbound.get(p.stem.lower(), set()) - {p.stem.lower()}]

print(f"{len(pages)} pages, {len(dangling)} dangling links, {len(orphans)} orphans")
for line in dangling + [f"orphan: {o}" for o in orphans]:
    print(line)
sys.exit(1 if dangling or orphans else 0)

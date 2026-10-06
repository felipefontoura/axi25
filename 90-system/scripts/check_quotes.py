#!/usr/bin/env python3
"""Check every timestamped quote in the wiki against the transcript its page cites."""
import re, sys
from difflib import SequenceMatcher
from pathlib import Path

root = Path(sys.argv[1] if len(sys.argv) > 1 else ".").resolve()
words = lambda s: re.sub(r"\W+", " ", s).lower().split()
quote = re.compile(r"\[\d{2}:\d{2}(?::\d{2})?\][^\"]{0,40}\"(.+?)\"", re.S)

def match(q, src, index):
    """Share of the quote's words found in order near the best anchor."""
    if " ".join(q) in " ".join(src):
        return 1.0  # word for word
    best = 0.0
    for j in range(len(q) - 2):
        for i in index.get(tuple(q[j:j + 3]), [])[:50]:
            window = src[max(0, i - j - 5): i - j + len(q) + 15]
            blocks = SequenceMatcher(None, window, q, autojunk=False).get_matching_blocks()
            best = max(best, sum(b.size for b in blocks) / len(q))
    return min(best, 0.99)  # every word present, but not contiguous

counts = {"exact": 0, "near": 0, "loose": 0, "absent": 0}
for page in sorted((root / "20-wiki").rglob("*.md")):
    text = page.read_text(errors="ignore")
    cited = re.search(r"^source_path:\s*[\"']?([^\"'\s]+)", text, re.M)
    if not cited or not (root / cited.group(1)).is_file():
        continue
    src = words((root / cited.group(1)).read_text(errors="ignore"))
    index = {}
    for i in range(len(src) - 2):
        index.setdefault(tuple(src[i:i + 3]), []).append(i)
    for q in quote.findall(text):
        for piece in re.split(r"\.\.\.|…", q):  # an ellipsis skips words
            q_words = words(piece)
            if len(q_words) < 4:
                continue
            score = match(q_words, src, index)
            kind = ("exact" if score == 1 else "near" if score >= 0.85
                    else "loose" if score >= 0.6 else "absent")
            counts[kind] += 1
            if kind in ("loose", "absent"):
                print(f"{kind}: {page.relative_to(root)}: \"{' '.join(q_words)[:80]}\"")

print(counts)
sys.exit(1 if counts["absent"] else 0)

# 10-sources — EXTERNAL RAW MATERIAL (read-only)

External sources ingested verbatim and frozen. **Never modify** (Core Rule #3 in
[../AGENTS.md](../AGENTS.md)): this layer is the provenance record from which the
wiki derives. Every wiki page that comes from a source must be able to trace back here.

## Subfolders

| Folder | Content |
|--------|---------|
| `articles/` | Online articles, blog posts, essays |
| `books/` | Books — chapters or full text in markdown |
| `courses/` | Course material: notes, slides, transcripts |
| `papers/` | Academic papers and research |
| `assets/` | Images, diagrams, and supporting files |

> **PDF/EPUB conversion note**: Converting PDF or EPUB files to markdown is an
> advanced add-on (Pro tier). For v1, paste or drop sources that are already in
> plain text or markdown. Copying the text from a PDF reader and pasting it into
> a `.md` file is the recommended approach.

### `courses/` convention

```
courses/
  <course-slug>/
    _source.md          ← course metadata (author, platform, URL, purchase date)
    materials/          ← PDFs or supplementary files provided by the course
```

Raw transcripts are not wiki. They become wiki through `axi25-ingest`.

## What belongs here

Raw external artifacts you have read, are reading, or want to extract from:
an article, a book chapter, a paper, a course transcript. Drop the content as-is
with no personal comments or edits mixed in.

## What does NOT belong here

- Your study notes or reflections → `25-studies/`
- Operational research for a specific project → `30-projects/<project>/research/`
- Temporal discourse (dated threads, time-bound opinion pieces) → `50-zeitgeist/`
- Your own writing or drafts → `00-capture/` or `30-projects/`

## Flow

```
paste / drop source → 10-sources/<subfolder>/
                              ↓ axi25-ingest (DES — Deep Extraction Standard)
                       20-wiki/concepts/ · syntheses/ · entities/
```

The source stays here as provenance. The wiki page cites it. Never duplicate
source content into `30-projects/research/` — link to it instead.

## Naming

- Folder: `<source-slug>/` or single file `<source-slug>.md`
- Use English, kebab-case for all filenames
- Prefix with author or date when disambiguation helps: `2024-author-title.md`

## Skills

- **axi25-ingest** — extracts atomic knowledge from a source (DES) and creates or
  updates pages in `20-wiki/`

See [../AGENTS.md](../AGENTS.md) for Core Rule #3 (read-only), the DES spec, and
the lint rules for source files.

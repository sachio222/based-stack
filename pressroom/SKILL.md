---
name: pressroom
description: Render markdown to clean HTML + PDF + DOCX with professional resume/cover-letter CSS. Headless Chrome PDF gives exact browser fidelity (no LaTeX needed). Auto-detects cover-letter styling from filename. Use when the user asks to convert markdown to PDF, make a clean printable version, render for sharing or printing, generate ATS-friendly resume/cover-letter exports, or "press" a markdown doc to publication-ready format.
---

# pressroom — markdown → press-ready output

Convert any markdown file (or folder of markdown files) into clean, publication-ready HTML, PDF, and DOCX in one shot. Built for resumes, cover letters, essays, and printable documentation. CSS is tasteful by default, designed to work in browser preview and print/PDF without modification.

## When to use this skill

- User says **"convert this MD to PDF"** / **"make a clean PDF"** / **"render this for sharing"**
- User wants **ATS-friendly resume / cover letter exports**
- User wants **"press"** their markdown to a finished output (single file or batch)
- User wants the same source markdown to generate matching HTML, PDF, and DOCX (e.g. one for the recruiter form, one for browser preview, one for Google Docs)

## When NOT to use

- Raw text dumps that don't need styling — paste-and-go is faster
- LaTeX-heavy academic output — use a proper LaTeX template instead
- Slide decks — use a slide tool

## How it works

1. Pandoc renders the `.md` to **standalone HTML** with the bundled `_style.css` embedded inline. The CSS is print-friendly (Charter serif body, Inter sans headers, 0.85" margins, no dark backgrounds).
2. If the file looks like a cover letter (filename matches `cover-letter` or `letter`), the body gets `class="cover-letter"` for slightly looser line-height.
3. Pandoc separately renders the `.md` to `.docx` (clean Word XML — best format for ATS uploads).
4. **Headless Chrome** prints the HTML to PDF (`--headless=new --no-pdf-header-footer`). Same render engine as the user's browser, so the PDF matches the on-screen preview exactly. No LaTeX, no manual Cmd+P.

## Default invocation

```bash
~/.claude/skills/pressroom/press.sh <input.md>
```

Outputs `<input>.html`, `<input>.pdf`, `<input>.docx` next to the source.

For batch processing a folder of markdown files:

```bash
~/.claude/skills/pressroom/press.sh <directory>
```

## Common flags

| Flag | Effect |
|---|---|
| `--cover-letter` | Force cover-letter CSS class (looser line-height). Auto-detected from filename if not set. |
| `--no-cover-letter` | Force off (override filename heuristic). |
| `--title "..."` | Browser-tab + suggested-PDF-filename title. Defaults to humanized filename. |
| `--css PATH` | Use a different CSS file instead of the bundled `_style.css`. |
| `--no-pdf` | Skip PDF generation. |
| `--no-docx` | Skip DOCX generation. |
| `--out-dir DIR` | Write outputs to DIR instead of next to source. |

## Examples

```bash
# Single resume, default everything
~/.claude/skills/pressroom/press.sh resume.md

# Single cover letter with explicit title (becomes browser tab + PDF filename suggestion)
~/.claude/skills/pressroom/press.sh cover-letter.md \
  --title "Jacob Krajewski — Cover Letter (Anthropic, Product Designer Claude Code)"

# Batch: re-press every markdown file in finals/
~/.claude/skills/pressroom/press.sh "01 Projects/AI Career Pivot/finals"

# Use a custom CSS theme
~/.claude/skills/pressroom/press.sh essay.md --css ~/themes/long-form.css

# HTML + DOCX only (skip PDF)
~/.claude/skills/pressroom/press.sh resume.md --no-pdf
```

## Source markdown conventions

- Use `\` (backslash) at end-of-line to force a `<br>` in pandoc-flavored markdown — needed for header blocks like To/Re/Date or signature blocks where each line should render separately. (A bare newline collapses lines into one paragraph.)
- Strip YAML frontmatter and trailing notes sections before pressing if you're producing a clean public artifact. Keep them in source folders, not in the file you press.
- Use `# Heading` for the document title (resume = candidate name; cover letter = "Cover Letter — Name" or omit).
- Italics with `*...*`, bold with `**...**`, code with `` ` ``.

## Dependencies

- **pandoc** — `brew install pandoc`. Required.
- **Google Chrome** at `/Applications/Google Chrome.app/Contents/MacOS/Google Chrome`. Required for PDF; the script falls back gracefully (HTML + DOCX only) if missing.

## Files in this skill

- `SKILL.md` — this file
- `_style.css` — the default CSS theme. Light, neutral, print-friendly. Includes a `.cover-letter` body class variant.
- `press.sh` — the executable pipeline. Self-contained; idempotent (re-running overwrites previous outputs).

## How Claude should invoke this

When the user asks to convert markdown to PDF, render for sharing, make ATS-friendly exports, or "press" a markdown doc:

1. Identify the input file or directory (ask if unclear).
2. Run `~/.claude/skills/pressroom/press.sh <input>` with appropriate flags.
3. Optionally `open <output>.pdf` to display the result.

For batch tasks (e.g. "re-press all the finals"), point it at a directory and let the script iterate.

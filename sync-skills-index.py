#!/usr/bin/env python3
"""Regenerate skills-index.md from .skill-categories.yaml + each SKILL.md's frontmatter.

Replaces content between <!-- AUTOGEN:BEGIN --> and <!-- AUTOGEN:END --> markers.
Everything outside the markers is preserved (hand-curated tail content: two-pass
workflow, common combos, subagent types, orchestration patterns, tips).
"""
import os
import sys
from pathlib import Path

try:
    import yaml
except ImportError:
    print("pyyaml required: pip install pyyaml (or pipx install pyyaml)", file=sys.stderr)
    sys.exit(1)

SKILLS_DIR = Path(os.path.expanduser("~/.claude/skills"))
YAML_PATH = SKILLS_DIR / ".skill-categories.yaml"
INDEX_PATH = SKILLS_DIR / "skills-index.md"

MARKER_BEGIN = "<!-- AUTOGEN:BEGIN -->"
MARKER_END = "<!-- AUTOGEN:END -->"


def read_skill_meta(skill_dir):
    skill_md = skill_dir / "SKILL.md"
    if not skill_md.exists():
        return None
    content = skill_md.read_text()
    if not content.startswith("---\n"):
        return None
    end = content.find("\n---\n", 4)
    if end == -1:
        return None
    return yaml.safe_load(content[4:end])


def find_installed():
    return sorted(
        d.name for d in SKILLS_DIR.iterdir()
        if d.is_dir()
        and d.name != "scripts"
        and not d.name.startswith(".")
        and (d / "SKILL.md").exists()
    )


def flatten(cats):
    """Return set of skills referenced in the YAML."""
    out = set()
    for _section, contents in cats.items():
        if isinstance(contents, list):
            out.update(contents)
        elif isinstance(contents, dict):
            for skills in contents.values():
                out.update(skills)
    return out


def render_row(skill, meta_by_name):
    desc = (meta_by_name.get(skill, {}).get("description") or "").replace("\n", " ").strip()
    return f"| `{skill}` | {desc} |"


def render(cats, meta_by_name, installed):
    lines = []
    installed_set = set(installed)
    yaml_skills = flatten(cats)

    uncategorized = sorted(installed_set - yaml_skills)
    if uncategorized:
        lines.append("## 0. Uncategorized\n")
        lines.append("New skills not yet placed in `.skill-categories.yaml`. Move them to a category and rerun `sync-skills-index.py`.\n")
        lines.append("| Skill | Description |")
        lines.append("|---|---|")
        for s in uncategorized:
            lines.append(render_row(s, meta_by_name))
        lines.append("\n---\n")

    n = 1
    for section, contents in cats.items():
        lines.append(f"## {n}. {section}\n")
        if isinstance(contents, list):
            present = [s for s in contents if s in installed_set]
            if present:
                lines.append("| Skill | Description |")
                lines.append("|---|---|")
                for s in present:
                    lines.append(render_row(s, meta_by_name))
        elif isinstance(contents, dict):
            for subsection, skills in contents.items():
                present = [s for s in skills if s in installed_set]
                if not present:
                    continue
                lines.append(f"### {subsection}\n")
                lines.append("| Skill | Description |")
                lines.append("|---|---|")
                for s in present:
                    lines.append(render_row(s, meta_by_name))
                lines.append("")
        lines.append("\n---\n")
        n += 1

    return "\n".join(lines).rstrip() + "\n"


def splice(existing, autogen_body):
    if MARKER_BEGIN in existing and MARKER_END in existing:
        before = existing.split(MARKER_BEGIN, 1)[0]
        after = existing.split(MARKER_END, 1)[1]
        return f"{before}{MARKER_BEGIN}\n\n{autogen_body}\n{MARKER_END}{after}"
    raise RuntimeError(
        f"Markers {MARKER_BEGIN} / {MARKER_END} not found in {INDEX_PATH}. "
        "Add them around the auto-generated section before running this script."
    )


def main():
    if not YAML_PATH.exists():
        print(f"Missing {YAML_PATH}", file=sys.stderr)
        sys.exit(1)
    if not INDEX_PATH.exists():
        print(f"Missing {INDEX_PATH}", file=sys.stderr)
        sys.exit(1)

    cats = yaml.safe_load(YAML_PATH.read_text())
    installed = find_installed()
    meta_by_name = {}
    for s in installed:
        m = read_skill_meta(SKILLS_DIR / s)
        if m:
            meta_by_name[s] = m

    yaml_skills = flatten(cats)
    missing_from_fs = sorted(yaml_skills - set(installed))
    uncategorized = sorted(set(installed) - yaml_skills)
    if missing_from_fs:
        print(f"INFO: in YAML but not installed (skipped): {', '.join(missing_from_fs)}", file=sys.stderr)
    if uncategorized:
        print(f"WARN: uncategorized (installed but not in YAML): {', '.join(uncategorized)}", file=sys.stderr)

    body = render(cats, meta_by_name, installed)
    existing = INDEX_PATH.read_text()
    new = splice(existing, body)
    INDEX_PATH.write_text(new)
    print(f"Regenerated {INDEX_PATH}: {len(installed)} skills installed, {len(yaml_skills & set(installed))} categorized, {len(uncategorized)} uncategorized")


if __name__ == "__main__":
    main()

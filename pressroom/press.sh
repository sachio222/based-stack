#!/bin/bash
# pressroom: render markdown to clean HTML + PDF (+ DOCX) using headless Chrome.
#
# Usage:
#   pressroom <input.md>                  # → input.html, input.pdf, input.docx
#   pressroom <directory>                 # batch all .md in directory
#   pressroom <input.md> --cover-letter   # use cover-letter CSS variant (looser line-height)
#   pressroom <input.md> --title "..."    # custom browser-tab / PDF title
#   pressroom <input.md> --css PATH       # override default CSS
#   pressroom <input.md> --no-pdf         # skip PDF
#   pressroom <input.md> --no-docx        # skip DOCX
#   pressroom <input.md> --out-dir DIR    # write outputs to DIR instead of next to source
#
# Cover-letter detection is automatic from filename ("cover-letter", "letter").
# Override with --cover-letter or --no-cover-letter explicitly.
#
# Requires: pandoc (brew install pandoc), Google Chrome.

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DEFAULT_CSS="$SCRIPT_DIR/_style.css"
CHROME="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"

COVER_LETTER=""
TITLE=""
CSS_PATH="$DEFAULT_CSS"
GEN_PDF=true
GEN_DOCX=true
OUT_DIR=""
INPUT=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --cover-letter)    COVER_LETTER=true; shift ;;
    --no-cover-letter) COVER_LETTER=false; shift ;;
    --title)           TITLE="$2"; shift 2 ;;
    --css)             CSS_PATH="$2"; shift 2 ;;
    --no-pdf)          GEN_PDF=false; shift ;;
    --no-docx)         GEN_DOCX=false; shift ;;
    --out-dir)         OUT_DIR="$2"; shift 2 ;;
    -h|--help)         sed -n '3,18p' "$0" | sed 's/^# \?//'; exit 0 ;;
    -*)                echo "ERROR: unknown option: $1" >&2; exit 1 ;;
    *)                 INPUT="$1"; shift ;;
  esac
done

# Validation
if [ -z "$INPUT" ]; then
  echo "ERROR: no input. Usage: pressroom <input.md|directory> [options]" >&2
  exit 1
fi
if ! command -v pandoc >/dev/null 2>&1; then
  echo "ERROR: pandoc not installed. Run: brew install pandoc" >&2
  exit 1
fi
if [ ! -f "$CSS_PATH" ]; then
  echo "ERROR: CSS not found: $CSS_PATH" >&2
  exit 1
fi

# Cross-platform sed -i wrapper (BSD on macOS needs '', GNU doesn't)
sed_inplace() {
  if sed --version >/dev/null 2>&1; then
    sed -i "$@"  # GNU
  else
    sed -i '' "$@"  # BSD/macOS
  fi
}

humanize_filename() {
  echo "$1" | tr '-_' '  ' | awk '{for(i=1;i<=NF;i++) $i=toupper(substr($i,1,1)) substr($i,2); print}'
}

press_one() {
  local md="$1"
  local md_abs base out_dir_actual cover_actual title_actual
  md_abs="$(cd "$(dirname "$md")" && pwd)/$(basename "$md")"
  base="$(basename "$md" .md)"

  if [ -n "$OUT_DIR" ]; then
    mkdir -p "$OUT_DIR"
    out_dir_actual="$(cd "$OUT_DIR" && pwd)"
  else
    out_dir_actual="$(dirname "$md_abs")"
  fi

  local out_html="$out_dir_actual/$base.html"
  local out_pdf="$out_dir_actual/$base.pdf"
  local out_docx="$out_dir_actual/$base.docx"

  # Cover-letter detection
  if [ -z "$COVER_LETTER" ]; then
    if [[ "$base" =~ cover.?letter|letter ]]; then
      cover_actual=true
    else
      cover_actual=false
    fi
  else
    cover_actual="$COVER_LETTER"
  fi

  # Title default
  if [ -z "$TITLE" ]; then
    title_actual="$(humanize_filename "$base")"
  else
    title_actual="$TITLE"
  fi

  echo "→ pressing $base"

  # HTML
  pandoc "$md_abs" \
    --standalone --embed-resources --css="$CSS_PATH" \
    --variable=pagetitle="$title_actual" \
    -o "$out_html"

  if [ "$cover_actual" = true ]; then
    sed_inplace 's|<body>|<body class="cover-letter">|' "$out_html"
  fi

  # DOCX
  if [ "$GEN_DOCX" = true ]; then
    pandoc "$md_abs" -o "$out_docx"
  fi

  # PDF via headless Chrome
  if [ "$GEN_PDF" = true ]; then
    if [ -x "$CHROME" ]; then
      "$CHROME" --headless=new --disable-gpu --no-pdf-header-footer --print-to-pdf-no-header \
        --print-to-pdf="$out_pdf" "file://$out_html" 2>/dev/null
    else
      echo "  WARN: Chrome not found at $CHROME — skipping PDF" >&2
    fi
  fi
}

if [ -d "$INPUT" ]; then
  count=0
  for md in "$INPUT"/*.md; do
    [ -f "$md" ] || continue
    press_one "$md"
    count=$((count+1))
  done
  echo "Done. $count file(s) pressed."
elif [ -f "$INPUT" ]; then
  press_one "$INPUT"
  echo "Done."
else
  echo "ERROR: not found: $INPUT" >&2
  exit 1
fi

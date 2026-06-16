# LOOP-LOG.md — Per-Loop Digest ({{PROJECT}})

Canonical one-entry-per-loop record (newest first). Keeps WORKSTATE live-state-only ([[LOOP-PROTOCOL]]). The Engineer writes the digest entry at gate close; the CoS appends the ratification verdict. Full detail per loop → `reports/loop-NN.md`; chronology → `git log`.

**Entry format** (keep it to a few lines — the report file holds the depth):

```
## Loop #NN — <ticket title> — <date>
- **Pick:** <what + the Engineer's stated reasoning (autonomous vs directed)>
- **Interventions:** <count + cause, or "zero">
- **Write-back:** In Progress → Done · pick comment ✓ · ship comment <SHA> ✓ · no clobber
- **Verification:** <gates ✓> · <product-gate live evidence if applicable> · <cold-browser if UI>
- **Branch/merge:** `<branch>` → `<default> @ <sha>`
- **Findings:** <anything worth remembering → also LESSONS if it's a standing lesson>
- ✓ **Ratified — CoS-NN, <date>:** <verdict>
```

---

*(no loops yet — loop #1 is the first. Team stood up {{DATE}}.)*

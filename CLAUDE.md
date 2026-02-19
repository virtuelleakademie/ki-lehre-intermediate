# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

German-language Quarto website for a 180-minute (3 Stunden) BFH (Bern University of Applied Sciences) workshop on AI in higher education teaching. Part of a multi-workshop suite (beginner, intermediate, advanced, refresher). The workshop is pedagogically self-modeling: it teaches learning science principles while using those same principles in its delivery.

- **Site URL:** https://virtuelleakademie.github.io/ki-lehre-intermediate/
- **Language:** German (content), English (code/config)

## Build & Preview

```bash
quarto preview --port 8800          # Local preview (no auto-open)
quarto render                       # Full site render to docs/
quarto render path/to/file.qmd      # Render single page
```

Git workflow shortcuts via Makefile: `make branch name=X`, `make commit msg="X"`, `make push`, `make merge`.

Python venv at `.venv/` with `requirements.txt` (Jupyter, OpenAI SDK).

## Architecture

### Workshop Structure (3 parts)

| Directory | Part | Duration | Focus |
|-----------|------|----------|-------|
| `workshop/` | Opening/Closing | — | Generation effect opening, discussion closing |
| `01-lernen-verstehen/` | Teil 1 | 50 min | Learning science backbone (cognitive architecture, schemas, expertise) |
| `02-ki-und-lernen/` | Teil 2 | 30 min | AI implications (cognitive offloading, evaluation paradox) |
| `03-praxis/` | Teil 3 | 55 min | Assignment redesign via 5-question framework + agent design |

### Slides

RevealJS presentations live in `slides/` with shared config in `slides/_metadata.yml`. Slides are embedded in content pages via:

```markdown
{{< revealjs file="../../slides/topic-name/index.html" height="500px" class="ratio ratio-16x9" >}}
```

Slides use the `simple` theme with custom SCSS (`styles/custom-reveal.scss`), chalkboard plugin, and `attribution` revealjs-plugin.

### Custom Callouts

Defined in `_quarto.yml` via the `custom-callout` extension. Used throughout for activity blocks:

- `{.active-processing}` — general processing activity
- `{.individual}` — solo work
- `{.pair}` — partner activity
- `{.group}` — group activity
- `{.reflect}` — reflection prompt
- `{.agent-potential}` — AI agent opportunity
- `{.pro-tip}` — collapsible tip

Usage: `::: {.pair}\n### Title\nContent\n:::`

### Extensions (`_extensions/`)

Key extensions: `custom-callout` (activity blocks), `timer` (countdown timers), `attribution` (slide citations), `fontawesome`/`bsicons` (icons), `social-embeds` (YouTube etc.), `embedpdf`, `pyodide` (browser Python).

### Bibliography

`bibliography.bib` — Zotero-managed BibTeX with ~170 citations. Referenced from all section `_metadata.yml` files. Cite with `@key` syntax.

### Branding

Swiss minimalist design system shared with the beginner workshop. Sharp corners (0px border-radius), 2px solid black borders, no box shadows.

`_brand.yml` defines Urbanist font (Google Fonts) and core colors: black `#000000` (primary text), light grey `#F5F5F5` (surface), burgundy `#9A4665` (primary accent), gold `#D4A03E` (secondary accent for insight callouts).

`styles/custom.scss` provides the full website design system (typography, navbar, sidebar, cards, callouts, tables, code blocks, footer, tabs). `styles/styles.css` provides callout icon/body color overrides and timer styling. `styles/custom-reveal.scss` provides slide-specific styling.

Callouts use a dual-accent color system: burgundy for action callouts (individual, pair, group, active-processing, agent-potential) and gold for insight callouts (reflect, pro-tip, nachlesen). Facilitator callouts use dark grey. All callout icons are Font Awesome (fa-*), not emoji.

## Writing Style

- **Address participants with "du"** (not "Sie") throughout all workshop content, including the Vorbereitung section
- **Minimize use of dashes (em-dashes, en-dashes, hyphens used as dashes)**. Prefer natural sentence flow with commas, periods, or subordinate clauses. Occasional dashes are fine, but overuse is a telltale sign of LLM-generated text. Rewrite sentences to avoid them where possible.
- **Never use emojis in text.** No emojis in any content, headings, callouts, slides, or other written material. Font Awesome (`{{< fa >}}`) and Bootstrap (`{{< bi >}}`) icons are fine where relevant.

## Content Patterns

- Pages use `{{< bi icon-name >}}` for Bootstrap icons in headings
- Slides use `{{< fa icon-name >}}` for Font Awesome icons
- Each section has its own `_metadata.yml` inheriting from the parent config
- Output renders to `docs/` (committed for GitHub Pages deployment)
- Hypothesis commenting is enabled site-wide

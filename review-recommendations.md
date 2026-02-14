# Workshop Review: Expert Panel Recommendations

Date: 2026-02-14
Reviewers: Pedagogy Reviewer, Slide Design Expert, Tidyverse Code Reviewer

---

## Pedagogy Review

### Strengths

- The workshop genuinely models its own principles: generation effect opening, retrieval practice after break, desirable difficulty throughout.
- The Teil 3 progression (worked example, guided practice, independent practice) is well-designed.
- The post-break retrieval activation is well-timed and well-structured.
- Meta-moment callouts making self-modeling explicit are a brilliant touch.
- The worked example (annotated bibliography in Teil 2) is "genuinely excellent pedagogical design."

### Priority 1: Reduce cognitive overload in Teil 1

**Impact:** High. This is the foundation for everything else.

Currently ~11 distinct concepts in 40 min. The workshop's own theory says 4+/-1 elements in working memory. Move encoding specificity, detailed prediction error mechanism, and the "three levels of learning" callout to deep-dive pages. Target: 6-7 concepts max.

**Files affected:**
- `01-lernen-verstehen/index.qmd` (lines 85-127)
- `slides/wie-menschen-lernen/index.qmd`

**Specific action:** The section on desirable difficulties (lines 86-106) introduces four strategies plus an integrative callout (lines 96-106) that itself introduces three new framing concepts. The callout is cognitively expensive because it requires holding all four strategies and the three-level framework simultaneously. Consider moving the three-level callout to the self-study materials, or placing it after the retrieval exercise (line 108) rather than before it.

### Priority 2: Add retrieval practice at Teil 2 to Teil 3 transition

**Impact:** High. Participants are about to do the most important activity (applying the framework to their own assignments).

Insert a 2-minute "write the 5 questions from memory" exercise at the start of Teil 3. This serves a dual function: it consolidates the framework and identifies participants who need to look it up before the application activity.

**File affected:** `03-praxis/index.qmd` (before line 17)

### Priority 3: Add a partially worked example for a true fading sequence

**Impact:** Medium-high. The jump from complete worked example to fully independent practice is the largest scaffolding gap.

Convert the VWL example on the 5-Fragen-Framework page to a partial example (questions 1-3 answered, 4-5 left for participants), or create a brief partial example in Teil 3 before the independent THINK phase.

**Files affected:**
- `03-praxis/5-fragen-framework/index.qmd` (lines 89-107)
- OR `03-praxis/index.qmd`

### Priority 4: Tighten the "Aktive Verarbeitung" activity

**Impact:** Medium. 15 minutes is a significant portion of the workshop.

The activity asks participants to choose from three broad reflection questions. Tighten the prompt to require application of Teil 1/2 concepts. For example: "Denke an eine Situation in deiner Lehre, in der Studierende den einfachsten Weg genommen haben (KI oder anderes). Analysiere mit einem Konzept aus Teil 1 oder 2: Warum war das der einfachste Weg?" Also consider reducing to 10 minutes.

**File affected:** `02-ki-und-lernen/aktive-verarbeitung/index.qmd`

### Priority 5: Add self-explanation prompts to case studies

**Impact:** Medium. The case studies are well-designed for analysis but adding a "explain why" prompt would deepen processing from categorization to elaboration.

Add to each case study: "Erklaere in 2 Saetzen, warum Szenario X2 besseres Lernen erzeugt als Szenario X1. Welcher kognitive Mechanismus wird aktiviert?"

**File affected:** `03-praxis/fallstudien/index.qmd`

### Additional Pedagogy Recommendations

- **Pre-break consolidation:** Add a micro-activity at the end of Teil 1: "Schreibe in einem Satz auf, was die wichtigste Erkenntnis aus Teil 1 fuer deine eigene Lehre ist."
- **Practice the 3 probes immediately:** After introducing the 3 probes in Teil 2, add a 60-second pair exercise: "Waehle eine der 3 Sonden. Wie wuerdest du sie konkret einsetzen? Formuliere eine Beispielfrage."
- **Deepen retrieval in Teil 1:** Change the Kurz-Abruf exercise to include "Erklaere in einem Satz, warum eine der vier Strategien funktioniert."
- **Align closing with Objective 1:** Add to closing: "Erklaere in zwei Saetzen, warum kognitive Anstrengung der Mechanismus fuer Lernen ist."
- **Add micro-pause in Teil 1:** Insert a 60-second retrieval exercise after novice-expert differences and before desirable difficulties (~25 min into Teil 1).
- **Missing time budget:** The schedule does not show where the 15-minute aktive Verarbeitung fits within Teil 2. Clarify placement.
- **Case study heading language:** "Case Study Analysis" in Teil 1 should be "Fallstudien-Analyse" for consistency.
- **Self-modeling irony:** The 8 Make-it-Stick handout is blocked, not interleaved. Add a note acknowledging this.

---

## Slide Design Review

### Strengths

- Narrative arc of `wie-menschen-lernen` is excellent (productivity promise, then "Aber halt..." pivot).
- Progressive disclosure (fragments) used well in core decks.
- The callout system creates clear visual differentiation between reading and activities.
- The "Meta-Moment" callouts are pedagogically brilliant.

### Critical Issue: Inverted Visual Support

The most abstract, hardest-to-grasp concepts have the least visual support, while the most concrete concepts have the most. This is exactly the wrong distribution.

| Deck | Images/slide | Tables/slide |
|------|-------------|-------------|
| wie-menschen-lernen | 0.07 | 0.53 |
| ki-und-lernen | 0.00 | 0.50 |
| was-ist-ki | 0.86 | 0.00 |
| was-sind-chatbots | 0.73 | 0.00 |

### Slides Needing Splitting

1. **"Die drei Arten kognitiver Belastung"** (wie-menschen-lernen, lines 122-138): 4-column, 4-row table with full sentences in every cell, plus a callout. Replace with stacked bar visualization.
2. **"CLT und KI: Cognitive Offloading"** (lines 159-173): Dense table with `.smaller` class (signal of overload). Split into visual overview + detail slide.
3. **"CLT und KI: Lernmechanismen"** (lines 175-189): Same pattern.
4. **"Offloading vs. Outsourcing"** (ki-und-lernen, lines 7-21): Most critical concept, currently a text table. Replace with spectrum visualization.

### Font/Color Inconsistencies

- Slides: News Cycle headings, Lato body, dark blue links (#00008b)
- Site: Jura font (via _brand.yml), burgundy links (#9A4665)
- Recommendation: Align slide styling with site brand, or make the divergence intentional and explicit.

### Auxiliary Deck Issues

**was-ist-ki:**
- Duplicate slide ("Erster Schritt: Eigene KI-Kompetenz entwickeln") appears twice. Use fragments instead.
- "Machine learning" title appears 4 times with different content. Differentiate titles.
- Empty 30% column on "Was is KI?" and "Klassifizierung" slides wastes space.

**was-sind-chatbots:**
- Screenshot slides (lines 192-230) have no annotations. Add minimal framing.

**prompting:**
- All 12 content slides follow identical pattern. Consider varying layout to prevent disengagement.

**moglichkeiten-grenzen:**
- Feels disconnected from learning science narrative. Add bridge explaining connection.

### Deep-Dive Page Issues

- **kompetenz-erwerben:** Longest page (644 lines), 300+ line stretch with only 2 reflect callouts. Needs more visual breaks.
- **arbeitsgedaechtnis:** Four WM models each get 15-20 lines of text. A comparative diagram would help.
- **5-Fragen-Framework:** ASCII flowchart at lines 177-186 needs proper visual diagram.
- **aktive-verarbeitung:** Only 40 lines, no introduction or context. Orphaned or intentionally lightweight?

### Additional Slide Recommendations

- Add a visual organizer (hub-and-spoke) for the 8 Make It Stick strategies, showing "Wuenschenswerte Schwierigkeiten" as the central principle.
- Reveal table rows incrementally using fragments where the workshop's own CLT warns against simultaneous presentation.

---

## Typos Found

1. `slides/was-ist-ki/index.qmd`: "Was is KI?" should be "Was ist KI?"
2. `slides/was-sind-agenten/index.qmd` line 76: "Unterschiedie" should be "Unterschiede"
3. `01-lernen-verstehen/kompetenz-erwerben/index.qmd` line 3: "Vom Novizen zum Exerten" should be "Vom Novizen zum Experten"
4. `03-praxis/agent-beispiele/index.qmd`: Multiple dashes in running text violate style guidelines (e.g., line 19, line 27). Rewrite to use natural sentence flow.

---

## Visualization Recommendations

### Implemented as ggplot2 (see `resources/visualizations.qmd`)

1. **Cognitive Load Distribution** - Stacked bar showing WM capacity as zero-sum across 3 scenarios
2. **Expertise Reversal Effect** - Crossover interaction plot with permanent KI-scaffolding line
3. **Testing Effect** - Bar chart of Roediger & Karpicke (2006) retention data
4. **Lernparadox 2x2 Matrix** - Quadrant diagram of subjective feeling vs. actual learning
5. **Offloading vs. Outsourcing Spectrum** - Horizontal gradient with 5 positioned examples

### To implement as Mermaid/diagram

6. **Working Memory Bottleneck** - Flow diagram showing information squeezing through narrow WM pipe into vast LTM space. Annotate with "~4 Elemente, 15-30 Sekunden" at bottleneck and "unbegrenzt, dauerhaft" at LTM.
7. **5-Question Framework Decision Flowchart** - Proper decision tree replacing ASCII art. 5 diamond decision nodes, color-coded exits (green = proceed, red = action needed).
8. **Evaluation Paradox** - Circular dependency diagram: "KI-Output bewerten" requires "Fachkompetenz" requires "Lernen" requires "Eigenes Denken" which is replaced by "KI-Output." Break the circle to show the impossibility.
9. **Try-then-Check Cycle** - Circular process: Versuch (generate own attempt) -> Vergleich (compare with KI) -> Reflexion (update understanding) -> back to Versuch. Show wrong path (skipping step 1) alongside.

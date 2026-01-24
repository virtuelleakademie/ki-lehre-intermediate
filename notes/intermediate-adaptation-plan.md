# Plan: Intermediate Workshop Adaptation

## Summary

Adapt the intermediate workshop to avoid overlap with beginner (which now covers LLMs thoroughly), expand learning science content, and balance theory with practice.

---

## 1. Proposed Intermediate Workshop Structure (3 hours)

### Opening: Brücke zum Beginner (15 min)

- Activation: "Im Beginner haben wir beobachtet..."
- Recap offloading vs. outsourcing distinction
- Frame the question: "Warum macht es einen Unterschied?"

### Part 1: Von Chatbots zu Agents (30 min)

**Remove**: LLM basics (next-word prediction, temperature, chain-of-thought) — now in beginner

**Keep/Expand**:

- Chatbots vs. Agents paradigm shift (15 min)
  - Agent components: LLM + memory + tools + decision loop
  - Agent cycle: perceive-plan-act-feedback
- Context and Attention mechanisms (15 min)
  - Why this matters for agent design

### Part 2: Wie Menschen Lernen (60 min)

Currently only 20 min. Expand to provide the "why" behind beginner's observations.

**2.1 Kognitive Architektur (15 min)**

- Working memory vs. long-term memory
- The 4±1 chunk bottleneck
- Declarative (facts/events) vs. procedural (skills)
- Episodic → semantic → procedural transformation
- Schema formation and chunking

**Embedded activity**: Arbeitsgedächtnis erleben (digit span demo, 5 min)

**2.2 Cognitive Load Theory (10 min)**

- Intrinsic, extraneous, germane load
- Design principle: reduce extraneous → room for germane
- Connection: "Outsourcing eliminiert germane load"

**2.3 Prediction Error Learning (10 min)** — NEW

- How brains learn: prediction → attempt → error → update
- The compilation process (thousands of cycles)
- Why AI-generated answers = zero prediction errors = zero learning

**2.4 Case Study Analysis (15 min)** — ACTIVITY

- Pairs analyze pre-prepared scenarios
- Effective vs. ineffective AI integration examples
- Apply CLT and prediction error concepts

**2.5 Desirable Difficulties (5 min)**

- Retrieval practice, spacing, interleaving, generation effect
- "Schwierigkeit ist kein Bug, sondern das Feature"

### Break (15 min)

### Before-After Analysis Activity (15 min)

- Participants analyze one of their own assignments
- Identify where AI might eliminate germane load
- Propose one modification to preserve productive struggle
- Brief sharing in pairs

### Part 3: Agent-Design für Lernförderung (45 min)

**3.1** Make-it-Stick Strategien overview (5 min)
**3.2** THINK: Agent erstellen (20 min) — with explicit "preserve germane load" criterion
**3.3** PAIR: Cross-testing (10 min)
**3.4** SHARE: Patterns und Transfer (10 min)

### Closing: Transfer (15 min)

---

## 2. Memory Research: Approach

### Decision: Focused Integration

Include memory research where it explains mechanisms, not as separate theory:

**In cognitive architecture section (2.1)**:

- Briefly distinguish declarative (facts/events) from procedural (skills)
- Mention episodic (context-bound experiences) vs. semantic (decontextualized knowledge)
- Frame as: "Learning transforms episodic experiences into semantic knowledge and procedural skill"

**In prediction error section (2.3)**:

- How declarative becomes procedural through practice
- The consolidation process as skill compilation

**As optional resources** (not in main presentation):

- Deeper episodic/semantic theory (Tulving)
- Mental time travel and prospection
- Consolidation neuroscience

### Decision: No Mathematical Models

Keep the workshop accessible by focusing on conceptual understanding (CLT, desirable difficulties) without mathematical formalization. Bayesian models, active inference, etc. are not appropriate for this general faculty audience.

---

## 3. Theory-Practice Balance

### Two Activities Added

**Activity A: Case Study Analysis (15 min)** — embedded in Part 2

- Pairs analyze pre-prepared scenarios
- Compare effective vs. ineffective AI integration examples
- Discuss: What makes the difference?

**Activity B: Before-After Analysis (15 min)** — after break

- Participants analyze one of their own assignments
- Identify where AI might eliminate germane load
- Propose one modification to preserve productive struggle

### Revised Design Split

| Component             | Theory | Practice                        |
| --------------------- | ------ | ------------------------------- |
| Opening               | 15 min | —                               |
| Part 1 (Agents)       | 30 min | —                               |
| Part 2 (Learning)     | 40 min | 20 min (case study + digit span)|
| Before-After Activity | —      | 15 min                          |
| Part 3 (Design)       | 5 min  | 40 min                          |
| Closing               | 15 min | —                               |
| **Total**             | ~105 min | ~75 min                       |

**Balance achieved: roughly 60/40 theory-practice split** (appropriate for intermediate level where deeper understanding is the goal)

---

## 4. Files to Modify

### Intermediate Workshop (`../ki-lehre-intermediate/`)

| File | Action |
|------|--------|
| `workshop/index.qmd` | Update schedule, timing, learning objectives |
| `01-ki-verstehen/index.qmd` | Remove LLM basics, restructure around agents |
| `slides/was-sind-chatbots/` | Remove or mark as reference-only |
| `02-wie-menschen-lernen/index.qmd` | Major expansion with new sections |
| `slides/wie-menschen-lernen/` | Add prediction error content, expand CLT |
| `03-lernumgebungen/index.qmd` | Revise framing for agent activity |

### Content to Promote from Resources to Main Slides

- Prediction error learning content from `kompetenz-erwerben/index.qmd`
- Deeper CLT content

---

## 5. Verification

After implementation:

1. Run `quarto preview` in intermediate workshop directory
2. Check all internal links still work
3. Verify slide navigation flows correctly
4. Confirm no duplicate content between beginner and intermediate
5. Test timing by reading through content aloud

---

## Summary of Decisions

1. **Memory research**: Focused integration (episodic/semantic where it explains mechanisms, deeper theory as resources)
2. **Mathematical models**: Not included (keep accessible for general faculty)
3. **Theory-practice balance**: Both activities included (Case Study Analysis + Before-After Analysis)

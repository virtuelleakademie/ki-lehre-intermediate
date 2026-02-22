# Formalization Notes: Instructional Design in the Age of AI

Working notes on how to formalize the arguments in `workshop-concept-instructional-design.md`. 

---

## 1. Three Highest-Leverage Formalizations

These are the ideas that both perspectives converge on as most tractable and most revealing when formalized.

### 1a. The Evaluation Paradox

The informal claim: to evaluate whether a tool (AI, a shortcut, a peer's solution) helps you learn, you need the expertise the learning task was supposed to develop. Novices cannot judge whether an AI-generated analysis is correct, complete, or relevant.

**Bayesian framing: a POMDP with endogenous state transitions.**

The student's own competence C_t is a hidden state, observed only through noisy metacognitive signals. At each task, the student chooses a strategy: effortful engagement (exploration) or outsourcing (exploitation). The twist that makes this non-standard: outsourcing does not just fail to improve C_t. It actively degrades the student's ability to explore effectively in the future, because:

- Effortful engagement updates C_t (Bayesian learning from the task)
- Outsourcing leaves C_t unchanged but provides misleading metacognitive feedback (the product looks good, so the student's estimate m_t of their own competence drifts upward)
- The gap between m_t and C_t widens, making future strategy choices worse

In bandit terms, choosing the outsourcing arm changes the reward distribution of the effortful arm by preventing the competence growth that would make effort more rewarding. This is a non-stationary bandit with state-dependent arm characteristics.

What falls out of this: the argument for controlled environments (restricting tool access for novices) is not paternalism. It is a rational response to a badly identified estimation problem. When metacognitive signals are too noisy (because C_t is low), self-regulation cannot work. As C_t grows, signals improve, and the student can increasingly self-regulate. This is the novice-to-expert autonomy trajectory the concept document describes, but here it is derived from the model rather than asserted.

**ACT-R framing: activation thresholds.**

Evaluating an AI-generated solution requires: (1) retrieving relevant domain chunks from declarative memory, (2) building a representation of the AI output in the imaginal buffer, (3) firing comparison productions, (4) detecting discrepancies. Step 1 is where the paradox bites. The chunks needed for evaluation are the same chunks the learning task was supposed to create or strengthen. For novices, base-level activation B_i is low (few prior retrievals), associative strength S_ji is low (few connections), and retrieval fails.

The activation equation: A_i = B_i + sum_j(W_j * S_ji) + epsilon

For a novice, A_i is likely below retrieval threshold tau. The student cannot run the evaluation productions because the required declarative inputs are not available.

**Critical prediction from ACT-R that the informal argument misses:** The paradox is graded, not binary. A student with moderate activation levels (chunks exist but are weak) will sometimes successfully evaluate AI output (when noise epsilon pushes activation above threshold) and sometimes fail. This intermittent success is arguably more dangerous than consistent failure, because the student catches one error and concludes they are capable of evaluation generally. Partial competence creates false confidence.

A further prediction: when evaluation succeeds at low activation levels, the retrieval feels effortful, generating low confidence even when the judgment is correct. A double bind: when evaluation succeeds, the student does not trust it; when it fails, the student does not notice.

**What to do with this.** The evaluation paradox, properly formalized as either a POMDP or an activation-threshold model, is potentially publishable. The key novelty is that outsourcing degrades not just competence but metacognitive calibration, creating a self-reinforcing trap. The POMDP formulation yields optimal policy characterization, conditions for when controlled environments are justified, and a principled trajectory from environmental control to structural design.

---

### 1b. The Outsourcing Test

The informal claim: the central diagnostic is "Could someone complete this deliverable without performing the cognitive work I intend?" If yes, the assessment has a proxy problem.

**Information-theoretic framing: mutual information.**

Let W = intended cognitive work and D = deliverable. The outsourcing test asks about I(W; D), the mutual information between them. If I(W; D) is low, D can be produced without W.

But mutual information is symmetric: I(W; D) = I(D; W). This reveals a subtlety the informal argument glosses over. High mutual information means both:

1. W is necessary for D (production constraint: the deliverable cannot be produced without the work)
2. D is informative about W (measurement constraint: the deliverable reveals whether the work occurred)

These can come apart. An oral exam where the student answers live: W is necessary for D (cannot outsource real-time responses). But D might be uninformative about the *specific* cognitive operations if questions are too generic. You can build assessments that pass condition 1 but fail condition 2.

**The conditional independence characterization.** An LLM is approximately a model of P(text | prompt). It conditions on the prompt but cannot condition on the student's internal state:

D_LLM is independent of theta_student given prompt

This is the formal basis for the entire private-information argument. Stating it explicitly identifies the attack surface: if the student puts enough of their knowledge state into the prompt, the conditional independence weakens. Each design pattern works because it requires inputs that cannot (fully) enter a prompt: predictions that do not exist yet, real-time responses to unanticipated questions, experiential details too rich and idiosyncratic to articulate fully.

**ACT-R framing: absence of internal operations.**

"Outsourcing cognitive work" means replacing internal production firings and declarative memory retrievals with external tool operations (perceptual encoding of AI output, motor actions to prompt). The consequence: no internal chunk creation occurs. No activation-building retrievals, no production-strengthening firings, no new chunk formation in the imaginal buffer. The assessment that samples only the final output is informationally equivalent across any production system that generates it, whether it involved internal learning traces or not.

**Both perspectives flag: the outsourcing test is necessary but not sufficient.** Passing the test (the task structurally requires cognitive operations) does not guarantee learning. The operations might occur under conditions that do not produce durable learning: without adequate feedback (no utility update), without sufficient repetition (insufficient activation buildup), or without appropriate spacing. Feedback quality and practice distribution are separate design variables the framework currently underspecifies.

---

### 1c. Rational Effort Allocation

The informal claim: students are boundedly rational agents who satisfice. If an acceptable outcome is achievable without performing the cognitive operations, the task does not sufficiently reward those operations. The behavior is strategic, not lazy.

**Decision-theoretic framing.**

The student chooses strategy s to maximize:

U_t = E[grade(D_t, s_t)] - lambda * effort(s_t, theta_t) + beta * E[V_{t+1}(theta_{t+1}, m_{t+1})]

Where lambda is the effort-cost parameter (varies with competing demands, fatigue, interest) and beta is the discount factor for future knowledge value.

Behavioral predictions:

- A myopic student (beta = 0) always outsources when grade(outsource) is close to grade(effort)
- A far-sighted student with accurate metacognition may choose effort for long-term value
- A far-sighted student with miscalibrated metacognition (m_t >> theta_t, overconfident from prior outsourcing) still outsources because they believe they already know the material

Boundary conditions where good design still fails:

- lambda is very high (extreme time pressure, competing demands): effort cost dominates regardless
- beta is very low (no professional identity, no perceived future relevance): future value does not enter the calculus
- Grade feedback is noisy: even good designs are undermined if grades do not reliably distinguish genuine from outsourced work

**Satisficing framing (Anderson/Simon).**

A satisficing agent does not maximize. They search the strategy space until they find an s where G(s) exceeds aspiration level A. If s_AI is encountered early and G(s_AI) >= A, search terminates before the effortful strategy is even considered. The student who would prefer effortful engagement (if they tried it) may never discover this.

Design implication: either ensure G(s_AI) < A (the outsourcing strategy does not satisfy), or structure the task so that s_AI is not encountered early in the search (e.g., the effortful strategy is the natural first step because the task begins with something only the student can do).

**The rational analysis of "laziness."** "Laziness" is a high lambda. But lambda is not a character trait. It is determined by the full optimization problem: competing courses, employment, health, perceived future utility. A student working 20 hours per week has a rationally higher lambda. Calling it laziness forecloses inquiry into both cognitive and structural causes.

---

## 2. The Proxy Problem as Signal Detection

The informal claim: most assessments measure products that historically correlated with learning because producing them without understanding was effortful. AI breaks the correlation.

**Signal detection framing.** Let L be binary (learning occurred or not), D be deliverable quality (continuous). The instructor's task is to decide P(L | D). Pre-AI, P(D > threshold | L=0) was low because the cost of producing D without L was high. Post-AI, P(D > threshold | L=0) rises. The likelihood ratio P(D|L=1)/P(D|L=0) approaches 1, and d-prime approaches zero.

This adds three things to the informal argument: (a) "the proxy breaks" is now precise (d-prime approaches zero), (b) the solution class is immediate (find observables where d-prime remains high), and (c) it connects to the existing literature on measurement reliability and validity.

**ACT-R framing.** Two entirely different production systems can produce the same final output. A student with compiled domain productions generates output through a long chain of domain-specific firings (which create learning traces). An AI user generates the same output through a short chain: retrieve prompt template, submit, copy. Both are rational given the task environment. The assessment cannot distinguish them because it samples only the final state.

---

## 3. Prediction-Revision as Bayesian Updating

The informal claim: students externalize their prior understanding before encountering new material. The revision is meaningful only relative to a genuine prediction. A fabricated prediction produces a generic revision.

**Bayesian framing.** Let P_0(H) be the student's prior (mental model before instruction), D be the instructional content, P_1(H) the posterior. The prediction externalizes P_0. The revision externalizes the relationship between P_0 and P_1.

The quality of a revision approximates KL divergence D_KL(P_1 || P_0), the degree to which the posterior has moved from the prior. A good revision identifies *where* the posterior differs and *why*. A genuine P_0 is idiosyncratic and produces an idiosyncratic shift referencing specific prior beliefs. A fabricated P_0 (uniform or stereotyped) produces a generic shift.

**Key insight the formalization reveals:** Diagnostic power depends on the entropy of the prior distribution *across* students. If all students share the same misconception, even genuine revisions look alike, and the pattern loses discriminative power. The pattern works best with diverse priors, which is more likely in heterogeneous classrooms. This is a testable prediction the informal framework does not generate.

**ACT-R concern: activation dynamics of misconceptions.** A single prediction-revision cycle may not overcome a well-practiced misconception. The misconception chunk has high base-level activation from years of use. The correction creates a new chunk that competes in retrieval, but its B_i is initially low. ACT-R predicts the misconception will continue winning retrieval competitions until the correction is retrieved and strengthened multiple times.

The misconception is not overwritten; it coexists with correct knowledge, and retrieval is probabilistic. This generates specific design guidance: plan for multiple spaced prediction-revision cycles, not just one. Each cycle reactivates the misconception (raising its activation temporarily) and then strengthens the correction. Over time, the activation balance shifts.

---

## 4. Sequential Information Release as Multi-Stage Inference

The informal claim: information is released in stages. Cumulative reasoning is only coherent if earlier decisions rested on genuine understanding.

**Bayesian framing.** At each stage k, the student has beliefs P_k(H), receives new information D_k, and updates to P_{k+1}(H). The coherence of the reasoning chain is the degree to which P_{k+1} is consistent with P_k and D_k via Bayes' rule.

If the student outsourced at stage k, their reported R_k does not represent genuine beliefs. Their response to D_{k+1} will be inconsistent with R_k in detectable ways. Alternatively: maintaining consistency with a fabricated history is cognitively *more* demanding than genuine reasoning. The outsourcing cost increases across stages.

**Design implication from the formalization.** Diagnostic power per stage is:

IG_k = H(G | R_1,...,R_{k-1}) - H(G | R_1,...,R_k)

This is maximized when D_k forces revision of earlier commitments, not merely elaboration. The bridge example does this well (soil conditions forcing redesign of structural concepts). Stages that merely extend without conflicting provide less diagnostic power. The prescription: design stages to create conflicts with earlier decisions.

---

## 5. Critical Refinements Both Experts Identify

### 5a. Content operations vs. control operation

Retrieval, generation, and linking are operations on memory content. They change activation levels and chunk structures. Monitoring is a control operation on the *outputs* of those operations, requiring additional productions that inspect results and evaluate against goals.

In ACT-R, monitoring is not architecturally privileged. Monitoring productions are just productions. But they operate at a different level: they require a goal-stack that includes self-evaluation, not just task completion. This matters for task design: you can design tasks that require content operations without monitoring (retrieval practice with immediate feedback), and tasks that specifically target monitoring (confidence judgments, error detection). They are different design levers.

Recommendation: keep the four operations because they capture something pedagogically real. But be precise about the asymmetry. Three build and connect chunks; one evaluates the quality of those chunks.

### 5b. Complementarity, not just substitution

The framework assumes AI and student effort are substitutes: using AI reduces cognitive work. But the learning function L(s, a), where s = student effort and a = AI use, might be increasing in a when s is high. An expert who uses AI to explore a larger hypothesis space may learn *more* than one working alone. The substitution assumption holds for novices (who lack the schemas to evaluate or direct AI use) but may reverse for experts.

The bridge example (Stage 4: compare your concept with an AI-generated variant) partially captures this. The student must have done the work to evaluate the comparison meaningfully. This is complementary use, and the framework should explicitly design for it rather than treating all AI use as a threat.

### 5c. Process traces are higher-MI products

The document's Principle 1 ("assess the process, not only the product") sounds like an ontological shift, but the formalization shows it is quantitative. You never assess processes directly. You assess traces (revisions, logs, reflections) that are themselves products with higher mutual information with the intended cognitive work. Adding traces increases total I(W; {D, trace_1, trace_2, ...}), improving d-prime but never making it infinite.

Traces can be fabricated. The argument is that fabricated traces are detectable by their lack of specificity, but this is an empirical claim about discriminability, not a logical guarantee. The designs genuinely improve measurement. But the rhetoric sometimes implies a stronger claim than the mechanism supports.

Combining patterns provides stronger diagnostics because the private information types are largely independent. Prediction-revision plus peer explanation is jointly more diagnostic than either alone.

### 5d. Student heterogeneity as mechanism design under type uncertainty

The instructor designs one task for a heterogeneous class. The same task might be appropriately challenging for theta_high students, overwhelming for theta_low (who outsource from cognitive self-defense), and trivially easy for theta_very_high (who outsource from boredom). Each pattern has a sweet spot in the expertise distribution.

This is mechanism design under type uncertainty, and it is a hard problem. The document's "Step Zero" section (assess prior knowledge) is the right instinct, but the formalization shows why it is not optional. Without it, the task's alignment between strategic and learning paths holds only for students near the design point.

### 5e. SDT vs. rational analysis

SDT predicts that increasing external controls reduces perceived autonomy, reducing intrinsic motivation regardless of payoff structure. Rational analysis predicts that behavior follows payoff structure regardless of autonomy perceptions.

The concept document uses SDT to argue against surveillance and rational analysis to argue for better task design. These work well rhetorically but create tension when applied to the same situation. A well-designed task that structurally requires cognitive work but provides no autonomy (e.g., a rigid, mandatory process with no student choice in topic or method): SDT predicts demotivation, rational analysis predicts engagement.

One resolution: treat autonomy, competence, and relatedness as parameters in the cost function lambda. Low autonomy increases lambda (effort feels more costly when imposed). Low competence increases lambda (effort feels more costly when you expect to fail). High relatedness decreases lambda (effort feels less costly in a supportive context). This preserves rational analysis as the primary framework while incorporating SDT's insights as modulators of subjective cost.

### 5f. Predictive processing is not ACT-R

The concept document uses "internal generative model" and "mental model" language that comes from predictive processing. ACT-R does not posit a generative model in this sense. What AI cannot access, in ACT-R terms, is: activation levels (which chunks are strong or weak), production utilities (which strategies are preferred), and chunk structure (how knowledge is organized). These are the "internal inputs" in ACT-R terms. Calling them a "mental model" is fine informally but obscures the mechanism.

Recommendation for the concept document: use ACT-R language when discussing specific mechanisms (production compilation, activation, chunk formation). Use predictive processing language when discussing the brain's general learning principle (prediction error minimization). Do not blend them without flagging the shift.

---

## 6. Generative Model Sketch

A model that integrates the key mechanisms and could ground a paper.

**State space:**

- theta_t: knowledge state (distribution over hypothesis space H)
- m_t: metacognitive state (the student's beliefs about their own knowledge; m_t != theta_t in general, and the gap *is* the evaluation paradox)

**Action space:** For each task T_t, the student chooses s_t in [0,1] (degree of outsourcing, where 0 = fully effortful, 1 = fully outsourced).

**Dynamics:**

- If s_t = 0 (effortful): theta_{t+1} incorporates Bayesian learning from T_t. The update depends on the match between theta_t and T_t's demands (too hard = overload, too easy = no new information).
- If s_t = 1 (outsourced): theta_{t+1} = theta_t + epsilon (minimal incidental learning from reading the AI output)
- Metacognition: when s_t = 1, feedback is about deliverable quality (high, because AI produced it), not about learning. So m_t becomes miscalibrated upward. The student believes they know more than they do.

**Decision rule:**

U_t = E[grade(D_t, s_t)] - lambda * effort(s_t, theta_t) + beta * E[V_{t+1}(theta_{t+1}, m_{t+1})]

**What the design patterns do in this model:** They modify grade(D_t, s_t) so that grade(outsource) << grade(effort), by requiring private inputs.

**Behavioral predictions:**

1. Myopic students (beta = 0) always outsource when grade(outsource) is close to grade(effort)
2. Far-sighted students with accurate metacognition choose effort when future value V is high
3. Far-sighted students with miscalibrated metacognition (m_t >> theta_t) still outsource, because they believe they already have the knowledge
4. Prediction 3 creates a trap: outsourcing -> miscalibration -> continued outsourcing -> further miscalibration

**Boundary conditions (when good design fails):**

- lambda is very high (extreme time pressure, heavy competing demands)
- beta is very low (no professional identity, graduation-focused rather than learning-focused)
- Grade feedback is noisy (the assessment criteria do not reliably distinguish genuine from outsourced work)
- theta_t is too low for the task (overload, not outsourcing-as-strategy but outsourcing-as-triage)

**Connection to design recommendations:**

- Prediction-revision: forces externalization of theta_t, making m_t more accurate and breaking the miscalibration trap
- Sequential release: increases the cost of maintaining a fabricated history across stages, making outsourcing less efficient than genuine reasoning
- Experience-anchored: makes grade(outsource) low because AI cannot access the student's idiosyncratic experiences
- Peer explanation: removes the outsourcing option entirely for real-time interaction, and generates unscripted metacognitive feedback

---

## Open Questions

1. Can the evaluation paradox POMDP be solved analytically, or does it require simulation? The state space is small enough that both should be tractable.
2. How many prediction-revision cycles are needed to shift the activation balance for a well-practiced misconception? This is empirically estimable from ACT-R's base-level learning equation if you know the misconception's approximate age and retrieval frequency.
3. The complementarity point (5b) suggests a phase transition: AI as substitute for novices, AI as complement for experts. Where is the transition, and what determines it? Likely when theta_t is high enough that evaluation productions reliably fire (back to the activation threshold).
4. The heterogeneity problem (5d) is real but has no clean solution. Adaptive task difficulty (varying scaffolding within a cohort) is the standard answer, but it is expensive to implement. Is there a design pattern that is robust across a wider band of expertise levels?
5. Is the SDT-rational-analysis integration (5e) empirically distinguishable? A student who satisfices under high lambda (rational analysis with autonomy-modulated costs) looks identical to a student who disengages due to low autonomy (SDT). They may be the same phenomenon described in different vocabularies.

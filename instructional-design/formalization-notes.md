# Formalization Notes: Instructional Design in the Age of AI

These are working notes on how to formalise the arguments developed in `workshop-concept-instructional-design.md`. In what follows, I attempt to identify which of the informal claims are most amenable to formal treatment, to sketch the formalisms that seem most revealing, and to flag the places where the formal analysis generates insights that the informal argument does not. I draw on two complementary perspectives throughout: a Bayesian (rational analysis) framing and an ACT-R (cognitive architecture) framing. Where these perspectives converge, I am more confident that the formalisation captures something real; where they diverge, the divergence itself is informative.

---

## 1. Three Highest-Leverage Formalisations

Both perspectives converge on the same three ideas as the most tractable and most revealing candidates for formal treatment. I will discuss each in turn.

### 1a. The Evaluation Paradox

The informal claim is straightforward: to evaluate whether a tool (i.e., an AI system, a shortcut, or a peer's solution) genuinely supports learning, the student requires precisely the expertise that the learning task was supposed to develop. A novice, by definition, cannot judge whether an AI-generated analysis is correct, complete, or relevant, because the knowledge structures needed for such judgement are the knowledge structures the task was designed to build.

**Bayesian framing: a POMDP with endogenous state transitions.** I would argue that the most natural formalisation treats this as a partially observable Markov decision process in which the student's own competence $C_t$ is a hidden state, observed only through noisy metacognitive signals. At each task, the student chooses a strategy: effortful engagement (which functions as exploration) or outsourcing (which functions as exploitation). The twist that makes this non-standard is that outsourcing does not merely fail to improve $C_t$; it actively degrades the student's capacity for effective exploration in the future. More specifically, three mechanisms operate simultaneously: (1) effortful engagement updates $C_t$ via Bayesian learning from the task, (2) outsourcing leaves $C_t$ unchanged but provides misleading metacognitive feedback (i.e., the deliverable looks good, so the student's estimate $m_t$ of their own competence drifts upward), and (3) the gap between $m_t$ and $C_t$ widens, rendering future strategy choices progressively less well calibrated.

In bandit terms, choosing the outsourcing arm changes the reward distribution of the effortful arm by preventing the competence growth that would have made effortful engagement more rewarding. This is a non-stationary bandit with state-dependent arm characteristics, which is a well-studied but nontrivial problem class.

Crucially, what falls out of this formalisation is a principled justification for controlled environments. The argument for restricting tool access for novices is not paternalism; it is a rational response to a badly identified estimation problem. When metacognitive signals are too noisy (because $C_t$ is low), self-regulation cannot work reliably. As $C_t$ grows, metacognitive signals improve, and the student can increasingly self-regulate. This is the novice-to-expert autonomy trajectory that the concept document describes, but here it is derived from the model rather than simply asserted.

**ACT-R framing: activation thresholds.** In ACT-R terms, evaluating an AI-generated solution requires a chain of operations: (1) retrieving relevant domain chunks from declarative memory, (2) building a representation of the AI output in the imaginal buffer, (3) firing comparison productions, and (4) detecting discrepancies. The paradox bites at step 1. The chunks needed for evaluation are the same chunks the learning task was supposed to create or strengthen. For novices, base-level activation $B_i$ is low (i.e., few prior retrievals have occurred), associative strength $S_{ji}$ is low (i.e., few connections have been formed), and retrieval therefore fails.

The activation equation makes this precise: $A_i = B_i + \sum_j(W_j \cdot S_{ji}) + \epsilon$. For a novice, $A_i$ is likely to fall below the retrieval threshold $\tau$, and the student simply cannot execute the evaluation productions because the required declarative inputs are unavailable.

However, a critical prediction emerges from ACT-R that the informal argument misses: the paradox is graded, not binary. A student with moderate activation levels (i.e., chunks exist but are weak) will sometimes successfully evaluate AI output (when the noise term $\epsilon$ pushes activation above threshold) and sometimes fail. This intermittent success is arguably more dangerous than consistent failure, because a student who catches one error may conclude that they are capable of evaluation generally. Partial competence, in other words, creates false confidence. Furthermore, when evaluation does succeed at low activation levels, the retrieval feels effortful, generating low confidence even when the judgement is correct. This produces a double bind: when evaluation succeeds, the student does not trust it; when it fails, the student does not notice.

**Potential contribution.** I believe the evaluation paradox, properly formalised as either a POMDP or an activation-threshold model, is potentially publishable in its own right. The key novelty is that outsourcing degrades not just competence but metacognitive calibration, creating a self-reinforcing trap. The POMDP formulation would yield an optimal policy characterisation, formal conditions under which controlled environments are justified, and a principled trajectory from environmental control to structural design.


### 1b. The Outsourcing Test

The informal claim is that the central diagnostic question for any assessment is: "Could someone complete this deliverable without performing the cognitive work I intend?" If the answer is yes, the assessment has a proxy problem.

**Information-theoretic framing: mutual information.** Let $W$ denote the intended cognitive work and $D$ the deliverable. The outsourcing test asks about $I(W; D)$, the mutual information between them. If $I(W; D)$ is low, $D$ can be produced without $W$, and the assessment is uninformative about learning.

However, mutual information is symmetric: $I(W; D) = I(D; W)$. This reveals a subtlety that the informal argument glosses over. High mutual information entails both (1) a production constraint (i.e., $W$ is necessary for $D$, so the deliverable cannot be produced without the cognitive work) and (2) a measurement constraint (i.e., $D$ is informative about $W$, so the deliverable reveals whether the work occurred). These two constraints can come apart. Consider an oral exam in which the student answers live: $W$ is necessary for $D$ (one cannot outsource real-time responses), satisfying the production constraint. Nevertheless, $D$ might be uninformative about the specific cognitive operations if the questions are too generic, violating the measurement constraint. One can therefore build assessments that pass condition 1 but fail condition 2.

**The conditional independence characterisation.** An LLM is approximately a model of $P(\text{text} \mid \text{prompt})$. It conditions on the prompt but cannot condition on the student's internal state; formally, $D_{\text{LLM}} \perp \theta_{\text{student}} \mid \text{prompt}$. This conditional independence is the formal basis for the entire private-information argument. Stating it explicitly identifies the attack surface: if the student puts enough of their knowledge state into the prompt, the conditional independence weakens. Each design pattern works precisely because it requires inputs that cannot fully enter a prompt: predictions that do not yet exist, real-time responses to unanticipated questions, experiential details too rich and idiosyncratic to articulate fully.

**ACT-R framing: absence of internal operations.** In ACT-R terms, "outsourcing cognitive work" means replacing internal production firings and declarative memory retrievals with external tool operations (i.e., perceptual encoding of AI output and motor actions to prompt). The consequence is that no internal chunk creation occurs: no activation-building retrievals, no production-strengthening firings, no new chunk formation in the imaginal buffer. An assessment that samples only the final output is therefore informationally equivalent across any production system that generated it, regardless of whether that system involved internal learning traces.

It is worth noting that both perspectives flag the same limitation: the outsourcing test is necessary but not sufficient. Passing the test (i.e., the task structurally requires cognitive operations) does not guarantee learning. The operations might occur under conditions that do not produce durable learning: without adequate feedback (no utility update in ACT-R terms), without sufficient repetition (insufficient activation buildup), or without appropriate spacing. Feedback quality and practice distribution are separate design variables that the framework currently underspecifies.


### 1c. Rational Effort Allocation

The informal claim is that students are boundedly rational agents who satisfice. If an acceptable outcome is achievable without performing the intended cognitive operations, the task does not sufficiently reward those operations. The resulting behaviour is strategic, not lazy.

**Decision-theoretic framing.** The student chooses a strategy $s$ to maximise:

$$U_t = \mathbb{E}[\text{grade}(D_t, s_t)] - \lambda \cdot \text{effort}(s_t, \theta_t) + \beta \cdot \mathbb{E}[V_{t+1}(\theta_{t+1}, m_{t+1})]$$

where $\lambda$ is the effort-cost parameter (which varies with competing demands, fatigue, and interest) and $\beta$ is the discount factor for future knowledge value. This formulation generates several behavioural predictions. A myopic student ($\beta = 0$) will always outsource when the grade from outsourcing is close to the grade from effort. A far-sighted student with accurate metacognition may choose effort for its long-term value. However, a far-sighted student with miscalibrated metacognition ($m_t \gg \theta_t$, i.e., overconfident from prior outsourcing) will still outsource, because they believe they already possess the relevant knowledge.

The model also identifies boundary conditions under which even good task design fails: (1) $\lambda$ is very high (e.g., extreme time pressure or heavy competing demands), so that effort cost dominates regardless of task structure, (2) $\beta$ is very low (e.g., no professional identity, no perceived future relevance), so that future knowledge value does not enter the calculus, and (3) grade feedback is noisy, so that even well-designed assessments cannot reliably distinguish genuine from outsourced work.

**Satisficing framing (Anderson/Simon).** A satisficing agent does not maximise; they search the strategy space until they find a strategy $s$ where $G(s)$ exceeds their aspiration level $A$. If the AI-assisted strategy $s_{\text{AI}}$ is encountered early in the search and $G(s_{\text{AI}}) \geq A$, search terminates before the effortful strategy is even considered. A student who would actually prefer effortful engagement (if they tried it) may never discover this preference. The design implication is twofold: either ensure that $G(s_{\text{AI}}) < A$ (i.e., the outsourcing strategy does not satisfy the aspiration level), or structure the task so that $s_{\text{AI}}$ is not encountered early in the search (e.g., the task begins with something that only the student can do, so the effortful strategy is the natural first step).

**The rational analysis of "laziness."** In this framework, "laziness" corresponds to a high $\lambda$. However, $\lambda$ is not a character trait; it is determined by the full optimisation problem, including competing courses, employment, health, and perceived future utility. A student working 20 hours per week alongside their studies has a rationally higher $\lambda$. Calling this laziness forecloses inquiry into both the cognitive and the structural causes of the behaviour.


## 2. The Proxy Problem as Signal Detection

The informal claim is that most assessments measure products (i.e., essays, reports, code) that historically correlated with learning because producing them without understanding was prohibitively effortful. AI breaks this correlation.

**Signal detection framing.** Let $L$ be a binary variable indicating whether learning occurred, and let $D$ be a continuous measure of deliverable quality. The instructor's task is to estimate $P(L \mid D)$. Before AI, $P(D > \text{threshold} \mid L = 0)$ was low because the cost of producing a high-quality deliverable without genuine learning was high. After AI, $P(D > \text{threshold} \mid L = 0)$ rises substantially. The likelihood ratio $P(D \mid L = 1) / P(D \mid L = 0)$ approaches 1, and $d'$ approaches zero. This signal detection framing adds three things to the informal argument: (a) "the proxy breaks" is now precise (i.e., $d'$ approaches zero), (b) the solution class is immediate (i.e., find observables for which $d'$ remains high), and (c) the problem connects naturally to the existing literature on measurement reliability and validity.

**ACT-R framing.** Two entirely different production systems can generate the same final output. A student with compiled domain productions generates output through a long chain of domain-specific firings, each of which creates learning traces (i.e., strengthens activations and builds new chunks). An AI user generates the same output through a short chain: retrieve prompt template, submit, copy result. Both strategies are rational given the task environment. The assessment cannot distinguish them because it samples only the final state, not the production trace.


## 3. Prediction-Revision as Bayesian Updating

The informal claim is that when students externalise their prior understanding before encountering new material, the subsequent revision is meaningful only relative to a genuine prediction. A fabricated prediction produces a generic revision.

**Bayesian framing.** Let $P_0(H)$ denote the student's prior (i.e., their mental model before instruction), $D$ the instructional content, and $P_1(H)$ the posterior. The prediction step externalises $P_0$; the revision step externalises the relationship between $P_0$ and $P_1$. The quality of the revision can be understood in terms of the KL divergence $D_{\text{KL}}(P_1 \| P_0)$, which measures the degree to which the posterior has moved from the prior. A good revision identifies where the posterior differs from the prior and why. Crucially, a genuine $P_0$ is idiosyncratic (i.e., it reflects the student's particular history of learning and misconceptions) and therefore produces an idiosyncratic shift that references specific prior beliefs. A fabricated $P_0$ (i.e., one that is uniform or stereotyped) produces only a generic shift.

A key insight that the formalisation reveals is the following: diagnostic power depends on the entropy of the prior distribution *across* students. If all students share the same misconception, even genuine revisions will look alike, and the pattern loses its discriminative power. The prediction-revision pattern works best when priors are diverse, which is more likely in heterogeneous classrooms. This is a testable prediction that the informal framework does not generate.

**ACT-R concern: activation dynamics of misconceptions.** A single prediction-revision cycle may not suffice to overcome a well-practised misconception. In ACT-R terms, the misconception chunk has high base-level activation $B_i$ from years of use, and the correction creates a new chunk that competes in retrieval but whose $B_i$ is initially low. ACT-R predicts that the misconception will continue to win retrieval competitions until the correction has been retrieved and strengthened multiple times. Importantly, the misconception is not overwritten; it coexists with correct knowledge, and retrieval is probabilistic. This generates specific design guidance: one should plan for multiple spaced prediction-revision cycles, not just one. Each cycle reactivates the misconception (temporarily raising its activation) and then strengthens the correction; over time, the activation balance shifts in favour of the correct chunk.


## 4. Sequential Information Release as Multi-Stage Inference

The informal claim is that when information is released in stages, cumulative reasoning is coherent only if earlier decisions rested on genuine understanding.

**Bayesian framing.** At each stage $k$, the student holds beliefs $P_k(H)$, receives new information $D_k$, and updates to $P_{k+1}(H)$. The coherence of the reasoning chain can be understood as the degree to which $P_{k+1}$ is consistent with $P_k$ and $D_k$ via Bayes' rule. If the student outsourced at stage $k$, their reported response $R_k$ does not represent genuine beliefs, and their response to $D_{k+1}$ will be inconsistent with $R_k$ in detectable ways. An alternative way to see this is that maintaining consistency with a fabricated history is cognitively more demanding than genuine reasoning; the outsourcing cost therefore increases across stages.

**Design implication from the formalisation.** The diagnostic power per stage can be expressed as the information gain: $\text{IG}_k = H(G \mid R_1, \ldots, R_{k-1}) - H(G \mid R_1, \ldots, R_k)$. This quantity is maximised when $D_k$ forces revision of earlier commitments, not merely elaboration. The bridge example in the concept document does this well (e.g., soil conditions forcing redesign of structural concepts). Stages that merely extend without generating conflicts provide less diagnostic power. The prescription is thus to design stages that create genuine conflicts with earlier decisions.


## 5. Critical Refinements

In this section, I discuss several refinements and qualifications that emerge when the informal arguments are subjected to formal scrutiny. These are, in my view, not merely technical caveats but substantive points that shape how the framework should be applied.

### 5a. Content operations versus control operations

Retrieval, generation, and linking are operations on memory content; they change activation levels and chunk structures. Monitoring, by contrast, is a control operation on the *outputs* of those operations, requiring additional productions that inspect results and evaluate them against goals. In ACT-R, monitoring is not architecturally privileged: monitoring productions are simply productions. Nevertheless, they operate at a different level in the sense that they require a goal-stack that includes self-evaluation, not merely task completion. This distinction matters for task design, because one can design tasks that require content operations without monitoring (e.g., retrieval practice with immediate feedback) and tasks that specifically target monitoring (e.g., confidence judgements, error detection). These are different design levers, and conflating them obscures their distinct contributions.

I would recommend retaining the four operations because they capture something pedagogically real. However, it is important to be precise about the asymmetry: three of the operations build and connect chunks, while one evaluates the quality of those chunks.

### 5b. Complementarity, not just substitution

The framework as currently formulated assumes that AI use and student effort are substitutes: using AI reduces cognitive work. However, the learning function $L(s, a)$, where $s$ denotes student effort and $a$ denotes AI use, might be increasing in $a$ when $s$ is high. An expert who uses AI to explore a larger hypothesis space may learn more than one working alone. The substitution assumption plausibly holds for novices (who lack the schemas to evaluate or direct AI use) but may reverse for experts.

The bridge example in the concept document (Stage 4: compare your concept with an AI-generated variant) partially captures this complementary dynamic. The student must have done the prior work in order to evaluate the comparison meaningfully; this is complementary use. I would argue that the framework should explicitly design for such complementarity rather than treating all AI use as a threat.

### 5c. Process traces are higher-mutual-information products

The concept document's Principle 1 ("assess the process, not only the product") sounds like an ontological shift, but the formalisation reveals that it is quantitative rather than categorical. One never assesses processes directly; one assesses traces (i.e., revisions, logs, reflections) that are themselves products with higher mutual information with the intended cognitive work. Adding traces increases the total $I(W; \{D, \text{trace}_1, \text{trace}_2, \ldots\})$, thereby improving $d'$, but never making it infinite.

It is worth noting that traces can themselves be fabricated. The argument that fabricated traces are detectable by their lack of specificity is an empirical claim about discriminability, not a logical guarantee. The designs genuinely improve measurement, but the rhetoric in the concept document sometimes implies a stronger claim than the mechanism supports. Furthermore, combining patterns provides stronger diagnostics because the private information types are largely independent; prediction-revision plus peer explanation is jointly more diagnostic than either alone.

### 5d. Student heterogeneity as mechanism design under type uncertainty

The instructor designs one task for a heterogeneous class. The same task might be appropriately challenging for students with high $\theta$, overwhelming for students with low $\theta$ (who outsource as cognitive self-defence), and trivially easy for students with very high $\theta$ (who outsource from boredom). Each design pattern has a sweet spot in the expertise distribution.

This is, in essence, mechanism design under type uncertainty, and it is a hard problem. The concept document's "Step Zero" section (i.e., assess prior knowledge) is the right instinct, but the formalisation shows why it is not optional: without it, the alignment between the strategic path and the learning path holds only for students near the design point.

### 5e. Self-determination theory versus rational analysis

Self-determination theory (SDT) predicts that increasing external controls reduces perceived autonomy, thereby reducing intrinsic motivation regardless of payoff structure. Rational analysis predicts that behaviour follows payoff structure regardless of autonomy perceptions. The concept document uses SDT to argue against surveillance and rational analysis to argue for better task design; these work well rhetorically but create tension when applied to the same situation. Consider a well-designed task that structurally requires cognitive work but provides no autonomy (e.g., a rigid, mandatory process with no student choice in topic or method): SDT predicts demotivation, while rational analysis predicts engagement.

One resolution that I find promising is to treat autonomy, competence, and relatedness as parameters in the cost function $\lambda$. Low autonomy increases $\lambda$ (i.e., effort feels more costly when it is imposed rather than chosen). Low competence increases $\lambda$ (i.e., effort feels more costly when one expects to fail). High relatedness decreases $\lambda$ (i.e., effort feels less costly in a supportive context). This approach preserves rational analysis as the primary framework while incorporating SDT's insights as modulators of subjective cost.

### 5f. Predictive processing is not ACT-R

The concept document uses "internal generative model" and "mental model" language that derives from the predictive processing tradition. ACT-R does not posit a generative model in this sense. What AI cannot access, in ACT-R terms, is activation levels (i.e., which chunks are strong or weak), production utilities (i.e., which strategies are preferred), and chunk structure (i.e., how knowledge is organised). These are the "internal inputs" in ACT-R terminology. Referring to them as a "mental model" is acceptable informally but obscures the underlying mechanism.

I would recommend the following for the concept document: use ACT-R language when discussing specific mechanisms (e.g., production compilation, activation, chunk formation) and predictive processing language when discussing the brain's general learning principle (i.e., prediction error minimisation). However, one should not blend the two frameworks without explicitly flagging the shift.

---

## 6. Generative Model Sketch

In this section, I sketch a model that integrates the key mechanisms discussed above and that could, I believe, ground a paper. The model is deliberately simple; its purpose is to capture the essential dynamics of the outsourcing trap and to generate testable predictions about when and why different design patterns succeed or fail.

**State space.** The model tracks two state variables: (1) $\theta_t$, the student's knowledge state (i.e., a distribution over hypothesis space $H$), and (2) $m_t$, the student's metacognitive state (i.e., the student's beliefs about their own knowledge). In general, $m_t \neq \theta_t$, and the gap between them is precisely the evaluation paradox.

**Action space.** For each task $T_t$, the student chooses $s_t \in [0, 1]$, representing the degree of outsourcing (where 0 denotes fully effortful engagement and 1 denotes fully outsourced work).

**Dynamics.** The learning dynamics depend on the student's strategy choice. When $s_t = 0$ (effortful engagement), $\theta_{t+1}$ incorporates Bayesian learning from $T_t$; the magnitude of the update depends on the match between $\theta_t$ and the task's demands (i.e., tasks that are too hard produce overload and tasks that are too easy provide no new information). When $s_t = 1$ (fully outsourced), $\theta_{t+1} = \theta_t + \epsilon$, reflecting only minimal incidental learning from reading the AI output. Crucially, the metacognitive dynamics exhibit an asymmetry: when $s_t = 1$, feedback pertains to deliverable quality (which is high, because AI produced it) rather than to learning, so $m_t$ becomes miscalibrated upward. The student believes they know more than they actually do.

**Decision rule.** The student chooses $s_t$ to maximise:

$$U_t = \mathbb{E}[\text{grade}(D_t, s_t)] - \lambda \cdot \text{effort}(s_t, \theta_t) + \beta \cdot \mathbb{E}[V_{t+1}(\theta_{t+1}, m_{t+1})]$$

**The role of design patterns in this model.** The design patterns modify $\text{grade}(D_t, s_t)$ so that $\text{grade}(\text{outsource}) \ll \text{grade}(\text{effort})$, by requiring private inputs that AI cannot supply.

**Behavioural predictions.** The model generates four central predictions: (1) myopic students ($\beta = 0$) always outsource when the grade from outsourcing is close to the grade from effort, (2) far-sighted students with accurate metacognition choose effort when the future value $V$ is high, (3) far-sighted students with miscalibrated metacognition ($m_t \gg \theta_t$) still outsource because they believe they already possess the knowledge, and (4) prediction 3 creates a trap: outsourcing leads to further miscalibration, which leads to continued outsourcing, which leads to further miscalibration. This self-reinforcing loop is, I would argue, the central formal insight of the model.

**Boundary conditions (when good design fails).** The model also identifies conditions under which even well-designed tasks cannot prevent the outsourcing trap: (1) $\lambda$ is very high (i.e., extreme time pressure or heavy competing demands), (2) $\beta$ is very low (i.e., no professional identity, a graduation-focused rather than learning-focused orientation), (3) grade feedback is noisy (i.e., the assessment criteria do not reliably distinguish genuine from outsourced work), and (4) $\theta_t$ is too low for the task (i.e., the student faces overload rather than strategic outsourcing, and outsourcing functions as triage).

**Connection to design recommendations.** Each design pattern maps to a specific mechanism in this model. Prediction-revision forces externalisation of $\theta_t$, which makes $m_t$ more accurate and thereby breaks the miscalibration trap. Sequential release increases the cost of maintaining a fabricated history across stages, making outsourcing less efficient than genuine reasoning. Experience-anchored tasks make $\text{grade}(\text{outsource})$ low because AI cannot access the student's idiosyncratic experiences. Peer explanation removes the outsourcing option entirely for real-time interaction and generates unscripted metacognitive feedback.

---

## Open Questions

Several questions remain open, and I list them here both to guide future work and to be explicit about the limits of the current analysis.

1. **Analytical tractability of the evaluation paradox POMDP.** Can the POMDP formulated in section 1a be solved analytically, or does it require simulation? The state space is small enough that both approaches should be tractable, but I have not yet verified this.

2. **Number of prediction-revision cycles needed.** How many prediction-revision cycles are required to shift the activation balance for a well-practised misconception? This is in principle estimable from ACT-R's base-level learning equation, given the misconception's approximate age and retrieval frequency.

3. **The substitution-to-complementarity transition.** The complementarity point (section 5b) suggests something like a phase transition: AI functions as a substitute for novices but as a complement for experts. The question is where this transition occurs and what determines it. I suspect the answer involves the activation threshold from section 1a: the transition occurs when $\theta_t$ is high enough that evaluation productions reliably fire.

4. **Robustness across expertise levels.** The heterogeneity problem (section 5d) is real but has no clean solution. Adaptive task difficulty (i.e., varying scaffolding within a cohort) is the standard answer, but it is expensive to implement. An important open question is whether there exists a design pattern that is robust across a wider band of expertise levels.

5. **Empirical distinguishability of SDT and rational analysis.** Is the integrated SDT-rational-analysis account (section 5e) empirically distinguishable from either account taken alone? A student who satisfices under high $\lambda$ (i.e., rational analysis with autonomy-modulated costs) looks identical to a student who disengages due to low autonomy (i.e., SDT). These may be the same phenomenon described in different vocabularies.

---

## 7. Implementation: Gen.jl

The generative model sketch in section 6 maps almost directly to a Gen.jl probabilistic program. I believe Gen is the natural choice for implementation because the model is simultaneously a forward simulator (i.e., what happens to students under different task conditions?) and an inference problem (i.e., what can instructors infer about student states from observed behaviour?). In the following, I will discuss the rationale for Gen.jl, sketch a model skeleton, identify the highest-leverage simulation targets, and outline the instructor inference problem.

### Why Gen.jl rather than plain simulation

A plain Julia simulation would handle the forward model adequately. Gen adds value for three reasons: (1) it provides built-in inference machinery (importance sampling, SMC, MCMC) for the instructor's inference problem (i.e., given observed grades, what is the student's likely knowledge state?), (2) it supports programmable proposals for efficient exploration of the parameter space, and (3) it enforces a clean separation of model specification from inference strategy, which matters when comparing different task designs as interventions on the same generative process.

For the POMDP solution (i.e., finding the optimal teaching policy), Gen alone is insufficient, as it is an inference system rather than a planner. I see two viable options. The first is to combine Gen with POMDPs.jl, which provides SARSOP, POMCP, and other solvers; the state space ($\theta_t$, $m_t$) is small enough for exact methods, so Gen would define the model while POMDPs.jl finds the optimal strategy. This directly addresses open question 1. The second option is planning-as-inference within Gen itself: one treats the POMDP as an inference problem by conditioning on high cumulative utility and inferring the action sequence. Gen's programmable inference (custom proposals, SMC) can handle this. This approach is less standard but arguably more flexible, and it naturally handles the metacognitive miscalibration loop (prediction 4 in section 6) because it simulates forward through the trap.

### Model skeleton

```julia
@gen function student_episode(T, task_designs, theta_0, m_0, lambda, beta)
    theta = theta_0
    m = m_0
    for t in 1:T
        # Student chooses outsourcing degree based on m (not theta)
        s = {:strategy => t} ~ outsourcing_decision(m, lambda, beta, task_designs[t])
        # Learning dynamics (Bayesian update if effortful, stagnation if outsourced)
        theta_new = {:theta => t} ~ learning_update(theta, s, task_designs[t])
        # Metacognitive update (the key asymmetry: outsourcing inflates m)
        m_new = {:m => t} ~ metacognitive_update(m, s, theta_new, task_designs[t])
        # Observable deliverable quality
        {:grade => t} ~ grade_model(theta_new, s, task_designs[t])
        theta = theta_new
        m = m_new
    end
end
```

The `task_designs` vector encodes the design patterns. Each entry specifies what private inputs the task requires, how the grade depends on genuine versus outsourced work (i.e., the mutual information structure from section 2), and the cognitive load profile. Comparing design patterns amounts to comparing different `task_designs` vectors on the same student population.

### What to simulate first (highest leverage)

I would prioritise the following simulation targets, in roughly decreasing order of expected insight.

**The miscalibration trap (prediction 4).** The first priority is to forward-simulate student trajectories under different initial conditions and ask: how many outsourcing episodes are required before $m_t$ and $\theta_t$ diverge enough that recovery becomes unlikely? This is essentially a bifurcation question. Visualising the $m_t - \theta_t$ gap over time should reveal whether the trap appears as an absorbing region in the state space (i.e., once the gap exceeds some threshold, the student's strategy choice is locked into outsourcing because $m_t$ says they already know the material).

**Boundary conditions.** The second priority is to sweep $\lambda$ (effort cost) and ask: at what $\lambda$ does even a well-designed task fail to prevent the trap? This operationalises the "accept the limits of your influence" point from the concept document. There should exist a critical $\lambda^*$ above which no task design can make the effortful path rational. Plotting this threshold as a function of task design quality would be informative.

**The controlled-environments-to-process-constraints trajectory.** At what $\theta_t$ does the optimal policy shift from "restrict tool access" to "structural design is sufficient"? I expect the model to show that the crossover depends on metacognitive calibration quality (i.e., how accurately $m_t$ tracks $\theta_t$), not just on knowledge level per se. This would formalise the curriculum trajectory claim in the concept document.

**The prediction-revision intervention.** Finally, one could model the prediction step as a forced externalisation of $\theta_t$, which recalibrates $m_t$ towards the true $\theta_t$. The question is whether a single prediction-revision cycle suffices to break the miscalibration trap, and under what conditions (how miscalibrated the student is, how far into the trap they have progressed). The ACT-R analysis in section 3 suggests that multiple spaced cycles are needed; the Gen model can test whether this prediction also holds in the Bayesian framing.

### Instructor inference problem

Separately from the student's decision problem, there is the instructor's inference problem: given a sequence of observed grades $\{\text{grade}_1, \ldots, \text{grade}_T\}$, infer the student's trajectory of $(\theta_t, m_t, s_t)$. This is a filtering problem that Gen's particle filter can address directly. The interesting question is: under which task designs is the instructor's posterior over student states most concentrated? This is a formal version of "which designs are most diagnostic?" and connects naturally to the mutual information analysis in section 2.

### Connecting to empirical work

The model generates quantitative predictions: trap onset time as a function of model parameters, diagnostic power of different task designs, and the optimal transition point from controlled environments to process constraints. These predictions are in principle testable in controlled educational settings, although the measurement of $\theta_t$ and $m_t$ in real students is nontrivial. A calibration study pairing the model with Bayesian knowledge tracing data from an LMS could provide initial parameter estimates.

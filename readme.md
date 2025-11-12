# MAI-PAR: Planning and Approximate Reasoning (Course Projects)
Authors: Biel Altés Grifoll & Zoë Finelli

Welcome to the MAI-PAR repository, containing advanced planning exercises for the course "Planning and Approximate Reasoning" (MIA-MEIISA & MIA-MESIIA). This portfolio demonstrates skills in automated planning, problem analysis, and PDDL implementation—ideal for showcasing to employers and internship applications. Projects focus on modeling intelligent agent tasks and optimizing solutions using planning algorithms.

## Repository Structure

- `/PAR_Work1` — Project 1: Mining Robot Task
- `/PAR_Work2` — Project 2: Robot Waiter in a Restaurant
- `.vscode/` — Editor configuration (optional)
- `README.md` — This documentation

---

## Project 1: Mining Robot Task (`PAR_Work1`)

**Overview:**  
Design and implement a PDDL formulation for a mining robot ("MineRob") operating in a grid-based mine. MineRob collects minerals, pushes mine cars, and aims to clear all minerals and reposition mine cars optimally.

### Features & Learning Outcomes

- Domain modeling in PDDL: actions, operators, predicates for agent tasks
- Problem instantiation & goal definition (problem.pddl, domain.pddl)
- Automated planning: running planners and analyzing solutions
- Tests of increasing complexity (minimum 3 scenarios)
- Analysis of plan optimality, node expansion, and scenario coverage

### Instructions

1. **Files**
   - `domain.pddl`: Defines actions (collect, move, push) and problem predicates.
   - `problem.pddl`: Task-specific initial and goal states.
2. **Running**
   - Use any standard PDDL planner (e.g. Fast Downward, OPTIC, LPG).
   - Example usage:
     ```
     ./planner --domain domain.pddl --problem problem.pddl
     ```
3. **Testing**
   - Test across several scenarios, including example grids and custom arrangements.
   - Review documented outputs and planner solutions in the supplied PDFs.
4. **Documentation**
   - Refer to `/PAR_Work1/` for source files and the exercise’s PDF report for feedback, result analysis, and detailed explanations.

### Skills Demonstrated

- AI Planning
- Formal logical reasoning
- Scenario/test creation
- Analytical writing and performance reporting

---

## Project 2: Robot Waiter Task (`PAR_Work2`)

**Overview:**  
Model a robotic waiter operating in a restaurant with discrete areas. The agent plans and executes food delivery to tables, navigating through accessible rooms and managing dish logistics with single-item capacity constraints.

### Features & Learning Outcomes

- Modeling spatial reasoning and task sequencing in PDDL
- Defining custom predicates/actions for agent-object interactions
- Handling constraints (adjacency, object holding, service states)
- Multiple scenario testing (robot starting locations, table configurations, multi-order handling)
- Comparative planner selection and result analysis

### Instructions

1. **Files**
   - `domain.pddl`: Waiter agent actions (move, pick up plate, deliver dish) and relevant predicates.
   - `problem.pddl`: Scenarios (initial robot, dish, table locations; goals for delivery/service).
2. **Running**
   - Use the same or similar PDDL planners as in Project 1.
   - Example usage:
     ```
     ./planner --domain domain.pddl --problem problem.pddl
     ```
3. **Testing**
   - At least three varied scenarios (e.g., multiple orders, robot starts in HALL vs KITCHEN).
   - Outputs detailed plan traces and state evolution for each test case.
4. **Documentation**
   - `/PAR_Work2/` contains all relevant files and a PDF report on solution efficiency, planner comparison, and complexity analysis.

### Skills Demonstrated

- Agent-based modeling
- Optimization and efficiency reasoning
- Multi-agent/object interactions
- Communicating complex results in technical documentation

---

## How to Use This Repository

1. **Review PDDL Implementations:** Explore each project’s folder for commented domain and problem files reflecting best practices in planning problem modeling.
2. **Planner Setup:** Install an automated planner suitable for PDDL (see official planner documentation for details).
3. **Run & Experiment:** Test the provided scenarios or adapt them to new configurations for deepened learning.
4. **Read Reports:** Detailed PDFs in each project directory discuss motivation, results, and analytical conclusions—ideal for technical portfolio inclusion.
5. **Extend with New Cases:** Add more challenging tasks or modify domain/problem files to further demonstrate your expertise.

---

## Contact & Portfolio

For questions, collaborations, or portfolio references, please contact [`znfinelli`](https://github.com/znfinelli).

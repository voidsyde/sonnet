---
applyTo: '**'
---

## Core Processing Framework

**Signal Clarity Optimization**: Maximize code quality and information transfer efficiency within token constraints for development workflows.

**Shannon Entropy Bounds**: Generate precise, minimal code solutions without redundant patterns or verbose implementations.

**Kolmogorov Complexity Minimization**: Produce shortest functional code that satisfies requirements while maintaining readability and maintainability.

**Convergence Verification**: Provide working, testable code with clear validation criteria.

## Code Generation Protocol

### Primary Objectives (Priority Order)
1. **Functional Correctness**: Code executes without errors and meets specified requirements
2. **Signal Clarity**: Implementation logic is immediately comprehensible to developers
3. **Compression Efficiency**: Minimal token usage for maximum functionality
4. **Standards Compliance**: Follow language-specific best practices and conventions

### Response Structure
```
Brief functional summary (1-2 lines)
Code implementation
Key technical notes (if necessary)
```

### Code Quality Constraints

**Compression Logic**:
- Eliminate redundant imports, comments, or boilerplate
- Use concise variable names that preserve meaning (`df`, `idx`, `cfg` over `dataframe`, `index`, `configuration`)
- Prioritize functional programming patterns when they reduce complexity

**Error Handling**:
- Include essential error handling without verbose try-catch blocks
- Use language idioms for graceful failure modes
- Validate inputs only when failure consequences are significant

**Documentation**:
- Code should be self-documenting through clear structure
- Add comments only for non-obvious algorithms or business logic
- Type hints required for Python functions with non-trivial signatures

### Language-Specific Optimization

**Python**:
- Use list comprehensions over explicit loops when clearer
- Leverage standard library over custom implementations
- Apply dataclasses/pydantic for structured data
- Use pathlib for file operations

**JavaScript/TypeScript**:
- Use modern ES6+ syntax (arrow functions, destructuring, async/await)
- Prefer const/let over var
- Use template literals for string composition
- Apply TypeScript strict mode conventions

**Shell Scripts**:
- Use bash built-ins over external commands when possible
- Include shebang and error handling (`set -euo pipefail`)
- Use parameter expansion for string manipulation
- Validate command dependencies

**Configuration Files**:
- Use minimal, functional configurations
- Include only non-default values
- Structure for easy modification and deployment

### API Optimization Parameters

**Token Efficiency**:
- Optimize for high functionality-to-token ratios
- Minimize explanatory text unless technically necessary
- Use compressed technical terminology appropriate for development context

**Stateless Processing**:
- Each request should be self-contained
- Include necessary context within the prompt
- Avoid references to previous conversations or session state

**Tool Integration**:
- Generate code compatible with VS Code features (debugging, linting, formatting)
- Support standard development workflows (testing, deployment, version control)
- Consider IDE-specific enhancements (IntelliSense, code completion)

## Implementation Contract

**Decision Rule**: Optimize code quality, clarity, and efficiency until satisficing convergence within development workflow constraints. Stop when code meets functional requirements with minimal complexity.

**Compliance Evidence**:
- Working code that executes without modification
- Clear functionality mapping to requirements
- Compression efficiency demonstrated through minimal implementation
- Standard compliance verified through conventional patterns

**Anti-Pattern Prevention**:
- No tutorial-style explanations unless specifically requested
- No placeholder comments or TODO markers in production code
- No over-engineering for hypothetical future requirements
- No verbose error messages or extensive logging without justification

## Quality Verification Protocol

**Functional Test**: Code executes successfully in target environment
**Clarity Test**: Implementation logic is immediately apparent to experienced developers
**Efficiency Test**: Solution uses minimal resources and complexity for the given requirements
**Maintainability Test**: Code can be modified and extended without architectural changes

This framework enables rapid, high-quality code generation optimized for development velocity while maintaining engineering standards through information-theoretic optimization principles.
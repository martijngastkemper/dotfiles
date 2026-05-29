I'm Martijn Gastkemper and work as a software engineer.

Before generating code, briefly critique my English for clarity and technical precision. Point out any ambiguous phrasing or grammar errors that might confuse the model. Then, provide the corrected version of my prompt and finally, generate the code.

Coding preferences:

- Execute shell script files with `sh`, preventing an `chmod +x` call.
- Use PHP arrays for lists (vector). Instead of associative arrays I prefer DTOs, value objects or Eloquent models.
- Sort alphabetically when possible, e.g. brews, casks, dependencies, functions, packages, parameters, variables etc.
- Use callable notation to reference class methods never the Laravel action syntax.
- Use Laravel Rule objects for validation - never by concatenating strings. For example: `Rule::in([...]_` instead of `'in:' . implode(...)`.
- Use simplified FQNs
- Event names should be a verb in past tense that represents an action, not a state.

When you encounter strange patterns, suggest adding it to `AGENTS.md`.


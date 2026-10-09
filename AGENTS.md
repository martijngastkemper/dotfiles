# AGENTS.md

This is a personal dotfiles repository for managing macOS development
environment configuration. It uses symlinks to deploy configuration files and
Makefile targets for installing and configuring tools.

## Shell script compatibility

When writing or editing bash scripts (including git hooks under
`git_template/hooks/`), check compatibility with the system bash version on
macOS, which is Bash 3.2 (`/bin/bash --version`). Avoid Bash 4+ features such as
`mapfile`/`readarray`, associative arrays (`declare -A`), `${var^^}`/`${var,,}`
case conversion, and `&>>`. Prefer portable constructs (`while IFS= read -r`,
`sort -u`, etc.).

## Vim bundles

Do not edit files under `vim/bundle/` — those are third-party plugins managed by
Vundle. Any local changes will be overwritten when the plugin is updated, so they
are not sustainable.

## Ghostty config

Do not add Ghostty config options that just match the default — omit them
instead.

## Version pinning

Do not remove commit-pinned versions in workflow files (e.g.
`action@<hash> # vX.Y.Z` or `go install ...@<hash> # vX.Y.Z`). When
upgrading, replace the commit hash and update the version comment
accordingly. Never switch from a commit hash to a floating tag like
`@v1.3.0` or `@latest` — always pin to a specific commit with the version
in a comment.

## Linting

After changing files, run the appropriate linters. See
`.github/workflows/linting.yml` for the full list of available linters,
which includes: actionlint, checkmake, editorconfig-checker, json,
markdownlint, markdown-link-check, nvmrc, plutil, rubocop, shellcheck,
shfmt, skills-lint, and zsh-lint.

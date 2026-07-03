# AGENTS.md

This is a personal dotfiles repository for managing macOS development environment configuration. It uses symlinks to deploy configuration files and Makefile targets for installing and configuring tools.

## Shell script compatibility

When writing or editing bash scripts (including git hooks under `git_template/hooks/`), check compatibility with the system bash version on macOS, which is Bash 3.2 (`/bin/bash --version`). Avoid Bash 4+ features such as `mapfile`/`readarray`, associative arrays (`declare -A`), `${var^^}`/`${var,,}` case conversion, and `&>>`. Prefer portable constructs (`while IFS= read -r`, `sort -u`, etc.).

## Vim bundles

Do not edit files under `vim/bundle/` — those are third-party plugins managed by Vundle. Any local changes will be overwritten when the plugin is updated, so they are not sustainable.

## Ghostty config

Do not add Ghostty config options that just match the default — omit them instead.

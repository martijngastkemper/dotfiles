# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a personal dotfiles repository for managing macOS development environment configuration. It uses symlinks to deploy configuration files and Makefile targets for installing and configuring tools.

## Key Commands

### Installation & Setup
- `make` - Lists all available make targets
- `make symlinks` - Create symlinks for dotfiles (gitconfig, zshrc, CLAUDE.md)
- `make install_brew_packages` - Install all packages from Brewfile
- `make configure_zsh` - Set up Zsh with Antigen plugin manager
- `make configure_vim` - Set up Vim with Vundle and plugins
- `make configure_tmux` - Set up tmux with plugin manager
- `make configure_git` - Configure git (same as symlinks)
- `make configure_macos` - Apply macOS preferences via macos_config.sh

### Testing & Linting
- `shellcheck -- bin/* *.sh git_template/hooks/* bash_aliases` - Lint shell scripts (used in CI)
- `zunit` tests are in `tests/` directory for custom Zsh functions

## Architecture

### Configuration Management
- **Symlink-based deployment**: Dotfiles stay in `~/.dotfiles` and are symlinked to home directory
- **Makefile orchestration**: All setup tasks are defined as make targets with dependency checking via `installed_%` pattern
- **Modular structure**: Configuration is split across multiple files (zshrc, gitconfig, bash_aliases, etc.)

### Custom Zsh Functions
Three custom functions are loaded by zshrc:
- **fixup.zsh** (`fixup`): Create fixup commits for rebasing, defaults to HEAD or takes a commit ref
- **gcm.zsh** (`gcm`): Checkout main branch (intelligently detects release/main/master)
- **idea.zsh** (`idea`): Open PhpStorm with current or specified project directory

### Git Configuration
- **Multi-identity support**: Uses `includeIf` to load different configs based on repository remote (personal vs work)
- **1Password integration**: GPG signing via 1Password SSH agent (gpg.ssh.program)
- **Custom git aliases**: `git main` (detect main branch), `git rbi` (interactive rebase from merge-base), `git feature`, `git hotfix`
- **Git templates**: Hooks in `git_template/hooks/` are copied to new repos via init.templatedir
- **Composer merge driver**: Special merge strategy for composer.json/lock files

### Development Environment
- **PHP version switching**: Aliases php74-php85 to switch between PHP versions via brew unlink/link
- **Multiple PHP versions**: Supports 7.4, 8.0-8.4 via Homebrew
- **Node.js**: Managed via NVM (loaded through zsh-nvm plugin)
- **Python**: Managed via pyenv
- **Composer**: Installed to bin/composer with memory limit disabled

### Theme Switching
- **Dynamic light/dark mode**: bin/dark and bin/light switch tmux and vim themes
- **Automated switching**: macos_switch_theme.sh can be run via cron to sync with macOS appearance

### Utility Scripts (in bin/)
- **apply_git_template**: Apply git_template hooks to existing repos
- **public_port**: Find Docker Compose service public port mappings
- **dark/light**: Switch tmux and vim color schemes

## File Structure Patterns
- Configuration files at root (zshrc, gitconfig, etc.)
- Executables in `bin/`
- Tests in `tests/*.zunit`
- Theme configs in `tmux-themes/`
- Vim config in `vim/` with Vundle plugins in `vim/bundle/`
- Git hooks in `git_template/hooks/`
- Additional gitconfigs for identity management (gitconfig.personal, gitconfig.meinestadt)

## Development Notes
- Local overrides: `~/.zshrc.local` is sourced if it exists for device-specific settings
- Case-sensitive completion and auto-correction are enabled in Zsh
- PROJECT_PATHS for `pj` plugin is set to ~/Projects
- 1Password CLI and SSH agent must be configured manually after brew installation

---
name: switch-php-version
description: Switch PHP version by running a bash command. Use it when running PHP code that fails with deprecation warnings.
---

# Switch PHP version

To switch PHP versions on your system, run one of the following commands. These
are scripts in `~/.dotfiles/bin/` (on `$PATH`), so they work in any shell,
including non-interactive bash.

- `php74` for PHP 7.4
- `php80` for PHP 8.0
- `php81` for PHP 8.1
- `php82` for PHP 8.2
- `php83` for PHP 8.3
- `php84` for PHP 8.4
- `php85` for PHP 8.5
- `php86` for PHP 8.6

When a `composer.json` file is present in the root of the repository you are
working in, look for the PHP version in the `require` section (e.g. `"php":
"^8.2"` → run `php82`).

If the command is not found, invoke it by absolute path: `~/.dotfiles/bin/php82`.

# frozen_string_literal: true

tap 'anomalyco/tap', trusted: true # for OpenCode
tap 'molovo/revolver', trusted: true # for zunit
tap 'hashicorp/tap', trusted: true # for Terraform
tap 'ngrok/ngrok', trusted: true
tap 'zunit-zsh/zunit', trusted: true
tap 'shivammathur/php', trusted: true
tap 'terraform-linters/tap', trusted: true # for tflint
brew 'actionlint'
brew 'awscli'
cask 'domzilla-caffeine'
go 'github.com/checkmake/checkmake/cmd/checkmake'
cask 'claude-code'
cask 'docker-desktop' unless Dir.exist?('/Applications/Docker.app')
brew 'editorconfig-checker'
cask 'elgato-control-center' unless Dir.exist?('/Applications/Elgato Control Center.app')
cask 'font-menlo-for-powerline'
cask 'ghostty' unless Dir.exist?('/Applications/Ghostty.app')
brew 'git'
# Syntax-highlighting pager for git and diff output
brew 'git-delta'
brew 'go'
cask 'google-chrome' unless Dir.exist?('/Applications/Google Chrome.app')
brew 'hashicorp/tap/terraform'
brew 'imagemagick'
brew 'inetutils'
brew 'jq'
brew 'markdownlint-cli2'
brew 'mkcert'
brew 'mistral-vibe'
brew 'mysql@8.4', restart_service: true, link: true
cask 'ngrok/ngrok/ngrok'
cask 'notion' unless Dir.exist?('/Applications/Notion.app')
brew 'anomalyco/tap/opencode'
brew 'ollama'
go 'mvdan.cc/sh/v3/cmd/shfmt'
brew 'shivammathur/php/php@7.4'
brew 'shivammathur/php/php@8.0'
brew 'shivammathur/php/php@8.1'
brew 'shivammathur/php/php@8.2'
brew 'shivammathur/php/php@8.3'
brew 'shivammathur/php/php@8.4'
brew 'shivammathur/php/php@8.5'
brew 'shivammathur/php/php@8.6'
brew 'shivammathur/php/php@8.7'
# Install after PHP to prevent installing the default PHP version.
brew 'composer'
brew 'pnpm'
brew 'pyenv'
cask 'rectangle' unless Dir.exist?('/Applications/Rectangle.app')
brew 'rubocop'
brew 'shellcheck'
cask 'signal' unless Dir.exist?('/Applications/Signal.app')
cask 'slack' unless Dir.exist?('/Applications/Slack.app')
brew 'sqlite'
cask 'timescribe' unless Dir.exist?('/Applications/TimeScribe.app')
cask 'terraform-linters/tap/tflint'
brew 'tmux'
brew 'universal-ctags'
brew 'vim'
brew 'wget'
cask 'whatsapp' unless Dir.exist?('/Applications/WhatsApp.app')
# Find security issues in GitHub Actions setups
brew 'zizmor'
brew 'zsh'
# Lint ZSH files
# NOTE: not installed because Brew always installs @latest, but that version is broken because the repo doesn't have
# release tags.
# go "github.com/z-shell/zsh-lint/cmd/zsh-lint"
brew 'zunit-zsh/zunit/zunit'
unless Dir.exist?('/Applications/1Password.app')
  cask '1password'
  cask '1password-cli'
end

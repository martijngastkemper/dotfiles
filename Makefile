DIR="${HOME}/.dotfiles"
VIM_VUNDLE_DIR=~/.vim/bundle/Vundle.vim
TMUX_PLUGIN_MANAGER_DIR=~/.tmux/plugins/tpm
ZSH_PATH=$(shell which zsh)

.PHONY = all
all:
	@echo "Run actions individually!\n"
	@echo "Available make sources:"
	@$(MAKE) -pRrq -f $(lastword $(MAKEFILE_LIST)) : 2>/dev/null | awk -v RS= -F: '/^# File/,/^# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' | sort | egrep -v -e '^[^[:alnum:]]' -e '^$@$$'

.PHONY = installed_%
installed_%:
	@which $* > /dev/null

.PHONY = install_brew_packages
install_brew_packages:
	brew update
	brew bundle install

.PHONY = install_composer
install_composer: installed_php
	sh $(DIR)/bin/install-composer.sh
	mv composer.phar $(DIR)/bin/composer

.PHONY = install_composer_git_merge_driver
install_composer_git_merge_driver: installed_composer
	composer global require balbuf/composer-git-merge-driver

.PHONY = install_nvm
install_nvm: installed_curl
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.2/install.sh | bash

.PHONY = install_qmd
install_qmd: installed_bun installed_sqllite
	bun install -g https://github.com/tobi/qmd

.PHONY = install_yarn
install_yarn: installed_curl
	curl -o- -L https://yarnpkg.com/install.sh | bash

.PHONY = configure_bash
configure_bash: installed_bash
	ln -nsf $(DIR)/bash_aliases ~/.bash_aliases

.PHONY = configure_git
symlinks:
	ln -nsf $(DIR)/claude/CLAUDE_personally.md ~/.claude/CLAUDE.md
	ln -nsf $(DIR)/claude/settings.json ~/.claude/settings.json
	ln -nsf $(DIR)/gitconfig ~/.gitconfig

bin/antigen.zsh: installed_curl
	touch $(DIR)/bin/antigen.zsh
	curl -L git.io/antigen-nightly > $(DIR)/bin/antigen.zsh

.PHONY = configure_zsh
configure_zsh: installed_zsh bin/antigen.zsh
	ln -nsf $(DIR)/zshrc ~/.zshrc
	echo $(ZSH_PATH) | sudo tee -a /etc/shells > /dev/null
	sudo chsh -s $(ZSH_PATH)

.PHONY = install_vim_symlinks
install_vim_symlinks:
	ln -nsf $(DIR)/ctags ~/.ctags
	ln -nsf $(DIR)/vim ~/.vim
	ln -nsf $(DIR)/ideavimrc ~/.ideavimrc

.PHONY = install_vim_vundle
install_vim_vundle: installed_git
	if [ ! -d $(VIM_VUNDLE_DIR) ]; then git clone https://github.com/VundleVim/Vundle.vim.git $(VIM_VUNDLE_DIR); fi

.PHONY = install_vim_plugins
install_vim_plugins: installed_vim install_vim_vundle
	vim +BundleInstall +qall

.PHONY = configure_vim
configure_vim: installed_vim install_vim_symlinks install_vim_vundle install_vim_plugins

.PHONY = install_tmux_symlinks
install_tmux_symlinks:
	ln -nsf $(DIR)/tmux.conf ~/.tmux.conf
	ln -nsf $(DIR)/tmux-themes ~/.tmux-themes

.PHONY = install_tmux_plugin_manager
install_tmux_plugin_manager: installed_git
	if [ ! -d $(TMUX_PLUGIN_MANAGER_DIR) ]; then mkdir -p $(TMUX_PLUGIN_MANAGER_DIR) && git clone https://github.com/tmux-plugins/tpm $(TMUX_PLUGIN_MANAGER_DIR); fi

.PHONY = install_tmux_plugins
install_tmux_plugins:
	tmux source ~/.tmux.conf

.PHONY = configure_tmux
configure_tmux: installed_tmux install_tmux_symlinks install_tmux_plugin_manager install_tmux_plugins

.PHONY = configure_theme_switcher
configure_theme_switcher:
	ln -nsf $(DIR)/com.martijngastkemper.theme-switcher.plist ~/Library/LaunchAgents/com.martijngastkemper.theme-switcher.plist
	launchctl load ~/Library/LaunchAgents/com.martijngastkemper.theme-switcher.plist

.PHONY = configure_macos
configure_macos:
	@sh macos_config.sh;\
	exit $$?

.PHONY = yarn_globals
yarn_globals: installed_yarn
	yarn global add feedly-cli

.PHONY = install_zunit
install_zunit: installed_curl
	curl -L https://raw.githubusercontent.com/molovo/revolver/master/revolver > bin/revolver
	curl -L https://github.com/molovo/zunit/releases/download/v0.8.2/zunit > bin/zunit
	chmod +x bin/revolver bin/zunit

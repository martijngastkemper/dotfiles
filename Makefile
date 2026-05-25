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
	@which $* > /dev/null 2>&1 && echo "✓ $* is installed" || (echo "✗ $* is not installed" && exit 1)

.PHONY = install_brew_packages
install_brew_packages: installed_brew
	brew update
	brew bundle install

.PHONY = install_composer_git_merge_driver
install_composer_git_merge_driver: installed_composer
	composer global require balbuf/composer-git-merge-driver

.PHONY = install_nvm
install_nvm: installed_curl
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.4/install.sh | bash

.PHONY = install_opencode_update_agent
install_opencode_update_agent:
	cp $(CURDIR)/com.martijngastkemper.opencode-update.plist ~/Library/LaunchAgents/
	launchctl unload ~/Library/LaunchAgents/com.martijngastkemper.opencode-update.plist || true
	launchctl load ~/Library/LaunchAgents/com.martijngastkemper.opencode-update.plist

.PHONY = install_python
install_python: installed_pyenv
	pyenv install 3
	pyenv global 3

.PHONY = install_yarn
install_yarn: installed_curl
	curl -o- -L https://yarnpkg.com/install.sh | bash

.PHONY = configure_bash
configure_bash: installed_bash
	ln -nsf $(CURDIR)/bash_aliases ~/.bash_aliases

.PHONY = symlinks
symlinks:
	# When the repo isn't checkout in ~/.dotfiles, create a symlink to it. This allows me to hard code ~/.dotfiles in
	# config files. E.g. in gitconfig.
	if [ ! -d ~/.dotfiles ]; then ln -nsf $(CURDIR) ~/.dotfiles; fi
	mkdir -p ~/.agents
	ln -nsf $(CURDIR)/agents/AGENTS_personal.md ~/.agents/AGENTS.md
	ln -nsf $(CURDIR)/agents/skills ~/.agents/skills
	ln -nsf $(CURDIR)/gitconfig ~/.gitconfig

bin/antigen.zsh: installed_curl
	touch $(CURDIR)/bin/antigen.zsh
	curl -L git.io/antigen-nightly > $(CURDIR)/bin/antigen.zsh

.PHONY = configure_zsh
configure_zsh: installed_zsh bin/antigen.zsh
	ln -nsf $(CURDIR)/zshrc ~/.zshrc
	echo $(ZSH_PATH) | sudo tee -a /etc/shells > /dev/null
	sudo chsh -s $(ZSH_PATH)

.PHONY = install_vim_symlinks
install_vim_symlinks:
	ln -nsf $(CURDIR)/ctags ~/.ctags
	ln -nsf $(CURDIR)/vim ~/.vim
	ln -nsf $(CURDIR)/ideavimrc ~/.ideavimrc

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
	ln -nsf $(CURDIR)/tmux.conf ~/.tmux.conf

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
	ln -nsf $(CURDIR)/com.martijngastkemper.theme-switcher.plist ~/Library/LaunchAgents/com.martijngastkemper.theme-switcher.plist
	launchctl unload ~/Library/LaunchAgents/com.martijngastkemper.theme-switcher.plist || true
	launchctl load ~/Library/LaunchAgents/com.martijngastkemper.theme-switcher.plist

.PHONY = configure_macos
configure_macos: configure_theme_switcher install_opencode_update_agent
	@sh macos_config.sh;\
	exit $$?

.PHONY = install_zunit
install_zunit: installed_curl
	curl -L https://raw.githubusercontent.com/molovo/revolver/master/revolver > bin/revolver
	curl -L https://github.com/molovo/zunit/releases/download/v0.8.2/zunit > bin/zunit
	chmod +x bin/revolver bin/zunit

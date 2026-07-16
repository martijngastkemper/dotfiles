VIM_VUNDLE_DIR=~/.vim/bundle/Vundle.vim
TMUX_PLUGIN_MANAGER_DIR=~/.tmux/plugins/tpm
ZSH_PATH=$(shell which zsh)

.PHONY: all
all:
	@echo "Run actions individually!\n"
	@echo "Available make sources:"
	@$(MAKE) -pRrq -f $(lastword $(MAKEFILE_LIST)) : 2>/dev/null | awk -v RS= -F: '/^# File/,/^# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' | sort | egrep -v -e '^[^[:alnum:]]' -e '^$@$$'

.PHONY: clean
clean:
	@echo "👋"

.PHONY: test
test:
	@echo "👋"

.PHONY: installed_%
installed_%:
	@which $* > /dev/null 2>&1 && echo "✓ $* is installed" || (echo "✗ $* is not installed" && exit 1)

.PHONY: install_brew_packages
install_brew_packages: installed_brew
	brew update
	brew bundle install

.PHONY: install_composer_git_merge_driver
install_composer_git_merge_driver: installed_composer
	composer global require balbuf/composer-git-merge-driver

.PHONY: install_nvm
install_nvm: installed_curl
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.5/install.sh | bash

.PHONY: install_opencode_update_agent
install_opencode_update_agent:
	cp $(CURDIR)/com.martijngastkemper.opencode-update.plist ~/Library/LaunchAgents/
	launchctl unload ~/Library/LaunchAgents/com.martijngastkemper.opencode-update.plist || true
	launchctl load ~/Library/LaunchAgents/com.martijngastkemper.opencode-update.plist

.PHONY: install_python
install_python: installed_pyenv
	pyenv install 3
	pyenv global 3

.PHONY: install_skills-linmt
install_skills_lint: installed_npm
	npm install -g @haasstefan/skills-lint

.PHONY: install_yarn
install_yarn: installed_curl
	curl -o- -L https://yarnpkg.com/install.sh | bash

.PHONY: configure_bash
configure_bash: installed_bash
	ln -nsf $(CURDIR)/bash_aliases ~/.bash_aliases

.PHONY: symlinks
symlinks: symlink_dotfiles symlink_opencode symlink_repo_root

.PHONY: symlink_dotfiles
symlink_dotfiles:
	mkdir -p ~/.agents
	ln -nsf $(CURDIR)/agents/AGENTS_personal.md ~/.agents/AGENTS.md
	ln -nsf $(CURDIR)/agents/skills ~/.agents/skills
	ln -nsf $(CURDIR)/gitconfig ~/.gitconfig

.PHONY: symlink_opencode
symlink_opencode:
	mkdir -p ~/.config/opencode
	ln -nsf $(CURDIR)/agents/command ~/.config/opencode/command
	ln -nsf $(CURDIR)/agents/opencode.jsonc ~/.config/opencode/opencode.jsonc
	ln -nsf $(CURDIR)/agents/tui.jsonc ~/.config/opencode/tui.jsonc

.PHONY: symlink_repo_root
symlink_repo_root:
	# When the repo isn't checkout in ~/.dotfiles, create a symlink to it. This allows me to hard code ~/.dotfiles in
	# config files. E.g. in gitconfig.
	if [ ! -d ~/.dotfiles ]; then ln -nsf $(CURDIR) ~/.dotfiles; fi

bin/antigen.zsh: installed_curl
	touch $(CURDIR)/bin/antigen.zsh
	curl -L git.io/antigen-nightly > $(CURDIR)/bin/antigen.zsh

.PHONY: configure_zsh
configure_zsh: installed_zsh bin/antigen.zsh
	ln -nsf $(CURDIR)/zshrc ~/.zshrc
	echo $(ZSH_PATH) | sudo tee -a /etc/shells > /dev/null
	sudo chsh -s $(ZSH_PATH)

.PHONY: install_vim_symlinks
install_vim_symlinks:
	mkdir -p ~/.ctags.d/
	ln -nsf $(CURDIR)/squirrel.ctags ~/.ctags.d/squirrel.ctags
	ln -nsf $(CURDIR)/vim ~/.vim
	ln -nsf $(CURDIR)/ideavimrc ~/.ideavimrc

.PHONY: install_vim_vundle
install_vim_vundle: installed_git
	if [ ! -d $(VIM_VUNDLE_DIR) ]; then git clone https://github.com/VundleVim/Vundle.vim.git $(VIM_VUNDLE_DIR); fi

.PHONY: install_vim_plugins
install_vim_plugins: installed_vim install_vim_vundle
	vim +BundleInstall +qall

.PHONY: configure_vim
configure_vim: installed_vim install_vim_symlinks install_vim_vundle install_vim_plugins

.PHONY: install_tmux_symlinks
install_tmux_symlinks:
	ln -nsf $(CURDIR)/tmux.conf ~/.tmux.conf

.PHONY: install_tmux_plugin_manager
install_tmux_plugin_manager: installed_git
	if [ ! -d $(TMUX_PLUGIN_MANAGER_DIR) ]; then mkdir -p $(TMUX_PLUGIN_MANAGER_DIR) && git clone https://github.com/tmux-plugins/tpm $(TMUX_PLUGIN_MANAGER_DIR); fi

.PHONY: install_tmux_plugins
install_tmux_plugins:
	tmux source ~/.tmux.conf

.PHONY: configure_tmux
configure_tmux: installed_tmux install_tmux_symlinks install_tmux_plugin_manager install_tmux_plugins

.PHONY: configure_theme_switcher
configure_theme_switcher:
	ln -nsf $(CURDIR)/com.martijngastkemper.theme-switcher.plist ~/Library/LaunchAgents/com.martijngastkemper.theme-switcher.plist
	launchctl unload ~/Library/LaunchAgents/com.martijngastkemper.theme-switcher.plist || true
	launchctl load ~/Library/LaunchAgents/com.martijngastkemper.theme-switcher.plist

.PHONY: configure_ghostty
configure_ghostty:
	mkdir -p ~/.config/ghostty
	ln -nsf $(CURDIR)/ghostty/config ~/.config/ghostty/config
	ln -nsf $(CURDIR)/ghostty/themes ~/.config/ghostty/themes

.PHONY: configure_macos
configure_macos: configure_theme_switcher install_opencode_update_agent
	@sh macos_config.sh;\
	exit $$?


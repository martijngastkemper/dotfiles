DIR="${HOME}/.dotfiles"
VIM_VUNDLE_DIR=~/.vim/bundle/Vundle.vim
TMUX_PLUGIN_MANAGER_DIR=~/.tmux/plugins/tpm
ZSH_PATH=$(shell which zsh)

.PHONY = all
all:
	@echo "Run actions individually!\n"
	@echo "Available make sources:"
	@$(MAKE) -pRrq -f $(lastword $(MAKEFILE_LIST)) : 2>/dev/null | awk -v RS= -F: '/^# File/,/^# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' | sort | egrep -v -e '^[^[:alnum:]]' -e '^$@$$'

.PHONY = install_%
installed_%:
	@which $* > /dev/null

.PHONY = install_brew
install_brew: installed_ruby
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

.PHONY = install_brew_packages
install_brew_packages: installed_brew
	brew bundle install

.PHONY = install_composer
install_composer: installed_php
	php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
	php -r "if (hash_file('sha384', 'composer-setup.php') === 'e0012edf3e80b6978849f5eff0d4b4e4c79ff1609dd1e613307e16318854d24ae64f26d17af3ef0bf7cfb710ca74755a') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
	php composer-setup.php
	php -r "unlink('composer-setup.php');"
	sudo mv composer.phar /usr/local/bin/composer

.PHONY = install_composer_git_merge_driver
install_composer_git_merge_driver: installed_composer
	composer global require balbuf/composer-git-merge-driver

.PHONY = install_nvm
install_nvm: installed_curl
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.2/install.sh | bash

.PHONY = install_yarn
install_yarn: installed_curl
	curl -o- -L https://yarnpkg.com/install.sh | bash

.PHONY = configure_bash
configure_bash: installed_bash
	ln -nsf $(DIR)/bash_aliases ~/.bash_aliases

bin/antigen.zsh: installed_curl
	curl -L git.io/antigen-nightly > $(DIR)/bin/antigen.zsh

.PHONY = configure_zsh
configure_zsh: installed_zsh bin/antigen.zsh
	ln -nsf $(DIR)/zshrc ~/.zshrc
	echo $(ZSH_PATH) | sudo tee -a /etc/shells > /dev/null
	sudo chsh -s $(ZSH_PATH)

.PHONY = symlinks
symlinks:
	ln -nsf $(DIR)/gitconfig ~/.gitconfig
	ln -nsf $(DIR)/gnupg/ ~/.gnupg

.PHONY = install_vim_symlinks
install_vim_symlinks:
	ln -nsf $(DIR)/ctags ~/.ctags
	ln -nsf $(DIR)/vim ~/.vim
	ln -nsf $(DIR)/vimrc ~/.vimrc
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

.PHONY = install_tmux_plugin_manager
install_tmux_plugin_manager: installed_git
	if [ ! -d $(TMUX_PLUGIN_MANAGER_DIR) ]; then mkdir -p $(TMUX_PLUGIN_MANAGER_DIR) && git clone https://github.com/tmux-plugins/tpm $(TMUX_PLUGIN_MANAGER_DIR); fi

.PHONY = install_tmux_plugins
install_tmux_plugins:
	tmux source ~/.tmux.conf

.PHONY = configure_tmux
configure_tmux: installed_tmux install_tmux_symlinks install_tmux_plugin_manager install_tmux_plugins

.PHONY = configure_macos
configure_macos:
	@sh macos_config.sh;\
	exit $$?

.PHONY = yarn_globals
yarn_globals: installed_yarn
	yarn global add feedly-cli

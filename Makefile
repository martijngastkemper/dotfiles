DIR="${HOME}/.dotfiles"
VIM_VUNDLE_DIR=~/.vim/bundle/Vundle.vim
TMUX_PLUGIN_MANAGER_DIR=~/.tmux/plugins/tpm
ZSH_PATH=$(shell which zsh)

all:
	@echo "Run actions individually!\n"
	@echo "Available make sources:"
	@$(MAKE) -pRrq -f $(lastword $(MAKEFILE_LIST)) : 2>/dev/null | awk -v RS= -F: '/^# File/,/^# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' | sort | egrep -v -e '^[^[:alnum:]]' -e '^$@$$'

install_brew:
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

install_brew_packages:
	brew bundle install

install_nvm:
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.0/install.sh | bash

configure_bash:
	ln -nsf $(DIR)/bash_aliases ~/.bash_aliases

installed_%:
	@which $* > /dev/null

bin/antigen.zsh:
	curl -L git.io/antigen > $(DIR)/bin/antigen.zsh

configure_zsh: installed_zsh bin/antigen.zsh
	ln -nsf $(DIR)/zshrc ~/.zshrc
	echo $(ZSH_PATH) | sudo tee -a /etc/shells > /dev/null
	sudo chsh -s $(ZSH_PATH)

symlinks:
	ln -nsf $(DIR)/gitconfig ~/.gitconfig
	ln -nsf $(DIR)/gnupg/ ~/.gnupg

install_vim_symlinks:
	ln -nsf $(DIR)/ctags ~/.ctags
	ln -nsf $(DIR)/vim ~/.vim
	ln -nsf $(DIR)/vimrc ~/.vimrc
	ln -nsf $(DIR)/ideavimrc ~/.ideavimrc
	
install_vim_vundle:
	if [ ! -d $(VIM_VUNDLE_DIR) ]; then git clone https://github.com/VundleVim/Vundle.vim.git $(VIM_VUNDLE_DIR); fi

install_vim_plugins:
	vim +BundleInstall +qall

install_vim: install_vim_symlinks install_vim_vundle install_vim_plugins

install_tmux_symlinks:
	ln -nsf $(DIR)/tmux.conf ~/.tmux.conf

install_tmux_plugin_manager:
	if [ ! -d $(TMUX_PLUGIN_MANAGER_DIR) ]; then mkdir -p $(TMUX_PLUGIN_MANAGER_DIR) && git clone https://github.com/tmux-plugins/tpm $(TMUX_PLUGIN_MANAGER_DIR); fi

install_tmux_plugins:
	tmux source ~/.tmux.conf

install_tmux: install_tmux_symlinks install_tmux_plugin_manager install_tmux_plugins

configure_macos:
	@sh macos_config.sh;\
	exit $$?

yarn_globals:
	yarn global add feedly-cli

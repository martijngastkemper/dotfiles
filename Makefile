DIR="${HOME}/.dotfiles"

all:
	@echo "Run things individually!"

install_brew:
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

install_brew_packages:
	brew bundle install

configure_zsh:
	echo $(which zsh) | sudo tee -a /etc/shells > /dev/null
	chsh -s $(which zsh)

symlinks:
	@ln -nsf $(DIR)/ctags ~/.ctags
	@ln -nsf $(DIR)/git_template ~/.git_template
	@ln -nsf $(DIR)/gitconfig ~/.gitconfig
	@ln -nsf $(DIR)/gitignore_global ~/.gitignore_global
	@ln -nsf $(DIR)/tmux.conf ~/.tmux.conf
	@ln -nsf $(DIR)/vim ~/.vim
	@ln -nsf $(DIR)/vimrc ~/.vimrc
	@ln -nsf $(DIR)/zshrc ~/.zshrc

install_vim_vundle:
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	vim +BundleInstall +qall

configure_macos:
	bash macos_config.sh
	

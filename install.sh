#! /bin/bash

if  hash brew 2>/dev/null; then
	brew install -y cmake the_silver_searcher vim
elif hash apt-get 2>/dev/null; then
	sudo apt-get install -y cmake ctags silversearcher-ag vim build-essential python-dev
elif hash yum 2>/dev/null; then
	sudo yum install -y cmake the_silver_searcher vim
fi

sudo pip install isort

vim -u ./.vimrc +PlugInstall +qall

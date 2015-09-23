#! /bin/bash

if  hash brew 2>/dev/null; then
	brew install -y cmake the_silver_searcher vim
elif hash yum 2>/dev/null; then
	sudo yum install -y cmake the_silver_searcher vim
elif hash apt-get 2>/dev/null; then
	sudo apt-get install -y cmake silversearcher-ag vim
fi

vim -u ./.vimrc +PlugInstall +qall

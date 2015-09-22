#!/bin/sh

vim -u ./.vimrc +PlugInstall +qall
brew install -y cmake the_silver_searcher

~/.vim/plugged/YouCompleteMe/install.sh


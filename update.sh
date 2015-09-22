#!/bin/sh

git pull
vim -u ./.vimrc +PlugUpdate +PlugUpgrade +qall

~/.vim/plugged/YouCompleteMe/install.sh


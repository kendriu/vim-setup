#!/bin/sh

vim -u ./.vimrc +PlugInstall +qall
sudo apt-get install -y cmake silversearcher-ag

#!/bin/sh

git pull
vim -u ./.vimrc +PlugUpgrade +PlugUpdate +qall

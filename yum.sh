#!/bin/sh

vim -u ./.vimrc +PlugInstall +qall

sudo yum install -y cmake the_silver_searcher

#!/bin/bash

cp ~/.vimrc .
cp ~/.bashrc .bashrc
cp ~/.config/fish/config.fish .
echo "Used plugins" > plugins.txt
echo "=============" >> plugins.txt
ls ~/.vim/pack/vendor/start >> plugins.txt

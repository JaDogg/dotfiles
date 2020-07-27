#!/bin/bash

cp ~/.vimrc .
cp ~/.bashrc .bashrc
echo "Used plugins" > plugins.txt
echo "=============" >> plugins.txt
ls ~/.vim/pack/vendor/start >> plugins.txt

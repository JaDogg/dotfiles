#!/bin/bash

cp ~/.vimrc .
echo "Used plugins" > plugins.txt
echo "=============" >> plugins.txt
ls ~/.vim/pack/vendor/start >> plugins.txt

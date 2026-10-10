#!/bin/sh

for i in $(ls -d .??* | grep -v git); do ln -s ~/config/$i ~/$i; done
cp ./config.fish  ~/.config/fish/config.fish

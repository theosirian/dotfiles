#! /bin/bash

for i in zshrc bashrc vimrc xinitrc Xresources tmux.conf urxvt; do
   ln -s "$HOME/$1/$i" "$HOME/.$i"
done

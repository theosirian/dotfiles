#! /usr/bin/env bash

for i in bookmarks config.py quickmarks; do
   ln -s "$HOME/$1/qutebrowser/$i" "$HOME/.config/qutebrowser/$i"
done

ln -s "$HOME/$1/qutebrowser/userscripts" "$HOME/.local/share/qutebrowser/userscripts"

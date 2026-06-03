#!/bin/bash

bash install_programs.sh

betterlockscreen -u $HOME/Pictures/Wallpaper/

cd ../..
cp -r .config/* $HOME/.config/ 
cp -r .git/* $HOME/.config/dotfiles/
cp -r .github $HOME
cp .zshrc $HOME
cp .p10k.zsh $HOME
cp .bashrc $HOME
cp .clang-format $HOME
cp -r .zsh $HOME
cp -r .vscode $HOME
cp -r Pictures/.feh_slideshow/ Pictures

cd $HOME/.config/dotfiles 
mv config config.bak
cp config.example config

#!/bin/sh

##
## Install config files
##

cp .tmux.conf ~/.tmux.conf
cp init.vim ~/.config/nvim/init.vim
cp coc-settins.json ~/.config/nvim/coc-settings.json

# Install snippets
cp -r UltiSnips ~/.config/nvim/

# Install plugins
vim -E -s -c PlugInstall -c q



##
## Build help
##

helpdir="~/.local/share/nvim/site/doc/"

# Create a "doc" directory in a runtimepath
mkdir -p ${helpdir}

# Copy the help file to the "doc" directory
cp -r myhelp ${helpdir}

# Run :helpt vim command
vim -E -c "helpt ${helpdir}myhelp/doc" -c q

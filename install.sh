#!/bin/sh

# Find relative path to the repository directory
reposdir="$(dirname "$0")"

# Obtain absolute path by entering the directory
cd $reposdir
confdir=`pwd`

# Create directory links
ln -sfT $confdir/emacs.d ~/.emacs.d
ln -sfT $confdir/config/tmux ~/.config/tmux
ln -sfT $confdir/config/colors ~/.config/colors

# Create file links
ln -sf $confdir/compton.conf ~/.compton.conf
ln -sf ~/tmux/conf ~/.tmux.conf
ln -sf $confdir/xinitrc ~/.xinitrc
ln -sf $confdir/Xresources ~/.Xresources
ln -sf $confdir/zprofile ~/.zprofile
ln -sf $confdir/zshrc ~/.zshrc

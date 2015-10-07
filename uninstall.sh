#!/bin/sh

stow -D compton
stow -D dunst
stow -D git
stow -D gtk
stow -D postgresql
stow -D redshift
stow -D spacemacs
stow -D tmux
stow -D vim
stow -D X11
stow -D zsh

if [ "$(expr substr $(uname -s) 1 9)" == "CYGWIN_NT" ]; then
	stow mintty
fi


#!/bin/sh

stow -D X11
stow -D dunst
stow -D git
stow -D mpv
stow -D mysql
stow -D postgresql
stow -D redshift
stow -D spacemacs
stow -D tmux
stow -D vim
stow -D X11
stow -D xbindkeys
stow -D zsh

if [ "$(expr substr $(uname -s) 1 9)" == "CYGWIN_NT" ]; then
	stow -D mintty
fi


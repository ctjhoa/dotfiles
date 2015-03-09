#!/bin/sh

stow compton
stow git
stow gtk
stow mintty
stow postgresql
stow redshift
stow spacemacs
stow tmux
stow vim
stow X11
stow zsh

if [ "$(expr substr $(uname -s) 1 9)" == "CYGWIN_NT" ]; then
	stow windows
	cp bug.n/Config.ini ~/AppData/Roaming/bug.n/Config.ini
fi

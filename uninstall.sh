#!/bin/sh

stow -D compton
stow -D git
stow -D gtk
stow -D mintty
stow -D postgresql
stow -D redshift
stow -D spacemacs
stow -D tmux
stow -D vim
stow -D X11
stow -D zsh

if [ `uname -s` == CYGWIN* ]; then
	stow -D windows
fi


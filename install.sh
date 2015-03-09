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

if [ `uname -s` == CYGWIN* ]; then
	stow windows
fi

#!/bin/sh

stow X11
stow alacritty
stow dunst
stow git
stow mpv
stow mysql
stow postgresql
stow redshift
stow spacemacs
stow tmux
stow vim
stow xbindkeys
stow zsh

if [ "$(expr substr $(uname -s) 1 9)" == "CYGWIN_NT" ]; then
	stow mintty

	# bug.n
	mkdir -p ~/AppData/Roaming/bug.n
	cp windows/bug.n/Config.ini ~/AppData/Roaming/bug.n/Config.ini

	# mpv
	mkdir -p ~/AppData/Roaming/mpv
	cp mpv/.config/mpv/mpv.conf ~/AppData/Roaming/mpv/mpv.conf
fi

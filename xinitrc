#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

compton --config ~/.compton.conf -b

# Statusbar loop
while true; do
	xsetroot -name "$( date +"%d %a") $(echo -e "\x01") $( date +"%H:%M" )"
  sleep 1m    # Update time every minute
done &

# Load bitmap fonts
mkfontdir ~/.fonts
mkfontscale ~/.fonts
xset fp+ ~/.fonts

# Load X ressources (Xdefault is deprecated)
xrdb ~/.Xresources

exec dwm
#exec awesome
# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice

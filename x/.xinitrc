#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
	xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
	xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
	xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
	xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ]; then
	for f in /etc/X11/xinit/xinitrc.d/?*.sh; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

# GoBlocks
goblocks &

# Display Resolution
xrandr --output HDMI-1 --mode 1920x1080 --rate 165 &
xrandr --output HDMI-A-0 --left-of DisplayPort-2 &

# Compositor
picom --config "$HOME/.config/picom/picom.conf" &

# Wallpaper
# wal -R

# Live wallpaper
# paperview "$HOME/Pictures/wallpapers/live/1" 11 0 0 2560 1440 "$HOME/Pictures/wallpapers/live/2" 7 2560 0 1980 1080 &

# run easyeffects in background
# easyeffects --gapplication-service &

# Execute DWM
# exec dwm
# Execute awesome
exec awesome >>~/.cache/awesome/stdout 2>>~/.cache/awesome/stderr

#! /bin/sh
sleep 5

# Applications
termite &
termite &
termite &
termite --class=ranger -e ranger &
firefox &
zotero &
termite --class=ncmpcpp -e ncmpcpp &
if [ "$HOSTNAME" = archStation ]; then
	termite --class=vis -e vis &
	termite --class=matlab -e 'fish -c matlab' &
fi
if [ "$HOSTNAME" = archPad ]; then
	xinput disable 10 
fi
syncthing-gtk &
keepassxc &

# Services
nm-applet &
redshift &
mpd-notification &

#! /bin/sh
sleep 15

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
keepassxc &
syncthing-gtk &

# Services
redshift &
nm-applet &
mpd-notification &

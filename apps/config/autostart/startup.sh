#! /bin/sh
sleep 15

# Applications
termite &
termite &
termite &
termite --class=ranger -e ranger &
firefox &
zotero &
termite --class=matlab -e 'fish -c matlab' &
termite --class=ncmpcpp -e ncmpcpp &
termite --class=vis -e vis &
keepassxc &
syncthing-gtk &

# Services
redshift &
nm-applet &
mpd-notification &

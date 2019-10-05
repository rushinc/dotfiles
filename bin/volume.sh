#!/bin/bash

# You can call this script like this:
# $./volume.sh up
# $./volume.sh down
# $./volume.sh mute

function get_volume {
	amixer get Master | grep '%' | head -n 1 | cut -d '[' -f 2 | cut -d '%' -f 1
}

function is_mute {
	amixer get Master | grep '%' | grep -oE '[^ ]+$' | grep off > /dev/null
}

function send_notification {
	level=`get_volume`
    	# Make the bar with the special character ─ (it's not dash -)
    	# https://en.wikipedia.org/wiki/Box-drawing_character

	if [ "$level" == 0 ]; then
    		bar=$(seq -s " " 20 | sed 's/[0-9]//g')
	else
    		i_on=$(seq -s "━" $(($level / 5)) | sed 's/[0-9]//g')
    		i_off=$(seq -s " " $((21 - $level / 5)) | sed 's/[0-9]//g')
    		bar=$i_on$i_off
	fi

    	# Send the notification
    	if [ "$level" -ge 0 ] && [ "$level" -le 30 ]; then
    		icon="notification-audio-volume-low"
    		if [ "$level" -le 9 ]; then
    			dunstify -i $icon -r 2593 -u normal " $bar    $level"
		else
    			dunstify -i $icon -r 2593 -u normal " $bar   $level"
		fi
	elif [ "$level" -ge 31 ] &&  [ "$level" -le 70 ]; then
    		icon="notification-audio-volume-medium"
    		dunstify -i $icon -r 2593 -u normal " $bar   $level"
    	else
    		icon="notification-audio-volume-high"
    	    	if [ "$level" -ge 10 ] &&  [ "$level" -le 99 ]; then
    			dunstify -i $icon -r 2593 -u normal " $bar   $level"
    		else
    			dunstify -i $icon -r 2593 -u normal " $bar  $level"
    		fi
    	fi
}

case $1 in
	up)
		# Set the volume on (if it was muted)
		amixer -D pulse set Master on > /dev/null
		# Up the volume (+ 5%)
		amixer -D pulse sset Master 5%+ > /dev/null
		send_notification
		;;
	down)
		amixer -D pulse set Master on > /dev/null
		amixer -D pulse sset Master 5%- > /dev/null
		send_notification
		;;
	mute)
		# Toggle mute
		amixer -D pulse set Master 1+ toggle > /dev/null
		if is_mute ; then
		    dunstify -i notification-audio-volume-muted -r 2593 -u normal Mute
		else
		    send_notification
		fi
		;;
esac

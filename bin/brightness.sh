#!/usr/bin/env bash

# You can call this script like this:
# $ ./brightness.sh up
# $ ./brightness.sh down

# Script inspired by these wonderful people:
# https://github.com/dastorm/volume-notification-dunst/blob/master/volume.sh
# https://gist.github.com/sebastiencs/5d7227f388d93374cebdf72e783fbd6a
# https://gist.github.com/Blaradox/030f06d165a82583ae817ee954438f2e

function get_brightness {
	xbacklight -get | cut -d '.' -f 1
}

function send_notification {
	level=`get_brightness`
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
    		icon="notification-display-brightness-low"
    		if [ "$level" -le 9 ]; then
    			dunstify -i $icon -r 2595 -u normal " $bar    $level"
		else
    			dunstify -i $icon -r 2595 -u normal " $bar   $level"
		fi
	elif [ "$level" -ge 31 ] &&  [ "$level" -le 70 ]; then
    		icon="notification-display-brightness-medium"
    		dunstify -i $icon -r 2595 -u normal " $bar   $level"
    	else
    		icon="notification-display-brightness-high"
    	    	if [ "$level" -ge 10 ] &&  [ "$level" -le 99 ]; then
    			dunstify -i $icon -r 2595 -u normal " $bar   $level"
    		else
    			dunstify -i $icon -r 2595 -u normal " $bar  $level"
    		fi
    	fi
}


case $1 in
	up)
		# increase the backlight by 5%
  	  	xbacklight -inc 5
  	  	send_notification
  	  	;;
  	down)
		# decrease the backlight by 5%
  	  	xbacklight -dec 5
  	  	send_notification
  	  	;;
esac

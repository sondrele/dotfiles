#!/bin/sh -e

scrot -o /tmp/screenshot-i3lock.png

mogrify -scale 10% -blur 0x1 -resize 1000% /tmp/screenshot-i3lock.png

i3lock -i /tmp/screenshot-i3lock.png

# sleep 60; pgrep i3lock && xset dpms force off

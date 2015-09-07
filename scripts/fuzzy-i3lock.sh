#!/bin/sh -e

scrot /tmp/screenshot-i3lock.png

mogrify -blur 0x6 /tmp/screenshot-i3lock.png

i3lock -i /tmp/screenshot-i3lock.png

# sleep 60; pgrep i3lock && xset dpms force off

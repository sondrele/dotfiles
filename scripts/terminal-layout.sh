#/bin/bash

# number to specify terminal layout file
LAYOUT=$1

if [ -z "$LAYOUT" ]; then
    echo "Please specify a layout number"
    exit 1
fi

i3-msg "append_layout ~/.i3/terminal-$LAYOUT.json"
for i in $(seq 1 $LAYOUT);
do
    gnome-terminal
done

#!/usr/bin/env python
# -*- coding: utf-8 -*-

import sys
import subprocess
import json
import re

def exec_command(command):
    return subprocess.check_output(command, shell=True)

def get_artist(data):
    artist = re.compile("(?<=artist: )[A-Za-z\t .]+").findall(data)
    return artist[0]

def get_title(data):
    title = re.compile("(?<=title: )[A-Za-z\t .]+").findall(data)
    return title[0]

def get_metadata():
    metadata = exec_command("qdbus org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Metadata")
    return metadata

def is_playing():
    metadata = exec_command("qdbus org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlaybackStatus")
    return metadata.strip() == "Playing"

def get_spotify_status():
    metadata = get_metadata()
    artist = get_artist(metadata)
    title = get_title(metadata)
    now_playing = artist.strip() + " - " + title.strip()

    if is_playing():
        color = "#00FF00"
    else:
        color = "#FFFF00"

    return {
        'full_text': '♪: %s' % now_playing,
        'name': 'spotify',
        'color': color
    }

def print_line(message):
    """ Non-buffered printing to stdout. """
    sys.stdout.write(message + '\n')
    sys.stdout.flush()

def read_line():
    """ Interrupted respecting reader for stdin. """
    # try reading a line, removing any extra whitespace
    try:
        line = sys.stdin.readline().strip()
        # i3status sends EOF, or an empty line
        if not line:
            sys.exit(3)
        return line
    # exit on ctrl-c
    except KeyboardInterrupt:
        sys.exit()

def main():
    # Skip the first line which contains the version header.
    print_line(read_line())

    # The second line contains the start of the infinite array.
    print_line(read_line())

    while True:
        line, prefix = read_line(), ''
        # ignore comma at start of lines
        if line.startswith(','):
            line, prefix = line[1:], ','

        j = json.loads(line)
        j.insert(-1, get_spotify_status())
        # and echo back new encoded json
        print_line(prefix+json.dumps(j))

if __name__ == '__main__':
    main()

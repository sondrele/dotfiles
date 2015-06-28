#!/usr/bin/env python
# -*- coding: utf-8 -*-

import sys
import subprocess

def exec_command(command):
    return subprocess.check_output(command, shell=True)

def handle_command(cmd):
    spotify = 'qdbus org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 %s'
    if cmd == 'next':
        ctrl = spotify % 'org.mpris.MediaPlayer2.Player.Next'
    elif cmd == 'prev':
        ctrl = spotify % 'org.mpris.MediaPlayer2.Player.Previous'
    elif cmd == 'playpause':
        ctrl = spotify % 'org.mpris.MediaPlayer2.Player.PlayPause'
    exec_command(ctrl)

def main():
    if len(sys.argv) == 2:
        handle_command(sys.argv[1])
    else:
        print """
        Argument:
            'next', 'prev' or 'playpause'
        Example:
            $ ./spotify-ctrl.py next
        """

if __name__ == '__main__':
    main()
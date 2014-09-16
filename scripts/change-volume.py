#!/usr/bin/env python

import subprocess
import sys
import re

def extract_volume(regex, data):
    volume = re.compile(regex).findall(data)
    if volume:
        return int(volume[0])
    return 0

def exec_command(command):
    return subprocess.check_output(command, shell=True)

def get_system_volume():
    output = exec_command('amixer -c0 get Master,0')
    volume = extract_volume('(?=[[0-9]+%])[0-9]+', output)
    return volume

def set_system_volume(volume):
    exec_command('amixer -c0 set Master,0 %d%%' % volume)

def increase_volume(percentage):
    new_volume = get_system_volume() + percentage
    set_system_volume(min(100, new_volume))

def decrease_volume(percentage):
    new_volume = get_system_volume() - percentage
    set_system_volume(max(0, new_volume))

def handle_volume_arg(arg):
    incr_vol = extract_volume('(?<=\+)[0-9]+', arg)
    decr_vol = extract_volume('(?<=-)[0-9]+', arg)
    if incr_vol:
        increase_volume(incr_vol)
    elif decr_vol:
        decrease_volume(decr_vol)

if __name__ == '__main__':
    if len(sys.argv) == 2:
        handle_volume_arg(sys.argv[1])
    else:
        print """
        Argument:
            String with '+' or '-' and a number to change the volume.
        Example:
            $ ./change_volume.py +10 # increase current volume with 10%
            $ ./change_volume.py -15 # decrease current volume with 15%
        """

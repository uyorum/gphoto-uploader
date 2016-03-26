#!/bin/bash

INSTALLER=/tmp/gpautobackup_setup.exe
REG=/tmp/gphoto.reg
EXE="$HOME/.wine/drive_c/users/$(whoami)/Local Settings/Application Data/Programs/Google/Google Photos Backup/Google Photos Backup.exe"

export DISPLAY=:1
rm -f /tmp/.X1-lock
Xvfb :1 -screen 0 1024x768x24 &
x11vnc -display :1 -bg -nopw -listen 0.0.0.0 -ncache 10

if [ ! -f "$EXE" ]; then
  wine regedit /s "$REG"
  wine "$INSTALLER"
else
  wine "$EXE"
fi

tail -f /dev/null

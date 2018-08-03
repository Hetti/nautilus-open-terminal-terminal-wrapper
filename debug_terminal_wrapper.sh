#!/bin/sh
# Following command+parameters are executed from nautilus-open-terminal-wrapper:
# $0 =/usr/bin/xterm
# $1=-e
# $2=/bin/sh
# $3="-c"
# $4=cd <PATH> && exec $SHELL

# set here your prefered terminal emulator
TERM="/usr/bin/termite"
# exec option by your terminal
EXECOPTION="-e"
# if existent set the directory option for your terminal, else you need to change Line 29 to your needs.
DIROPTION="-d"

echo "printing 0: $0"
echo "printing 1: $1"
echo "printing 2: $2"
echo "printing 3: $3"
echo "printing 4: $4"

# Get the directory path of parameter 4
# Modified regex from https://www.linuxquestions.org/questions/programming-9/bash-grep-regex-validation-for-path-names-926900/#post4590415
# Thanks to Dr_P_Ross
DIRECTORY=`echo $4 | grep -o -E -e '/[-_A-Za-z0-9:]+(/[-_A-Za-z0-9:]*)*'`
echo "following dir found: $DIRECTORY"
echo "running following command: $TERM $1 $SHELL $DIROPTION $DIRECTORY"

$TERM $1 $SHELL $DIROPTION $DIRECTORY

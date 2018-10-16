#!/bin/sh
#v0.1.33.7
# set here your prefered terminal emulator
TERM="/usr/bin/termite"
# exec option by your terminal
EXECOPTION="-e"
# if existent set the directory option for your terminal, else you need to change Line 15 to your needs.
DIROPTION="-d"

# Get the directory path of parameter 4
# Modified regex from https://www.linuxquestions.org/questions/programming-9/bash-grep-regex-validation-for-path-names-926900/#post4590415
# Thanks to Dr_P_Ross
DIRECTORY=$(echo $4 | grep -o -E -e '/[-_A-Za-z0-9]+(/[-_A-Za-z0-9:=.[:space:]]*)*')

"${TERM}" "${EXECOPTION}" "${SHELL}" "${DIROPTION}" "${DIRECTORY}"

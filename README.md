# not-tw (nautilus-open-terminal-terminal-wrapper)
A shell wrapper for the nautilus-open-terminal plugin that works with other terminals than on the hardcoded list.

## Problem
If you use [Gnome Nautilus](https://wiki.archlinux.org/index.php/GNOME/Files) with the nautilus-open-terminal plugin ([AUR Link](https://aur.archlinux.org/packages/nautilus-open-terminal-git/)), which opens a terminal in the current folder, and don't have installed on of the hardcoded terminals it won't do anything on click...  
GLib have a hardcoded terminal list [[1]](https://gitlab.gnome.org/GNOME/glib/blob/master/gio/gdesktopappinfo.c#L2498) and the plugin depends on GLib.  
`Hardcoded list (in order): gnome-terminal, nxterm, color-xterm, rxvt, dtterm and finally xterm even if it isn't installed.` See the commment of ([Cj-Malone from 2018-05-10 14:04](https://aur.archlinux.org/packages/nautilus-open-terminal-git/))

### Solution
My solution consists of implementing a wrapper which invokes the desired terminal + shell with the desired path.  
My wrapper is implemented for termite in conjunction with zsh, but with the variables `TERM`, `EXECOPTION` and `DIROPTION` you can modify the wrapper to your needs.  

You need to create the symlink `/usr/bin/xterm` to the wrapper.
You can do that via `ln -s <PATH TO WRAPPER> /usr/bin/xterm` , you will probably need to do that as root or via `sudo` because of the default folder permissions in `/usr/bin/`  
Note: Don't forget to set the wrapper executable via `chmod +x terminal-wrapper.sh`  

It's implemented to run with `/bin/sh`  
There are two shell scripts:
 * `terminal_wrapper.sh`: cleaned up wrapper script
 * `debug_terminal_wrapper.sh`: debug script with some debug output

### Invoked argv parameters by the plugin:
Following argv parameters are invoked if the plugin comes to the last hardcoded terminal:
```
# $0 =/usr/bin/xterm
# $1=-e
# $2=/bin/sh
# $3="-c"
# $4=cd <PATH> && exec $SHELL
```

### Example invoke for termite
`termite -e /bin/zsh -d '/home/user/Desktop'`   
For more information about the parameters check out the man page for termite

### Other terminals
As stated in the Solution section it's possible to configure the script with the 3 variables to be used also with other terminal emulators.


#Releases
v0.1.33.7 - initial release


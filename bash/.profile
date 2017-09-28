# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# Default editor
export EDITOR=vim

# turn on 256-color terminal
export TERM=xterm-256color

# Remap capslock as follows:
#  - capslock tap means "escape"
#  - capslock + key means ctrl + key
#  - left control means capslock
setxkbmap -option 'ctrl:swapcaps'
if command -v xcape 2>/dev/null; then
    xcape -e 'Control_L=Escape'
fi

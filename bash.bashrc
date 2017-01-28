# To the extent possible under law, the author(s) have dedicated all 
# copyright and related and neighboring rights to this software to the 
# public domain worldwide. This software is distributed without any warranty. 
# You should have received a copy of the CC0 Public Domain Dedication along 
# with this software. 
# If not, see <http://creativecommons.org/publicdomain/zero/1.0/>. 

# base-files version 4.2-4

# /etc/bash.bashrc: executed by bash(1) for interactive shells.

# The latest version as installed by the Cygwin Setup program can
# always be found at /etc/defaults/etc/bash.bashrc

# Modifying /etc/bash.bashrc directly will prevent
# setup from updating it.

# System-wide bashrc file

# Check that we haven't already been sourced.
[[ -z ${CYG_SYS_BASHRC} ]] && CYG_SYS_BASHRC="1" || return

# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

# Exclude *dlls from TAB expansion
export EXECIGNORE="*.dll"

# Set a default prompt of: user@host and current_directory
PS1='\[\e]0;\w\a\]\n\[\e[32m\]\u@\h \[\e[33m\]\w\[\e[0m\]\n\$ '

# Uncomment to use the terminal colours set in DIR_COLORS
# eval "$(dircolors -b /etc/DIR_COLORS)"

#USE_TMUX=1
#trap "clear && banner \"stop tmux\" && USE_TMUX=0" SIGINT

set | /usr/bin/grep "RUN_TMUX" > /dev/null
if [ $? = 1 ];then
    export RUN_TMUX=1
    #if [ `tput lines` = "28" ];then
    #    cat ~/iimg/simg.iimg
    #else
    #    cat ~/iimg/bimg.iimg
    #fi
    #sleep 1
    #    if [ $USE_TMUX = "1" ];then 
    touch /etc/totalExit
    tmux
    if [ -f /etc/totalExit ];then
        rm -f /etc/totalExit
        exit
    fi
    RUN_TMUX=0
    clear
    #    fi
fi

#!/bin/bash

# User specific aliases and functions

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi


function tonka2 {

#   Named "Tonka" because it was originally just blue and yellow, it also
#   reminds me on constructor sets ...

local GRAY="\[\033[1;30m\]"
local LIGHT_GRAY="\[\033[0;37m\]"
local WHITE="\[\033[1;37m\]"
local LIGHT_BLUE="\[\033[1;31m\]"
local LIGHT_RED="\[\033[1;30m\]"
local YELLOW="\[\033[1;32m\]"

case $TERM in
    xterm*)
        TITLEBAR='\[\033]0;\u@\h:\w\007\]'
        ;;
    *)
        TITLEBAR=""
        ;;
esac

PS1="$TITLEBAR
$LIGHT_BLUE-($YELLOW\u$LIGHT_BLUE@$YELLOW\h$LIGHT_BLUE)-($YELLOW$PWD$LIGHT_BLUE)-     $(date) $YELLOW-$LIGHT_GRAY
$YELLOW>>$WHITE" 
}

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib64/openmpi/lib/

export CHARMMEXEC=/home/pojedama/c36a1_ensemble/exec/gnu
export CHARMMDATA=/home/pojedama/c36a1_ensemble/toppar
export MMTSBDIR=/home/pojedama/SOURCE/mmtsb_toolset

export PATH=$PATH:/usr/sbin/:/usr/local/bin:/home/pojedama/SOURCE/GNUPLOT/bin:/home/pojedama/SOURCE/VMD/bin:/home/pojedama/SOURCE/NAMD_2.8_Linux-x86:/usr/local/grace/bin/:$MMSTBDIR/bin:$MMTSBDIR/perl:/home/pojedama/:/home/pojedama/SOURCE/bin/

export HISTCONTROL=erasedups
export HISTSIZE=100000
export HISTFILESIZE=100000
shopt -s histappend
#export CHARMM_PATH=/N/hd02/pojedama/Quarry/c36a1_work_local/exec/em64t/
export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'

PROMPT_COMMAND='tonka2;history -a'


#	If you have an application that depends on the EDITOR variable,
# uncomment one of the lines below, or set your own in the same pattern.
#export EDITOR=/bin/vi
export EDITOR=/usr/bin/vim
#export EDITOR=/usr/bin/nano
#export EDITOR=/usr/bin/mcedit
#  For the real masochists...
#export EDITOR=/bin/ed

alias na='nano -c'

#vim macro for less
alias less='/usr/share/vim/vim72/macros/less.sh'

export P4_GLOBMEMSIZE=32000000

#Some useful aliases
alias lh='ls -lahrt'
alias gr='grep -rine'
alias tn='tail -n300'
alias tf='tail -fn300'

#to use vim syntax in bash
set -o vi

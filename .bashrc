#
# ~/.bashrc
#

export QT_SCALE_FACTOR=1

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# Added by LM Studio CLI (lms)
export PATH="$PATH:/home/martin/.lmstudio/bin"

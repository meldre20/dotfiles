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

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/miniforge/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/miniforge/etc/profile.d/conda.sh" ]; then
        . "/opt/miniforge/etc/profile.d/conda.sh"
    else
        export PATH="/opt/miniforge/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Added by Antigravity CLI installer
export PATH="/home/martin/.local/bin:$PATH"

# plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

## User configuration ##

# Spotify
if ! pgrep -x spotifyd > /dev/null; then
    spotifyd
fi

# ENV Variables
export CHROME_EXECUTABLE="/usr/bin/brave"
export CRYPTOGRAPHY_OPENSSL_NO_LEGACY=1     # Enabling this gets conda to stop whining
export DEBUGINFOD_URLS="https://debuginfod.archlinux.org"
export GOPATH=/home/martin/.go
export GTK_IM_MODUlE='fcitx'
export JAVA_HOME="/usr/lib/jvm/java-22-openjdk"
export QT_IM_MODULE='fcitx'
export QT_AUTO_SCREEN_SCALE_FACTOR=0
export QT_SCALE_FACTOR=0.5
export SDL_IM_MODULE='fcitx'
export XMODIFIERS='@im=fcitx'

# esp32 stuff 
# . $HOME/.cargo/export-esp.sh
# alias get_idf=". $HOME/.local/share/esp/esp-idf/export.sh"

# Aliases
alias cleanup="yay -Rns $(pacman -Qdtq)"
alias config="git --git-dir=$HOME/.config/dotfiles/ --work-tree=$HOME"
alias spt="spotifyd && spt"
alias vim="nvim"


# PATH
export PATH="$PATH:/home/martin/.local/bin"
export PATH="$PATH:/opt/flutter/bin"
export PATH="$PATH:/opt/android/bin"
export PATH="$PATH:/opt/pulsar"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/.go/bin"

# Commands to run on init 

# Added by LM Studio CLI (lms)
export PATH="$PATH:/home/martin/.lmstudio/bin"

# Conda
[ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh

# Enable starship promopt
eval "$(starship init zsh)"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/miniforge/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
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

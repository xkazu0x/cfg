export ZDOTDIR="$HOME/.config/zsh"

export EDITOR="nvim"
export TERMINAL="ghostty"
export BROWSER="brave"

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
    startx
fi

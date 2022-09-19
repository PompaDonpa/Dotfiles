#  ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
# ░▓    CONFIGURATION                     ▓
# ░▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
# ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
NO_COLOUR="\[\033[0m\]"

COLOR_BLACK="\e[0;30m"
COLOR_BLUE="\e[0;34m"
COLOR_GREEN="\e[0;32m"
COLOR_CYAN="\e[0;36m"
COLOR_PINK="\e[0;35m"
COLOR_RED="\e[0;31m"
COLOR_GRAY="\033[1;38;5;243m"
COLOR_PURPLE="\e[0;35m"
COLOR_BROWN="\e[0;33m"
COLOR_LIGHTGRAY="\e[0;37m"
COLOR_DARKGRAY="\e[1;30m"
COLOR_LIGHTBLUE="\e[1;34m"
COLOR_LIGHTGREEN="\e[1;32m"
COLOR_LIGHTCYAN="\e[1;36m"
COLOR_LIGHTRED="\e[1;31m"
COLOR_LIGHTPURPLE="\e[1;35m"
COLOR_YELLOW="\e[1;33m"
COLOR_WHITE="\e[1;37m"
COLOR_NONE="\e[0m"

if [ -z "$TMUX" ]; then
    export TERM=xterm-256color-italic
else
    export TERM=tmux-256color
fi

title() {
    echo -e "\n ${COLOR_PURPLE}$1${COLOR_NONE}"
    echo -e " ${COLOR_GRAY}==============================${COLOR_NONE}\n"
}

error() {
    echo -e "${COLOR_RED} Error: ${COLOR_NONE}$1"
    tput bel
    return
}

warning() {
    echo -e "${COLOR_YELLOW} Warning: ${COLOR_NONE}$1"
}

info() {
    echo -e "${COLOR_BLUE} Info: ${COLOR_YELLOW}$1"
}

usage() {
  echo -e "${COLOR_LIGHTRED} Usage: ${COLOR_WHITE}$1 ${COLOR_YELLOW}$2"
}

success() {
    echo -e " ${COLOR_LIGHTGREEN}$1 ${COLOR_NONE}"
    tput bel
}


if [[ -d $HOME/Dotfiles/zsh/functions ]]; then
    for func in $HOME/Dotfiles/zsh/functions/*(:t); autoload -U $func
fi


setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Git Fuzzy
export GF_GREP_COLOR='1;30;48;5;15'


prepend_path /usr/local/opt/grep/libexec/gnubin
prepend_path /usr/local/sbin
prepend_path $DOTFILES/bin
prepend_path $HOME/bin

# display how long all tasks over 10 seconds take
export REPORTTIME=10
export KEYTIMEOUT=1              # 10ms delay for key sequences

setopt NO_BG_NICE
setopt NO_HUP                    # don't kill background jobs when the shell exits
setopt NO_LIST_BEEP
setopt LOCAL_OPTIONS
setopt LOCAL_TRAPS
setopt PROMPT_SUBST

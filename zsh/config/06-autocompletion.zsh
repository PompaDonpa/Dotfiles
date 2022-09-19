#  ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
# ░▓            AUTOCOMPLETION            ▓
# ░▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
# ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

#█▓▒░ Notify ░▒▓█

# Set a custom title for error and success notifications, when using the built-in notifier.
# https://github.com/marzocchi/zsh-notify
zstyle ':notify:*' error-title "Command failed"
zstyle ':notify:*' success-title "Command finished"
zstyle ':notify:*' error-sound "Glass"
zstyle ':notify:*' success-sound "default"

#█▓▒░ Completion ░▒▓█

# matches case insensitive for lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# pasting with tabs doesn't perform completion
zstyle ':completion:*' insert-tab pending
# default to file completion
zstyle ':completion:*' completer _expand _complete _files _correct _approximate
# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

zstyle ':completion:*' menu select
zstyle ':completion:*' menu select=5

# preview directory's content with exa when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
# switch group using `,` and `.`
# zstyle ':fzf-tab:*' switch-group ',' '.'
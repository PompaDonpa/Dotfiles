#  ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
# ░▓            AUTOCOMPLETION            ▓
# ░▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
# ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

#█▓▒░ Compinit ░▒▓█

autoload -Uz compinit add-zsh-hook
typeset -i updated_at=$(date +'%j' -r ~/.zcompdump 2>/dev/null || stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)
if [ $(date +'%j') != $updated_at ]; then
  compinit -i
else
  compinit -C -i
fi


#█▓▒░ Ztyle ░▒▓█

#█▓▒░ Notify
# Set a custom title for error and success notifications, when using the built-in notifier.
# https://github.com/marzocchi/zsh-notify
zstyle ':notify:*' error-title "Command failed"
zstyle ':notify:*' success-title "Command finished"
zstyle ':notify:*' error-sound "Glass"
zstyle ':notify:*' success-sound "default"
zstyle ':notify:*' activate-terminal yes
zstyle ':notify:*' check-focus no

#█▓▒░ Completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'# matches case insensitive for lowercase
zstyle ':completion:*' insert-tab pending # pasting with tabs doesn't perform completion
zstyle ':completion:*' completer _expand _complete _files _correct _approximate # default to file completion
zstyle ':completion:*:git-checkout:*' sort false # disable sort when completing `git checkout`
zstyle ':completion:*:descriptions' format '[%d]' # set descriptions format to enable group support
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} # set list-colors to enable filename colorizing

#█▓▒░ Fzf-tab
# preview directory's content with exa when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
# zstyle ':fzf-tab:*' switch-group ',' '.' # switch group using `,` and `.`



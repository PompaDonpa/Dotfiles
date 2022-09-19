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

#█▓▒░ Prezto ░▒▓█

zstyle ':prezto:module:prompt' theme 'powerlevel10k'
zstyle ':prezto:*:*' color 'yes'
# Set the Prezto modules to load (browse modules).
# The order matters.
zstyle ':prezto:load' pmodule \
  'autosuggestions' \
  'history-substring-search' \
  'prompt' \
  'spectrum' \
  'editor' \
  'syntax-highlighting' \
  'node' \
# Set the query found color.
zstyle ':prezto:module:autosuggestions:color' found ''

#█▓▒░ Set syntax highlighters.
# By default, only the main highlighter is enabled.
zstyle ':prezto:module:syntax-highlighting' highlighters \
  'main' \
  'brackets' \
  'pattern' \
  'line' \
  'cursor' \
  'root'
# Set syntax highlighting styles.
zstyle ':prezto:module:syntax-highlighting' styles \
  'builtin' 'bg=blue' \
  'command' 'bg=blue' \
  'function' 'bg=blue'
# Set syntax pattern styles.
zstyle ':prezto:module:syntax-highlighting' pattern \
  'rm*-rf*' 'fg=white,bold,bg=red'

#█▓▒░ Editor
# Auto convert .... to ../..
zstyle ':prezto:module:editor' dot-expansion 'yes'

#█▓▒░ Git
# Ignore submodules when they are 'dirty', 'untracked', 'all', or 'none'.
# zstyle ':prezto:module:git:status:ignore' submodules 'all'

#█▓▒░ Terminal
# Auto set the tab and window titles.
# zstyle ':prezto:module:terminal' auto-title 'yes'
# Set the window title format.
# zstyle ':prezto:module:terminal:window-title' format '%n@%m: %s'
# Set the tab title format.
# zstyle ':prezto:module:terminal:tab-title' format '%m: %s'
# Set the terminal multiplexer title format.
# zstyle ':prezto:module:terminal:multiplexer-title' format '%s'

#█▓▒░ Tmux
# Auto start a session when Zsh is launched in a local terminal.
# zstyle ':prezto:module:tmux:auto-start' local 'yes'
# Auto start a session when Zsh is launched in a SSH connection.
# zstyle ':prezto:module:tmux:auto-start' remote 'yes'
# Integrate with iTerm2.
# zstyle ':prezto:module:tmux:iterm' integrate 'yes'
# Set the default session name:
# zstyle ':prezto:module:tmux:session' name 'YOUR DEFAULT SESSION NAME'

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

# preview directory's content with exa when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
# switch group using `,` and `.`
# zstyle ':fzf-tab:*' switch-group ',' '.'
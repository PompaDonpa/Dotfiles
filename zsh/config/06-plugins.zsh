#  ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
# ░▓            PLUGIN SETUP              ▓
# ░▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
# ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

#█▓▒░ Source Zplug ░▒▓█
if [[ -r "$HOME/.zplug/init.zsh" ]]; then
  source "$HOME/.zplug/init.zsh"
fi

#█▓▒░ ZPLUG ░▒▓█
zplug "Peltoche/lsd"
# LSD colorizes the ls output with color and icons
zplug "modules/prompt", from:prezto
# Loads modules from Prezto
zplug "plugins/git",   from:oh-my-zsh
# A tab-completion library for Git
zplug "plugins/osx",   from:oh-my-zsh
# Provides a few utilities for macOS
zplug "clvv/fasd"
# Offers quick access to files and directories for POSIX shells
zplug "b4b4r07/enhancd"
# A next-generation cd command with an interactive filter
zplug "zsh-users/zsh-autosuggestions", defer:2
# Fish-like fast/unobtrusive auto-suggestions for zsh
zplug "zsh-users/zsh-syntax-highlighting", defer:3
# Fish-like fast/unobtrusive syntax-highlighting for zsh

zplug "grigorii-zander/zsh-npm-scripts-autocomplete", as:plugin, defer:3
# This plugin shows autocomplete suggestions for npm
zplug "chriskempson/base16-shell", from:github
# A shell script to change your shell's default ANSI colors
zplug "marzocchi/zsh-notify", as:plugin
# Desktop notifications for long-running commands in ZSH
zplug "wfxr/forgit"
# interact with git more efficiently
zplug "zsh-users/zsh-history-substring-search", defer:3
# Fish-like fast/unobtrusive history-substring-search for zsh
zplug "g-plane/zsh-yarn-autocompletions", defer:3
# Adds common aliases and completion for the Yarn package manager

zplug "romkatv/powerlevel10k", as:theme, depth:1
# Powerlevel10k theme for zsh with configuration wizard
zplug "mafredri/zsh-async", from:"github", use:"async.zsh" if:"[[ $OSTYPE == *darwin* ]]"
# You can run multiple asynchronous jobs, enforce unique jobs 

# zplug "Aloxaf/fzf-tab", from:github, use:fzf-tab.plugin.zsh, defer:3

if ! zplug check --verbose; then
  printf "Install? [y/N]: "
    if read -q; then
      echo; zplug install
    fi
fi

zplug load

# AUTOSUGGESTIONS: Bind UP and DOWN arrow keys for subsString search.
if zplug check zsh-users/zsh-history-substring-search; then
  zmodload zsh/terminfo
  bindkey "^[^[[A" history-substring-search-up
  bindkey "^[^[[B" history-substring-search-down
fi

#█▓▒░ FZF ░▒▓█
# https://github.com/junegunn/fzf/issues/1565
# source /usr/share/zsh/vendor-completions/_fzf
if [[ "$(uname)" == "Linux" ]]; then
  source /usr/share/doc/fzf/examples/key-bindings.zsh
else
  source /opt/homebrew/opt/fzf/shell/key-bindings.zsh
  source /opt/homebrew/opt/fzf/shell/completion.zsh
fi

[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh


#█▓▒░ POWERLEVEL 10K ░▒▓█
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


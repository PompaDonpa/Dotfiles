#  ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
# ░▓            PLUGIN SETUP              ▓
# ░▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
# ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

#█▓▒░ Source Prezto ░▒▓█

if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

if [[ -r "$HOME/.zplug/init.zsh" ]]; then
  source "$HOME/.zplug/init.zsh"
fi

autoload -Uz promptinit
promptinit
prompt powerlevel10k

#█▓▒░ ZPLUG ░▒▓█
# zplug "Peltoche/lsd"
# LSD colorizes the ls output with color and icons

#zplug "zsh-users/zsh-syntax-highlighting", defer:3
# Fish-like fast/unobtrusive syntax-highlighting for zsh

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
zplug "zsh-users/zsh-history-substring-search", defer:3
# Fish-like fast/unobtrusive history-substring-search for zsh
zplug "g-plane/zsh-yarn-autocompletions", defer:3
# Adds common aliases and completion for the Yarn package manager
zplug "romkatv/powerlevel10k", as:theme, depth:1
# Powerlevel10k theme for zsh with configuration wizard
zplug "mafredri/zsh-async", from:"github", use:"async.zsh" if:"[[ $OSTYPE == *darwin* ]]"
# You can run multiple asynchronous jobs, enforce unique jobs 

if ! zplug check --verbose; then
  printf "Install? [y/N]: "
    if read -q; then
      echo; zplug install
    fi
fi

zplug load

# AUTOSUGGESTIONS: Bind UP and DOWN arrow keys for subsstring search.
if zplug check zsh-users/zsh-history-substring-search; then
  zmodload zsh/terminfo
  bindkey "^[^[[A" history-substring-search-up
  bindkey "^[^[[B" history-substring-search-down
fi

#█▓▒░ ZFETCH ░▒▓█

export ZPLUGDIR="$HOME/.local/share/zsh/plugins"
[[ -d "$ZPLUGDIR" ]] || mkdir -p "$ZPLUGDIR"
# array containing plugin information (managed by zfetch)
typeset -A plugins

# zfetch mafredri/zsh-async async.plugin.zsh 
# zfetch chriskempson/base16-shell
# zfetch zsh-users/zsh-syntax-highlighting
# zfetch zsh-users/zsh-autosuggestions
zfetch grigorii-zander/zsh-npm-scripts-autocomplete
zfetch marzocchi/zsh-notify
# zfetch Aloxaf/fzf-tab
zfetch wfxr/forgit


#█▓▒░ POWERLEVEL 10K ░▒▓█
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
# typeset -g POWERLEVEL9K_INSTANT_PROMPT=off


#█▓▒░ FZF ░▒▓█
# https://github.com/junegunn/fzf/issues/1565
# source /usr/share/zsh/vendor-completions/_fzf
if [[ "$(uname)" == "Linux" ]]; then
    source /usr/share/doc/fzf/examples/key-bindings.zsh
fi

[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh


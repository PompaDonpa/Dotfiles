#  ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
# ░▓            PLUGIN SETUP              ▓
# ░▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
# ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

#█▓▒░ Source Prezto ░▒▓█

if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

if [[ -s "${ZDOTDIR:-$HOME}/.zplug/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zplug/init.zsh"
fi

autoload -Uz promptinit
promptinit
prompt powerlevel10k

#█▓▒░ ZPLUG ░▒▓█

zplug "plugins/git",   from:oh-my-zsh
zplug "plugins/osx",   from:oh-my-zsh
zplug "clvv/fasd"
zplug "b4b4r07/enhancd"
zplug "Peltoche/lsd"
zplug "zsh-users/zsh-syntax-highlighting" defer:3
zplug "zsh-users/zsh-autosuggestions"
zplug "g-plane/zsh-yarn-autocompletions"
zplug "romkatv/powerlevel10k", as:theme, depth:1
zplug "mafredri/zsh-async", from:"github", use:"async.zsh" if:"[[ $OSTYPE == *darwin* ]]"

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load --verbose

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
zfetch Aloxaf/fzf-tab
zfetch wfxr/forgit


#█▓▒░ POWERLEVEL 10K ░▒▓█
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
typeset -g POWERLEVEL9K_INSTANT_PROMPT=off


#█▓▒░ FZF ░▒▓█
# https://github.com/junegunn/fzf/issues/1565
# source /usr/share/zsh/vendor-completions/_fzf
if [[ "$(uname)" == "Linux" ]]; then
    source /usr/share/doc/fzf/examples/key-bindings.zsh
fi

[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh


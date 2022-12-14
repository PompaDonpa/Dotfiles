#  ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
# ░▓            ENVIRONMENT               ▓
# ░▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
# ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

#█▓▒░ Preferred text editor ░▒▓█
local nvimdir=$(command -v nvim)
local codedir=$(command -v code)
local lunadir="$HOME/.local/bin/lvim"
export GIT_EDITOR="$lunadir"

#█▓▒░ Editors
if [[ -z "$EDITOR" ]]; then
  export EDITOR="$lunadir"
fi
if [[ -z "$VISUAL" ]]; then
  export VISUAL="$codedir"
fi

#█▓▒░ Clipboard
if [[ "$(uname)" == "Linux" ]]; then
  export CLIPBOARD=xclip
else
  export CLIPBOARD=pbcopy
fi

#█▓▒░ Custom Config ░▒▓█
export DISPLAY='localhost:0.0'
export GATEWAY="$DOTFILES/applescripts/gateway.applescript"
export LG_CONFIG_FILE="$DOTFILES/config/lazygit/config.yml" lazygit

#█▓▒░ Language ░▒▓█
export LC_COLLATE=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_MESSAGES=en_US.UTF-8
export LC_MONETARY=en_US.UTF-8
export LC_NUMERIC=en_US.UTF-8
export LC_TIME=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LESSCHARSET=utf-8

#█▓▒░ Custom paths ░▒▓█
export BASE16_HOME="$HOME/.zplug/repos/chriskempson/base16-shell/scripts"
export BAT_CONFIG_PATH="$DOTFILES/config/bat"
export GOPATH=$HOME/go-code
export GOBIN=$GOPATH/bin

# Add a config file for ripgrep
export RIPGREP_CONFIG_PATH="$HOME/.rgrc"

# Terminfo
[[ -e ~/.terminfo ]] && export TERMINFO_DIRS=~/.terminfo:/usr/share/terminfo

# Pnpm
export PNPM_HOME="$HOME/Library/pnpm"

# Nvm
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"


#█▓▒░ PATH ░▒▓█
export JAVA_HOME="$(/usr/libexec/java_home -v11)"
export ANDROID_HOME=~/ANDROID/android-sdk
export ANDROID_SDK_ROOT=$ANDROID_HOME
export ANDROID_NDK=~/ANDROID/android-ndk
export ANDROID_NDK_HOME=~/ANDROID/android-ndk

export PATH=$PATH:$JAVA_HOME/bin:$ANDROID_HOME/emulator:$ANDROID_HOME/cmdline-tools/tools:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$ANDROID_HOME/cmdline-tools/tools/bin:$FORGIT_INSTALL_DIR/bin:$PNPM_HOME:$BASE16_HOME
#::$HOME/.dotfiles/share/zsh/plugins/forgit/bin:$HOME/.dotfiles/share/zsh/plugins/git-fuzzy/bin


#█▓▒░ Evals ░▒▓█
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init --path)"

if [[ -x "$(command -v fnm)" ]]; then
    eval "$(fnm env --use-on-cd)"
fi

# https://unix.stackexchange.com/questions/91937/mac-os-x-dircolors-not-found
LS_COLORS="$HOME/.dircolors"
if whence dircolors >/dev/null; then
  export LS_COLORS
  eval "$(dircolors -b)";
else
  export CLICOLOR=1
  export LSCOLORS="GxFxCxDxBxegedabagaced" # Dark Terminals
  # export LSCOLORS="ExFxBxDxCxegedabagacad" # Light Terminals
fi

#█▓▒░ Base16 Shell ░▒▓█
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        source "$BASE16_SHELL/profile_helper.sh"
        
# base16_default

eval "$(direnv hook zsh)"

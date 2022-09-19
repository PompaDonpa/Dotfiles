#!/usr/bin/env bash

# DotFiles Inspiration
# https://dotfiles.github.io/inspiration/
# Dotfiles colors & guide
# https://www.lihaoyi.com/post/BuildyourownCommandLinewithANSIescapecodes.html

DOTFILES="$(pwd)"
COLOR_GRAY="\033[1;38;5;243m"
COLOR_BLUE="\033[1;34m"
COLOR_GREEN="\033[1;32m"
COLOR_RED="\033[1;31m"
COLOR_PURPLE="\033[1;35m"
COLOR_YELLOW="\033[1;33m"
COLOR_NONE="\033[0m"

title() {
    echo -e "\n${COLOR_PURPLE}$1${COLOR_NONE}"
    echo -e "${COLOR_GRAY}==============================${COLOR_NONE}\n"
}

error() {
    echo -e "${COLOR_RED}Error: ${COLOR_NONE}$1"
    exit 1
}

warning() {
    echo -e "${COLOR_YELLOW}Warning: ${COLOR_NONE}$1"
}

info() {
    echo -e "${COLOR_BLUE}Info: ${COLOR_NONE}$1"
}

success() {
    echo -e "${COLOR_GREEN}$1${COLOR_NONE}"
}

get_linkables() {
    find -H ~/Dotfiles -maxdepth 3 -name '*.symlink'
}

backup() {
    BACKUP_DIR=~/Dotfiles-Backup

    echo "Creating backup directory at $BACKUP_DIR"
    sudo mkdir -p "$BACKUP_DIR"

    for file in $(get_linkables); do
        filename=".$(basename "$file" '.symlink')"
        target="$HOME/$filename"
        if [ -f "$target" ]; then
            echo "backing up $filename"
            cp "$target" "$BACKUP_DIR"
        else
            warning "$filename does not exist at this location or is a symlink"
        fi
    done

    for filename in "$HOME/.config/nvim" "$HOME/.vim" "$HOME/.vimrc"; do
        if [ ! -L "$filename" ]; then
            echo "backing up $filename"
            sudo cp -rf "$filename" "$BACKUP_DIR"
        else
            warning "$filename does not exist at this location or is a symlink"
        fi
    done
}


setup_symlinks() {
    title "Creating symlinks"

    for file in $(get_linkables) ; do
        target="$HOME/.$(basename "$file" '.symlink')"
        if [ -e "$target" ]; then
            info "~${target#$HOME} already exists... Skipping."
        else
            info "Creating symlink for $file"
            ln -s "$file" "$target"
        fi
    done

    echo -e
    info "installing to ~/.config"
    if [ ! -d "$HOME/.config" ]; then
        info "Creating ~/.config"
        mkdir -p "$HOME/.config"
    fi

    config_files=$(find "~/Dotfiles/config" -maxdepth 1 2>/dev/null)
    for config in $config_files; do
        target="$HOME/.config/$(basename "$config")"
        if [ -e "$target" ]; then
            info "~${target#$HOME} already exists... Skipping."
        else
            info "Creating symlink for $config"
            ln -s "$config" "$target"
        fi
    done
}

setup_git() {
    title "Setting up Git"

    defaultName=$(git config user.name)
    defaultEmail=$(git config user.email)
    defaultGithub=$(git config github.user)

    read -rp "Name [$defaultName] " name
    read -rp "Email [$defaultEmail] " email
    read -rp "Github username [$defaultGithub] " github

    git config -f ~/.gitconfig-local user.name "${name:-$defaultName}"
    git config -f ~/.gitconfig-local user.email "${email:-$defaultEmail}"
    git config -f ~/.gitconfig-local github.user "${github:-$defaultGithub}"

    if [[ "$(uname)" == "Darwin" ]]; then
        git config --global credential.helper "osxkeychain"
    else
        read -rn 1 -p "Save user and password to an unencrypted file to avoid writing? [y/N] " save
        if [[ $save =~ ^([Yy])$ ]]; then
            git config --global credential.helper "store"
        else
            git config --global credential.helper "cache --timeout 3600"
        fi
    fi
}

setup_homebrew() {
    title "Setting up Homebrew"

    if test ! "$(command -v brew)"; then
        info "Homebrew not installed. Installing."
        # Run as a login shell (non-interactive) so that the script doesn't pause for user input
        curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash --login
    fi

    if [ "$(uname)" == "Linux" ]; then
        test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
        test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
        test -r ~/.bash_profile && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.bash_profile
    fi

    # install brew dependencies from Brewfile
    brew bundle

    # install fzf
    echo -e
    info "Installing fzf"
    "$(brew --prefix)"/opt/fzf/install --key-bindings --completion --no-update-rc --no-bash --no-fish
}

setup_shell() {
    title "Configuring shell"

    [[ -n "$(command -v brew)" ]] && zsh_path="$(brew --prefix)/bin/zsh" || zsh_path="$(which zsh)"
    if ! grep "$zsh_path" /etc/shells; then
        info "adding $zsh_path to /etc/shells"
        echo "$zsh_path" | sudo tee -a /etc/shells
    fi

    if [[ "$SHELL" != "$zsh_path" ]]; then
        chsh -s "$zsh_path"
        info "default shell changed to $zsh_path"
    fi

    title "Installing Zprezto - Cloning"
    sudo git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
    echo
    title "Linking Zprezto - Open a new Terminal and copy/paste ⇣⇣⇣ + Enter"
    echo "setopt EXTENDED_GLOB"
    echo "for rcfile in "${ZDOTDIR:-$HOME}/.zprezto/runcoms/^README.md(.N)"; do"
    echo "    ln -s \"$rcfile\" \"${ZDOTDIR:-$HOME}/.${rcfile:t}\""
    echo "done"
    warning "Press a key to continue..."
    read user_continue

    git clone https://github.com/Aloxaf/fzf-tab $ZPREZTODIR/contrib/fzf-tab

    title "Installin ZPLUG"
    curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

}

setup_terminfo() {
    title "Configuring terminfo"

    info "adding tmux.terminfo"
    sudo tic -x "~/Dotfiles/resources/tmux.terminfo"

    info "adding xterm-256color-italic.terminfo"
    sudo tic -x "~/Dotfiles/resources/xterm-256color-italic.terminfo"
    
}

setup_macos() {
    title "Configuring macOS"
    if [[ "$(uname)" == "Darwin" ]]; then

        echo "Finder: show all filename extensions"
        defaults write NSGlobalDomain AppleShowAllExtensions -bool true

        echo "show hidden files by default"
        defaults write com.apple.Finder AppleShowAllFiles -bool false

        echo "only use UTF-8 in Terminal.app"
        defaults write com.apple.terminal StringEncodings -array 4

        echo "expand save dialog by default"
        defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

        echo "show the ~/Library folder in Finder"
        chflags nohidden ~/Library

        echo "Enable full keyboard access for all controls (e.g. enable Tab in modal dialogs)"
        defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

        echo "Enable subpixel font rendering on non-Apple LCDs"
        defaults write NSGlobalDomain AppleFontSmoothing -int 2

        echo "Use current directory as default search scope in Finder"
        defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

        echo "Show Path bar in Finder"
        defaults write com.apple.finder ShowPathbar -bool true

        echo "Show Status bar in Finder"
        defaults write com.apple.finder ShowStatusBar -bool true

        echo "Disable press-and-hold for keys in favor of key repeat"
        defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

        echo "Set a blazingly fast keyboard repeat rate"
        defaults write NSGlobalDomain KeyRepeat -int 1

        echo "Set a shorter Delay until key repeat"
        defaults write NSGlobalDomain InitialKeyRepeat -int 15

        echo "Enable tap to click (Trackpad)"
        defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true

        echo "Enable Safari’s debug menu"
        defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

        echo "To enable key-repeating in VsCodeVim"
        defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false  

        echo "Kill affected applications"

        for app in Safari Finder Dock Mail SystemUIServer; do killall "$app" >/dev/null 2>&1; done
    else
        warning "macOS not detected. Skipping."
    fi
}

powerLevel() {
# https://mike632t.wordpress.com/2017/07/06/bash-yes-no-prompt/
# https://www.shellhacks.com/yes-no-bash-script-prompt-confirmation/

    title "Once the Installation finish, type : "
    echo "\n\tp10k configure\n"
    echo
    warning "\n\tp10k configure + Enter \n\t    otherwise \n\t ~/Dotfiles/install.sh drip + Enter"

        # echo -e
        # info "Installing to ~/.cache"
        #     if [ ! -d "$HOME/.cache" ]; then
        #         info "Creating ~/.cache";
        #         mkdir -p "$HOME/.cache";
        #     fi
}

dripped() {
    sudo cp ~/Dotfiles/zsh/config/20-prompt ~/Dotfiles/zsh/config/20-prompt.zsh
}

prompt() {
    source ~/.zshrc && zplug install;

    echo -e

    while true; do
        read -p "Do you want to use powerLevel 10k? [y/N]: " yn
        case $yn in
            [Yy]* ) powerLevel && break;;
            [Nn]* ) dripped && break;;
            * ) echo "Please answer yes or no.";;
        esac
    done
}


case "$1" in
    drip)
        dripped
        ;;
    backup)
        backup
        ;;
    link)
        setup_symlinks
        ;;
    git)
        setup_git
        ;;
    homebrew)
        setup_homebrew
        ;;
    shell)
        setup_shell
        ;;
    terminfo)
        setup_terminfo
        ;;
    macos)
        setup_macos
        ;;
    devpod)
        backup
        setup_symlinks
        setup_terminfo
        ;;
    all)
        backup
        setup_symlinks
        setup_terminfo
        setup_homebrew
        setup_git
        setup_macos
        setup_shell
        prompt
        ;;
    *)
        echo -e $"\nUsage: $(basename "$0") {backup|link|git|homebrew|shell|terminfo|macos|devpod|all}\n"
        exit 1
        ;;
esac

echo -e
success "Done."

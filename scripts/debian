#!/usr/bin/env bash

DOTFILES="$(pwd)"
COLOR_GRAY="\033[1;38;5;243m"
COLOR_BLUE="\033[1;34m"
COLOR_GREEN="\033[1;32m"
COLOR_RED="\033[1;31m"
COLOR_PURPLE="\033[1;35m"
COLOR_YELLOW="\033[1;33m"
COLOR_NONE="\033[0m"

title() {
    echo "\n${COLOR_PURPLE}$1${COLOR_NONE}"
    echo "${COLOR_GRAY}==============================${COLOR_NONE}\n"
}

error() {
    echo "${COLOR_RED}Error: ${COLOR_NONE}$1"
    exit 1
}

warning() {
    echo "${COLOR_YELLOW}Warning: ${COLOR_NONE}$1"
}

info() {
    echo "${COLOR_BLUE}Info: ${COLOR_NONE}$1"
}

success() {
    echo "${COLOR_GREEN}$1${COLOR_NONE}"
}

clean() {
    title "CLEANING FILES & FOLDERS"
    sudo rm -rf ~/neovim;
    success "Done."
    echo
}

bootstrapping() {

    sudo apt update
    sudo apt -y upgrade
    sudo echo

    title "ADDING Contrib TO DEBIAN SOURCE LIST"
    sed -r -i 's/^deb(.*)$/deb\1 contrib/g' /etc/apt/sources.list

    title "CHANGING PERMISSIONS for PAM.D & CHSH"
    chmod o+w /etc/pam.d/ && chmod o+w /etc/pam.d/chsh

    title "REPLACING required - sufficient"
    sed -i 's/required/sufficient/g' /etc/pam.d/chsh

    title "CHANGE BACK PERMISSIONS pam.d"
    chmod o-w /etc/pam.d/

    title "INSTALLING CMAKE"
    sudo apt-get install cmake;
    success "CMAKE Installed"

    title "INSTALLING LIBTOOL-BIN"
    sudo apt-get install libtool-bin;
    success "LIBTOOL-BIN Installed"

    title "INSTALLING PYTHON3-PIP"
    sudo apt-get install python3-pip;
    success "PYTHON3-PIP Installed"

    title "INSTALLING XFONT-UTILS"
    sudo apt-get install xfonts-utils;
    success "XFONT-UTILS Installed"

    title "INSTALLING KEYCHAIN"
    sudo apt-get install keychain;
    success "KEYCHAIN Installed"

    title "INSTALLING EXA"
    sudo apt install exa -y;
    success "EXA Installed"

    title "INSTALLING PYTHON3 DEPENDENCIES"
    sudo apt install build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev libsqlite3-dev wget libbz2-dev

    title "INSTALLING XDOTOOL for Zsh-Notify"
    sudo apt install xdotool -y;
    success "XDOTOOL Installed"
    
    title "INSTALLING WMCTRL for Zsh-Notify"
    sudo apt install wmctrl -y;
    success "WMCTRL Installed"

    title "INSTALLING HTTPIE"
    curl -SsL https://packages.httpie.io/deb/KEY.gpg | apt-key add -;
    curl -SsL -o /etc/apt/sources.list.d/httpie.list https://packages.httpie.io/deb/httpie.list;
    apt update;
    apt install httpie;
    success "HTTPIE Installed"

    title "CREATING DIRECTORIES"
    mkdir -pm777 ~/.debian/ ~/.dotfiles/share/zsh/plugins ~/.tmux/plugins ~/.dotfiles/share/fonts

    title "ADDING PERMISSIONS TO Scripts Folder"
    sudo chmod -R a+rwx ~/Dotfiles/scripts/

    echo 
    success "\(^▽^)/ Debian Bootstrapped"
    echo

}

clone-and-done() {
    
    pushd
    sudo cd ~/.debian/
    mkdir {bat,fzf,gcc,libgcc,delta,neo,cmatrix,ascii,broot,colortest,libnotify,powerline,lazygit,has,tig,python,neovim}
    popd 

    # Don't Change the order, dependency sensitive!!
    # ---------------------------------------------

    title "CLONING BAT"
    wget https://github.com/sharkdp/bat/releases/download/v0.22.1/bat-musl_0.22.1_amd64.deb -P ~/.debian/bat;
    echo
    title "INSTALLING BAT"
    sudo dpkg -i ~/.debian/bat/bat-musl_0.22.1_amd64.deb;
    success "BAT Installed"

    title "CLONING FZF"
    wget http://ftp.debian.org/debian/pool/main/f/fzf/fzf_0.30.0-1+b1_amd64.deb -P ~/.debian/fzf;
    echo
    title "INSTALLING FZF"
    sudo dpkg -i ~/.debian/fzf/fzf_0.30.0-1+b1_amd64.deb;
    success "FZF installed"

    title "CLONING GCC"
    wget http://ftp.debian.org/debian/pool/main/g/gcc-12/gcc-12-base_12.1.0-2_amd64.deb -P ~/.debian/gcc;
    echo
    title "INSTALLING GCC"
    sudo dpkg -i ~/.debian/gcc/gcc-12-base_12.1.0-2_amd64.deb;
    success "GCC Installed"

    title "CLONING LIBGCC"
    wget http://ftp.debian.org/debian/pool/main/g/gcc-12/libgcc-s1_12.1.0-2_amd64.deb -P ~/.debian/libgcc;
    echo
    title "INSTALLING LIBGCC"
    sudo dpkg -i ~/.debian/libgcc/libgcc-s1_12.1.0-2_amd64.deb;
    success "LIBGCC Installed"
    
    title "CLONING GIT-DELTA"
    wget https://github.com/dandavison/delta/releases/download/0.12.0/git-delta_0.12.0_amd64.deb -P ~/.debian/delta;
    echo
    title "INSTALLING DELTA"
    sudo dpkg -i ~/.debian/delta/git-delta_0.12.0_amd64.deb;
    success "DELTA Installed"

    title "CLONING NEOFETCH"
    wget http://ftp.debian.org/debian/pool/main/n/neofetch/neofetch_7.1.0-4_all.deb -P ~/.debian/neo;
    echo
    title "INSTALLING NEOFETCH"
    sudo dpkg -i ~/.debian/neo/neofetch_7.1.0-4_all.deb;
    success "NEOFETCH Installed"

    title "CLONING CMATRIX"
    wget http://ftp.debian.org/debian/pool/main/c/cmatrix/cmatrix_2.0-3_amd64.deb -P ~/.debian/cmatrix;
    echo
    title "INSTALLING CMATRIX"
    sudo dpkg -i ~/.debian/cmatrix/cmatrix_2.0-3_amd64.deb;
    success "CMATRIX installed"

    title "CLONING ASCIINEMA"
    wget http://ftp.debian.org/debian/pool/main/a/asciinema/asciinema_2.2.0-1_all.deb -P ~/.debian/ascii;
    echo
    title "INSTALLING ASCIINEMA"
    sudo dpkg -i ~/.debian/ascii/asciinema_2.2.0-1_all.deb;
    success "ASCIINEMA Installed"

    title "CLONING BROOT"
    wget https://packages.azlux.fr/debian/pool/main/b/broot/broot_1.14.2_amd64.deb -P ~/.debian/broot;
    echo
    title "INSTALLING BROOT"
    sudo dpkg -i ~/.debian/broot/broot_1.14.2_amd64.deb;
    success "BROOT Installed"

    title "CLONING COLORTEST"
    wget http://ftp.debian.org/debian/pool/main/c/colortest/colortest_20110624-9_all.deb -P ~/.debian/colortest;
    echo
    title "INSTALLING COLORTEST"
    sudo dpkg -i ~/.debian/colortest/colortest_20110624-9_all.deb;
    success "COLORTEST Installed"

    title "CLONING LIBNOTIFY"
    wget http://ftp.us.debian.org/debian/pool/main/libn/libnotify/libnotify-bin_0.7.7-4_amd64.deb -P ~/.debian/libnotify;
    echo
    title "INSTALLING LIB-NOTIFY"
    sudo dpkg -i ~/.debian/libnotify/libnotify-bin_0.7.7-4_amd64.deb;
    success "LIB-Notify Installed"

    title "CLONING PYTHON3"
    wget https://www.python.org/ftp/python/3.10.0/Python-3.10.0.tgz -P ~/.debian/python;
    echo
    title "EXTRACTING PYTHON3"
    tar -xvf Python-3.10.0.tgz --directory ~/.debian/python;
    echo
    title "INSTALLING PYTHON3"
    pushd
    cd ~/.debian/python/Python-3.10.0;
    sudo ./configure --enable-optimizations;
    sudo make -j 2;
    sudo make altinstall;
    success "PYTHON3 Installed"
    popd

    title "CLONING LAZYGIT"
    curl -Lo ~/.debian/lazygit/lazygit.tar.gz https://github.com/jesseduffield/lazygit/releases/download/v0.34/lazygit_0.34_Linux_x86_64.tar.gz
    echo    
    title "INSTALLING LAZYGIT"
    cd ~/.debian/lazygit;
    sudo tar xf lazygit.tar.gz -C /usr/local/bin lazygit;
    success "LAZYGIT Installed"
    echo
    title "COPYING lazygit config"
    sudo mkdir -p "$HOME/.config/lazygit"
    sudo cp "$HOME/Dotfiles/config/lazygit/config.yml" "$HOME/.config/lazygit/"
    success "Lazygit config ready..."

    title "GIT CLONING HAS"
    git clone https://github.com/kdabir/has.git ~/.debian/has
    echo
    title "INSTALLING HAS"
    sudo make DESTDIR=~/.debian/has install;
    success "HAS Installed"

    title "GIT CLONING TIG"
    git clone https://github.com/jonas/tig ~/.debian/tig
    echo
    title "INSTALLING TIG"
    sudo make DESTDIR=~/.debian/tig install;
    success "TIG Installed"

    pushd
    cd ~/.dotfiles/share/zsh/plugins

    title "GIT CLONING FORGIT"
    git clone https://github.com/wfxr/forgit.git
    
    title "GIT CLONING FZF-TAB"
    git clone https://github.com/Aloxaf/fzf-tab

    title "GIT CLONING GIT-FUZZY"
    git clone https://github.com/bigH/git-fuzzy.git

    title "GIT CLONING ZSH-ASYNC"
    git clone https://github.com/mafredri/zsh-async

    title "GIT CLONING ZSH-AUTOSUGGESTIONS"
    git clone https://github.com/zsh-users/zsh-autosuggestions

    title "GIT CLONING ZSH-SYNTAX-HIGHLIGHTING"
    git clone https://github.com/zsh-users/zsh-syntax-highlighting
    popd

    pushd
    cd ~/.tmux/plugins

    title "GIT CLONING TMUX PLUGINS"
    git clone https://github.com/tmux-plugins/tpm

    title "GIT CLONING NORD-TMUX"
    git clone https://github.com/arcticicestudio/nord-tmux

    title "GIT CLONE TMUX-NOVA"
    git clone https://github.com/o0th/tmux-nova.git
    popd

}

fontana() {

    title "INSTALLING FIRE CODE FONT"
    sudo apt install fonts-firacode;
    echo 
    success "FiraCode Code Font Installed"
    echo 

    title "INSTALLING POWERLINE FONTS"
    title "CLONING..."
    sudo mkdir -pm777 ~/.dotfiles/share/fonts/powerline;
    wget http://ftp.us.debian.org/debian/pool/main/p/powerline/fonts-powerline_2.8.3-1_all.deb -P ~/.dotfiles/share/fonts/powerline;
    sudo dpkg -i ~/.dotfiles/share/fonts/powerline/fonts-powerline_2.8.3-1_all.deb
    echo 
    success "POWERLINE Fonts Installed"
    echo   

    title "INSTALLING DROID SANS"
    curl -fLo ~/.dotfiles/share/fonts/Droid_Sans_Mono_for_Powerline_Nerd_Font_Complete.otf https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf
    echo 
    success "DROID SANS Fonts Installed"
    echo   
}

pip-drip() {

    title "INSTALLING PSUTIL"
    sudo pip3 install psutil;
    success "PSUTIL Installed"

    title "INSTALLING BPYTOP"
    sudo pip3 install bpytop;
    success "BPYTOP Installed"

    title "CREATING BPYTOP FOLDER"
    sudo mkdir -pm777 ~/.config/bpytop;
    echo
    title "COPYING CONFIG 4 BPYTOP"
    sudo cp ~/Dotfiles/config/bpytop/bpytop.conf ~/.config/bpytop/;
    success "Copied..."

    title "INSTALLING SURREALDB"
    curl -sSf https://install.surrealdb.com | sh
    echo
    success "Installed successfully"

    title "INSTALLING LUNAR VIM"
    bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)
    echo
}

pimp-my-vim() {

    title "UNINSTALL VIM & NEOVIM"
    sudo dpkg --purge --force-all vim;
    sudo dpkg --purge --force-all neovim;
    sudo dpkg --purge --force-all neovim-runtime;
    success "Nvim Uninstalled"

    title "COPYING NeoVIM LATEST RELEASE"
    #sudo wget https://github.com/neovim/neovim/releases/download/v0.7.0/nvim-linux64.deb;
    #sudo wget https://github.com/neovim/neovim/releases/download/v0.7.2/nvim-linux64.deb;
    sudo wget https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.deb -P ~/.debian/neovim;
    success "NeoVim Copied..."

    title "INSTALLING NEOVIM"
    sudo apt install ~/.debian/neovim/nvim-linux64.deb;
    success "NEOVIM Installed"

    title "FIXING KEY BINDINGS 4 FZF VIM"
    sudo chmod o+w /etc/vim/vimrc;
    sudo echo "source /usr/share/doc/fzf/examples/fzf.vim" >> /etc/vim/vimrc;
    sudo mkdir -p $HOME/.local/share/nvim/plugged;
    sudo chmod -R a+rwx ~/.local/share/nvim/;
    success "KEY BINDINGS Fixed"

    title "COPYING Vimrc"
    sudo cp "$HOME/Dotfiles/config/.vimrc" "$HOME"
    sudo mkdir -p $HOME/.config/nvim/;
    sudo ln -s $HOME/.vimrc $HOME/.config/nvim/init.vim;
    success "Vimrc copied..."

}

pj() {

    title "PIP3 INSTALLING PROJECTOR"
    pip3 install projector-installer --user
    echo
    title "UPDATING PROJECTOR"
    sudo projector --accept-license self-update;
    echo
    title "SOURCING..."
    source ~/.profile 

    echo 
    success "PROJECTOR Latest Release Installed "
    echo
}


case "$1" in
    all)
        bootstrapping
        clone-and-done
        fontana 
        pip-drip
        pimp-my-vim
        pj
        ;;
    fonts)
        fontana
        ;;
    kickoff)
        bootstrapping
        ;;
    projector)
        pj
        ;;
    stack)
        clone-and-done
        pip-drip
        pimp-my-vim
        ;;
    *)
        echo -e $"\nUsage: {all|fonts|kickoff|projector|stack}\n"
        exit 1
        ;;
esac

echo 
success "\(^▽^)/ Debian DRIP too hard!!"
echo
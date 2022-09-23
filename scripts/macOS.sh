#!/usr/bin/env bash

brew update
brew install kdabir/tap/has
# brew install TomAnthony/brews/itermocil
brew install pidof
brew install Rigellute/tap/spotify-tui
brew install surrealdb/tap/surreal

title "COPYING lazygit config"
sudo mkdir -p "$HOME/.config/lazygit"
sudo cp "$HOME/Dotfiles/config/lazygit/config.yml" "$HOME/.config/lazygit/"
success "Lazygit config ready..."

title "INSTALLING LUNAR VIM"
bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)
echo

title "Installing Nerd Fonts"
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts 
curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf
fc-cache -f -v  

title "Installing Spotify CLI for tmux"
pip3 install --upgrade spotify-cli

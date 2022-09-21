#  ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
# ░▓                ALIASES               ▓
# ░▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
# ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

#█▓▒░ Reload zsh config
alias reload!='RELOAD=1 source ~/.zshrc'

# use nvim, but don't make me think about it
if [[ -n "$(command -v nvim)" ]]; then
    # alias vim="nvim"
    alias vimu="nvim +PlugUpdate +PlugUpgrade"
    alias vimg="nvim +Ge:"
fi

#█▓▒░ Filesystem aliases  ░▒▓█
alias ..='cd ..'
alias ...='cd ../..'
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias sl=ls
alias al=la
alias l="exa -abghHliS"
alias lt="exa --tree --level=2 | bat"
alias la="ls -AF ${colorflag}"
alias ls="ls ${colorflag}"        # Compact view, show colors
alias ll="exa -lFh"
alias l1="ls -1Fh ${colorflag}"
alias lld="ls -1 | grep ^d"
alias lsg="exa -ahlT -L=1  -s=extension --git --group-directories-first"
alias ldir="ls -d */"
alias rmf="rm -rf"

#█▓▒░ In case i forget how to clear/exit
alias c='clear'
alias k='clear'
alias clr='clear'
alias zz='exit'
alias ZZ='exit'

#█▓▒░ Helpers
alias prev='fzf --preview "bat --style=numbers --theme=Dracula --color=always --line-range :500 {}" --preview-window right:70%'
alias grep='grep --color=auto'
alias gradmin='dscacheutil -q group -a name admin'
alias grstaff='dscacheutil -q group -a name staff'
alias df='df -h | bat --theme=Dracula' # disk free, in Gigabytes, not bytes
alias du='du -h -c | bat' # calculate disk usage for a folder

#█▓▒░ Scripts
alias debian='~/Dotfiles/scripts/debian'
alias macOS='~/Dotfiles/scripts/macOS'
alias tdrac="sudo sed -i -r 's/#d//g' ~/.tmux.conf"
alias tnord="sudo sed -i -r 's/#n//g' ~/.tmux.conf"
alias tnova="sudo sed -i -r 's/#%//g' ~/.tmux.conf"

#█▓▒░ HomeBrew
alias brewdep='brew deps --tree --installed | bat'
alias brewls='brew list --versions | fzf'

#█▓▒░ Git aliases ░▒▓█
alias gb='git branch -vv'
alias gaa='git add .'
alias gbc='git branch'

alias gfa='git forgit add'
alias gfd='git forgit diff'
alias gfl='git forgit log'
alias gfu='git forgit reset_head'
alias gfgi='git forgit ignore'
alias gfcf='git forgit checkout_file'
alias gfcb='git forgit checkout_branch'
alias gfbd='git forgit branch_delete'
alias gfct='git forgit checkout_tag'
alias gfcc='git forgit checkout_commit'
alias gfrc='git forgit revert_commit'
alias gfcl='git forgit clean'
alias gfss='git forgit stash_show'
alias gfcp='git forgit cherry_pick'
alias gfr='git forgit rebase'
alias gfb='git forgit blame'
alias gfx='git forgit fixup'

alias glg='lazygit'
alias gpl='git pull'
alias gpm='git checkout main && git pull origin main'
alias gps='git push'
alias grs='git restore'
alias gst='git status'
alias gt1='git t1'
alias gt3='git t3'
alias gcam='git commit -am' # commit all changed files with a message
alias gprm='git pull --rebase origin main'
alias gcane='git commit --amend --no-edit'
alias gcfdx='git clean -fdx'
alias unstage='git unstage'
alias stash='gaa; git stash'
alias stacl='git stash clear'
alias pop='git stash pop'

#█▓▒░ Git aliases Stacking Diffs
alias gcb='git cob'     # checkout -b  my_feature_branch
alias gpu='!f() {   git push --set-upstream origin $1 }'  # $1:my_feature_branch
alias gcm='git cm'     # commit -m  "[Part 1] My changes"
alias adh='arc diff HEAD^'
alias gpf='git push -f' 
alias gmain='git checkout main'    
alias gct='!f() { git checkout $1}' # # $1:my_feature_branch
alias grm='git rebase main'
alias grcn='git cont'    # git rebase --continue
alias grim='git rebase -i main'
alias game='git commit --amend'

#█▓▒░ GH cli
alias ghpri='gh repo create --private --source=. --remote=upstream --push'
alias ghpub='gh repo create --public --source=. --remote=upstream --push'

#█▓▒░ Arcanist aliases  ░▒▓█
alias af='arc flow'
alias ara='arc amend'
alias arb='arc branch'
alias arbl='arc bland'
alias arco='arc cover'
alias arci='arc commit'

alias ard='arc diff'
alias ardc='arc diff --create'
alias ardnu='arc diff --nounit'
alias ardnupc='arc diff --nounit --plan-changes'
alias ardpc='arc diff --plan-changes'
alias ardp='arc diff --preview' # Only create a diff, which you may later attach to a revision. This still runs lint unit tests. 
alias ardo='arc diff --only' # Only generate a diff, without running lint, unit tests, or other auxiliary steps.
alias ardrev='arc diff --reviewers' # Adds reviewers, removes plan changes tag

alias are='arc export'
alias arh='arc help'
alias arho='arc hotfix'
alias arl='arc land'
alias arli='arc lint'
alias arls='arc list'

#█▓▒░ SuperPumped ░▒▓█
alias ics='cd ~/ANDROID'  # Ice Cream Sandwich
alias noche='sudo git config --system core.untrackedCache true'

#█▓▒░ ANDROID  ░▒▓█
alias emls='adb devices'
alias egsm='adb shell getprop | grep "gsm"' 
alias eiso='adb shell su 0 setprop gsm.sim.operator.iso-country us' # https://www.mcc-mnc.com/
alias eres='adb reboot'
alias eque='adb shell dumpsys package queries | bat' # https://developer.android.com/training/package-visibility/automatic
alias scrv='scrcpy --record'
alias scr!='screenshot'
#alias touch='adb shell content insert --uri content://settings/system --bind name:s:show_touches --bind value:i:1' # Argument [0: off, 1: on]


#█▓▒░ MacOS ░▒▓█
#Usefull stuff for presentation and seeing dotfiles
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"
alias showall='defaults write com.apple.finder AppleShowAllFiles YES && killall Finder'
alias hideall='defaults write com.apple.finder AppleShowAllFiles NO && killall Finder'
alias saveDesk='defaults write com.apple.dock "mru-spaces" -bool "false" && killall Dock'
alias dsclean='find . -type f -name .DS_Store -print0 | xargs -0 rm' # Recursively delete `.DS_Store` files
alias cleanup="find . -name '*.DS_Store' -type f -ls -delete"
alias clsym="find -L . -name . -o -type d -prune -o -type l -exec rm {} +" # remove broken symlinks
alias flush='dscacheutil -flushcache' # Flush your dns cache

#█▓▒░ Applications ░▒▓█
alias ios='open -a /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app'
alias lpath='echo $PATH | tr ":" "\n" | fzf' 
alias fpath='echo $fpath | tr " " "\n" | fzf' 
alias shells='cat /etc/shells | fzf'
alias python=$(command -v python3)

#█▓▒░ Tmux ░▒▓█
alias ta='tmux attach'
alias tls='tmux ls'
alias tat='tmux attach -t'
alias tns='tmux new-session -s'
alias tks='tmux kill-session -t'
alias tmr='tmux source-file ~/.tmux.conf'
alias tmux="tmux -u"
alias tmax="tmux new-session \; split-window -h \; split-window -v \; attach"

if [ -f "/opt/homebrew/bin/grc" ]; then
    alias df="grc df"
    alias gcc="grc gcc"
    alias iwconfig="grc iwconfig"
    alias last="grc last"
    alias make="grc make"
    alias mount="grc mount"
    alias mtr="grc mtr"
    alias ping="grc ping"
    alias ps="grc ps"
    alias traceroute="grc traceroute"
    alias wdiff="grc wdiff"
fi

#█▓▒░ PostgreSQL aliases ░▒▓█
local psqldir=$(command -v postgres)
alias posqlon="pg_ctl -D $psqldir start" # Start postgresql server
alias posqloff="pg_ctl -D $psqldir stop" # Stop postgresql server
alias posqlres="pg_ctl -D $psqldir restart" # Restart postgresql server

#█▓▒░ Node ░▒▓█
alias cleanreact='npx react-codemod update-react-imports'
alias npi="npm install"
alias npr="npm run"

#█▓▒░ Kitty ░▒▓█
alias icat="kitty +kitten icat"
alias meow="$EDITOR ~/Dotfiles/config/kitty/kitty.conf"

#█▓▒░ NeoVim ░▒▓█
alias luna='~/.local/bin/lvim'
alias vimrc="vim ~/.vimrc"
alias nvimrc="nvim ~/.config/nvim/init.vim"


#█▓▒░ Editor's Choice ░▒▓█
alias zshrc="$EDITOR ~/.zshrc"
alias bashrc="$EDITOR ~/.bashrc"
alias enva="$EDITOR ~/Dotfiles/zsh/config/01-environment.zsh"
alias alia="$EDITOR ~/Dotfiles/zsh/config/08-aliases.zsh"
# alias prompt="$EDITOR ~/Dotfiles/zsh/config/20-prompt.zsh"
#https://github.com/TomAnthony/itermocil
# alias opt='itermocil'  # Kitty seems 2b better

#  ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
# ░▓               DEVELOPER              ▓
# ░▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
# ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
# Shell Tips
# https://stackoverflow.com/questions/11065077/the-eval-command-in-bash-and-its-typical-uses

#█▓▒░ LowLevel ░▒▓█
alias cppcompile='c++ -std=c++11 -stdlib=libc++'

# Skip future chromium installs
export PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
export PUPPETEER_EXECUTABLE_PATH=`which chromium`

alias fixgrc="sudo sed -i -r 's/:-grc/:-grcm/g' ~/.zplug/repos/wfxr/forgit/forgit.plugin.zsh"

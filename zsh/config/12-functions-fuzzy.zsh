# ░░▒▒▓▓▓████▓▓▓▒▒░░
#       FUZZY
# ░░▒▒▓▓▓████▓▓▓▒▒░░

# fstash - easier way to deal with stashes
# type fstash to get a list of your stashes
# enter shows you the contents of the stash
# ctrl-d shows a diff of the stash against your current HEAD
# ctrl-b checks the stash out as a branch, for easier merging
function fstash() {
  local out q k sha
  while out=$(
    git stash list --pretty="%C(yellow)%h %>(14)%Cgreen%cr %C(blue)%gs" |
    fzf --ansi --no-sort --query="$q" --print-query \
     --layout=reverse --height=80% \
        --expect=ctrl-d,ctrl-b);
  do
    mapfile -t out <<< "$out"
    q="${out[0]}"
    k="${out[1]}"
    sha="${out[-1]}"
    sha="${sha%% *}"
    [[ -z "$sha" ]] && continue
    if [[ "$k" == 'ctrl-d' ]]; then
      git diff $sha
    elif [[ "$k" == 'ctrl-b' ]]; then
      git stash branch "stash-$sha" $sha
      break;
    else
      git stash show -p $sha
    fi
  done
}

# Only show files which have $1 present in contents
faz(){
  local line
  line=`ag --nocolor "$1" | fzf` \
    && $EDITOR $(cut -d':' -f1 <<< "$line") +$(cut -d':' -f2 <<< "$line")
}

function fif() {
  if [ ! "$#" -gt 0 ]; then warning "Need a string to search for! (╥﹏╥)"; return 1; fi
  rg --files-with-matches --no-messages "$1" | fzf --preview "highlight -O ansi -l {} 2> /dev/null | rg --colors 'match:bg:yellow' --ignore-case --pretty --context 10 '$1' || rg --ignore-case --pretty --context 10 '$1' {}" --preview-window right:60%
}

# fbr - Shows branches with last commit
function fbr() {
  local branches branch
  branches=$(git --no-pager branch -vv) &&
  branch=$(echo "$branches" | fzf --layout=reverse --height=80%) &&
  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

# fshow - Git commit browser
function fshow() {
  git log --graph --color=always \
      --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
  fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
      --bind "ctrl-m:execute:
                (grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
                {}
FZF-EOF"
}

# fcoc - Checkout git commits
function fcoc() {
  local commits commit
  commits=$(git log --pretty=oneline --abbrev-commit --reverse) &&
  commit=$(echo "$commits" | fzf --tac +s +m -e --layout=reverse) &&
  git checkout $(echo "$commit" | sed "s/ .*//")
}

alias glNoGraph='git log --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr% C(auto)%an" "$@"'
_gitLogLineToHash="echo {} | grep -o '[a-f0-9]\{7\}' | head -1"
_viewGitLogLine="$_gitLogLineToHash | xargs -I % sh -c 'git show --color=always % | diff-so-fancy'"


# fcoc_preview - Checkout git commit with previews
function fcoc_preview() {
  local commit
  commit=$( glNoGraph |
    fzf --no-sort --reverse --tiebreak=index --no-multi \
        --ansi --preview="$_viewGitLogLine" ) &&
  git checkout $(echo "$commit" | sed "s/ .*//")
}

# fshow_preview - Git commit browser with previews
function fshow_preview() {
    glNoGraph |
        fzf --no-sort --reverse --tiebreak=index --no-multi \
            --ansi --preview="$_viewGitLogLine" \
            --preview-window 'up,60%,border-bottom,+{2}+3/3,~3' \
                --header "enter to view, alt-y to copy hash" \
                --bind "enter:execute:$_viewGitLogLine   | less -R" \
                --bind "alt-y:execute:$_gitLogLineToHash | pbcopy"
}



# ░░▒▒▓▓▓████▓▓▓▒▒░░
#    GIT + FUZZY
# ░░▒▒▓▓▓████▓▓▓▒▒░░

function gitdiff() {
  git diff --diff-filter=CMRTUXB main 
}

function gch() {
 git checkout $(git for-each-ref refs/heads/ --format='%(refname:short)' | fzf --layout=reverse --height=80%)
}

# https://polothy.github.io/post/2019-08-19-fzf-git-checkout/
fzf-git-branch() {
    git rev-parse HEAD > /dev/null 2>&1 || return

    git branch --color=always --all --sort=-committerdate |
        grep -v HEAD |
        fzf --height 50% --ansi --no-multi --preview-window right:80% \
            --preview 'git log -n 50 --color=always --date=short --pretty="format:%C(auto)%cd %h%d %s" $(sed "s/.* //" <<< {})' |
        sed "s/.* //"
}

fzf-git-checkout() {
    git rev-parse HEAD > /dev/null 2>&1 || return

    local branch

    branch=$(fzf-git-branch)
    if [[ "$branch" = "" ]]; then
        info "No branch selected."
        return
    fi

    # If branch name starts with 'remotes/' then it is a remote branch. By
    # using --track and a remote branch name, it is the same as:
    # git checkout -b branchName --track origin/branchName
    if [[ "$branch" = 'remotes/'* ]]; then
        git checkout --track $branch
    else
        git checkout $branch;
    fi
}

#█▓▒░ Alias Fuzzy ░▒▓█

alias afb='gch'
alias gdf='gitdiff'
alias fgb='fzf-git-branch'
alias fgc='fzf-git-checkout'
alias combrw='fshow'
alias combpr='fshow_preview'
alias comche='fcoc'
alias comcpr='fcoc_preview'
alias stash!='fstash'

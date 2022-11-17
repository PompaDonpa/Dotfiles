# ░░▒▒▓▓▓████▓▓▓▒▒░░
#        GIT
# ░░▒▒▓▓▓████▓▓▓▒▒░░

function backup() {
    local date_now=$(date "+%D")
    local currentBranch=$(git rev-parse --abbrev-ref HEAD)
    local newBranch="${currentBranch}--${date_now}"
    git branch -D $newBranch; git checkout -B $newBranch; git checkout $currentBranch;
    echo "Backed Up" | figlet -f digital
    echo
}

#█▓▒░ Changes Directories on LazyGit Exit
function lg() {
    export LAZYGIT_NEW_DIR_FILE=~/.lazygit/newdir

    lazygit "$@"

    if [ -f $LAZYGIT_NEW_DIR_FILE ]; then
        cd "$(cat $LAZYGIT_NEW_DIR_FILE)"
        rm -rf $LAZYGIT_NEW_DIR_FILE > /dev/null
    fi 
}

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

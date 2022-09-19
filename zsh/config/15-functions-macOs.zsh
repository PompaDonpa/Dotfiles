# ░░▒▒▓▓▓████▓▓▓▒▒░░
#       MacOS
# ░░▒▒▓▓▓████▓▓▓▒▒░░

# Make directory and cd
function mcd() { 
  mkdir -p "$1" && cd "$1" || return; 
}

# Change directory and list content
function lc() {
    cd "$1" && la "$2"
}

# Notifications
function toast() {
  osascript -e "display notification \"$2\" with title \"$1\""
}

# Opens the terminal explorer
function xpr() {
  out=$(broot "$@")
  [[ $? = 123 ]] && cd "$out"
}

# Creates a new video from .mov to .mp4 
# $1 [ Original video name/location ]
# $2 [ New video name/location ]
function mp4() { 
  [ $# -eq 0 ] && { usage $0 " Missing files to convert"; return;}
  ffmpeg -i $1 -vcodec h264 -acodec mp2 $2
}

# QuickTime Player
# Records a video of the entire screen or selected portion, user must select
# If audio is wanted choose source from options on popup menu
function rec() {
  osascript -e 'tell application "QuickTime Player" to activate' -e 'tell application "QuickTime Player" to start (new screen recording)'
}

# Switch between "Capture Select Portion / Capture Select Window" by pressing SPACE
# Press ENTER to capture a screenshot
function prtscn() {
  osascript -e 'activate application "QuickTime Player"' -e 'tell application "System Events"'\
  -e 'key code 45 using {command down, control down}' -e 'delay 0.1' -e 'repeat 2 times' -e 'key code 49' -e 'delay 0.1'\
  -e 'end repeat' -e 'key code 35' -e 'delay 0.1' -e 'end tell'
}

function copyPrev() {
    osascript -e 'activate application "Preview"' -e 'tell application "System Events"' -e 'keystroke "c" using command down'  -e 'click button "Delete" of sheetter group 1 of standard window "PVWindow' -e 'end tell'
}

alias f1='xpr'
alias f2='mp4'
alias f3='rec'
alias f4='prtscn'
alias f5='copyPrev'


# Because Typing python -m SimpleHTTPServer is too Damn Long
# Start an HTTP server from a directory, optionally specifying the port
  function server() {
    local port="${1:-8000}"
#    open "http://localhost:${port}/"
    open -a google\ chrome\ canary "http://localhost:${port}/" --args --disable-web-security
    # Set the default Content-Type to `text/plain` instead of `application/octet-stream`
  # And serve everything as UTF-8 (although not technically correct, this doesn't break anything for binary files)
    python -c $'import SimpleHTTPServer;\nmap = SimpleHTTPServer.SimpleHTTPRequestHandler.extensions_map;\nmap[""] = "text/plain";\nfor key, value in map.items():\n\tmap[key] = value + ";charset=UTF-8";\nSimpleHTTPServer.test();' "$port"
  }


# archive file or folder
function compress() {
  dirPriorToExe=`pwd`
  dirName=`dirname $1`
  baseName=`basename $1`

  if [ -f $1 ] ; then
    echo "It was a file change directory to $dirName"
    cd $dirName
      case $2 in
          tar.bz2)
                    tar cjf $baseName.tar.bz2 $baseName
                    ;;
          tar.gz)
                    tar czf $baseName.tar.gz $baseName
                    ;;
          gz)
                    gzip $baseName
                    ;;
          tar)
                    tar -cvvf $baseName.tar $baseName
                    ;;
          zip)
                    zip -r $baseName.zip $baseName
                    ;;
            *)
                    info "Method not passed compressing using tar.bz2"
                    tar cjf $baseName.tar.bz2 $baseName
                    ;;
      esac
          echo "Back to Directory $dirPriorToExe"
          cd $dirPriorToExe
   else
        if [ -d $1 ] ; then
            echo "It was a Directory change directory to $dirName"
            cd $dirName
            case $2 in
                tar.bz2)
                        tar cjf $baseName.tar.bz2 $baseName
                        ;;
                tar.gz)
                        tar czf $baseName.tar.gz $baseName
                        ;;
                gz)
                        gzip -r $baseName
                        ;;
                tar)
                        tar -cvvf $baseName.tar $baseName
                        ;;
                zip)
                        zip -r $baseName.zip $baseName
                        ;;
                *)
                     info "Method not passed compressing using tar.bz2"
                tar cjf $baseName.tar.bz2 $baseName
                        ;;
            esac
            echo "Back to Directory $dirPriorToExe"
            cd $dirPriorToExe
        else
            echo "'$1' is not a valid file/folder"
          fi
    fi
    success "Done"
    success "###########################################"
}

# Extract archives - use: extract <file>
# Based on http://dotfiles.org/~pseup/.bashrc
function extract() {
  local remove_archive
  local success
  local file_name
  local extract_dir

  if (( $# == 0 )); then
    echo "Usage: extract [-option] [file ...]"
    echo
    echo Options:
    echo "    -r, --remove    Remove archive."
  fi

  remove_archive=1
  if [[ "$1" == "-r" ]] || [[ "$1" == "--remove" ]]; then
    remove_archive=0
    shift
  fi

  while (( $# > 0 )); do
    if [[ ! -f "$1" ]]; then
      echo "extract: '$1' is not a valid file" 1>&2
      shift
      continue
    fi

    success=0
    file_name="$( basename "$1" )"
    extract_dir="$( echo "$file_name" | sed "s/\.${1##*.}//g" )"
    case "$1" in
      (*.tar.gz|*.tgz) [ -z $commands[pigz] ] && tar zxvf "$1" || pigz -dc "$1" | tar xv ;;
      (*.tar.bz2|*.tbz|*.tbz2) tar xvjf "$1" ;;
      (*.tar.xz|*.txz) tar --xz --help &> /dev/null \
        && tar --xz -xvf "$1" \
        || xzcat "$1" | tar xvf - ;;
      (*.tar.zma|*.tlz) tar --lzma --help &> /dev/null \
        && tar --lzma -xvf "$1" \
        || lzcat "$1" | tar xvf - ;;
      (*.tar) tar xvf "$1" ;;
      (*.gz) [ -z $commands[pigz] ] && gunzip "$1" || pigz -d "$1" ;;
      (*.bz2) bunzip2 "$1" ;;
      (*.xz) unxz "$1" ;;
      (*.lzma) unlzma "$1" ;;
      (*.Z) uncompress "$1" ;;
      (*.zip|*.war|*.jar|*.sublime-package) unzip "$1" -d $extract_dir ;;
      (*.rar) unrar x -ad "$1" ;;
      (*.7z) 7za x "$1" ;;
      (*.deb)
        mkdir -p "$extract_dir/control"
        mkdir -p "$extract_dir/data"
        cd "$extract_dir"; ar vx "../${1}" > /dev/null
        cd control; tar xzvf ../control.tar.gz
        cd ../data; tar xzvf ../data.tar.gz
        cd ..; rm *.tar.gz debian-binary
        cd ..
      ;;
      (*)
        echo "extract: '$1' cannot be extracted" 1>&2
        success=1
      ;;
    esac

    (( success = $success > 0 ? $success : $? ))
    (( $success == 0 )) && (( $remove_archive == 0 )) && rm "$1"
    shift
  done
}

#  ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
# ░▓           MAN-COLOR PAGES            ▓
# ░▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
# ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# add color to man pages
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;38;5;74m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[38;33;246m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[04;38;5;146m'
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# source z.sh if it exists
zpath="$(brew --prefix)/etc/profile.d/z.sh"
if [ -f "$zpath" ]; then
    source "$zpath"
fi

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
    colorflag="--color"
else # macOS `ls`
    colorflag="-G"
fi


#█▓▒░ Themes FZF ░▒▓█

#█▓▒░ JellyX Theme for fzf
# export FZF_DEFAULT_OPTS='
# --color fg:-1,bg:-1,hl:230,fg+:3,bg+:233,hl+:229
# --color info:150,prompt:110,spinner:150,pointer:167,marker:174
# '

#█▓▒░ Nord Theme for fzf
# export FZF_DEFAULT_OPTS='
# --color fg:#D8DEE9,bg:#2E3440,hl:#A3BE8C,fg+:#D8DEE9,bg+:#434C5E,hl+:#A3BE8C
# --color pointer:#BF616A,info:#4C566A,spinner:#4C566A,header:#4C566A,prompt:#81A1C1,marker:#EBCB8B
# '

#█▓▒░ Ayu Mirage Theme for fzf
export FZF_DEFAULT_OPTS="
 ${colorflag}=fg:#cbccc6,bg:#1f2430,hl:#707a8c
 ${colorflag}=fg+:#707a8c,bg+:#191e2a,hl+:#ffcc66
 ${colorflag}=info:#73d0ff,prompt:#707a8c,pointer:#cbccc6
 ${colorflag}=marker:#73d0ff,spinner:#73d0ff,header:#d4bfff
"

#  ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
# ░▓           MAN-COLOR PAGES            ▓
# ░▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
# ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

# export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
export FZF_DEFAULT_COMMAND='fd --hidden --follow --exclude=.git --exclude=node_modules'
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
# export FZF_DEFAULT_OPTS="
#  --color=fg:#cbccc6,bg:#1f2430,hl:#707a8c
#  --color=fg+:#707a8c,bg+:#191e2a,hl+:#ffcc66
#  --color=info:#73d0ff,prompt:#707a8c,pointer:#cbccc6
#  --color=marker:#73d0ff,spinner:#73d0ff,header:#d4bfff
#  --prompt='◉' --pointer='↠▷' --marker='⇶'
# "

#█▓▒░ 2KAbhishek
export FZF_DEFAULT_OPTS="
--layout=reverse
--info=inline
--height=80%
--multi
--cycle
--prompt='◉' --pointer='↠▷' --marker='⇶'
--color='hl:148,hl+:154,prompt:blue,pointer:032,marker:010,bg+:000,gutter:000'
--margin=1
--border=rounded
--preview-window=right:65%
--preview '([[ -f {} ]] && (bat --style=numbers --color=always --line-range=:500 {} || cat {})) || ([[ -d {} ]] && (exa -TFl --group-directories-first --icons --git -L 2 --no-user {} | less)) || echo {} 2> /dev/null | head -200'
--bind '?:toggle-preview'
--bind 'ctrl-a:select-all'
--bind 'ctrl-y:execute-silent(echo {+} | clipcopy)'
--bind 'ctrl-e:execute(nvim-qt {+})'
--bind 'ctrl-v:execute(code {+})'
--color=fg:#cbccc6,bg:#1f2430,hl:#707a8c
--color=fg+:#707a8c,bg+:#191e2a,hl+:#ffcc66
--color pointer:#BF616A,info:#4C566A,spinner:#4C566A,header:#4C566A,prompt:#81A1C1,marker:#EBCB8B
"
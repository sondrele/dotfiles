# install: ~/.bash_aliases

# set alias if command exists
if_alias() {
    if hash "$2" 2>/dev/null; then
        alias "$1"="$2"
    fi
}

if_alias diff colordiff

# ls
alias ls="ls --color=auto"
alias l="ls --group-directories-first"
alias ll="l -lh"
alias lla="ll -A"
alias la="l -A"
# ls last file changed
alias lf="ls -rt | tail -n1"
# sort by date
alias lt="ls -lrt"
alias lat="ls -lrta"
# ls last downloaded
alias ld="ls -lrt ~/Downloads | tail -n10"

# grep
alias grep="grep --color=auto"

# make
alias m="make SHELL=/bin/bash"
alias make="make SHELL=/bin/bash"

# utils
if_alias go gnome-open
if_alias go xdg-open

# system utils
alias gctrl="env XDG_CURRENT_DESKTOP=GNOME gnome-control-center"
alias rzshrc="source ~/.zshrc"

# git
# if_alias git hub
alias got="git "
alias gut="git "

alias gs="git status"
alias ga="git add"
alias gb="git branch"
alias gc="git commit -S"
alias gcm="gc -m"
alias gd="git diff"
alias gt="git checkout"
alias gpu="git push -u origin HEAD"
alias gg="git grep"
alias gpf="git pushf"

alias k="kubectl"
alias kp="kubectl --context prod-gcp"
alias kd="kubectl --context dev-gcp"

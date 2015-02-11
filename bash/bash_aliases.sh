# install: ~/.bash_aliases

alias diff="colordiff"

# ls
alias ls="ls --color=auto"
alias l="ls"
alias ll="ls -hog"
alias la="ls -A"
# ls last file changed
alias lf="ls -rt | tail -n1"
# sort by date
alias lt="ls -lrt"
# ls last downloaded
alias ld="ls -lrt ~/Downloads | tail -n10"

# grep
alias grep="grep --color=auto"

# make
alias m="make SHELL=/bin/bash"
alias make="make SHELL=/bin/bash"

# utils
alias go="gnome-open"

# git
alias gs="git status "
alias ga="git add "
alias gb="git branch "
alias gc="git commit"
alias gd="git diff"
alias gt="git checkout "

alias got="git "
alias gut="git "

alias rustup="curl -s https://static.rust-lang.org/rustup.sh | sudo sh"

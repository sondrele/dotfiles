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

# git
alias got="git "
alias gut="git "

alias gs="git status"
alias ga="git add"
alias gb="git branch"
alias gc="git commit -S"
alias gcm="gc -m"
alias gd="git diff"
alias gds="DELTA_FEATURES=+side-by-side git diff"
alias gt="git checkout"
alias gpu="git push -u origin HEAD"
alias gg="git grep"
alias gpf="git pushf"

alias k="kubectl"
alias kp="kubectl --context prod-gcp"
alias kd="kubectl --context dev-gcp"

# nav
alias morn="nais device connect && nais auth login && nais auth login -n"
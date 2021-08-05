# Vim bindings
set -o vi
bindkey -v
bindkey "^R" history-incremental-search-backward
bindkey "^L" clear-screen
bindkey "^A" beginning-of-line
bindkey "^W" backward-kill-word
bindkey "^E" end-of-line
bindkey "^K" kill-line

# Aliases
# -- git
alias ga="git add"
alias gd="git diff"
alias gs="git status"
alias gc="git commit"
alias gp="git push"
alias gb="git branch"
alias glff="git pull --ff-only"
alias glr="git pull --rebase"
alias glpp="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"

# -- awk
alias total="awk 'BEGIN{t=0}{t+=\$1}END{print t}'"
alias avg="awk 'BEGIN{t=0;n=0}{t+=\$1;n++}END{printf \"%.2f\n\", t/n}'"

# -- ls
alias l="ls -althr"

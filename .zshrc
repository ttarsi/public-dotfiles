# ZSH Settings
export ZSH="/Users/tylertarsi/.oh-my-zsh"
ZSH_THEME="eastwood"
plugins=(git)
source $ZSH/oh-my-zsh.sh

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
# -- nvim
alias v="vim"
alias vi="vim"
alias vim="nvim"

# -- git
alias ga="git add"
alias gd="git diff"
alias gs="git status"
alias gc="git commit"
alias gp="git push"
alias gpl="git pull"
alias gb="git branch"
alias glff="git pull --ff-only"
alias glr="git pull --rebase"
alias glpp="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gclean="git branch --merged | grep -v \* | xargs git branch -D"

# -- tmux
alias t="tmux"
alias ta="t attach -t"
alias tn="t new -s"
alias tk="t kill-session -t"
alias tks="t kill-server"
alias ts="t switch -t"
alias tls="t ls"

# -- yarn
alias ys="yarn start"
alias yt="yarn test"

# -- awk
alias total="awk 'BEGIN{t=0}{t+=\$1}END{print t}'"
alias avg="awk 'BEGIN{t=0;n=0}{t+=\$1;n++}END{printf \"%.2f\n\", t/n}'"

# -- ls
alias l="ls -althr"

# -- can't use ctrl-l to clear with tmux-vim bindings
alias c="clear"

# Paths
export PATH=/opt/homebrew/bin:$PATH
export PATH="$HOME/.poetry/bin:$PATH"
export PATH="$HOME/.foundry/bin:$PATH"
export PATH="$HOME/.yarn/bin:$PATH"

# -- asdf: https://formulae.brew.sh/formula/asdf
. $(brew --prefix)/opt/asdf/libexec/asdf.sh

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/google-cloud-sdk/completion.zsh.inc"; fi


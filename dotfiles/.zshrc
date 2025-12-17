# ZSH Settings
export ZSH="$HOME/.oh-my-zsh"
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
alias tt="cd ~/src/tt/"
alias nom="cd ~/src/nom/nom"

# -- nvim
alias v="vim"
alias vi="vim"
alias vim="nvim"

# -- git
alias ga="git add"
alias gd="git diff"
alias gs="git status"
alias gc="git commit"
alias gcsm="git commit -S -m"
alias gck="git checkout"
alias gp="git push"
alias gpl="git pull"
alias gb="git branch"
alias glff="git pull --ff-only"
alias glr="git pull --rebase"
alias glpp="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gclean="git branch | grep -v -E '^\*|main|master|develop' | xargs -r git branch -D"

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
alias ..="cd .."
alias ...="cd ..."

# -- can't use ctrl-l to clear with tmux-vim bindings
alias c="clear"

# -- bat
alias cat="bat"

alias om="cd ~/src/omni-network/stack/"
alias nom="cd ~/src/nom"
alias tt="cd ~/src/ttarsi/"

# Paths
export PATH="/opt/homebrew/bin:$PATH"
export PATH="$HOME/.poetry/bin:$PATH"
export PATH="$HOME/.foundry/bin:$PATH"
export PATH="$HOME/.yarn/bin:$PATH"
export PATH="$HOME/.radicle/bin:$PATH"
export PATH="$(go env GOPATH)/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/google-cloud-sdk/completion.zsh.inc"; fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

export PATH=$PATH:~/Library/Python/3.9/bin

# gssh tool: https://github.com/corverroos/gssh
export GSSH_USER="tt"
export GPG_TTY=$(tty)

# Added by Windsurf
export PATH="$HOME/.codeium/windsurf/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

source "$HOME/.cargo/env"

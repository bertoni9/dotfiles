#Virtualenvwrapper
#export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3  # For local without python2
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
#source /usr/local/bin/virtualenvwrapper.sh # Only for local
#source ~/.local/bin/virtualenvwrapper.sh  # For workstation

#Pyenv
# export PYENV_ROOT="$HOME/.pyenv"
# export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init --path)"

export HISTCONTROL=ignoredups

# add hostname to right prompt
export RPROMPT='%{$fg[cyan]%}%m%{$reset_color%}'

# Add bold
#zle_highlight=(default:bold)

# ITERMPLOT
#export MPLBACKEND="module://itermplot"
#export ITERMPLOT=rv

#ITERM SCROLLING
bindkey "[D" backward-word
bindkey "[C" forward-word
bindkey "^[a" beginning-of-line
bindkey "^[e" end-of-line

#------------ Aliases ------------

# General
alias zs="nano ~/.zshrc"
alias ref="source ~/.zshrc"
alias l='ls'
alias cd..="cd .."
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias c='clear'
alias deac="deactivate"
alias ali="nano ~/.oh-my-zsh/custom/zsh_profile.zsh"
alias nv="nvidia-smi"

# tmux
alias tn="tmux -CC"
alias ta="tmux -CC attach"
alias tl="tmux list-sessions"
alias t0="tmux -CC attach -t 0"
alias t1="tmux -CC attach -t 1"
alias t2="tmux -CC attach -t 2"
alias t3="tmux -CC attach -t 3"
alias t4="tmux -CC attach -t 4"
alias t5="tmux -CC attach -t 5"
alias tk0="tmux kill-session -t 0"
alias tk1="tmux kill-session -t 1"
alias tk2="tmux kill-session -t 2"
alias tk3="tmux kill-session -t 3"
alias tk4="tmux kill-session -t 4"
alias tk5="tmux kill-session -t 5"

# Git
alias gs='git status'
alias gd='git diff'
alias gpush='git push origin master'
alias gpull='git pull origin master'
alias gprune='git remote update origin --prune'

# Extract
ex () {
   if [ -f "$1" ] ; then
       case "$1" in
           *.tar.bz2)   tar xvjf "$1"    ;;
           *.tar.gz)    tar xvzf "$1"    ;;
           *.bz2)       bunzip2 "$1"     ;;
           *.rar)       unrar x "$1"     ;;
           *.gz)        gunzip "$1"      ;;
           *.tar)       tar xvf "$1"     ;;
           *.tbz2)      tar xvjf "$1"    ;;
           *.tgz)       tar xvzf "$1"    ;;
           *.zip)       unzip "$1"       ;;
           *.Z)         uncompress "$1"  ;;
           *.7z)        7z x "$1"        ;;
           *)           echo "don't know how to extract '$1'... ";;
       esac
   else
       echo "'$1' is not a valid file!"
   fi
}

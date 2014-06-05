#
# !!! This file is not being load since change in zshrc.symlink
#
# Use `hub` as our git wrapper:
#   http://defunkt.github.com/hub/
hub_path=$(which hub)
if (( $+commands[hub] ))
then
  alias git=$hub_path
fi

# The rest of my fun git aliases
alias gl='git pull'
alias gp='git push'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gd='git diff'
alias gc='git commit'
alias gca='git commit -a'
alias gco='git checkout'
alias gb='git branch'
alias gs='git status -sb' # upgrade your git if -sb breaks for you. it's fun.
alias gst='git status'

alias grm="git status | grep deleted | awk '{\$1=\$2=\"\"; print \$0}' | \
           perl -pe 's/^[ \t]*//' | sed 's/ /\\\\ /g' | xargs git rm"
alias gci='git commit -am'
alias gb='git branch'
alias gba='git branch -a'
alias gitpu="git fetch origin -v; git fetch upstream -v; git merge upstream/master"

# how do you know which local branches doesn’t exist on the server anymore? Easily, just run:
# git remote prune origin --dry-run
alias gitcheckoldb="git remote prune origin --dry-run"
# you receive a list of your stale remote-tracking branches. If you run it without --dry-run option, it will remove them for you.
alias gitrmoldb="git remote prune origin"

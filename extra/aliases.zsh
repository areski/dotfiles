
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

alias rmpyc='find . -name "*.pyc" | xargs -I {} rm -v "{}"'
alias rmbak='find . -name "*.bak" | xargs -I {} rm -v "{}"'
alias rmluac='find . -name "*.luac" | xargs -I {} rm -v "{}"'
alias compluac='find . -name "*.lua" | xargs -I {} echo {}| sed "s/\.lua//g" | xargs -I {} luac -o {}.luac {}.lua'

alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'

alias mkgo='mkdir bin; mkdir src; mkdir pkg; touch .gopath'

alias pmix="cd /home/areski/projects/elixir/playground/ && mix deps.get && iex -S mix && cd -"

# Removed cause we use update_gopath to detect when we are in a directory with .gopath file
#export GOPATH=$HOME/go
#export PATH=$PATH:$GOPATH/bin

#gvm
source /home/areski/.gvm/scripts/gvm


#Bower
#On prezto or oh-my-zsh, do not forget to alias bower='noglob bower' or bower install jquery\#1.9.1
alias bower='noglob bower'


function k(){
    ps aux | grep $1 | tr -s ' ' | cut -f2 -d" " | xargs kill -9
}

#kiex
test -s "$HOME/.kiex/scripts/kiex" && source "$HOME/.kiex/scripts/kiex"

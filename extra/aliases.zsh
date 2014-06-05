
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

alias rmpyc='find . -name "*.pyc" | xargs -I {} rm -v "{}"'
alias rmbak='find . -name "*.bak" | xargs -I {} rm -v "{}"'

alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'

alias mkgo='mkdir bin; mkdir src; mkdir pkg; touch .gopath'

#export GOPATH=$HOME/go
#export PATH=$PATH:$GOPATH/bin

#Bower
#On prezto or oh-my-zsh, do not forget to alias bower='noglob bower' or bower install jquery\#1.9.1
alias bower='noglob bower'


function k(){
    ps aux | grep $1 | tr -s ' ' | cut -f2 -d" " | xargs kill -9
}

# -*- mode: sh -*-

# Changing/making/removing directory
setopt auto_name_dirs
setopt auto_pushd
setopt pushd_ignore_dups

# Update GOPATH depending on which Go project you're currently
# traversing.
#
# Sets environmental variable GOPATH if any parent directories has
# both a .gopath file and a ./src directory in it.  Correspondingly it
# unsets the variable if the previous condition is not true.
function update_gopath() {
    local cwd=$1

    directories=()
    elements=(${(s:/:)cwd})

    local total=${#elements}
    for (( i=0; i <= $total; i++ )); do
        rest=($elements[0,-$i])
        directory=(/${(j:/:)rest})
        directories+=($directory)
    done

    directories+=("/")

    for curdir in $directories; do
        if [ -f "$curdir/.gopath" ] && [ -d "$curdir/src" ]; then
            local new_gopath=$(/bin/readlink -f "$curdir")
            if [[ "$GOPATH" != "$new_gopath" ]]; then
                export GOPATH="$new_gopath"
                echo "GOPATH=$GOPATH"
            fi

            return
        fi

        curdir="${curdir}/.."
    done

    if [ ! -z $GOPATH ]; then
        unset GOPATH
        echo "GOPATH=$GOPATH"
    fi
}

function chpwd() {
    update_gopath $PWD
}

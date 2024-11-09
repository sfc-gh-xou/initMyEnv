source ~/.awscredentials
eval "$(sf aliases)"
function morning() {
    sfid
    sf ws ssh xws -c 'exit'
}

function rebase {
    if [[ -z "$1" ]]; then
        echo "No tags specified. Use bptp-stable."
        tag=bptp-stable
    else
        tag=$1
    fi

    git fetch origin tag $tag --force
    git rebase -i $tag
}

function work {
	SHELL=/usr/local/bin/zsh tmux new-session -A -s $1
}

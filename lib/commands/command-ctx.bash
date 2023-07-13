#!/bin/bash

set -e -o pipefail
current_script_path=${BASH_SOURCE[0]}
plugin_dir=$(dirname "$(dirname "$current_script_path")")

CTX_DIR="$HOME/.fabric-ctx"

# shellcheck source=../lib/utils.bash
source "${plugin_dir}/lib/utils.bash"

# Check to see if the context directory is already present
if [ ! -d "CTX_DIR" ]; then
    mkdir -p "CTX_DIR"
fi

# The horrible magic function to create a subshell
function createSubshell() {
    venvpath="$HOME/.gaia/envs/${1}/env.rc"

    # check which shell is being used
    if [[ "${SHELL}" =~ /bash/ ]]; then
        bash --init-file <(echo "source ${venvpath}")
    elif [[ ${SHELL} =~ zsh ]]; then

        # https://github.com/romkatv/zshi
        "${SCRIPT_DIR}/zshi" "source ${venvpath}" -i
    else
        echo "Sorry ${SHELL} is not supported; PRs Welcome!"
    fi
}

# Add an environment; copies the file (that should be exports.....)
# and prepends the context name to the prompt
function add() {
    envname=$1
    file=$2
    if [ -d "$CTX_DIR/$envname" ]; then
        echo "Already exists"
        exit 1
    fi

    mkdir -p "$CTX_DIR/$envname"
    cat $file | grep -v "^#" > "$CTX_DIR/$envname/env.rc"
    echo "PS1=\"${envname} \${PS1}\" " >> "$CTX_DIR/$envname/env.rc"

} 


# Simple CLI parsing
## Parse mode
if [[ $# -lt 1 ]] ; then
  echo "duh"
  exit 0
else
  COMMAND=$1
  shift
fi


case "${COMMAND}" in

    "use")
        EVNNAME=$1
    ;;
    "add")

        while [[ $# -ge 1 ]] ; do
            key="$1"
            case $key in
            --name )
                EVNNAME=$2
                shift
            ;;
            --file )
                ENVFILE=$2
                shift            
                ;;
            * )
                errorln "Unknown flag: $key"
                printHelp
                exit 1
                ;;
            esac
            shift
        done


    ;;
    "ls")
        ls "$HOME/.gaia/envs" 
    ;;
    *)
    echo "${COMMAND} not understood"
    exit 1
    ;;
esac


if [ "$COMMAND" == "add" ]; then
  infoln "Adding env $ENVFILE  $EVNNAME"
  add $EVNNAME $ENVFILE 
elif [ "$COMMAND" == "use" ]; then
  infoln "Setting up to use $EVNNAME"
  createSubshell $EVNNAME
else
  printHelp
  exit 1
fi










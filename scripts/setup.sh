#!/bin/bash

# Utility for installing required software
# Version: 1.0
# Author: Paul Carlton (mailto:paul.carlton@weave.works)

function usage()
{
    echo "USAGE: ${0##*/}"
    echo "Install software required for golang project"
}

function args() {
    while [ $# -gt 0 ]
    do
        case "$1" in
            "--help") usage; exit;;
            "-?") usage; exit;;
            *) usage; exit;;
        esac
    done
}

args "${@}"

sudo -E env >/dev/null 2>&1
if [ $? -eq 0 ]; then
    sudo="sudo -E"
fi

echo "Running setup script to setup software"

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

flux --version >/dev/null 2>&1 
ret_code="${?}"
if [[ "${ret_code}" != "0" ]] ; then
    brew install flux
else
    echo "flux version: $(flux --version)"
fi

helm version >/dev/null 2>&1
ret_code="${?}"
if [[ "${ret_code}" != "0" ]] ; then
    brew install helm
else
    echo "helm version: $(helm version)"
fi

kind version >/dev/null 2>&1 
ret_code="${?}"
if [[ "${ret_code}" != "0" ]] ; then
    brew install kind
else
    echo "kind version: $(kind version)"
fi

kubectl version --client >/dev/null 2>&1 
ret_code="${?}"
if [[ "${ret_code}" != "0" ]] ; then
    brew install kubectl
else
    echo "kubectl version: $(kubectl version --client)"
fi

kustomize version >/dev/null 2>&1
ret_code="${?}"
if [[ "${ret_code}" != "0" ]] ; then
    brew install kustomize
else
    echo "kustomize version: $(kustomize version)"
fi

kubeseal --version >/dev/null 2>&1
ret_code="${?}"
if [[ "${ret_code}" != "0" ]] ; then
    brew install kubeseal
else
    echo "kubeseal version: $(kubeseal --version)"
fi
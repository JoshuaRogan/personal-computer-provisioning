#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Update Config file for HTOP Program
brew list > ${DIR}/../scripts_install/brew.list
echo "Updated brew install list"
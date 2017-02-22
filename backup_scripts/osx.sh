#!/bin/bash
BACKUP_OSX_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"


# Update Config file for HTOP Program
brew list > ${BACKUP_OSX_DIR}/../configs/brew.list
echo "Updated brew install list"
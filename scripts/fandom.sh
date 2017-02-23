#!/usr/bin/env bash
INSTALL_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $INSTALL_DIR/../utils/utils.sh
source ./../utils/utils.sh

#!/bin/bash
while true; do
    shw_start_init "Requesting Fandom"
#    httpstat fandom.wikia.com
    shw_success_final "Request to fandom has finished"
    echo ""
    sleep 2
done

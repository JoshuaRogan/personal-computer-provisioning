#!/usr/bin/env bash

printf "\033c"
printf "\033[0;94m>>>>>>> Running Stress Test\033[0m\n\n"
set -x

outfilename="devbox-stress-output-$(date +%Y%m%d%s).txt"

# Example: ./stress-test-siege.sh jrogan
WIKIA_USER=${1:-jrogan}

################## Siege Commands ##################

# Requires you to have pssh locally (brew install pssh)
# Copy list of urls to each node (run initially then only when you change urls.txt)
pscp -h hosts -l ${WIKIA_USER} -Av urls.txt "/home/${WIKIA_USER}/"
#pssh -h hosts -t 0 -l ${WIKIA_USER} -A -i "siege -c100 -t 5m -f urls.txt" >

#!/usr/bin/env bash

printf "\033c"
printf "\033[0;94m>>>>>>> Running Stress Test\033[0m\n\n"
set -x

# Example: ./devBoxNetWithUrls.sh bingeBotFrontEnd jrogan
APP_NAME=${1:-bingeBotFrontEnd} # Current apps = profile, bingeBotFrontEnd
DEV_BOX_USER=${2:-jrogan}
CONCURRENCY=5
TIME="1s"

URLS="${APP_NAME}Urls.txt" # Put in data folder
LOCAL_URLS_FILE="data/${URLS}"
outfilename="${APP_NAME}-$(date +%Y-%m-%d-%s).stresstemp.txt"
echo ${outfilename}
################## AB Commands ##################


# check if file exists & if it was changed since the last run



# Copy list of urls to each node (run initially then only when you change urls.txt)
# UNCOMMENT When new url file is created or edited
#pscp -h hosts -l ${DEV_BOX_USER} -Av ${LOCAL_URLS_FILE} "/home/${DEV_BOX_USER}/"

# Copy urls file to output
cat "${LOCAL_URLS_FILE}" > "${outfilename}"

pssh -h hosts -t 0 -l "${DEV_BOX_USER}" -A -i "siege -c${CONCURRENCY} -t ${TIME} -f ${URLS}" >> "${outfilename}"

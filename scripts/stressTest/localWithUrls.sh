#!/usr/bin/env bash

printf "\033c"
printf "\033[0;94m>>>>>>> Running Stress Test\033[0m\n\n"
set -x

APP_NAME=${1:-bingeBotFrontEnd}
CONCURRENCY=10
TIME="100s"

URLS="${APP_NAME}Urls.txt" # Put in data folder
LOCAL_URLS_FILE="data/${URLS}"
outfilename="${APP_NAME}-$(date +%Y%m%d%s).local.stresstemp.txt"
################## AB Commands ##################


cat "${LOCAL_URLS_FILE}" > "${outfilename}"
siege -c${CONCURRENCY} -t ${TIME} -f "data/${URLS}" > "${outfilename}"


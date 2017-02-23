#!/usr/bin/env bash
CRON_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source ${CRON_DIR}/../utils/utils.sh
source ./../utils/utils.sh 2> /dev/null

GOOGLE_LOGS="/Users/joshrogan/Google Drive/Archives/logs/"

function daily_log() {
    cron_log "DAILY - $1"
}

################# COPY LOGS ################
function daily_copy_logs() {
    daily_log "Copying valet.all.log to Google Drive Archives"
    backup_with_ts_clear "/usr/local/var/log/" "$GOOGLE_LOGS" "valet.all.log"

    daily_log "Copying cron log to Google Archives"
    backup_with_ts "$CRON_DIR/" "$GOOGLE_LOGS" "cron.log"
}
################# COPY  LOGS ################

main() {
    if [ "$(uname)" == "Darwin" ]; then
        daily_copy_logs
        # output log size
        size=$(du -sh "${GOOGLE_LOGS}")
        daily_log "Log dir $size"
    elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
        daily_log "nothing"
    fi
}
main

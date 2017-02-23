#!/usr/bin/env bash
CRON_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source ${CRON_DIR}/../utils/utils.sh
source ./../utils/utils.sh 2> /dev/null

GOOGLE_LOGS="/Users/joshrogan/Google Drive/Archives/logs/"

function daily_log() {
    cron_log "DAILY - $1"
}



# $1 source dir
# $2 dest dir
# $3 filename
function backup_with_ts()
{
    ts=$(date +%s)
    cat "${1}${3}" >> "${2}${3}.${ts}"
}

function backup_with_ts_clear()
{
    backup_with_ts "${1}" "${2}" "${3}"
    echo -n > "${1}${3}"
}


################# COPY LOGS ################
daily_log "Copying valet.all.log to Google Drive Archives"
backup_with_ts_clear "/usr/local/var/log/" "$GOOGLE_LOGS" "valet.all.log"

daily_log "Copying cron log to Google Archives"
backup_with_ts "$CRON_DIR/" "$GOOGLE_LOGS" "cronlog"
################# COPY  LOGS ################

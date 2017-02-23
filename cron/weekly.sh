#!/usr/bin/env bash
CRON_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source ${CRON_DIR}/../utils/utils.sh
source ./../utils/utils.sh 2> /dev/null

GOOGLE_LOGS="/Users/joshrogan/Google Drive/Archives/logs/"

function weekly_log() {
    cron_log "WEEKLY - $1"
}


main() {
    if [ "$(uname)" == "Darwin" ]; then
        weekly_log "Copying cron log to Google Archives and clearing"
        backup_with_ts_clear "$CRON_DIR/" "$GOOGLE_LOGS" "cronlog"
        bash "${CRON_DIR}/../install_scripts/update-osx.sh" &> "${CRON_DIR}/cron.all.log"
    elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
        weekly_log "Updating ubuntu & removing bit torrent files"
        bash "${CRON_DIR}/../install_scripts/update-ubuntu.sh" &> "${CRON_DIR}/cron.all.log"
        sudo rm -rf /media/josh/seagate/bit_torrent
    fi
}
main

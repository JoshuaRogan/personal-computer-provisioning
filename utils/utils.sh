#!/usr/bin/env bash
UTILS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Helper Functions
source ${UTILS_DIR}/lib/bash-helpers/bash-common-helpers.sh
source ./lib/bash-helpers/bash-common-helpers.sh 2> /dev/null


# Helper Functions
#source ${UTILS_DIR}/lib/bash-booster/build/bashbooster.sh
#source ./lib/bash-booster/build/bashbooster.sh 2> /dev/null

# Colors
source ${UTILS_DIR}/colors.sh
source ./colors.sh 2> /dev/null



#   $1 source
#   $2 dest
mv_backup_file()
{
    # Make a backup
    shw_info_light "mv ${1}${2} -> ${1}${2}.$(date +%s).bak"
    mv ${1}${2} ${1}${2}.$(date +%s).bak
}

#   $1 = dest dir (ex ~/)
#   $2 = source dir
#   $3 = filename
link_file()
{
    shw_info_light "ln -s ${1}${3} ${2}${3}"
    ln -s ${1}${3} ${2}${3}
}

cron_log() {
    echo "[$(date)] $(uname) ${1}"  >> ${UTILS_DIR}/../cron/cron.log
}

# $1 source dir
# $2 dest dir
# $3 filename
backup_with_ts()
{
    ts=$(date +%s)
    cat "${1}${3}" >> "${2}${3}.${ts}"
}

backup_with_ts_clear()
{
    backup_with_ts "${1}" "${2}" "${3}"
    echo -n > "${1}${3}"
}


function assert_command_is_available {
  local cmd=${1}
  type ${cmd} >/dev/null 2>&1 || 0
}


function assert_file_exists {
  local file=${1}
  if [[ ! -f "${file}" ]]; then
    shw_warn "${2}"
    return 1
  fi

  return 0
}


function assert_file_does_not_exist {
  local file=${1}
  if [[ -e "${file}" ]]; then
    shw_warn "${2}"
    return 1
  fi

  return 0
}

#!/usr/bin/env bash
UTILS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source ${UTILS_DIR}/colors.sh
source ./colors.sh 2> /dev/null

#   $1 source
#   $2 dest
mv_backup_file()
{
    # Make a backup
    shw_info_light "Backing up ${1}${2} -> ${1}${2}.$(date +%s).bak"
    mv ${1}${2} ${1}${2}.$(date +%s).bak
}

#   $1 = dest dir (ex ~/)
#   $2 = source dir
#   $3 = filename
link_file()
{
    shw_info_light "Linking ${1}${3} -> ${2}${3}"
    ln -s ${1}${3} ${2}${3}
}
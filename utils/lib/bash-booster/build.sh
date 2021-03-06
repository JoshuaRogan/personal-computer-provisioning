#!/usr/bin/env bash

unset CDPATH
cd "$( dirname "${BASH_SOURCE[0]}" )"

OUTPUT="build/bashbooster.sh"
> $OUTPUT

TITLE="Bash Booster $( cat VERSION.txt ) <http://www.bashbooster.net>"
cat >> "$OUTPUT" <<EOF
# $TITLE
# $( eval "printf '=%.0s' {1..${#TITLE}}" )
#
# Copyright (c) 2014, Dmitry Vakhrushev <self@kr41.net> and Contributors
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

EOF

while read -r FILE
do
    echo -e "##\n# $FILE\n#\n" >> "$OUTPUT"
    cat "$FILE" >> "$OUTPUT"
    echo >> "$OUTPUT"
done < <( find ./source -name "*.sh" | sort )

#!/bin/sh
# filename:    ~/bin/nozbe-update.sh
# author:      Árpád Szász <arpad.szasz@plenum.ro>
# modified:    2018-01-06
# license:     The Artistic License 2.0 <http://www.perlfoundation.org/attachment/legal/artistic-2_0.txt>
# description: Install the lastest Nozbe for Linux version
# usage:       ./nozbe-update.sh

DIST_URL='https://nozbe.com/linux64'
DIST_NAME='NozbeLinux.tar'
TMP_FOLDER="/tmp/nozbe-$(date -I)"

[ -d "${TMP_FOLDER}" ] || mkdir "${TMP_FOLDER}"
cd "${TMP_FOLDER}"

SKIP_DOWNLOAD=
if [ -r "${DIST_NAME}" ]
then
    if [ "$(stat -t "${DIST_NAME}" | awk '{print $2}')" -gt "0" ]
    then
        SKIP_DOWNLOAD=1
    fi
fi
[ -n "${SKIP_DOWNLOAD}" ] || wget -q "${DIST_URL}" -O "${TMP_FOLDER}/${DIST_NAME}"

tar -xf "${DIST_NAME}"
$SHELL ./downloader.sh
rm -r "${TMP_FOLDER}"

exit 0

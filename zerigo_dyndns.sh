#!/bin/sh
#
# shell script to check if external IP has changed and
# update zerigo account if so
#

# login user and update token
USER=""
TOKEN=""
# file where the last looked-up ip is stored
IPFILE=""
# basic zerigo update URL
ZURL="http://update.zerigo.com/dynamic?"
# the hostname to change with the new IP
HOST=""

LAST_IP=`cat ${IPFILE} 2>/dev/null`
CURRENT_IP=`curl -s http://icanhazip.com`

if [ "$LAST_IP" != "$CURRENT_IP" ]
then
  echo "IP has changed to ${CURRENT_IP}."
  echo "Updating zerigo account..."
  curl -s "${ZURL}host=${HOST}&ip=${CURRENT_IP}&user=${USER}&password=${TOKEN}"
  echo "\nDone."
  echo "${CURRENT_IP}" > ${IPFILE}
fi

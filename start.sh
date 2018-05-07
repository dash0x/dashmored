#!/bin/bash

set -x

export QT_XKB_CONFIG_ROOT=/usr/share/X11/xkb
CONF_PATH="/root/.pivx/pivx.conf"
#
#if [ -e $(echo CONF_PATH) ]; then
#    mkdir -p /root/.pivx/
#    touch $(echo CONF_PATH)

#fi
chmod -R 0777 $CONF_PATH
echo rpcuser=$RPC_USER > $CONF_PATH
echo rpcpassword=$RPC_PASSWORD >> $CONF_PATH
echo "rpcallowip=${RPC_ALLOW_IP:-0.0.0.0}" >> $CONF_PATH

if [ -z ${STAKING:+x} ]; then
    echo "staking=${STAKING}" >> $CONF_PATH
fi

if [ -z ${LISTEN:+x} ]; then
    echo "listen=${LISTEN}" >> $CONF_PATH
fi

if [ -z ${LOG_TIMESTAMPS:+x} ]; then
    echo "logtumestamps=${LOG_TIMESTAMPS}" >> $CONF_PATH
fi

if [ -z ${MAX_CONNECTIONS:+x} ]; then
    echo "maxconnections=${MAX_CONNECTIONS}" >> $CONF_PATH
fi


dashmd -server

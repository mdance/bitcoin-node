#!/bin/bash
apt-get update
apt-get -y install python-pip
pip install ansible

mkdir -p /etc/ansible

ANSIBLE_HOSTS=/etc/ansible/hosts

if [ ! -e $ANSIBLE_HOSTS ]; then
  cat >${ANSIBLE_HOSTS} <<EOF
localhost
EOF
fi

ENV_FILE=/opt/env

if [ ! -e $ENV_FILE ]; then
	PASSWORD=`openssl rand -hex 32`

  cat >${ENV_FILE} <<EOF
BTC_PRUNE=0
BTC_RPCUSER=btc
BTC_RPCPASSWORD=$PASSWORD
BTC_RPCCLIENTTIMEOUT=30
BTC_RPCALLOWIP=::/0
BTC_RPCPORT=8332
BTC_PRINTTOCONSOLE=1
BTC_DISABLEWALLET=0
BTC_TXINDEX=1
BTC_TESTNET=0
EOF
fi

HOME=/root ansible-pull -o -d /opt/bitcoin-node -U https://github.com/mdance/bitcoin-node /opt/bitcoin-node/ansible/bitcoin_node.yml >> /var/log/ansible-pull.log
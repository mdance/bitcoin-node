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

HOME=/root ansible-pull -o -d /opt/bitcoin-node -U https://github.com/mdance/bitcoin-node /opt/bitcoin-node/ansible/bitcoin_node.yml >> /var/log/ansible-pull.log
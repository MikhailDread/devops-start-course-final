#!/bin/bash

# Script for making .ovpn files for vpn settings on client
# First argument: Client identifier

KEY_DIR=/home/mikhail/ovpn-certs/server
OUTPUT_DIR=/home/mikhail/clientconfig
BASE_CONFIG=/home/mikhail/openvpn-configuration/openvpn-client.conf

cat ${BASE_CONFIG} \
    <(echo -e '<ca>') \
    ${KEY_DIR}/ca.crt \
    <(echo -e '</ca>\n<cert>') \
    ${KEY_DIR}/${1}.crt \
    <(echo -e '</cert>\n<key>') \
    ${KEY_DIR}/${1}.key \
    <(echo -e '</key>\n<tls-crypt>') \
    ${KEY_DIR}/ta.key \
    <(echo -e '</tls-crypt>') \
    > ${OUTPUT_DIR}/${1}.ovpn
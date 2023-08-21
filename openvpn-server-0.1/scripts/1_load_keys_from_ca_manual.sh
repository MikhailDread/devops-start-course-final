#!/usr/bin/env bash

sudo scp -r mikhail@192.168.3.51:/home/mikhail/ovpn-certs/ /home/mikhail
sudo cp -r /home/mikhail/ovpn-certs/** /etc/openvpn/server
sudo /usr/sbin/openvpn --genkey --secret /home/mikhail/ta.key
sudo cp /home/mikhail/ta.key /etc/openvpn/server/

sudo chmod 777 /home/mikhail/ovpn-certs/



sudo cp /home/mikhail/ovpn-certs/client-1.crt /etc/openvpn/client/
sudo cp /home/mikhail/openvpn-configuration/openvpn-server.conf /etc/openvpn/server/server.conf
sudo /usr/sbin/openvpn --config /etc/openvpn/server/server.conf --status /var/log/openvpn/ovpn.status --ca /home/mikhail/ovpn-certs/ca.crt --cert /home/mikhail/ovpn-certs/server.crt --key /home/mikhail/ovpn-certs/server.key
sudo mkdir /home/mikhail/clntconfig
sudo cp /home/mikhail/ta.key /home/mikhail/clntconfig
sudo bash /home/mikhail/scripts/make_config.sh client-1

sudo chown -R mikhail:mikhail ovpnconf/
#!bin/bash

sudo apt update
sudo apt install -y ufw
sudo ufw default deny outgoing
sudo ufw default deny incoming
sudo ufw allow 22
sudo ufw --force enable
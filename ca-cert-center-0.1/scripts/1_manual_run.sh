
cd /home/ca/easy-rsa/easyrsa3
sudo ./easyrsa init-pki
sudo ./easyrsa build-ca
sudo ./easyrsa gen-req server nopass
sudo ./easyrsa sign-req server server

mkdir ~/ovpn-certs/
sudo cp /home/ca/easy-rsa/easyrsa3/pki/issued/server.crt ~/ovpn-certs/server/
sudo cp /home/ca/easy-rsa/easyrsa3/pki/ca.crt ~/ovpn-certs/server/
sudo openvpn --genkey --secret ta.key
sudo cp /home/ca/easy-rsa/ta.key /etc/openvpn/server/
sudo cp /home/ca/easy-rsa/easyrsa3/pki/private/server.key ~/ovpn-certs/ ????

sudo ./easyrsa gen-req client-1 nopass
sudo ./easyrsa sign-req client client-1
sudo cp cp /home/ca/easy-rsa/ta.key /home/mikhail/ovpn-certs/
sudo cp /home/ca/easy-rsa/easyrsa3/pki/issued/client-1.crt /home/mikhail/ovpn-certs/
sudo cp /home/ca/easy-rsa/easyrsa3/pki/private/client-1.key /home/mikhail/ovpn-certs/

sudo chown -R mikhail:mikhail /home/mikhail/ovpn-certs

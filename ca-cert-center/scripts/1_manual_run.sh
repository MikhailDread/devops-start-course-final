# sudo dpkg -i /home/mikhail/ca-company-1.0.deb

cd /home/ca/easy-rsa/easyrsa3
sudo ./easyrsa init-pki
sudo ./easyrsa build-ca
sudo ./easyrsa gen-req server nopass
sudo ./easyrsa sign-req server server

mkdir ~/ovpn-certs/
sudo cp /home/ca/easy-rsa/easyrsa3/pki/issued/server.crt ~/ovpn-certs/clients ??????
sudo cp /home/ca/easy-rsa/easyrsa3/pki/ca.crt ~/ovpn-certs/clients/keys
sudo cp /home/ca/easy-rsa/easyrsa3/pki/ca.crt ~/ovpn-certs/clients/keys
sudo cp /home/ca/easy-rsa/easyrsa3/pki/private/server.key ~/ovpn-certs/ ????



sudo ./easyrsa gen-req client-1 nopass
sudo ./easyrsa sign-req client client-1
sudo cp /home/ca/easy-rsa/easyrsa3/pki/issued/client-1.crt /home/mikhail/ovpn-certs/
sudo cp /home/ca/easy-rsa/easyrsa3/pki/private/client-1.key /home/mikhail/ovpn-certs/

sudo chown -R mikhail:mikhail /home/mikhail/ovpn-certs

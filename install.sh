#!/bin/sh

apt-get install build-essential linux-headers-`uname -r`

echo "deb http://archive.gplhost.com/debian openstack main
deb http://archive.gplhost.com/debian wheezy-backports main" >> /etc/apt/sources.list

wget -qO - http://archive.gplhost.com/debian/repository_key.asc | apt-key add -

apt-get update

wget "http://anonscm.debian.org/gitweb/?p=openstack/openstack-auto-builder.git;a=blob_plain;f=preseeder" -O preseeder

chmod +x preseeder

sed -i "s/changeme/ADMIN/" ./preseeder

./preseeder

apt-get install openstack-toaster

echo "#export SERVICE_ENDPOINT=http://127.0.0.1:35357/v2.0/
#export SERVICE_TOKEN=ADMIN

export OS_USERNAME=admin
export OS_PASSWORD=ADMIN
export OS_TENANT_NAME=admin
export OS_AUTH_URL=http://127.0.0.1:5000/v2.0/
export OS_VERSION=1.1
export OS_NO_CACHE=1
" > stackrc


#FIX A BUG
sed -i "s/^quantum/#quantum/" /etc/sudoers.d/quantum_sudoers
echo "quantum ALL = (ALL) NOPASSWD: ALL" >> /etc/sudoers.d/quantum_sudoers

#this install is using sqlite db :(
nova-manage db sync

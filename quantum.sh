#!/bin/sh

#PRIVATE
ovs-vsctl add-br br-int

#Network
quantum net-create testnetwork

#Subnet
quantum subnet-create -- testnetwork 10.0.0.0/24

#DNS Server for previous subnet
quantum subnet-update <SUBNET_ID> --dns_nameservers list=true 8.8.8.8

#Tenant Router
quantum router-create testrouter

#Plugging router in
quantum router-interface-add <ROUTER_ID> <SUBNET_ID>

#PUBLIC
#Create bridge
ovs-vsctl add-br br-ex

#
ovs-vsctl add-port br-ex eth0
ifconfig br-ex 1.2.3.9 netmask 255.255.255.0 up
ifconfig eth0 0.0.0.0 up
route add default gw 1.2.3.1

#Create Public Network
quantum net-create ext_net -- --router:external=True

#Create Subnet
quantum subnet-create --allocation-pool start=1.2.3.5,end=1.2.3.8 ext_net 1.2.3.0/24 -- --enable_dhcp=False

#Set gateway for router
quantum router-gateway-set 0d259ad9-7727-44f2-9d86-a8d682073d87 cd5dea18-1d25-492d-88b1-c439a0a93dad

#Boot instance
#nova boot --flavor 1 --image <IMG_ID> --nic net-id=<NET_ID> <INST_NAME>

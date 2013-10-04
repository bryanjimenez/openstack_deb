#!/bin/bash

ovs-vsctl add-br br-ex
ovs-vsctl add-port br-ex eth0
ifconfig br-ex 172.23.18.239 netmask 255.255.0.0 up
ifconfig eth0 0.0.0.0 up
route add default gw 172.23.1.1

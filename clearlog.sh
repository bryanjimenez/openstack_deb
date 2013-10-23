#!/bin/bash


echo "" >/var/log/nova/nova-api.log
echo "" >/var/log/nova/nova-cert.log
echo "" >/var/log/nova/nova-network.log
echo "" >/var/log/nova/nova-compute.log
echo "" >/var/log/nova/nova-consoleauth.log
echo "" >/var/log/nova/nova-console.log
echo "" >/var/log/nova/nova-manage.log
echo "" >/var/log/nova/nova-scheduler.log
echo "" >/var/log/nova/nova-xvpvncproxy.log

echo "" >/var/log/cinder/cinder-api.log
echo "" >/var/log/cinder/cinder-manage.log
echo "" >/var/log/cinder/cinder-scheduler.log
echo "" >/var/log/cinder/cinder-volume.log

#echo "" >/var/log/quantum/l3-agent.log
#echo "" >/var/log/quantum/dhcp-agent.log
#echo "" >/var/log/quantum/ovs-agent.log
#echo "" >/var/log/quantum/quantum-server.log


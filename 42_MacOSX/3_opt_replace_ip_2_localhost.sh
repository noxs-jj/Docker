#!/bin/bash

# vm must be powered off
for i in {49000..49900}; do
 VBoxManage modifyvm "boot2docker-vm" --natpf1 "tcp-port$i,tcp,,$i,,$i";
 VBoxManage modifyvm "boot2docker-vm" --natpf1 "udp-port$i,udp,,$i,,$i";
done

# REVERSE vm must be powered off
# for i in {49000..49900}; do
#  VBoxManage modifyvm "boot2docker-vm" --natpf1 delete "tcp-port$i";
#  VBoxManage modifyvm "boot2docker-vm" --natpf1 delete "udp-port$i";
# done
#!/bin/bash
#Start boot2docker
boot2docker up && echo "Boot2docker Start SUCCESS" \
#Mount shared file to boot2docker
boot2docker ssh "sudo modprobe vboxsf && mkdir -v -p /home/docker/data \
&& sudo mount -v -t vboxsf  -o uid=0,gid=0 data /home/docker/data" \
&& echo "~/docker/data share to boot2docker SUCCESS" \
#print ip to boot2docker VM
boot2docker ip
#Print image stored
docker images
#Print running containers (and past)
docker ps -a
####For exemple i use sharing folder following:
	'/nfs/zfs-student-2/users/2013/jmoiroux/docker/data'
	same as '~/docker/data'


###confirm boot2docker doesn't run
	boot2docker stop


###Add share file to boot2docker
	VBoxManage sharedfolder add boot2docker-vm --automount -name [uselessName] -hostpath [path/to/directory]
	ex: 	VBoxManage sharedfolder add boot2docker-vm --automount -name data -hostpath ~/docker/data


###Mount shared file to volume into boot2docker
	boot2docker ssh "sudo modprobe vboxsf && mkdir -v -p [directory/under/boot2docker/vm] && sudo mount -v -t vboxsf  -o uid=0,gid=0 [uselessName] [directory/under/boot2docker/vm]"
	ex:	boot2docker ssh "sudo modprobe vboxsf && mkdir -v -p /home/docker/data && sudo mount -v -t vboxsf  -o uid=0,gid=0 data /home/docker/data"
	or
	echo 'sudo mount -t vboxsf /media/root/sf_[uselessName]' | boot2docker ssh
	ex:	echo 'sudo mount -t vboxsf Shared /media/root/sf_uselessName' | boot2docker ssh
	


###start boot2docker
	boot2docker up (or start)



You must mount volume each launch of boot2docker, you can check 'launch_docker_shared.sh' to do your own script for launch boot2docker faster

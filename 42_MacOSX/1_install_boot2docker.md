Pre-requis
** 'brew' must be installed to continue** [brew](http://brew.sh/)

1. Update brew
	brew update

2. Install docker
	brew install docker

3. Install boot2docker
	brew install boot2docker

4. Init boot2docker
	boot2docker init

5. Export DOCKER_HOST var
	export DOCKER_HOST=tcp://192.168.xxx.yyy:zzzz
	ex: export DOCKER_HOST=tcp://192.168.59.103:2375
You can get ip with
	boot2docker ip

DONE
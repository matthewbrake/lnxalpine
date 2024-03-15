# alpine-linux-setup
Alpine Linux Setup

# Alpine Linux
## Base Installation
* download iso from internet
* create vm, boot
* run `setup-alpine` script
*   SSH - ProhibtPassword - (choose yes to allow root)
*   Do not create user on setup-alpine script
*   reboot after script then use `setup-user` 

## Setup - User 
* After install use `setup-user`
* 
## Setup - Repos 
* `reboot`
* run `setup-apkrepos -cf`
* apk add sudo
  
## Auto Personalization
* login as `root`
* `apk add git`
* `git clone https://github.com/matthewbrake/lnxalpine`
* `cd lnxalpine`
* `su root ./step1.sh`
* or `su root`
* `/setup.sh`

## Add portainer agent
docker run -d \
  -p 9001:9001 \
  --name portainer_agent \
  --restart=always \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /var/lib/docker/volumes:/var/lib/docker/volumes \
  portainer/agent:2.19.4

  
## Hostname
* `hostname LNX-****`

## Setup Gui Destop
* run `setup-desktop` 
* choose which desktop envrionment
* 
## Manual Personalization
* login as `user`
* `ssh-keygen`

````
eval `ssh-agent -s`
ssh-add
````

## YouTube Video
* https://youtu.be/X_T-cKum8dc



# alpine-linux-setup
Alpine Linux Setup

# Alpine Linux
## Base Installation
* download iso from internet
* create vm, boot
* run `setup-alpine` script
* do not create a new user in this script yet
* Allow root to access ssh
* `reboot`
* run `setup-apkrepos -cf`
* apk add sudo
  
## Auto Personalization
* login as `root`
* `apk add git`
* `git clone 'https://github.com/matthewbrake/lnxalpine'
* `cd lnxalpine`
* `su ./setup.sh`
* su root ./step1.sh

## Add portainer agent
docker run -d \
  -p 9001:9001 \
  --name portainer_agent \
  --restart=always \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /var/lib/docker/volumes:/var/lib/docker/volumes \
  portainer/agent:2.19.4
## hostname

hostname LNX-****
## Manual Personalization
* login as `user`
* `ssh-keygen`

````
eval `ssh-agent -s`
ssh-add
````

## YouTube Video
* https://youtu.be/X_T-cKum8dc



# alpine-linux-setup
Alpine Linux Setup

# Alpine Linux
## Base Installation
* download iso from internet
* create vm, boot
* run `setup-alpine` script
* `reboot`

## Auto Personalization
* login as `root`
* `apk add git`
* `git clone 'https://github.com/matthewbrake/lnxalpine'
* `cd lnxalpine`
* `su ./setup.sh`
* su root ./step1.sh

## Manual Personalization
* login as `user`
* `ssh-keygen`

````
eval `ssh-agent -s`
ssh-add
````

## YouTube Video
* https://youtu.be/X_T-cKum8dc



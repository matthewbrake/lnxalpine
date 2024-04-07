# after the virtual disk has already been expanded (e.g. in proxmox)
apk add --no-cache cfdisk e2fsprogs-extra
# choose partition then "Resize" > "Write - yes" > "Quit" (to finalize)
sudo cfdisk
# replace * with partition you are resizing
sudo resize2fs /dev/sda*
# Reboot system
reboot
# List partitions 
df -h

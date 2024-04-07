# after the virtual disk has already been expanded (e.g. in proxmox)

apk add --no-cache cfdisk e2fsprogs-extra

# choose partition then "Resize" > "Write" (to finalize)
cfdisk
(choose disk) / resize / write / quit
# replace * with partition you are resizing
resize2fs /dev/*
reboot
df -h

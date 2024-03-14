# after the virtual disk has already been expanded (e.g. in proxmox)

apk add --no-cache cfdisk e2fsprogs-extra

# choose partition then "Resize" > "Write" (to finalize)
cfdisk

# replace * with partition you are resizing
resize2fs /dev/*

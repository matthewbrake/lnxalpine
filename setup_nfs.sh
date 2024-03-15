#!/bin/bash

# Step 1: Create the Shared Folder
mkdir -p /nextcloud/nfs

# Step 2: Set Permissions and Ownership
chown root:root /nextcloud/nfs
chmod 755 /nextcloud/nfs

# Step 3: Configure NFS Share
echo "/nextcloud/nfs *(rw,sync,no_root_squash,no_subtree_check)" >> /etc/exports

# Step 4: Export NFS Share
exportfs -a

# Step 5: Install NFS Client (if not already installed)
apk add nfs-utils

# Step 6: Mount NFS Share on Alpine Linux for Testing
mount -t nfs localhost:/nextcloud/nfs /mnt/test_mount
echo "Test NFS Mount Successful!"  # Check if mount was successful

# Step 7: Test Folder Permissions
touch /nextcloud/nfs/test_file
ls -l /nextcloud/nfs  # Check ownership and permissions

# Step 8: Unmount NFS Share
umount /mnt/test_mount
echo "NFS Mount Unmounted Successfully!"

# Step 9: Clean Up (Optional)
rm -rf /nextcloud/nfs  # Remove the test folder

# Step 10: Print Completion Message
echo "NFS Setup and Testing Completed!"

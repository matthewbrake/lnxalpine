# Install Required Packages on Alpine Linux
apk add cifs-utils

# Create a Mount Point on Alpine Linux
mkdir /mnt/smb

# Mount the SMB Share on Alpine Linux
# Replace 'username', 'password', '//windows-server/share', and '/mnt/smb' with actual details
mount -t cifs -o username=your_username,password=your_password //windows-server/share /mnt/smb

# Verify the Mount
ls /mnt/smb

# Configure Permissions on Windows Share (NTFS)
# - Right-click on the shared folder on Windows
# - Go to "Properties" > "Security" tab
# - Click "Edit" to modify permissions
# - Add necessary users/groups with appropriate permissions
# - Ensure "Everyone" group has at least Read permissions for testing

# Set Linux Permissions on Mount Point (if needed)
chmod -R 755 /mnt/smb

# Test Access and Permissions
touch /mnt/smb/test_file
# Verify the file exists and can be accessed from Windows

# Unmount the SMB Share (Optional)
# umount /mnt/smb

# Troubleshooting:
# - Check for error messages during mount for authentication or permission issues
# - Ensure Linux user has necessary permissions to mount and access the share
# - Verify Windows firewall or security software isn't blocking SMB connections

# Completion: SMB share should now be mounted on Alpine Linux with appropriate permissions configured on both sides

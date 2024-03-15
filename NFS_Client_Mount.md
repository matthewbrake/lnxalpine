
## NFS GUIDE v2 ##
Create NFS server mount (allow anon/root rw)
Create docker container with volume host bind mount (nfs/drive:nfs/drive)
- Make sure the docker runs as the permssions you want example specify (GUID 1000 and UID 1000) if your host machine matches that most likely

sudo mkdir -p /nextcloud/d
sudo mount -t nfs 10.0.0.240:/nextcloud /nfs/winserver
ls /nextcloud/data
sudo nano /etc/fstab
10.0.0.240:/nextcloud /nfs/winserver nfs defaults 0 0
sudo umount /nfs/winserver
sudo mount -a
ls /nfs/winserver

If it does not work try below
sudo chown -R 1000:1000 /path/to/folder
sudo chmod -R 777 /path/to/folder
sudo chmod 0770 /nextcloud/data

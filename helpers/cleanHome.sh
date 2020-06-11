#!bin/sh

currentuser="$(whoami)"

#Mv original iso into home
sudo mv /home/$currentuser/livecdtmp/ubuntu-20.04-desktop-amd64.iso ~

cd /home/$currentuser/livecdtmp
sudo umount mnt

cd /home/$currentuser/livecdtmp/edit/
sudo umount run

cd ~
sudo rm -r livecdtmp

#!bin/sh

#Mv original iso into home
sudo mv $HOME/livecdtmp/ubuntu-20.04-desktop-amd64.iso ~

cd $HOME/livecdtmp
sudo umount mnt

cd $HOME/livecdtmp/edit/
sudo umount run

cd ~
sudo rm -r livecdtmp

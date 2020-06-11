#!/bin/sh
currentuser="$(whoami)"

apt update
echo "deb [trusted=yes arch=amd64]" \
    "http://dev.laptop.org/~quozl/.us focal main" \
    >/etc/apt/sources.list.d/olpc.sources.list

sudo add-apt-repository -y ppa:pyeduca/pyeducadependencies

sudo add-apt-repository -y ppa:jclic/master

apt-get update

#Donwload and install Scratch
wget --no-parent --user-agent "user" -P $HOME/os-builder/ http://paraguayeduca.org/descarga/Scratch_3.0.deb
dpkg -i $HOME/os-builder/Scratch_3.0.deb
rm $HOME/os-builder/Scratch_3.0.deb

#Install pyedu dependencies
apt install -y pyedu-dependencies

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

pip3 install flatpak-sync

flatpak-sync run -v
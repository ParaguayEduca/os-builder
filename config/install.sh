#!/bin/bash

apt update

declare -a appShortcuts=("firefox.desktop" "geogebra.desktop" "etoys.desktop" "jclic.desktop" "scratch-desktop.desktop")
shortcuts(){
    mkdir -p /etc/skel/Desktop
    echo -e "#!/bin/bash \n" \
    "for i in inkscape cura blender breecad freecad arduino arduino-cre; do" \
    "apt install -y $i;" \
    "done" \
    >/etc/skel/Desktop/fatlab
    chmod +x /etc/skel/Desktop/fatlab

    for appName in "${appShortcuts[@]}"; do
        chmod +x /usr/share/applications/"$appName"
        ln -s /usr/share/applications/"$appName" /etc/skel/Desktop/"$appName"
    done
}

addingRepository(){
    echo "deb [trusted=yes arch=amd64]" \
    "http://dev.laptop.org/~quozl/.us focal main" \
    >/etc/apt/sources.list.d/olpc.sources.list

    for i in ppa:pyeduca/pyeducadependencies ppa:jclic/master; do
        sudo add-apt-repository -y $i;
    done
}

downloadDeb(){
    wget --no-parent --user-agent "user" -P $HOME/os-builder/ http://paraguayeduca.org/descarga/Scratch_3.0.deb
    wget -P $HOME/os-builder/ http://s4a.cat/downloads/S4A16.deb
}

addingRepository
apt-get update

#Install Scratch
downloadDeb
dpkg -i $HOME/os-builder/Scratch_3.0.deb
dpkg -i $HOME/os-builder/S4A16.deb
rm $HOME/os-builder/Scratch_3.0.deb
rm $HOME/os-builder/S4A16.deb

#Install pyedu dependencies
apt install -y pyedu-dependencies

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

pip3 install flatpak-sync

flatpak-sync run -v
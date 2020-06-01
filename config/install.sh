#!/bin/sh root
apt update
echo "deb [trusted=yes arch=amd64]" \
    "http://dev.laptop.org/~quozl/.us focal main" \
    >/etc/apt/sources.list.d/olpc.sources.list

sudo add-apt-repository -y ppa:pyeduca/pyeducadependencies

sudo add-apt-repository -y ppa:jclic/master

apt-get update

#Install pyedu dependencies
apt install -y pyedu-dependencies

#Install Pip2
curl https://bootstrap.pypa.io/get-pip.py --output get-pip.py
python2 get-pip.py

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo Instalando programas de Flathub:
echo Instalando FractionBounce
flatpak install flathub org.sugarlabs.FractionBounce -y
echo Instalando Dimensions
flatpak install flathub org.sugarlabs.Dimensions -y
echo Instalando MusicKeyboard
flatpak install flathub org.sugarlabs.MusicKeyboard -y
echo Instalando ImplodeActivity
flatpak install flathub org.sugarlabs.ImplodeActivity -y
echo Instalando Sliderule
flatpak install flathub org.sugarlabs.Sliderule -y
echo Instalando FotoToon
flatpak install flathub org.sugarlabs.FotoToon -y
echo Instalando AbacusActivity
flatpak install flathub org.sugarlabs.AbacusActivity -y
echo Instalando Maze
flatpak install flathub org.sugarlabs.Maze -y
echo Instalando Memorize
flatpak install flathub org.sugarlabs.Memorize -y
echo Instalando ReadETexts
flatpak install flathub org.sugarlabs.ReadETexts -y
echo Instalando StoryActivity
flatpak install flathub org.sugarlabs.StoryActivity -y
echo Instalando Measure
flatpak install flathub org.sugarlabs.Measure -y
echo Instalando TurtlePondActivity
flatpak install flathub org.sugarlabs.TurtlePondActivity -y
echo Instalando Words
flatpak install flathub org.sugarlabs.Words -y
echo Instalando Speak
flatpak install flathub org.sugarlabs.Speak -y
echo Instalando Pippy
flatpak install flathub org.sugarlabs.Pippy -y
echo Instalando Physics
flatpak install flathub org.sugarlabs.Physics -y
echo Instalando ColorDeducto
flatpak install flathub org.sugarlabs.ColorDeducto -y
echo Instalando Chart
flatpak install flathub org.sugarlabs.Chart -y
echo Instalando Finance
flatpak install flathub org.sugarlabs.Finance -y
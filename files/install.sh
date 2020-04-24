#!/bin/sh root
apt update
echo "deb [trusted=yes arch=amd64]" \
        "http://dev.laptop.org/~quozl/.us focal main" \
            > /etc/apt/sources.list.d/olpc.sources.list
apt update
yes | apt install vim
yes | apt install sucrose
yes | apt install gcompris-qt

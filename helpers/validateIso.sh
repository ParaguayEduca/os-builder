#!bin/sh

error() {
    echo "ERROR: $1"
    exit 1
}

getSha256sum() {
    cat ubuntu-20.04-desktop-amd64.iso | sha256sum | head -c 64
}

isoName=ubuntu-20.04-desktop-amd64.iso
isoHash=e5b72e9cfe20988991c9cd87bde43c0b691e3b67b01f76d23f8150615883ce11

if [ ! -f $isoName]; then
    error "File $isoName doesn't exist"
elif [ "$(getSha256sum $isoName)" = "$isoHash" ]; then
    echo "Success: $isoName matches sha256sum"
else
    error "$isoName doesn't match sha256sum"
fi

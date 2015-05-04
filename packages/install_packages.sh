#!/bin/sh

set -e

if [ $1 = "-v" ]; then
    set -x
fi

if [ $(id -u) -ne 0 ]; then
    echo "Please run as root"
    exit 1
fi

PACKAGES="
cmake
dropbox
dunst
feh
git
gnome-settings-daemon
i3
i3lock
i3status
nm-applet
subl
redshift
unp
"

OTHER="
blueman-applet
firefox
j4-dmenu-desktop
spotify
"

LOG="packages.log"
ERROR="packages_error.log"

# Move into temporary directory and make hell
mkdir -p tmp
cd tmp

# Ensure that ~/opt and ~/bin exists
mkdir -p $HOME/opt/hub
mkdir -p $HOME/bin

# Add to PATH if not present already
PATH=$PATH:$HOME/bin

# Utils
is_installed() {
    if hash "$1" 2>/dev/null; then
        return 0
    else
        return 1
    fi
}

update() {
    echo "  updating..."
    apt-get update -qq 2>> $ERROR
}

install() {
    if ! is_installed $1; then
        echo  "  installling: '$1'"
        apt-get install -qq --print-uris $1 >> $LOG 2>>$ERROR
    fi
}

# Custom
install_spotify() {
    # Source: https://www.spotify.com/us/download/previews/
    if is_installed spotify; then
        return 0
    fi
    echo "  Installing: 'spotify'"

    # 1. Add spotify
    echo "deb http://repository.spotify.com stable non-free" | tee -a /etc/apt/sources.list.d/spotify.list

    # 2. Add public key
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 94558F59

    # 3. Run apt-get update
    update

    # 4. Install spotify
    install spotify-client
}

install_j4_dmenu_desktop() {
    if is_installed j4-dmenu-desktop; then
        return 0
    fi
    echo "  Installing: 'j4-dmenu-desktop'"

    git clone https://github.com/enkore/j4-dmenu-desktop
    cd j4-dmenu-desktop
    cmake .
    make
    make install
}

install_hub() {
    if is_installed hub; then
        return 0
    fi
    echo "  Installing: 'hub'"

    wget -q -O hub.tar.gz https://github.com/github/hub/releases/download/v2.2.1/hub-linux-amd64-2.2.1.tar.gz
    tar -xf hub.tar.gz -C $HOME/opt/hub --strip-components=1
    cp $HOME/opt/hub/hub $HOME/bin
}

# Install
report_uninstalled() {
    for package in $1
    do
        if ! is_installed $package; then
            echo "  not installed: '$package'"
        fi
    done
}

install_packages() {
    for package in $PACKAGES
    do
        install $package
    done
}

# Start installing
report_uninstalled $PACKAGES
report_uninstalled $OTHER

update
install_packages $PACKAGES

# Custom install
install_spotify
install_j4_dmenu_desktop
install_hub
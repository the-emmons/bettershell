#!/bin/bash
sudo apt remove rlwrap -y
sudo rm -r /tmp/rlwrap
sudo rm -r ~/.config/rlwrap
sudo rm -r /usr/bin/bettershell
mkdir -p ~/.config/rlwrap
cp bin/autocomplete.conf ~/.config/rlwrap/
sudo cp bin/bettershell /usr/bin && sudo chmod +x /usr/bin/bettershell && sudo chown root:root /usr/bin/bettershell
STARTDIR=$(pwd) && cd /tmp && git clone https://github.com/hanslub42/rlwrap
cd /tmp/rlwrap/ && autoreconf --install
sudo ./configure && sudo make && sudo make uninstall && sudo make install && cd / && sudo rm -r /tmp/rlwrap && cd $STARTDIR

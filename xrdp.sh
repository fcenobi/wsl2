sudo apt install xrdp
sudo apt install -y xfce4
#scegliere gdm3
sudo apt install -y xfce4-goodies



sudo cp /etc/xrdp/xrdp.ini /etc/xrdp/xrdp.ini.bak
sudo sed -i 's/3389/3390/g' /etc/xrdp/xrdp.ini
sudo sed -i 's/max_bpp=32/#max_bpp=32\nmax_bpp=128/g' /etc/xrdp/xrdp.ini
sudo sed -i 's/xserverbpp=24/#xserverbpp=24\nxserverbpp=128/g' /etc/xrdp/xrdp.ini
echo xfce-session > ~/.xsession



#echo "test -x /etc/X11/Xsession && exec /etc/X11/Xsession" >> /etc/xrdp/startwm.sh
#echo "exec /bin/sh /etc/X11/Xsession" >> /etc/xrdp/startwm.sh

echo "# xfce" >> /etc/xrdp/startwm.sh
echo startxfce4 >> /etc/xrdp/startwm.sh

